v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 500 -960 2000 -70 {flags=graph
ypos1=0
ypos2=2
divy=20
subdivy=0
unity=1
divx=20
subdivx=1
xlabmag=0.5
ylabmag=1


unitx=1
logx=0
logy=0
rainbow=1












color="7 7 7 7 4 4"
node="vout
vbias
\\"nom mA;i(xvvccnom) 1000 *\\"
\\"out mA;i(viout) 1000 *\\"
vout_pex
vbias_pex"
y1=2.6e-05
y2=3.3
x1=0
dataset=-1
x2=1.28e-05}
N 410 -1010 410 -990 {lab=#net1}
N 410 -1090 410 -1070 {lab=VAPWR}
N 410 -930 410 -910 {lab=Vout}
N 20 -910 110 -910 {lab=#net2}
N 20 -910 20 -800 {lab=#net2}
N 20 -800 370 -800 {lab=#net2}
N 370 -800 370 -770 {lab=#net2}
N 290 -910 440 -910 {lab=Vout}
N 150 -750 150 -700 {lab=#net3}
N 370 -240 370 -210 {lab=#net4}
N 150 -190 150 -140 {lab=#net5}
N 410 -450 410 -430 {lab=#net6}
N 410 -530 410 -510 {lab=VAPWR}
N 410 -370 410 -350 {lab=Vout_pex}
N 20 -350 110 -350 {lab=#net4}
N 20 -350 20 -240 {lab=#net4}
N 290 -350 440 -350 {lab=Vout_pex}
N 20 -240 370 -240 {lab=#net4}
C {devices/vsource.sym} 960 -1070 0 0 {name=Vvcc value="1.8" savecurrent=false}
C {devices/gnd.sym} 840 -1040 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 960 -1100 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {devices/vsource.sym} 1080 -1070 0 0 {name=Vvpu value="3.3" savecurrent=false}
C {lab_pin.sym} 1080 -1100 0 0 {name=p5 sig_type=std_logic lab=VAPWR}
C {devices/simulator_commands.sym} 490 -1090 0 0 {name=COMMANDS2
simulator=ngspice
only_toplevel=false 
value="
* Set Vbias level (negative logic, so 0=ON, 1.8=OFF):
.param bias2=1.8
.param bias1=1.8
.param bias0=1.8
Vvbias2 bias[2] GND \{bias2\}
Vvbias1 bias[1] GND \{bias1\}
Vvbias0 bias[0] GND \{bias0\}

*NOTE: Possible ngspice bug with .IF(), so it's commented out here:
*.param singlebits=0
*.IF (singlebits == 1)
* Mode to just test each binary-weighted level:
*Vxp0 DATA[0]  GND pulse 0v 1.8v 1u 1n 1n 1u 10u
*Vxp1 DATA[1]  GND pulse 0v 1.8v 2u 1n 1n 1u 10u
*Vxp2 DATA[2]  GND pulse 0v 1.8v 3u 1n 1n 1u 10u
*Vxp3 DATA[3]  GND pulse 0v 1.8v 4u 1n 1n 1u 10u
*Vxp4 DATA[4]  GND pulse 0v 1.8v 5u 1n 1n 1u 10u
*Vxp5 DATA[5]  GND pulse 0v 1.8v 6u 1n 1n 1u 10u
*Vxp6 DATA[6]  GND pulse 0v 1.8v 7u 1n 1n 1u 10u
*Vxp7 DATA[7]  GND pulse 0v 1.8v 8u 1n 1n 1u 10u
*.ELSEIF (singlebits == 0)
* Mode to test full 0..255 trange:
Vxp0 DATA[0]  GND pulse 1.8v 0v 0n 1n 1n 39n 80n
Vxp1 DATA[1]  GND pulse 1.8v 0v 0n 1n 1n 79n 160n
Vxp2 DATA[2]  GND pulse 1.8v 0v 0n 1n 1n 159n 320n
Vxp3 DATA[3]  GND pulse 1.8v 0v 0n 1n 1n 319n 640n
Vxp4 DATA[4]  GND pulse 1.8v 0v 0n 1n 1n 639n 1280n
Vxp5 DATA[5]  GND pulse 1.8v 0v 0n 1n 1n 1279n 2560n
Vxp6 DATA[6]  GND pulse 1.8v 0v 0n 1n 1n 2559n 5120n
Vxp7 DATA[7]  GND pulse 1.8v 0v 0n 1n 1n 5119n 10240n
*.endif

*.options savecurrents
.control
	* Start with all bias[*] switches at 0V (ENb), so highest Vbias (max current sink):
	let biaslevel=7
	foreach bv2 0 1.8
		foreach bv1 0 1.8
			foreach bv0 0 1.8
				alterparam bias2 = $bv2
				alterparam bias1 = $bv1
				alterparam bias0 = $bv0
				reset
				echo Bias level $&biaslevel = $bv2 $bv1 $bv0
				save
				+ data[0] data[1] data[2] data[3] data[4] data[5] data[6] data[7]
				+ bias[0] bias[1] bias[2]
				+ vbias          vbias_pex
				+ vout i(viout)  vout_pex i(viout_pex)
				+ i(vvcc)
				+ i(vvpu)
				+ i(vvgnd)
				+ "XDAC.THERMO_ROWn[0]" "XDAC.THERMO_ROWn[1]" "XDAC.THERMO_ROWn[2]" "XDAC.THERMO_ROWn[3]" "XDAC.THERMO_ROWn[4]" "XDAC.THERMO_ROWn[5]" "XDAC.THERMO_ROWn[6]" "XDAC.THERMO_ROWn[7]" "XDAC.THERMO_ROWn[8]" "XDAC.THERMO_ROWn[9]" "XDAC.THERMO_ROWn[10]" "XDAC.THERMO_ROWn[11]" "XDAC.THERMO_ROWn[12]" "XDAC.THERMO_ROWn[13]" "XDAC.THERMO_ROWn[14]"
				+ "XDAC.THERMO_COLn[0]" "XDAC.THERMO_COLn[1]" "XDAC.THERMO_COLn[2]" "XDAC.THERMO_COLn[3]" "XDAC.THERMO_COLn[4]" "XDAC.THERMO_COLn[5]" "XDAC.THERMO_COLn[6]" "XDAC.THERMO_COLn[7]" "XDAC.THERMO_COLn[8]" "XDAC.THERMO_COLn[9]" "XDAC.THERMO_COLn[10]" "XDAC.THERMO_COLn[11]" "XDAC.THERMO_COLn[12]" "XDAC.THERMO_COLn[13]" "XDAC.THERMO_COLn[14]"
				+ "XDAC.XThR.TA1" "XDAC.XThR.TA2" "XDAC.XThR.TA3" "XDAC.XThR.TAN" "XDAC.XThR.TAN2" "XDAC.XThR.TB1" "XDAC.XThR.TB2" "XDAC.XThR.TB3" "XDAC.XThR.TB4" "XDAC.XThR.TB5" "XDAC.XThR.TB6" "XDAC.XThR.TB7" "XDAC.XThR.TBN"
				+ "XDAC.XThC.TA1" "XDAC.XThC.TA2" "XDAC.XThC.TA3" "XDAC.XThC.TAN" "XDAC.XThC.TAN2" "XDAC.XThC.TB1" "XDAC.XThC.TB2" "XDAC.XThC.TB3" "XDAC.XThC.TB4" "XDAC.XThC.TB5" "XDAC.XThC.TB6" "XDAC.XThC.TB7" "XDAC.XThC.TBN"
				+ "XDAC_PEX.XThR.Tn[0]" "XDAC_PEX.XThR.Tn[1]" "XDAC_PEX.XThR.Tn[2]" "XDAC_PEX.XThR.Tn[3]" "XDAC_PEX.XThR.Tn[4]" "XDAC_PEX.XThR.Tn[5]" "XDAC_PEX.XThR.Tn[6]" "XDAC_PEX.XThR.Tn[7]" "XDAC_PEX.XThR.Tn[8]" "XDAC_PEX.XThR.Tn[9]" "XDAC_PEX.XThR.Tn[10]" "XDAC_PEX.XThR.Tn[11]" "XDAC_PEX.XThR.Tn[12]" "XDAC_PEX.XThR.Tn[13]" "XDAC_PEX.XThR.Tn[14]"
				+ "XDAC_PEX.XThC.Tn[0]" "XDAC_PEX.XThC.Tn[1]" "XDAC_PEX.XThC.Tn[2]" "XDAC_PEX.XThC.Tn[3]" "XDAC_PEX.XThC.Tn[4]" "XDAC_PEX.XThC.Tn[5]" "XDAC_PEX.XThC.Tn[6]" "XDAC_PEX.XThC.Tn[7]" "XDAC_PEX.XThC.Tn[8]" "XDAC_PEX.XThC.Tn[9]" "XDAC_PEX.XThC.Tn[10]" "XDAC_PEX.XThC.Tn[11]" "XDAC_PEX.XThC.Tn[12]" "XDAC_PEX.XThC.Tn[13]" "XDAC_PEX.XThC.Tn[14]"
				+ "XDAC_PEX.XThR.TA1" "XDAC_PEX.XThR.TA2" "XDAC_PEX.XThR.TA3" "XDAC_PEX.XThR.TAN" "XDAC_PEX.XThR.TAN2" "XDAC_PEX.XThR.TB1" "XDAC_PEX.XThR.TB2" "XDAC_PEX.XThR.TB3" "XDAC_PEX.XThR.TB4" "XDAC_PEX.XThR.TB5" "XDAC_PEX.XThR.TB6" "XDAC_PEX.XThR.TB7" "XDAC_PEX.XThR.TBN"
				+ "XDAC_PEX.XThC.TA1" "XDAC_PEX.XThC.TA2" "XDAC_PEX.XThC.TA3" "XDAC_PEX.XThC.TAN" "XDAC_PEX.XThC.TAN2" "XDAC_PEX.XThC.TB1" "XDAC_PEX.XThC.TB2" "XDAC_PEX.XThC.TB3" "XDAC_PEX.XThC.TB4" "XDAC_PEX.XThC.TB5" "XDAC_PEX.XThC.TB6" "XDAC_PEX.XThC.TB7" "XDAC_PEX.XThC.TBN"
				tran 1n 12.8u
				write tb_csdac255_all.raw
				*plot vout vbias i(viout)*1000
				set appendwrite
				reset
				let biaslevel = biaslevel - 1
			end
		end
	end
.endc
"}
C {devices/code.sym} 620 -1090 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib /home/anton/asic/ciel/sky130A/libs.tech/combined/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false}
C {lab_pin.sym} 840 -1100 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 840 -1070 0 0 {name=Vvgnd value="0" savecurrent=false}
C {csdac255.sym} 260 -740 0 0 {name=XDAC}
C {lab_pin.sym} 440 -910 0 1 {name=p2 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 150 -770 0 0 {name=p4 sig_type=std_logic lab=DATA[7:0]}
C {lab_pin.sym} 370 -750 0 1 {name=p9 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 370 -730 0 1 {name=p11 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 370 -710 0 1 {name=p12 sig_type=std_logic lab=Vbias}
C {tt_pin_model.sym} 200 -890 0 0 {name=XTTPIN}
C {lab_pin.sym} 110 -870 0 0 {name=p13 sig_type=std_logic lab=VAPWR}
C {lab_pin.sym} 290 -870 0 1 {name=p14 sig_type=std_logic lab=VGND}
C {res.sym} 410 -960 0 0 {name=R2
value=500
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 410 -1040 0 0 {name=Viout value="0" savecurrent=false}
C {lab_pin.sym} 410 -1090 0 1 {name=p15 sig_type=std_logic lab=VAPWR}
C {devices/capa.sym} 370 -880 0 0 {name=C1
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 370 -850 0 0 {name=l5 lab=VGND}
C {devices/lab_pin.sym} 90 -700 0 0 {name=p20 sig_type=std_logic lab=bias[2:0]}
C {devices/gnd.sym} 1080 -1040 0 0 {name=l1 lab=VGND}
C {devices/gnd.sym} 960 -1040 0 0 {name=l3 lab=VGND}
C {devices/launcher.sym} 560 -30 0 0 {name=h2
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_csdac255_all.raw tran"
}
C {res.sym} 120 -700 1 0 {name=Rbias[2:0]
value=10k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 150 -210 0 0 {name=p3 sig_type=std_logic lab=DATA[7:0]}
C {lab_pin.sym} 370 -190 0 1 {name=p6 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 370 -170 0 1 {name=p8 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 370 -150 0 1 {name=p10 sig_type=std_logic lab=Vbias_pex}
C {devices/lab_pin.sym} 90 -140 0 0 {name=p16 sig_type=std_logic lab=bias[2:0]}
C {res.sym} 120 -140 1 0 {name=Rbias1[2:0]
value=10k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 440 -350 0 1 {name=p17 sig_type=std_logic lab=Vout_pex}
C {tt_pin_model.sym} 200 -330 0 0 {name=XTTPIN_PEX}
C {lab_pin.sym} 110 -310 0 0 {name=p18 sig_type=std_logic lab=VAPWR}
C {lab_pin.sym} 290 -310 0 1 {name=p19 sig_type=std_logic lab=VGND}
C {res.sym} 410 -400 0 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 410 -480 0 0 {name=Viout_pex value="0" savecurrent=false}
C {lab_pin.sym} 410 -530 0 1 {name=p21 sig_type=std_logic lab=VAPWR}
C {devices/capa.sym} 370 -320 0 0 {name=C2
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 370 -290 0 0 {name=l4 lab=VGND}
C {csdac255.sym} 260 -180 0 0 {name=XDAC_PEX}
