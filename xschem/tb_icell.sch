v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 350 -300 350 -230 {lab=VPWR}
N 390 -120 490 -120 {lab=Vout}
N 490 -150 490 -120 {lab=Vout}
N 490 -300 490 -210 {lab=#net1}
N 490 -120 560 -120 {lab=Vout}
N 260 -190 290 -190 {lab=stim}
N 490 -400 490 -360 {lab=VPWR}
C {icell.sym} 350 -180 0 0 {name=x1}
C {devices/vsource.sym} 80 -490 0 0 {name=Vvcc value="1.8" savecurrent=false}
C {devices/gnd.sym} 80 -150 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 80 -520 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 350 -300 0 0 {name=p2 sig_type=std_logic lab=VPWR}
C {res.sym} 490 -180 0 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 490 -400 0 0 {name=p3 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 560 -120 0 1 {name=p4 sig_type=std_logic lab=Vout}
C {devices/vsource.sym} 200 -490 0 0 {name=Vvbias value="0.92" savecurrent=false}
C {lab_pin.sym} 200 -520 0 0 {name=p5 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 290 -150 0 0 {name=p6 sig_type=std_logic lab=Vbias}
C {devices/simulator_commands.sym} 660 -440 0 1 {name=COMMANDS2
simulator=ngspice
only_toplevel=false 
value="
.options savecurrents
.control

    save all
    tran 1n 12.8u
    write tb_icell.raw vout

.endc
"}
C {devices/code.sym} 660 -440 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false}
C {lab_pin.sym} 80 -210 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 200 -460 0 0 {name=p8 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 80 -180 0 0 {name=Vvgnd value="0" savecurrent=false}
C {lab_pin.sym} 80 -460 0 0 {name=p10 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 350 -130 0 0 {name=p11 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 490 -330 0 0 {name=Viout value="0" savecurrent=false}
C {devices/vsource.sym} 80 -350 0 0 {name=Vlogic value="pwl( 0n,0v  10u,1.8v )" savecurrent=false}
C {lab_pin.sym} 80 -320 0 0 {name=p12 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 80 -380 0 0 {name=p13 sig_type=std_logic lab=stim}
C {lab_pin.sym} 260 -190 0 0 {name=p14 sig_type=std_logic lab=stim}
C {lab_pin.sym} 290 -210 0 0 {name=p15 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 330 -240 0 0 {name=p9 sig_type=std_logic lab=stim}
