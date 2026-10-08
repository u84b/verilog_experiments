`timescale 1ns/1ps

module blink_tb;

reg clk = 0;
reg rst = 1;
wire led;

blink #(
    .MAX_COUNT(5)
) dut (
    .clk(clk),
    .rst(rst),
    .led(led)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("blink.vcd");
    $dumpvars(0, blink_tb);

    #12;
    rst = 0;

    #250;
    $finish;
end

endmodule
