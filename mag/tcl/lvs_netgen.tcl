set layout_netlist_file_handle [readnet spice $layout_name.lvs.spice]
set schem_netlist_file_handle  [readnet spice /dev/null]
readnet spice $::env(PDK_ROOT)/$::env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice $schem_netlist_file_handle

#NOTE: For simplicity, ALL of the files below can be loaded for every
# LVS run, because even if you're LVSing just one block, the last
# 'lvs' command selects which one actually matters.

# Add spice files of analog block(s):
readnet spice ../xschem/simulation/icell.spice          $schem_netlist_file_handle
readnet spice ../xschem/simulation/row15x.spice         $schem_netlist_file_handle
readnet spice ../xschem/simulation/array255x.spice      $schem_netlist_file_handle
readnet spice ../xschem/simulation/thermo15.spice       $schem_netlist_file_handle

# # Add GL verilog of digital block(s) (i.e. flat file from OpenLane hardening):
# readnet verilog ../verilog/gl/analog_control_wrapper.pnl.v $schem_netlist_file_handle

# # Top-level abstract integration verilog:
# readnet verilog ../src/project.v $schem_netlist_file_handle

lvs "$layout_netlist_file_handle $layout_name" "$schem_netlist_file_handle $schem_name" $::env(PDK_ROOT)/$::env(PDK)/libs.tech/netgen/sky130A_setup.tcl lvs.report -blackbox
