`timescale 1ns/1ps

module biba_tb;

wire [7:0] C0_in, C1_in, C2_in, C3_in;
reg [1:0] A_in;
reg [7:0] D_in;

biba dut (
    .C0(C0_in),
    .C1(C1_in),
    .C2(C2_in),
    .C3(C3_in),
    .A(A_in),
    .D(D_in)
);

initial begin
    $dumpfile("biba.vcd");
    $dumpvars(0, biba_tb);

    D_in = 8'b00000010;

    A_in = 2'b00;
    #200 A_in = 2'b01;
    #200 A_in = 2'b10;
    #200 A_in = 2'b11;
    #200 $finish;
end

endmodule