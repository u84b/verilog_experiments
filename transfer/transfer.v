`timescale 1ns/1ns

module transfer (
    input  wire       clk,
    input  wire       rst,
    input  wire       chip_select,
    input  wire [7:0] mosi,
    input  wire [7:0] multiplier,

    output reg        miso_bit,
    output reg  [7:0] miso
);

    reg [3:0] counter;
    wire      bit_result = mosi[7 - counter] & multiplier[7 - counter];

    always @(posedge clk) begin
        if (rst || chip_select) begin
            counter  <= 4'd0;
            miso     <= 8'd0;
            miso_bit <= 1'b0;
        end else begin
            miso_bit         <= bit_result;
            miso[7 - counter] <= bit_result;

            if (counter == 4'd7)
                counter <= 4'd0;    // кончаем...
            else
                counter <= counter + 4'd1;
        end
    end

endmodule