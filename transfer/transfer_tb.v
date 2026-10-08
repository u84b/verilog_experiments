`timescale 1ns/1ns

module transfer_tb;

    reg        clk         = 0;
    reg        rst         = 1;
    reg        chip_select = 1;
    reg  [7:0] mosi        = 8'b0101_1100;
    reg  [7:0] mult        = 8'b1111_1111;

    wire       miso_bit;
    wire [7:0] miso;

    // bruuuuh
    transfer dut (
        .clk         (clk),
        .rst         (rst),
        .chip_select (chip_select),
        .mosi        (mosi),
        .multiplier  (mult),
        .miso_bit    (miso_bit),
        .miso        (miso)
    );

    // T=10ns
    always #5 clk = ~clk;

    initial begin
        $dumpfile("transfer.vcd");
        $dumpvars(0, transfer_tb);

        // сброс
        #20 rst = 0;

        #10 chip_select = 0;      // bullshit
        #80 chip_select = 1;

        #20 $finish;
    end

endmodule