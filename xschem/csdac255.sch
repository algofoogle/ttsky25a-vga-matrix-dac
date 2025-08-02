v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 740 -360 760 -360 {lab=THERMO_COLn[14:0]}
N 680 -380 760 -380 {lab=THERMO_ROWn[14:0]}
N 120 -210 120 -180 {
lab=Vbias}
N 120 -150 120 -80 {
lab=VGND}
N 120 -210 240 -210 {
lab=Vbias}
N 240 -210 240 -150 {
lab=Vbias}
N 160 -150 240 -150 {
lab=Vbias}
N 240 -430 240 -400 {
lab=Vbias}
N 240 -400 240 -210 {
lab=Vbias}
N 240 -500 240 -490 {
lab=VPWR}
N 180 -420 180 -410 {
lab=VPWR}
N 180 -350 180 -210 {
lab=Vbias}
N 120 -340 120 -330 {
lab=VPWR}
N 120 -270 120 -210 {
lab=Vbias}
N 80 -380 140 -380 {
lab=bias[1]}
N 80 -460 200 -460 {
lab=bias[2]}
N 680 -240 740 -240 {lab=THERMO_COLn[14:0]}
N 740 -360 740 -240 {lab=THERMO_COLn[14:0]}
N 240 -150 760 -150 {lab=Vbias}
N 760 -340 760 -150 {lab=Vbias}
N 760 -150 820 -150 {lab=Vbias}
N 760 -420 760 -380 {lab=THERMO_ROWn[14:0]}
N 740 -240 780 -240 {lab=THERMO_COLn[14:0]}
C {thermo15.sym} 530 -420 0 0 {name=x1}
C {array255x.sym} 910 -360 0 0 {name=x2}
C {thermo15.sym} 530 -280 0 0 {name=x3}
C {iopin.sym} 100 -600 0 1 {name=p1 lab=VPWR}
C {opin.sym} 140 -600 0 0 {name=p3 lab=Iout}
C {lab_pin.sym} 820 -150 0 1 {name=p4 sig_type=std_logic lab=Vbias}
C {iopin.sym} 100 -580 0 1 {name=p5 lab=VGND}
C {devices/lab_pin.sym} 240 -500 0 0 {name=p2 sig_type=std_logic lab=VPWR}
C {sky130_fd_pr/nfet_01v8.sym} 140 -150 0 1 {name=Mmirror
L=0.5
W=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 80 -460 0 0 {name=p21 sig_type=std_logic lab=bias[2]}
C {sky130_fd_pr/pfet3_01v8.sym} 220 -460 0 0 {name=M1
W=0.5
L=0.5
body=VPWR
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 180 -420 0 0 {name=p40 sig_type=std_logic lab=VPWR}
C {devices/lab_pin.sym} 80 -380 0 0 {name=p46 sig_type=std_logic lab=bias[1]}
C {sky130_fd_pr/pfet3_01v8.sym} 160 -380 0 0 {name=M2
W=0.5
L=1
body=VPWR
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 120 -340 0 0 {name=p47 sig_type=std_logic lab=VPWR}
C {devices/lab_pin.sym} 80 -300 0 0 {name=p48 sig_type=std_logic lab=bias[0]}
C {sky130_fd_pr/pfet3_01v8.sym} 100 -300 0 0 {name=M3
W=0.5
L=2
body=VPWR
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {lab_pin.sym} 120 -80 0 0 {name=p6 sig_type=std_logic lab=VGND}
C {ipin.sym} 100 -540 0 0 {name=p7 lab=bias[2:0]}
C {lab_pin.sym} 1060 -340 0 1 {name=p11 sig_type=std_logic lab=Iout}
C {ipin.sym} 100 -640 0 0 {name=p12 lab=data[7:0]}
C {lab_pin.sym} 380 -460 0 0 {name=p13 sig_type=std_logic lab=data[7:4]}
C {lab_pin.sym} 380 -320 0 0 {name=p14 sig_type=std_logic lab=data[3:0]}
C {lab_pin.sym} 680 -460 0 1 {name=p15 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 680 -440 0 1 {name=p16 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 680 -320 0 1 {name=p17 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 680 -300 0 1 {name=p18 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 680 -420 0 1 {name=p19 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 680 -400 0 1 {name=p20 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 680 -280 0 1 {name=p22 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 680 -260 0 1 {name=p23 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 1060 -380 0 1 {name=p24 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 1060 -360 0 1 {name=p25 sig_type=std_logic lab=VGND}
C {opin.sym} 140 -580 0 0 {name=p26 lab=Vbias}
C {lab_pin.sym} 760 -420 0 1 {name=p10 sig_type=std_logic lab=THERMO_ROWn[14:0]}
C {lab_pin.sym} 780 -240 0 1 {name=p27 sig_type=std_logic lab=THERMO_COLn[14:0]}
