`timescale 1ns/1ns

module signal (
    input wire clk,
    input wire rst,
    input wire value,

    output reg reversed

);
    reg [31:0] counter;

    //assign value = (1 - value);

    always @(posedge clk) begin
        //value <= ~value;
        if (rst) begin
           counter <= 0;
           reversed <= 0;
        end else if (counter == 1) begin
           counter <= 0;
           reversed <= ~reversed;
        end else begin
           counter <= counter + 1;
        end
    end

endmodule