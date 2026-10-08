.PHONY: all sim wave lint synth clean

all: sim

sim:
	iverilog -g2012 -Wall -o light_sim light.v light_tb.v
	vvp light_sim

wave:
	gtkwave light_controller.vcd

#lint:
#	verilator --lint-only --Wall light.v

#synth:
#	yosys -p "read_verilog light.v; hierarchy -top blink; proc; opt; show -format svg -prefix blink_schematic"

#clean:
#	rm -f light_sim light.vcd