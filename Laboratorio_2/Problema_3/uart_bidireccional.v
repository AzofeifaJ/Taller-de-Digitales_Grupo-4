module uart (
    input wire clk,              // Reloj principal
    input wire rst,              // Reset
    input wire [7:0] data_tx,    // Dato para transmitir
    input wire tx_start,         // Señal para iniciar la transmisión
    input wire rx,               // Línea RX (entrada)
    output wire tx,              // Línea TX (salida)
    output wire [7:0] data_rx,   // Dato recibido
    output wire tx_busy,         // Indicador de transmisión ocupada
    output wire rx_done          // Indicador de recepción completada
);

    uart_tx tx_inst (
        .clk(clk),
        .rst(rst),
        .data_in(data_tx),
        .tx_start(tx_start),
        .tx(tx),
        .tx_busy(tx_busy)
    );

    uart_rx rx_inst (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .data_out(data_rx),
        .rx_done(rx_done)
    );

endmodule
