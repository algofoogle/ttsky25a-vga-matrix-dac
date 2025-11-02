v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 0 -750 1500 -50 {flags=graph
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
rainbow=0












color="4 10 12 7"
node="vout_pex
vbias_pex
\\"Vbias src ma;i(vbpwrmon) 1000 *\\"
\\"out mA;i(viout) 1000 *\\""
y1=1.8
y2=1.93
x1=9.54e-06
x2=1.03e-05
dataset=0}
B 2 0 -1370 1500 -670 {flags=graph
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
rainbow=0












color="4 10 12 7"
node="vout_pex
vbias_pex
\\"Vbias src ma;i(vbpwrmon) 1000 *\\"
\\"out mA;i(viout) 1000 *\\""
y1=1.2
y2=1.35
x1=9.54e-06
x2=1.03e-05
dataset=0}
T {25a} 1410 -60 0 0 1 1 {}
C {devices/launcher.sym} 60 -30 0 0 {name=h3
descr="vbias+fakepex" 
tclcommand="xschem raw_read $netlist_dir/raw-pex1/tb_csdac255_all.raw tran"
}
