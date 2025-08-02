v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 5 160 -440 560 -440 560 0 160 0 160 -440 {}
P 4 5 580 -320 780 -320 780 -40 580 -40 580 -320 {}
T {Replaces nfet3_01v8, 0.5/0.5} 800 -130 0 0 0.2 0.2 {}
N 300 -220 300 -170 {lab=Sn}
N 280 -220 300 -220 {lab=Sn}
N 340 -240 340 -200 {lab=#net1}
N 340 -420 340 -300 {lab=VPWR}
N 480 -320 480 -300 {lab=#net2}
N 480 -420 480 -380 {lab=VPWR}
N 260 -120 420 -120 {lab=#net3}
N 340 -140 340 -120 {lab=#net3}
N 260 -60 420 -60 {lab=VGND}
N 340 -60 340 -20 {lab=VGND}
N 650 -130 670 -130 {lab=Vbias}
N 710 -190 710 -160 {lab=#net4}
N 710 -100 710 -70 {lab=VGND}
N 710 -350 710 -250 {lab=Iout}
N 300 -270 300 -220 {lab=Sn}
N 340 -220 670 -220 {lab=#net1}
N 480 -240 480 -220 {lab=#net1}
C {ipin.sym} 80 -180 0 0 {name=p1 lab=Rn}
C {iopin.sym} 80 -240 0 1 {name=p2 lab=VPWR}
C {opin.sym} 60 -60 0 0 {name=p3 lab=Iout}
C {iopin.sym} 80 -220 0 1 {name=p4 lab=VGND}
C {ipin.sym} 80 -160 0 0 {name=p5 lab=Cn}
C {ipin.sym} 80 -140 0 0 {name=p6 lab=Sn}
C {ipin.sym} 80 -100 0 0 {name=p7 lab=Vbias}
C {sky130_fd_pr/pfet3_01v8.sym} 320 -270 0 0 {name=M2
W=0.5
L=0.15
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
C {sky130_fd_pr/nfet3_01v8.sym} 320 -170 0 0 {name=M3
W=0.5
L=0.15
body=VGND
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
C {sky130_fd_pr/pfet3_01v8.sym} 460 -270 0 0 {name=M4
W=0.5
L=0.15
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
C {sky130_fd_pr/pfet3_01v8.sym} 460 -350 0 0 {name=M5
W=0.5
L=0.15
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
C {sky130_fd_pr/nfet3_01v8.sym} 240 -90 0 0 {name=M6
W=0.5
L=0.15
body=VGND
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
C {sky130_fd_pr/nfet3_01v8.sym} 440 -90 0 1 {name=M7
W=0.5
L=0.15
body=VGND
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
C {lab_pin.sym} 340 -420 0 0 {name=p19 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 480 -420 0 0 {name=p9 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 710 -350 0 1 {name=p10 sig_type=std_logic lab=Iout}
C {lab_pin.sym} 650 -130 0 0 {name=p18 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 220 -90 0 0 {name=p16 sig_type=std_logic lab=Rn}
C {lab_pin.sym} 280 -220 0 0 {name=p20 sig_type=std_logic lab=Sn}
C {lab_pin.sym} 440 -270 0 0 {name=p21 sig_type=std_logic lab=Cn}
C {lab_pin.sym} 710 -70 0 0 {name=p22 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 340 -20 0 0 {name=p15 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 440 -350 0 0 {name=p11 sig_type=std_logic lab=Rn}
C {lab_pin.sym} 460 -90 0 1 {name=p8 sig_type=std_logic lab=Cn}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 690 -130 0 0 {name=M1
W=0.5
L=0.5
body=VGND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 690 -220 0 0 {name=M8
W=1.0
L=0.5
body=VGND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
