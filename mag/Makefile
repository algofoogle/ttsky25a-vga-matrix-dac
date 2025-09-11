#NOTE: PROJECT_NAME can also be a subcell name, and in the case of LVS it is the LAYOUT name:
PROJECT_NAME ?= tt_um_algofoogle_vga_matrix_dac

#NOTE: SCHEMATIC_NAME is only used in LVS, and can be overridden to compare a given layout with a specific schematic SPICE subcircuit:
SCHEMATIC_NAME ?= $(PROJECT_NAME)

MAGIC_RC := $(PDK_ROOT)/$(PDK)/libs.tech/magic/sky130A.magicrc
TEMPLATE_FILE := tt_analog_1x2.def
# TEMPLATE_FILE := tt_analog_2x2.def
# TEMPLATE_FILE := tt_analog_1x2_3v3.def

.PHONY: lvs magic start

# magic:
# 	magic -rcfile $(MAGIC_RC) $(PROJECT_NAME).mag

tt_analog_1x2.def:
	wget https://raw.githubusercontent.com/TinyTapeout/tt-support-tools/tt10/def/analog/tt_analog_1x2.def

tt_analog_2x2.def:
	wget https://raw.githubusercontent.com/TinyTapeout/tt-support-tools/tt10/def/analog/tt_analog_2x2.def

tt_analog_1x2_3v3.def:
	wget https://raw.githubusercontent.com/TinyTapeout/tt-support-tools/tt10/def/analog/tt_analog_1x2_3v3.def

start: $(TEMPLATE_FILE)
	magic -rcfile $(MAGIC_RC) -noconsole -dnull tcl/tt-analog-draw.tcl $(TEMPLATE_FILE) $(PROJECT_NAME)

$(PROJECT_NAME).lvs.spice: $(PROJECT_NAME).mag
	magic -noconsole -dnull tcl/extract_for_lvs.tcl $(PROJECT_NAME)
	rm -f *.ext

antenna:
	magic -noconsole -dnull tcl/antenna.tcl $(PROJECT_NAME)
	rm -f *.ext

drc:
	magic -noconsole -dnull tcl/drc.tcl $(PROJECT_NAME)
	
$(PROJECT_NAME).sim.spice: $(PROJECT_NAME).mag
	magic -noconsole -dnull tcl/extract_for_sim.tcl $(PROJECT_NAME)
	rm -f *.ext

lvs.report: $(PROJECT_NAME).lvs.spice ../src/project.v
	@echo "============ Comparing layout '$(PROJECT_NAME)' with schematic '$(SCHEMATIC_NAME)' ============"
	netgen -batch eval "set layout_name $(PROJECT_NAME) ; set schem_name $(SCHEMATIC_NAME) ; source tcl/lvs_netgen.tcl"

lvs: lvs.report
	@bash -c 'props=OK; match=FAIL; port=OK; \
    if grep -q "match uniquely" lvs.report; then \
        match=OK; \
    fi; \
    if grep -q "Property errors were found" lvs.report; then \
        props=FAIL; \
    fi; \
    if grep -q "The following cells had property errors" lvs.report; then \
        props=FAIL; \
    fi; \
    if grep -q "failed pin matching" lvs.report; then \
        match=FAIL; \
    fi; \
    if grep -q "Final result: Netlists do not match" lvs.report; then \
        match=FAIL; \
    fi; \
    if grep -q "port errors" lvs.report; then \
        port=FAIL; \
    fi; \
    if grep -q "Final result: Circuits match uniquely\." lvs.report; then \
        match=OK; \
    fi; \
    if [ "$$match" == "OK" ] && [ "$$props" == "OK" ] && [ "$$port" == "OK" ]; then \
        echo "LVS OK"; \
        exit 0; \
    else \
        echo "LVS FAIL: match=$$match properties=$$props port=$$port"; \
        exit 1; \
    fi'

update_gds:
	mkdir -p ../gds ../lef
	magic -noconsole -dnull tcl/update_gds_lef.tcl $(PROJECT_NAME)

clean:
	rm -f lvs.report *.lvs.spice *.nodes
