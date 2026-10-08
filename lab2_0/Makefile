.PHONY: all sim wave lint synth clean

all: sim

sim:
	iverilog -g2012 -Wall -o biba_sim biba.v biba_tb.v
	vvp biba_sim

wave:
	gtkwave biba.vcd