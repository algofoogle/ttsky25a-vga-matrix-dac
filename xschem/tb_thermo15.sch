v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 710 -350 710 -320 {lab=#net1}
N 710 -450 710 -410 {lab=VPWR}
N 550 -220 710 -220 {lab=a,b,c,d,e,f,g,h,i,j,k,l,m,n,o}
N 710 -260 710 -220 {lab=a,b,c,d,e,f,g,h,i,j,k,l,m,n,o}
N 710 -220 790 -220 {lab=a,b,c,d,e,f,g,h,i,j,k,l,m,n,o}
C {devices/vsource.sym} 80 -370 0 0 {name=Vvcc value="1.8" savecurrent=false}
C {devices/gnd.sym} 80 -30 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 80 -400 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {res.sym} 710 -290 0 0 {name=R[14:0]
value=5k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 710 -450 0 0 {name=p3 sig_type=std_logic lab=VPWR}
C {devices/vsource.sym} 200 -370 0 0 {name=Vvbias value="0.92" savecurrent=false}
C {lab_pin.sym} 200 -400 0 0 {name=p5 sig_type=std_logic lab=Vbias}
C {devices/simulator_commands.sym} 850 -120 0 1 {name=COMMANDS2
simulator=ngspice
only_toplevel=false 
value="
Vxp0 DATA[0]  GND pulse 1.8v 0v 0n 1n 1n 39n 80n
Vxp1 DATA[1]  GND pulse 1.8v 0v 0n 1n 1n 79n 160n
Vxp2 DATA[2]  GND pulse 1.8v 0v 0n 1n 1n 159n 320n
Vxp3 DATA[3]  GND pulse 1.8v 0v 0n 1n 1n 319n 640n

*.options savecurrents
.control

    save all
    tran 1n 12.8u
    write tb_row15x.raw a b c d e f g h i j k l m n o

.endc
"}
C {devices/code.sym} 850 -120 0 0 {name=TT_MODELS
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
C {devices/vsource.sym} 710 -380 0 0 {name=Viout value="0" savecurrent=false}
C {lab_pin.sym} 790 -220 0 1 {name=p15 sig_type=std_logic lab=a,b,c,d,e,f,g,h,i,j,k,l,m,n,o}
C {thermo15.sym} 400 -260 0 0 {name=x1}
C {lab_pin.sym} 250 -300 0 0 {name=p2 sig_type=std_logic lab=DATA[3:0]}
C {lab_pin.sym} 550 -300 0 1 {name=p4 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 550 -280 0 1 {name=p6 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 550 -260 0 1 {name=p9 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 550 -240 0 1 {name=p11 sig_type=std_logic lab=VGND}
