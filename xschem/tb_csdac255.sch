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












color="7 7 7 7"
node="vout
vbias
\\"nom mA;i(xvvccnom) 1000 *\\"
\\"out mA;i(viout) 1000 *\\""
y1=0.00023
y2=4.2
x1=0
dataset=-1
x2=1.28e-05}
N 410 -650 410 -630 {lab=#net1}
N 410 -730 410 -710 {lab=VAPWR}
N 410 -570 410 -550 {lab=Vout}
N 20 -550 110 -550 {lab=#net2}
N 20 -550 20 -440 {lab=#net2}
N 20 -440 370 -440 {lab=#net2}
N 370 -440 370 -410 {lab=#net2}
N 290 -550 440 -550 {lab=Vout}
N 150 -390 150 -340 {lab=#net3}
C {devices/vsource.sym} 70 -730 0 0 {name=Vvcc value="1.8" savecurrent=false}
C {devices/gnd.sym} 70 -600 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 70 -760 0 0 {name=p1 sig_type=std_logic lab=VPWR}
C {devices/vsource.sym} 190 -730 0 0 {name=Vvpu value="3.3" savecurrent=false}
C {lab_pin.sym} 190 -760 0 0 {name=p5 sig_type=std_logic lab=VAPWR}
C {devices/simulator_commands.sym} 0 -910 0 0 {name=COMMANDS2
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
				+ vbias
				+ vout i(viout)
				+ i(vvcc)
				+ i(vvpu)
				+ i(vvgnd)
				tran 1n 12.8u
				write tb_csdac255.raw vbias vout i(viout) i(vvgnd) i(vvcc) i(vvpu)
				*plot vout vbias i(viout)*1000
				set appendwrite
				reset
				let biaslevel = biaslevel - 1
			end
		end
	end
.endc
"}
C {devices/code.sym} 130 -910 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
.include $::SKYWATER_STDCELLS/sky130_fd_sc_hd.spice
"
spice_ignore=false}
C {lab_pin.sym} 70 -660 0 0 {name=p7 sig_type=std_logic lab=VGND}
C {devices/vsource.sym} 70 -630 0 0 {name=Vvgnd value="0" savecurrent=false}
C {csdac255.sym} 260 -380 0 0 {name=x1}
C {lab_pin.sym} 440 -550 0 1 {name=p2 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 150 -410 0 0 {name=p4 sig_type=std_logic lab=DATA[7:0]}
C {lab_pin.sym} 370 -390 0 1 {name=p9 sig_type=std_logic lab=VPWR}
C {lab_pin.sym} 370 -370 0 1 {name=p11 sig_type=std_logic lab=VGND}
C {lab_pin.sym} 370 -350 0 1 {name=p12 sig_type=std_logic lab=Vbias}
C {tt_pin_model.sym} 200 -530 0 0 {name=x2}
C {lab_pin.sym} 110 -510 0 0 {name=p13 sig_type=std_logic lab=VAPWR}
C {lab_pin.sym} 290 -510 0 1 {name=p14 sig_type=std_logic lab=VGND}
C {res.sym} 410 -600 0 0 {name=R2
value=500
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 410 -680 0 0 {name=Viout value="0" savecurrent=false}
C {lab_pin.sym} 410 -730 0 1 {name=p15 sig_type=std_logic lab=VAPWR}
C {devices/capa.sym} 370 -520 0 0 {name=C1
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 370 -490 0 0 {name=l5 lab=VGND}
C {devices/lab_pin.sym} 90 -340 0 0 {name=p20 sig_type=std_logic lab=bias[2:0]}
C {devices/gnd.sym} 190 -700 0 0 {name=l1 lab=VGND}
C {devices/gnd.sym} 70 -700 0 0 {name=l3 lab=VGND}
C {devices/launcher.sym} 560 -30 0 0 {name=h2
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_csdac255.raw tran"
}
C {res.sym} 120 -340 1 0 {name=Rbias[2:0]
value=10k
footprint=1206
device=resistor
m=1}
