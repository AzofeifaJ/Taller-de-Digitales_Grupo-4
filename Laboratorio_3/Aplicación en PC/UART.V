`timescale 1ns / 1ps
module uart_tx (
    input wire clk,
    output reg tx
);

    // Declaración de estados
    parameter READY = 2'b00;
    parameter START = 2'b01;
    parameter DATA  = 2'b10;
    parameter STOP  = 2'b11;

    reg [1:0] present_state = READY;
    reg [7:0] store;
    reg baud_clk = 0;
    integer baud_count = 0;
    integer bit_index = 0;
    integer j = 0;

    // Datos a transmitir
    reg [7:0] data [0:12]; // Array de datos (0 a 12, total 13 elementos)

    initial begin
        // Inicialización del array de datos
        data[0] = 8'h48; // H
        data[1] = 8'h65; // e
        data[2] = 8'h6C; // l
        data[3] = 8'h6F; // o
        data[4] = 8'h20; //  
        data[5] = 8'h57; // W
        data[6] = 8'h6F; // o
        data[7] = 8'h72; // r
        data[8] = 8'h6C; // l
        data[9] = 8'h64; // d
        data[10] = 8'h21; // !
        data[11] = 8'h0D; // \r
        data[12] = 8'h00; // \0
    end

    // Proceso para la generación de baud_clk
    always @(posedge clk) begin
        if (baud_count == 325) begin
            baud_clk <= 1;
            baud_count <= 0;
        end else begin
            baud_count <= baud_count + 1;
            baud_clk <= 0;
        end
    end

    // Proceso principal
    always @(posedge baud_clk) begin
        case (present_state)
            READY: begin
                if (j < 13) begin
                    store <= data[j]; // Cargar el próximo dato
                    tx <= 0; // Bit de inicio
                    bit_index <= 0;
                    present_state <= START;
                end else begin
                    tx <= 1; // Línea en reposo
                end
            end

            START: begin
                present_state <= DATA; // Pasar al envío de datos
            end

            DATA: begin
                if (bit_index < 8) begin
                    tx <= store[bit_index]; // Enviar el bit correspondiente
                    bit_index <= bit_index + 1;
                end else begin
                    tx <= 1; // Preparar el bit de parada
                    present_state <= STOP;
                end
            end

            STOP: begin
                if (j < 12) begin
                    j <= j + 1; // Avanzar al siguiente dato
                    present_state <= READY; // Regresar al estado READY
                end else begin
                    j <= 0; // Reiniciar el contador
                    present_state <= READY; // Finalizar la transmisión
                end
            end
        endcase
    end
endmodule
