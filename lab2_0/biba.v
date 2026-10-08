`timescale 1ns/1ps

module biba(
    input wire [1:0] A,
    input wire [7:0] D,
    output reg [7:0] C0, C1, C2, C3
);

always @(*) begin

    // значения по умолчанию
    C0 = 8'b0;
    C1 = 8'b0;
    C2 = 8'b0;
    C3 = 8'b0;

    case (A)
        2'b00: C0 = D;
        2'b01: C1 = D;
        2'b10: C2 = D;
        2'b11: C3 = D;
    endcase

end

endmodule