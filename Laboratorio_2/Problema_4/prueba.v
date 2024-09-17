`timescale 1ps/1ps

module top(
    input clk,        // Reloj 27Mhz
    input resetn,     // Reset activo bajo
    input btn_n,      // Entrada del pin 3 (botón de encendido/apagado)

    output reg lcd_resetn, // Reset para la pantalla LCD
    output reg lcd_clk,    // Señal de reloj para la pantalla LCD
    output reg lcd_cs,     // Señal de selección de chip para la pantalla LCD
    output reg lcd_rs,     // Señal de registro de comando/datos para la pantalla LCD
    output reg lcd_data    // Línea de datos (MOSI)
);

parameter CNT_100MS = 32'd2700000; // Ajuste según la frecuencia del reloj
parameter CNT_200MS = 32'd5400000; // Ajuste según la frecuencia del reloj

// Estados de la inicialización
localparam INIT_RESET   = 4'b0000; // 100ms durante el reset
localparam INIT_PREPARE = 4'b0001; // 200ms después del reset
localparam INIT_DONE    = 4'b0010; // Inicialización completada

// Variables de control y estado
reg [3:0] init_state;
reg [31:0] clk_cnt;
reg lcd_enabled;

always @(posedge clk or negedge resetn) begin
    if (~resetn) begin
        clk_cnt <= 0;
        init_state <= INIT_RESET;
        lcd_cs <= 1;
        lcd_rs <= 1;
        lcd_resetn <= 0;
        lcd_data <= 1;
        lcd_clk <= 0;
        lcd_enabled <= 0;  // Apagar LCD inicialmente
    end else begin
        if (~btn_n) begin
            lcd_enabled <= 0; // Apagar LCD si btn_n está presionado
        end else begin
            lcd_enabled <= 1; // Encender LCD si btn_n no está presionado
        end

        if (lcd_enabled) begin
            case (init_state)
                INIT_RESET: begin
                    if (clk_cnt == CNT_100MS) begin
                        clk_cnt <= 0;
                        init_state <= INIT_PREPARE;
                        lcd_resetn <= 1; // Salir de reset
                    end else begin
                        clk_cnt <= clk_cnt + 1;
                    end
                end

                INIT_PREPARE: begin
                    if (clk_cnt == CNT_200MS) begin
                        clk_cnt <= 0;
                        init_state <= INIT_DONE;
                    end else begin
                        clk_cnt <= clk_cnt + 1;
                    end
                end

                INIT_DONE: begin
                    // Aquí puedes agregar más lógica para inicializar la pantalla LCD
                    // En este estado, la pantalla debería estar encendida y lista para recibir datos
                end

                default: init_state <= INIT_RESET;
            endcase
        end else begin
            // Cuando lcd_enabled es 0, se apaga la pantalla LCD
            lcd_resetn <= 0;
            lcd_cs <= 1;
            lcd_rs <= 1;
            lcd_data <= 0;
            lcd_clk <= 0;
        end
    end
end

endmodule
