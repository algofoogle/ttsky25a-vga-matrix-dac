v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 820 -490 820 -460 {lab=#net1}
N 820 -590 820 -550 {lab=VPWR}
N 660 -360 820 -360 {lab=VPWR}
N 820 -400 820 -360 {lab=VPWR}
N 820 -360 900 -360 {lab=VPWR}
C {row15x.sym} 510 -370 0 0 {name=x1}
C {devices/vsource.sym} 100 -380 0 0 {name=Vvcc value="1.8" savecurrent=false}
C {devices/gnd.sym} 100 -40 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 100 -410 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {res.sym} 820 -430 0 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 820 -590 0 0 {name=p3 sig_type=std_logic lab=VPWR}
C {devices/vsource.sym} 220 -380 0 0 {name=Vvbias value="0.92" savecurrent=false}
C {lab_pin.sym} 220 -410 0 0 {name=p5 sig_type=std_logic lab=Vbias}
C {devices/simulator_commands.sym} 700 -250 0 1 {name=COMMANDS2
simulator=ngspice
only_toplevel=false 
value="
*.options savecurrents
.control

    save all
    tran 1n 12.8u
    write tb_row15x.raw vout

.endc
"}
C {devices/code.sym} 700 -250 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false}
C {lab_pin.sym} 100 -100 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 220 -350 0 0 {name=p8 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 100 -70 0 0 {name=Vvgnd value="0" savecurrent=false}
C {lab_pin.sym} 100 -350 0 0 {name=p10 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 820 -520 0 0 {name=Viout value="0" savecurrent=false}
C {devices/vsource.sym} 100 -240 0 0 {name=Vlogic value="pwl( 0n,0v  10u,1.8v )" savecurrent=false}
C {lab_pin.sym} 100 -210 0 0 {name=p12 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 100 -270 0 0 {name=p13 sig_type=std_logic lab=stim}
C {lab_pin.sym} 360 -400 0 0 {name=p2 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 660 -400 0 1 {name=p4 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 660 -380 0 1 {name=p6 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 510 -430 0 0 {name=p9 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 360 -360 0 0 {name=p11 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 360 -380 0 0 {name=p14 sig_type=std_logic lab=stim}
C {lab_pin.sym} 900 -360 0 1 {name=p15 sig_type=std_logic lab=Vout}
