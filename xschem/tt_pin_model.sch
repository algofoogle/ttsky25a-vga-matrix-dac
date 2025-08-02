v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {ENABLED pass gate
connecting user module
to the analog mux
and hence output "pin"} 720 -620 0 0 0.3 0.3 {}
T {DISABLED pass gates
representing 15 other
user designs that are
not currently active.} 720 -310 0 0 0.3 0.3 {}
N 120 -520 180 -520 {
lab=pin}
N 240 -520 260 -520 {
lab=#net1}
N 160 -520 160 -500 {
lab=pin}
N 160 -440 160 -420 {
lab=VGND}
N 340 -520 340 -500 {
lab=#net2}
N 340 -440 340 -420 {
lab=VGND}
N 320 -520 340 -520 {
lab=#net2}
N 340 -520 360 -520 {
lab=#net2}
N 420 -520 510 -520 {
lab=#net3}
N 470 -520 470 -500 {
lab=#net3}
N 470 -440 470 -420 {
lab=VGND}
N 600 -620 620 -620 {
lab=#net3}
N 680 -620 700 -620 {
lab=mod}
N 510 -520 600 -520 {
lab=#net3}
N 600 -620 600 -520 {
lab=#net3}
N 600 -520 600 -420 {
lab=#net3}
N 600 -420 620 -420 {
lab=#net3}
N 700 -620 700 -520 {
lab=mod}
N 700 -520 700 -420 {
lab=mod}
N 680 -420 700 -420 {
lab=mod}
N 700 -520 920 -520 {
lab=mod}
N 600 -310 620 -310 {
lab=#net3}
N 680 -310 700 -310 {
lab=VGND}
N 600 -310 600 -210 {
lab=#net3}
N 600 -210 600 -110 {
lab=#net3}
N 600 -110 620 -110 {
lab=#net3}
N 700 -310 700 -210 {
lab=VGND}
N 700 -210 700 -110 {
lab=VGND}
N 680 -110 700 -110 {
lab=VGND}
N 700 -210 790 -210 {
lab=VGND}
N 550 -210 600 -210 {
lab=#net3}
N 750 -520 750 -500 {
lab=mod}
N 750 -440 750 -420 {
lab=VGND}
N 550 -520 550 -210 {lab=#net3}
C {devices/res.sym} 210 -520 1 0 {name=R2
value=1
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 160 -470 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/ind.sym} 290 -520 1 0 {name=L7
m=1
value=1n
footprint=1206
device=inductor}
C {devices/capa.sym} 340 -470 0 0 {name=C3
m=1
value=2p
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 390 -520 1 0 {name=R3
value=50
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 470 -470 0 0 {name=C4
m=1
value=250f
footprint=1206
device="ceramic capacitor"}
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} 650 -640 1 0 {name=M2
L=0.5
W=100
body=VAPWR
nf=20
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 650 -400 3 0 {name=M1
L=0.5
W=60
body=VGND
nf=12
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
C {sky130_fd_pr/pfet3_g5v0d10v5.sym} 650 -330 1 0 {name=M4
L=0.5
W=100
body=VAPWR
nf=20
mult=15
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet3_g5v0d10v5.sym} 650 -90 3 0 {name=M3
L=0.5
W=60
body=VGND
nf=12
mult=15
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/capa.sym} 750 -470 0 0 {name=C5
m=1
value=250f
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 650 -380 0 1 {name=p14 sig_type=std_logic lab=VAPWR}
C {devices/lab_pin.sym} 650 -350 0 1 {name=p15 sig_type=std_logic lab=VAPWR}
C {iopin.sym} 100 -650 0 0 {name=p1 lab=VGND}
C {iopin.sym} 100 -630 0 0 {name=p2 lab=VAPWR}
C {iopin.sym} 920 -520 0 0 {name=p3 lab=mod}
C {iopin.sym} 120 -520 0 1 {name=p4 lab=pin}
C {lab_pin.sym} 160 -420 0 0 {name=p5 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 340 -420 0 0 {name=p6 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 470 -420 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 650 -70 0 0 {name=p8 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 790 -210 0 1 {name=p9 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 750 -420 0 1 {name=p10 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 650 -660 0 1 {name=p11 sig_type=std_logic lab=VGND}
