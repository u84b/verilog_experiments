`timescale 1ns/1ns

module light_controller_tb;

reg clk = 0;
reg rst = 1;
reg [7:0] light_adc;

wire lamp_pwm;

light_controller dut (
    .clk(clk),
    .rst(rst),
    .light_adc(light_adc),
    .lamp_pwm(lamp_pwm)
);

// Тактовый сигнал с периодом 10 ns
always #5 clk = ~clk;

initial begin
    $dumpfile("light_controller.vcd");
    $dumpvars(0, light_controller_tb);

    // Начальное состояние
    light_adc = 8'd0;

    // Сброс
    #12;
    rst = 0;

    // Темно: лампа почти полностью включена
    #2560;
    light_adc = 8'd64;

    // Средняя освещенность
    #2560;
    light_adc = 8'd128;

    // Светло: лампа почти выключена
    #2560;
    light_adc = 8'd220;

    #2560;
    $finish;
end

endmodule