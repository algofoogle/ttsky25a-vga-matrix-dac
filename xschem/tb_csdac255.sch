v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 1110 -940 2610 -50 {flags=graph
ypos1=0
ypos2=2
divy=20
subdivy=0
unity=1
divx=20
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
rainbow=1












color="11 10 6 8"
node="vout
vbias
\\"nom mA;i(vvccnom) 1000 *\\"
\\"out mA;i(vcurrent) 1000 *\\""
y1=-0.12
y2=3.4
x1=1.0228446e-05
x2=1.0339026e-05}
T {TT_MODELS is set to use
'tt_mm' (for Monte Carlo)
instead of just 'tt'.
Use 'repeat' >1
in COMMANDS2 to make
use of this.} 400 -670 0 0 0.3 0.3 {}
T {Introduce random variation
in VCC for Monte Carlo by
setting power supply to:

1.8 trrandom(1 15us 0s 100mV 0mV)} 760 -630 0 0 0.3 0.3 {}
T {*** Could try 3.3V transistors to maintain better range AND drive} 190 -810 0 0 0.5 0.5 {}
N 1000 -460 1020 -460 {
lab=a3v3}
N 580 -330 620 -330 {lab=#net1}
N 880 -390 880 -330 {lab=vout}
N 580 -310 620 -310 {lab=vcc_nom}
N 620 -310 620 -240 {lab=vcc_nom}
N 620 -240 640 -240 {lab=vcc_nom}
N 600 -290 600 -220 {lab=vss}
N 580 -290 600 -290 {lab=vss}
N 580 -270 580 -160 {lab=Vbias}
N 880 -330 980 -330 {lab=vout}
N 980 -330 1030 -330 {lab=vout}
N 680 -330 700 -330 {lab=#net2}
N 700 -290 700 -270 {lab=a3v3}
N 880 -460 940 -460 {lab=#net3}
N 880 -460 880 -440 {lab=#net3}
C {csdac255.sym} 430 -300 0 0 {name=x1}
C {devices/vsource.sym} 700 -590 0 0 {name=Vvcc1 value="1.8" savecurrent=false}
C {devices/lab_pin.sym} 700 -620 0 0 {name=p1 sig_type=std_logic lab=vcc1}
C {devices/gnd.sym} 700 -560 0 0 {name=l2 lab=GND}
C {devices/simulator_commands.sym} 280 -660 0 1 {name=COMMANDS2
simulator=ngspice
only_toplevel=false 
value="
.param singlebits=0
.IF (singlebits == 1)
* Mode to just test each binary-weighted level:
Vxp0 DATA[0]  GND pulse 0v 1.8v 1u 1n 1n 1u 10u
Vxp1 DATA[1]  GND pulse 0v 1.8v 2u 1n 1n 1u 10u
Vxp2 DATA[2]  GND pulse 0v 1.8v 3u 1n 1n 1u 10u
Vxp3 DATA[3]  GND pulse 0v 1.8v 4u 1n 1n 1u 10u
Vxp4 DATA[4]  GND pulse 0v 1.8v 5u 1n 1n 1u 10u
Vxp5 DATA[5]  GND pulse 0v 1.8v 6u 1n 1n 1u 10u
Vxp6 DATA[6]  GND pulse 0v 1.8v 7u 1n 1n 1u 10u
Vxp7 DATA[7]  GND pulse 0v 1.8v 8u 1n 1n 1u 10u
Vxn0 DATAn[0] GND pulse 1.8v 0v 1u 1n 1n 1u 10u
Vxn1 DATAn[1] GND pulse 1.8v 0v 2u 1n 1n 1u 10u
Vxn2 DATAn[2] GND pulse 1.8v 0v 3u 1n 1n 1u 10u
Vxn3 DATAn[3] GND pulse 1.8v 0v 4u 1n 1n 1u 10u
Vxn4 DATAn[4] GND pulse 1.8v 0v 5u 1n 1n 1u 10u
Vxn5 DATAn[5] GND pulse 1.8v 0v 6u 1n 1n 1u 10u
Vxn6 DATAn[6] GND pulse 1.8v 0v 7u 1n 1n 1u 10u
Vxn7 DATAn[7] GND pulse 1.8v 0v 8u 1n 1n 1u 10u
.ELSEIF (singlebits == 0)
* Mode to test full 0..255 trange:
Vxp0 DATA[0]  GND pulse 1.8v 0v 0n 1n 1n 39n 80n
Vxp1 DATA[1]  GND pulse 1.8v 0v 0n 1n 1n 79n 160n
Vxp2 DATA[2]  GND pulse 1.8v 0v 0n 1n 1n 159n 320n
Vxp3 DATA[3]  GND pulse 1.8v 0v 0n 1n 1n 319n 640n
Vxp4 DATA[4]  GND pulse 1.8v 0v 0n 1n 1n 639n 1280n
Vxp5 DATA[5]  GND pulse 1.8v 0v 0n 1n 1n 1279n 2560n
Vxp6 DATA[6]  GND pulse 1.8v 0v 0n 1n 1n 2559n 5120n
Vxp7 DATA[7]  GND pulse 1.8v 0v 0n 1n 1n 5119n 10240n
Vxn0 DATAn[0] GND pulse 0v 1.8v 0n 1n 1n 39n 80n
Vxn1 DATAn[1] GND pulse 0v 1.8v 0n 1n 1n 79n 160n
Vxn2 DATAn[2] GND pulse 0v 1.8v 0n 1n 1n 159n 320n
Vxn3 DATAn[3] GND pulse 0v 1.8v 0n 1n 1n 319n 640n
Vxn4 DATAn[4] GND pulse 0v 1.8v 0n 1n 1n 639n 1280n
Vxn5 DATAn[5] GND pulse 0v 1.8v 0n 1n 1n 1279n 2560n
Vxn6 DATAn[6] GND pulse 0v 1.8v 0n 1n 1n 2559n 5120n
Vxn7 DATAn[7] GND pulse 0v 1.8v 0n 1n 1n 5119n 10240n
.ENDIF

.options savecurrents
.control

    save all
    tran 0.1n 12.8u
    write tb_csdac255.raw i(vvss) vcc1 vbias vout i(vvccnom) i(vcurrent) i(viout)
    * + v("DATA[0]") v("DATA[1]") v("DATA[2]") v("DATA[3]") v("DATA[4]") v("DATA[5]") v("DATA[6]") v("DATA[7]")

.endc
"}
C {devices/gnd.sym} 620 -560 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 620 -590 0 0 {name=Vvss value=0 savecurrent=false}
C {devices/lab_pin.sym} 620 -620 0 0 {name=p42 sig_type=std_logic lab=vss}
C {devices/code.sym} 280 -660 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false}
C {devices/vsource.sym} 900 -160 0 0 {name=Vvccnom value=0 savecurrent=false}
C {devices/lab_pin.sym} 900 -130 0 0 {name=p49 sig_type=std_logic lab=vcc_nom}
C {devices/lab_pin.sym} 900 -190 0 0 {name=p51 sig_type=std_logic lab=vcc1}
C {devices/lab_pin.sym} 1030 -330 0 1 {name=p45 lab=vout}
C {devices/capa.sym} 980 -300 0 0 {name=C1
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 980 -270 0 0 {name=l5 lab=vss}
C {devices/lab_pin.sym} 1020 -460 0 1 {name=p58 sig_type=std_logic lab=a3v3}
C {devices/vsource.sym} 970 -460 1 0 {name=VCurrent value=0 savecurrent=false}
C {devices/lab_pin.sym} 640 -240 0 1 {name=p3 sig_type=std_logic lab=vcc_nom}
C {devices/res.sym} 880 -410 0 0 {name=R1
value=537.5
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 650 -330 1 0 {name=VIout value=0 savecurrent=false}
C {devices/lab_pin.sym} 280 -330 2 1 {name=p2 sig_type=std_logic lab=DATA[7:0]}
C {devices/gnd.sym} 600 -220 0 0 {name=l1 lab=vss}
C {devices/lab_pin.sym} 580 -160 0 1 {name=p5 sig_type=std_logic lab=Vbias}
C {devices/launcher.sym} 1170 -20 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_csdac255.raw tran"
}
C {devices/lab_pin.sym} 240 -420 0 0 {name=p4 sig_type=std_logic lab=vcc_nom}
C {devices/lab_pin.sym} 300 -500 0 1 {name=p6 sig_type=std_logic lab=bias[2]}
C {devices/lab_pin.sym} 280 -310 0 0 {name=p7 sig_type=std_logic lab=bias[2:0]}
C {devices/lab_pin.sym} 300 -460 0 1 {name=p8 sig_type=std_logic lab=bias[1]}
C {devices/lab_pin.sym} 300 -420 0 1 {name=p9 sig_type=std_logic lab=bias[0]}
C {devices/lab_pin.sym} 240 -460 0 0 {name=p10 sig_type=std_logic lab=vcc_nom}
C {devices/lab_pin.sym} 240 -500 0 0 {name=p11 sig_type=std_logic lab=vss}
C {devices/res.sym} 270 -500 1 0 {name=R4
value=1m
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 270 -460 1 0 {name=R5
value=1m
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 270 -420 1 0 {name=R6
value=1m
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 620 -470 0 0 {name=Va3v3 value="3.3" savecurrent=false}
C {devices/gnd.sym} 620 -440 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 620 -500 0 1 {name=p12 sig_type=std_logic lab=a3v3}
C {tt_pin_model.sym} 790 -310 0 0 {name=x2}
C {devices/gnd.sym} 880 -290 0 0 {name=l4 lab=vss}
C {devices/lab_pin.sym} 700 -270 0 0 {name=p13 sig_type=std_logic lab=a3v3}
