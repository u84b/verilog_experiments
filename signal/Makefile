.PHONY: all sim wave

all: sim

sim:
	iverilog -g2012 -Wall -o signal_sim signal.v signal_tb.v
	vvp signal_sim

wave:
	gtkwave signal.vcd
