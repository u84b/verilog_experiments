`timescale 1ns/1ps


module biba_tb;

reg [15:0] D;
wire [3:0] C;

biba dut (
    .D(D),
    .C(C)
);

initial begin
    $dumpfile("biba.vcd");
    $dumpvars(0, biba_tb);

    D = 16'b0000_0000_0000_0001;
    #100 D = 16'b0000_0000_0000_1010;
    #100 D = 16'b1111_1111_1111_1111;
    #100 $finish;
end

endmodule