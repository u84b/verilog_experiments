.PHONY: all sim wave lint synth clean

all: sim

sim:
	iverilog -g2012 -Wall -o blink_sim blink.v blink_tb.v
	vvp blink_sim

wave:
	gtkwave blink.vcd

lint:
	verilator --lint-only --Wall blink.v

synth:
	yosys -p "read_verilog blink.v; hierarchy -top blink; proc; opt; show -format svg -prefix blink_schematic"

clean:
	rm -f blink_sim blink.vcd