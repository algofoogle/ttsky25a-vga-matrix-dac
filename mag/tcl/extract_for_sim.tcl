set project [lindex $argv $argc-1]
load $project.mag
flatten tt_um_flat
load tt_um_flat
select top cell
cellname delete $project
cellname rename tt_um_flat ${project}_parax
extract all
ext2sim labels on
ext2sim
extresist tolerance 20 ; # Merge more resistors (normally 10%, pushing up to 20% for simpler netlist)
extresist
ext2spice lvs
ext2spice cthresh 0.001f ; # Ignore caps below 1e-18 (normally 0, this should cut out ~36% of caps)
ext2spice extresist on
ext2spice -o $project.sim.spice
quit -noprompt
