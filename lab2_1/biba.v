`timescale 1ns/1ps

module biba(
    input reg [15:0] D,
    output reg [3:0] C
);

integer i;
integer j;

always @(*) begin

    C = 0;

    for (i = 0; i < 16; i = i + 1) begin
        if (D[i]) begin
            for (j = 0; j < i; j = j + 1) begin
                C = C + 1;
            end
        end
    end

end

endmodule