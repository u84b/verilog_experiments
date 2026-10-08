`timescale 1ns/1ps

module light_controller (
    input  wire       clk,
    input  wire       rst,

    // Условный результат ADC:
    // 0   = темно
    // 255 = очень светло
    input  wire [7:0] light_adc,

    // PWM-сигнал для лампы
    output wire       lamp_pwm
);

    reg [7:0] pwm_counter;

    // Яркость лампы:
    // темно  -> duty близко к 255
    // светло -> duty близко к 0
    wire [7:0] lamp_duty;

    assign lamp_duty = 8'd255 - light_adc;

    // Счетчик PWM
    always @(posedge clk) begin
        if (rst)
            pwm_counter <= 8'd0;
        else
            pwm_counter <= pwm_counter + 8'd1;
    end

    // Если счетчик меньше duty, лампа включена
    assign lamp_pwm = (pwm_counter < lamp_duty);

endmodule