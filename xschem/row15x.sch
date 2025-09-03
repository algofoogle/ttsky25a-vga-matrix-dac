v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 4 200 -240 610 -40 {fill=false
dash=4}
T {Cn and Rn (both active low) are pulled high on
the last cell to ensure it can only be activated
by row select-all (i.e. Sn=0).} 430 -470 0 0 0.2 0.2 {}
T {Dummy instances of icell, for fabrication symmetry
(to help improve device matching)} 300 -230 0 0 0.2 0.2 {}
N 330 -420 330 -410 {lab=VPWR}
N 510 -420 510 -410 {lab=VPWR}
N 370 -300 370 -280 {lab=Iout}
N 370 -280 600 -280 {lab=Iout}
N 550 -300 550 -280 {lab=Iout}
N 330 -180 330 -170 {lab=VPWR}
N 510 -180 510 -170 {lab=VPWR}
C {icell.sym} 330 -360 0 0 {name=XIC[14:0]}
C {ipin.sym} 100 -380 0 0 {name=p1 lab=Sn}
C {ipin.sym} 100 -360 0 0 {name=p2 lab=Rn}
C {ipin.sym} 100 -340 0 0 {name=p3 lab=Cn[14:0]}
C {lab_pin.sym} 270 -390 0 0 {name=p4 sig_type=std_logic lab=Sn}
C {lab_pin.sym} 270 -370 0 0 {name=p5 sig_type=std_logic lab=Rn}
C {lab_pin.sym} 310 -420 0 0 {name=p6 sig_type=std_logic lab=Cn[14:0]}
C {iopin.sym} 100 -420 0 1 {name=p7 lab=VPWR}
C {iopin.sym} 100 -300 0 1 {name=p8 lab=VGND}
C {opin.sym} 600 -280 0 0 {name=p9 lab=Iout}
C {ipin.sym} 100 -460 0 0 {name=p10 lab=Vbias}
C {lab_pin.sym} 270 -330 0 0 {name=p11 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 330 -310 0 0 {name=p13 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 330 -420 0 1 {name=p15 sig_type=std_logic lab=VPWR}
C {icell.sym} 510 -360 0 0 {name=XIC[15]}
C {lab_pin.sym} 450 -390 0 0 {name=p12 sig_type=std_logic lab=Sn}
C {lab_pin.sym} 450 -330 0 0 {name=p18 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 510 -310 0 0 {name=p19 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 510 -420 0 1 {name=p21 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 490 -420 0 0 {name=p16 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 450 -370 0 0 {name=p17 sig_type=std_logic lab=VPWR}
C {icell.sym} 330 -120 0 0 {name=XIC_dummy_left}
C {lab_pin.sym} 330 -70 0 0 {name=p22 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 270 -130 0 0 {name=p23 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 330 -180 0 1 {name=p24 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 310 -180 0 0 {name=p25 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 270 -150 0 0 {name=p14 sig_type=std_logic lab=VPWR}
C {icell.sym} 510 -120 0 0 {name=XIC_dummy_right}
C {lab_pin.sym} 510 -70 0 0 {name=p26 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 450 -130 0 0 {name=p27 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 510 -180 0 1 {name=p28 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 490 -180 0 0 {name=p29 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 450 -150 0 0 {name=p30 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 450 -90 0 0 {name=p31 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 270 -90 0 0 {name=p20 sig_type=std_logic lab=VGND}
