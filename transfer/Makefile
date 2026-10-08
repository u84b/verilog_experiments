.PHONY: all sim wave

all: sim

sim:
	iverilog -g2012 -Wall -o transfer_sim transfer.v transfer_tb.v
	vvp transfer_sim

wave:
	gtkwave transfer.vcd