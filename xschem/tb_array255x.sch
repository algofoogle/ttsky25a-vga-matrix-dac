v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 800 -480 800 -450 {lab=#net1}
N 800 -580 800 -540 {lab=VPWR}
N 640 -350 800 -350 {lab=Vout}
N 800 -390 800 -350 {lab=Vout}
N 800 -350 880 -350 {lab=Vout}
C {devices/vsource.sym} 80 -370 0 0 {name=Vvcc value="1.8" savecurrent=false}
C {devices/gnd.sym} 80 -30 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 80 -400 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {res.sym} 800 -420 0 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 800 -580 0 0 {name=p3 sig_type=std_logic lab=VPWR}
C {devices/vsource.sym} 200 -370 0 0 {name=Vvbias value="0.92" savecurrent=false}
C {lab_pin.sym} 200 -400 0 0 {name=p5 sig_type=std_logic lab=Vbias}
C {devices/simulator_commands.sym} 680 -240 0 1 {name=COMMANDS2
simulator=ngspice
only_toplevel=false 
value="
*.options savecurrents
.control

    save all
    tran 1n 12.8u
    write tb_array255x.raw vout

.endc
"}
C {devices/code.sym} 680 -240 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false}
C {lab_pin.sym} 80 -90 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 200 -340 0 0 {name=p8 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 80 -60 0 0 {name=Vvgnd value="0" savecurrent=false}
C {lab_pin.sym} 80 -340 0 0 {name=p10 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 800 -510 0 0 {name=Viout value="0" savecurrent=false}
C {devices/vsource.sym} 80 -230 0 0 {name=Vlogic value="pwl( 0n,0v  10u,1.8v )" savecurrent=false}
C {lab_pin.sym} 80 -200 0 0 {name=p12 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 80 -260 0 0 {name=p13 sig_type=std_logic lab=stim}
C {lab_pin.sym} 880 -350 0 1 {name=p15 sig_type=std_logic lab=Vout}
C {array255x.sym} 490 -370 0 0 {name=x1}
C {lab_pin.sym} 640 -390 0 1 {name=p2 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 640 -370 0 1 {name=p4 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 340 -350 0 0 {name=p6 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 340 -370 0 0 {name=p9 sig_type=std_logic lab=stim}
C {lab_pin.sym} 340 -390 0 0 {name=p11 sig_type=std_logic lab=stim}
