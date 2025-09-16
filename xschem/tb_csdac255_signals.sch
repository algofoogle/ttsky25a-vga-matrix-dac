v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 -130 -850 1370 40 {flags=graph
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












color="9 9 9 9 9 9 9 9 9 9 9 9 9 9 9 17 17 17 17 17 17 17 17 17 17 17 17 17 17 17 7 7 7 7 4 4 4"
node="\\"R14; xdac_pex.xthr.tn[14] 2 / 14 + 0.1 *\\"
\\"R13; xdac_pex.xthr.tn[13] 2 / 13 + 0.1 *\\"
\\"R12; xdac_pex.xthr.tn[12] 2 / 12 + 0.1 *\\"
\\"R11; xdac_pex.xthr.tn[11] 2 / 11 + 0.1 *\\"
\\"R10; xdac_pex.xthr.tn[10] 2 / 10 + 0.1 *\\"
\\"R9;  xdac_pex.xthr.tn[9]  2 /  9 + 0.1 *\\"
\\"R8;  xdac_pex.xthr.tn[8]  2 /  8 + 0.1 *\\"
\\"R7;  xdac_pex.xthr.tn[7]  2 /  7 + 0.1 *\\"
\\"R6;  xdac_pex.xthr.tn[6]  2 /  6 + 0.1 *\\"
\\"R5;  xdac_pex.xthr.tn[5]  2 /  5 + 0.1 *\\"
\\"R4;  xdac_pex.xthr.tn[4]  2 /  4 + 0.1 *\\"
\\"R3;  xdac_pex.xthr.tn[3]  2 /  3 + 0.1 *\\"
\\"R2;  xdac_pex.xthr.tn[2]  2 /  2 + 0.1 *\\"
\\"R1;  xdac_pex.xthr.tn[1]  2 /  1 + 0.1 *\\"
\\"R0;  xdac_pex.xthr.tn[0]  2 /  0 + 0.1 *\\"
\\"C14; xdac_pex.xthc.tn[14] 2 / 14 + 16 + 0.1 *\\"
\\"C13; xdac_pex.xthc.tn[13] 2 / 13 + 16 + 0.1 *\\"
\\"C12; xdac_pex.xthc.tn[12] 2 / 12 + 16 + 0.1 *\\"
\\"C11; xdac_pex.xthc.tn[11] 2 / 11 + 16 + 0.1 *\\"
\\"C10; xdac_pex.xthc.tn[10] 2 / 10 + 16 + 0.1 *\\"
\\"C9;  xdac_pex.xthc.tn[9]  2 /  9 + 16 + 0.1 *\\"
\\"C8;  xdac_pex.xthc.tn[8]  2 /  8 + 16 + 0.1 *\\"
\\"C7;  xdac_pex.xthc.tn[7]  2 /  7 + 16 + 0.1 *\\"
\\"C6;  xdac_pex.xthc.tn[6]  2 /  6 + 16 + 0.1 *\\"
\\"C5;  xdac_pex.xthc.tn[5]  2 /  5 + 16 + 0.1 *\\"
\\"C4;  xdac_pex.xthc.tn[4]  2 /  4 + 16 + 0.1 *\\"
\\"C3;  xdac_pex.xthc.tn[3]  2 /  3 + 16 + 0.1 *\\"
\\"C2;  xdac_pex.xthc.tn[2]  2 /  2 + 16 + 0.1 *\\"
\\"C1;  xdac_pex.xthc.tn[1]  2 /  1 + 16 + 0.1 *\\"
\\"C0;  xdac_pex.xthc.tn[0]  2 /  0 + 16 + 0.1 *\\"

vout
vbias
\\"nom mA;i(xvvccnom) 1000 *\\"
\\"out mA;i(viout) 1000 *\\"
vout_pex
vbias_pex
\\"pex out mA;i(viout_pex) 1000 *\\""
y1=6.3e-05
y2=3.3
x1=0
dataset=0
x2=1.28e-05}
C {devices/launcher.sym} -70 80 0 0 {name=h2
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_csdac255_all.raw tran"
}
