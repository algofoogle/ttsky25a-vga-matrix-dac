`default_nettype none

module controller_wrapper (
    // Standard TT digital IOs, on the North side:
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input wire        uio_in2,  // bias[0]
    input wire        uio_in3,  // bias[1]
    input wire        uio_in4,  // bias[2]
    output wire [1:0] uio_out,  // IOs: Output path
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n,    // reset_n - low to reset

    // Outputs for interfacing with the DACs, on the South side:
    output wire [7:0] R,
    output wire [7:0] G,
    output wire [7:0] B,
    // Vbias controls (the R/G/B colour channels' biases are copies of each other):
    output wire [2:0] Rbias,
    output wire [2:0] Gbias,
    output wire [2:0] Bbias
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

    // assign uio_oe       = 8'b00000011; // 0=input, 1=output.
    // assign uio_out[7:2] =   6'b000000; // Unused output paths.

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, 1'b0};

    wire [2:0] bias = {uio_in4, uio_in3, uio_in2};

    assign Rbias = bias;
    assign Gbias = bias;
    assign Bbias = bias;

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
        .r          (rgb[7:0])
        //output  wire [7:0]  rn, gn, bn,        // INVERTED channel bits (for current steering).
        //output  wire        r7,g7,b7, r6,g6,b6 // Extra convenience outputs to wire up to digital outs on the north side of the macro.
    );

endmodule
