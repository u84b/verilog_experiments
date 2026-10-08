`timescale 1ns/1ps

module blink #(
    parameter integer MAX_COUNT = 5
    )(
    input  wire clk,
    input  wire rst,
    output reg  led
);

reg [31:0] counter;

always @(posedge clk) begin
    if (rst) begin
        counter <= 0;
        led     <= 0;
    end else if (counter == MAX_COUNT - 1) begin
        counter <= 0;
        led     <= ~led;
    end else begin
        counter <= counter + 1;
    end
end

endmodule
