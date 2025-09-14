`default_nettype none

module controller_wrapper (
    // Standard TT digital IOs, on the North side:
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n - low to reset

    // Outputs for interfacing with the DACs, on the South side:
    output wire [7:0] R,
    output wire [7:0] G,
    output wire [7:0] B,
    // Vbias controls (the R/G/B colour channels' biases are copies of each other):
    output wire Rbias1, Rbias2, Rbias3,
    output wire Gbias1, Gbias2, Gbias3,
    output wire Bbias1, Bbias2, Bbias3
);

    // VGA signals
    wire hsync;
    wire vsync;
    wire [23:0] rgb; // Actually it's BGR order: {B[7:0], G[7:0], R[7:0]}

    assign {B,G,R} = rgb;

    // TinyVGA PMOD (digital RGB222 version output):
    assign uo_out = {
        hsync,
        // BGR order, MSB-1:
        rgb[22], rgb[14], rgb[6],
        vsync,
        // BGR order, MSB:
        rgb[23], rgb[15], rgb[7]
    };

    assign uio_oe       = 8'b00000011; // 0=input, 1=output.
    assign uio_out[7:2] =   6'b000000; // Unused output paths.

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_in[4:0], 1'b0};

    wire bias1 = uio_in[5];
    wire bias2 = uio_in[6];
    wire bias3 = uio_in[7];

    assign {Rbias1,Rbias2,Rbias3} = {bias1,bias2,bias3};
    assign {Gbias1,Gbias2,Gbias3} = {bias1,bias2,bias3};
    assign {Bbias1,Bbias2,Bbias3} = {bias1,bias2,bias3};
    // wire usewobble      = ui_in[4];
    // wire mixnoise       = ui_in[3];
    // wire [2:0] inymode  = ui_in[2:0];

    controller vga_pattern_gen(
        .clk        (clk),
        .rst_n      (rst_n),
        .ui_in      (ui_in),    //NOTE: See https://github.com/algofoogle/journal/blob/master/0215-2024-08-21.md#explanation-of-digital-block-control-inputs
        .hsync      (hsync),    // H/V sync polarity determined by vga_sync module per vga_timing_mode.
        .vsync      (vsync),
        .hblank     (uio_out[1]),
        .vblank     (uio_out[0]),
        .b          (rgb[23:16]),   // Positive colour channel bits. Primarily goes to DACs.
        .g          (rgb[15:8]),
        .r          (rgb[7:0]),
        .rn(), .gn(), .bn(),
        .r7(), .g7(), .b7(),
        .r6(), .g6(), .b6()
        //output  wire [7:0]  rn, gn, bn,        // INVERTED channel bits (for current steering).
        //output  wire        r7,g7,b7, r6,g6,b6 // Extra convenience outputs to wire up to digital outs on the north side of the macro.
    );

endmodule
