`timescale 1ns/1ns

module signal_tb;

reg clk = 0;
reg rst = 1;
reg value = 0;

wire reversed;

signal dut (
    .clk(clk),
    .rst(rst),
    .value(value),
    .reversed(reversed)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("signal.vcd");
    $dumpvars(0, signal_tb);

    #10;
    rst = 0;

    #200;
    
    $finish;
end

endmodule