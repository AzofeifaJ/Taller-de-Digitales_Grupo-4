`timescale 1ps/1ps

module top(
	input clk,       // Reloj 27Mhz
	input resetn,    // Reset activo bajo

	output ser_tx,   // UART transmisión (no utilizado en este código)
	input ser_rx,    // UART recepción (no utilizado en este código)

	output lcd_resetn, // Reset para la pantalla LCD
	output lcd_clk,    // Señal de reloj para la pantalla LCD
	output lcd_cs,     // Señal de selección de chip para la pantalla LCD
	output lcd_rs,     // Señal de registro de comando/datos para la pantalla LCD
	output lcd_data    // Línea de datos (MOSI)
);
/*    // UART signals
    reg [7:0] tx_data;
    reg tx_start;
    wire tx_done;
    wire [7:0] rx_data;
    wire rx_ready;
    // Instantiate UART transmitter
    uart_tx uart_tx_inst (
        .clk(clk),
        .resetn(resetn),
        .tx_data(tx_data),
        .tx_start(tx_start),
        .ser_tx(ser_tx),
        .tx_done(tx_done)
    );
    // Instantiate UART receiver
    uart_rx uart_rx_inst (
        .clk(clk),
        .resetn(resetn),
        .ser_rx(ser_rx),
        .rx_data(rx_data),
        .rx_ready(rx_ready)
    );*/
localparam MAX_CMDS = 69;  // Máximo de comandos para la inicialización del LCD

wire [8:0] init_cmd[MAX_CMDS:0];

// Secuencia de comandos de inicialización de la pantalla LCD (ST7789V)
assign init_cmd[ 0] = 9'h036;
assign init_cmd[ 1] = 9'h170;
assign init_cmd[ 2] = 9'h03A;
assign init_cmd[ 3] = 9'h105;
assign init_cmd[ 4] = 9'h0B2;
assign init_cmd[ 5] = 9'h10C;
assign init_cmd[ 6] = 9'h10C;
assign init_cmd[ 7] = 9'h100;
assign init_cmd[ 8] = 9'h133;
assign init_cmd[ 9] = 9'h133;
assign init_cmd[10] = 9'h0B7;
assign init_cmd[11] = 9'h135;
assign init_cmd[12] = 9'h0BB;
assign init_cmd[13] = 9'h119;
assign init_cmd[14] = 9'h0C0;
assign init_cmd[15] = 9'h12C;
assign init_cmd[16] = 9'h0C2;
assign init_cmd[17] = 9'h101;
assign init_cmd[18] = 9'h0C3;
assign init_cmd[19] = 9'h112;
assign init_cmd[20] = 9'h0C4;
assign init_cmd[21] = 9'h120;
assign init_cmd[22] = 9'h0C6;
assign init_cmd[23] = 9'h10F;
assign init_cmd[24] = 9'h0D0;
assign init_cmd[25] = 9'h1A4;
assign init_cmd[26] = 9'h1A1;
assign init_cmd[27] = 9'h0E0;
assign init_cmd[28] = 9'h1D0;
assign init_cmd[29] = 9'h104;
assign init_cmd[30] = 9'h10D;
assign init_cmd[31] = 9'h111;
assign init_cmd[32] = 9'h113;
assign init_cmd[33] = 9'h12B;
assign init_cmd[34] = 9'h13F;
assign init_cmd[35] = 9'h154;
assign init_cmd[36] = 9'h14C;
assign init_cmd[37] = 9'h118;
assign init_cmd[38] = 9'h10D;
assign init_cmd[39] = 9'h10B;
assign init_cmd[40] = 9'h11F;
assign init_cmd[41] = 9'h123;
assign init_cmd[42] = 9'h0E1;
assign init_cmd[43] = 9'h1D0;
assign init_cmd[44] = 9'h104;
assign init_cmd[45] = 9'h10C;
assign init_cmd[46] = 9'h111;
assign init_cmd[47] = 9'h113;
assign init_cmd[48] = 9'h12C;
assign init_cmd[49] = 9'h13F;
assign init_cmd[50] = 9'h144;
assign init_cmd[51] = 9'h151;
assign init_cmd[52] = 9'h12F;
assign init_cmd[53] = 9'h11F;
assign init_cmd[54] = 9'h11F;
assign init_cmd[55] = 9'h120;
assign init_cmd[56] = 9'h123;
assign init_cmd[57] = 9'h021;
assign init_cmd[58] = 9'h029;
assign init_cmd[59] = 9'h02A; // Comando columna
assign init_cmd[60] = 9'h100;
assign init_cmd[61] = 9'h128;
assign init_cmd[62] = 9'h101;
assign init_cmd[63] = 9'h117;
assign init_cmd[64] = 9'h02B; // Comando fila
assign init_cmd[65] = 9'h100;
assign init_cmd[66] = 9'h135;
assign init_cmd[67] = 9'h100;
assign init_cmd[68] = 9'h1BB;
assign init_cmd[69] = 9'h02C; // Comenzar escritura en memoria

// Estados de la inicialización
localparam INIT_RESET   = 4'b0000; // 100ms durante el reset
localparam INIT_PREPARE = 4'b0001; // 200ms después del reset
localparam INIT_WAKEUP  = 4'b0010; // Comando para salir del modo sleep
localparam INIT_SNOOZE  = 4'b0011; // Espera 120ms después de despertar
localparam INIT_WORKING = 4'b0100; // Envío de comandos y datos
localparam INIT_DONE    = 4'b0101; // Inicialización completada

`ifdef MODELTECH
localparam CNT_100MS = 32'd2700000;
localparam CNT_120MS = 32'd3240000;
localparam CNT_200MS = 32'd5400000;
`else
// Simulación rápida
localparam CNT_100MS = 32'd27;
localparam CNT_120MS = 32'd32;
localparam CNT_200MS = 32'd54;
`endif

// Variables de control y estado
reg [3:0] init_state;
reg [6:0] cmd_index;
reg [31:0] clk_cnt;
reg [4:0] bit_loop;
reg [15:0] pixel_cnt;
reg lcd_cs_r;
reg lcd_rs_r;
reg lcd_reset_r;
reg [7:0] spi_data;

assign lcd_resetn = lcd_reset_r;
assign lcd_clk    = ~clk;      // Reloj invertido
assign lcd_cs     = lcd_cs_r;
assign lcd_rs     = lcd_rs_r;
assign lcd_data   = spi_data[7]; // MSB de los datos

// Color verde en formato RGB565
wire [15:0] pixel = 16'hFFFF; // Color blanco en formato RGB565

// Máquina de estados y control
always @(posedge clk or negedge resetn) begin
	if (~resetn) begin
		clk_cnt <= 0;
		cmd_index <= 0;
		init_state <= INIT_RESET;
		lcd_cs_r <= 1;
		lcd_rs_r <= 1;
		lcd_reset_r <= 0;
		spi_data <= 8'hFF;
		bit_loop <= 0;
		pixel_cnt <= 0;
	end else begin

		case (init_state)

			INIT_RESET : begin
				if (clk_cnt == CNT_100MS) begin
					clk_cnt <= 0;
					init_state <= INIT_PREPARE;
					lcd_reset_r <= 1; // Salir de reset
				end else begin
					clk_cnt <= clk_cnt + 1;
				end
			end

			INIT_PREPARE : begin
				if (clk_cnt == CNT_200MS) begin
					clk_cnt <= 0;
					init_state <= INIT_WAKEUP;
				end else begin
					clk_cnt <= clk_cnt + 1;
				end
			end

			INIT_WAKEUP : begin
				if (bit_loop == 0) begin
					// Enviar comando para salir de sleep
					lcd_cs_r <= 0;
					lcd_rs_r <= 0;
					spi_data <= 8'h11; // Comando para salir de sleep
					bit_loop <= bit_loop + 1;
				end else if (bit_loop == 8) begin
					lcd_cs_r <= 1;
					lcd_rs_r <= 1;
					bit_loop <= 0;
					init_state <= INIT_SNOOZE;
				end else begin
					spi_data <= { spi_data[6:0], 1'b1 };
					bit_loop <= bit_loop + 1;
				end
			end

			INIT_SNOOZE : begin
				if (clk_cnt == CNT_120MS) begin
					clk_cnt <= 0;
					init_state <= INIT_WORKING;
				end else begin
					clk_cnt <= clk_cnt + 1;
				end
			end

			INIT_WORKING : begin
				if (cmd_index == MAX_CMDS + 1) begin
					init_state <= INIT_DONE;
				end else begin
					if (bit_loop == 0) begin
						lcd_cs_r <= 0;
						lcd_rs_r <= init_cmd[cmd_index][8];
						spi_data <= init_cmd[cmd_index][7:0];
						bit_loop <= bit_loop + 1;
					end else if (bit_loop == 8) begin
						lcd_cs_r <= 1;
						lcd_rs_r <= 1;
						bit_loop <= 0;
						cmd_index <= cmd_index + 1; // Siguiente comando
					end else begin
						spi_data <= { spi_data[6:0], 1'b1 };
						bit_loop <= bit_loop + 1;
					end
				end
			end

			INIT_DONE : begin
				if (pixel_cnt == 32400) begin
					; // Stop (pantalla llena)
				end else begin
					if (bit_loop == 0) begin
						lcd_cs_r <= 0;
						lcd_rs_r <= 1;
						spi_data <= pixel[15:8]; // Byte alto del color verde
						bit_loop <= bit_loop + 1;
					end else if (bit_loop == 8) begin
						spi_data <= pixel[7:0]; // Byte bajo del color verde
						bit_loop <= bit_loop + 1;
					end else if (bit_loop == 16) begin
						lcd_cs_r <= 1;
						lcd_rs_r <= 1;
						bit_loop <= 0;
						pixel_cnt <= pixel_cnt + 1; // Siguiente pixel
					end else begin
						spi_data <= { spi_data[6:0], 1'b1 };
						bit_loop <= bit_loop + 1;
					end
				end
			end

		endcase
	end
end

endmodule

module uart_tx(
    input wire clk,
    input wire resetn,
    input wire [7:0] tx_data,
    input wire tx_start,
    output reg ser_tx,
    output reg tx_done
);
    // UART parameters
    parameter BAUD_RATE = 115200;
    parameter CLOCK_FREQ = 27000000; // 27 MHz
    localparam DIVISOR = CLOCK_FREQ / BAUD_RATE;

    // UART state
    reg [15:0] divisor_cnt;
    reg [3:0] bit_cnt;
    reg [7:0] shift_reg;
    reg tx_busy;
    reg tx_enable;

    always @(posedge clk or negedge resetn) begin
        if (~resetn) begin
            divisor_cnt <= 0;
            bit_cnt <= 0;
            shift_reg <= 0;
            tx_busy <= 0;
            ser_tx <= 1;
            tx_done <= 0;
            tx_enable <= 0;
        end else begin
            if (tx_start && !tx_busy) begin
                tx_busy <= 1;
                tx_enable <= 1;
                shift_reg <= tx_data;
                bit_cnt <= 0;
                divisor_cnt <= 0;
                tx_done <= 0;
            end

            if (tx_enable) begin
                if (divisor_cnt < (DIVISOR - 1)) begin
                    divisor_cnt <= divisor_cnt + 1;
                end else begin
                    divisor_cnt <= 0;
                    if (bit_cnt < 8) begin
                        ser_tx <= shift_reg[0];
                        shift_reg <= shift_reg >> 1;
                        bit_cnt <= bit_cnt + 1;
                    end else begin
                        ser_tx <= 1; // Idle state
                        tx_busy <= 0;
                        tx_done <= 1;
                        tx_enable <= 0;
                    end
                end
            end
        end
    end
endmodule

module uart_rx(
    input wire clk,
    input wire resetn,
    input wire ser_rx,
    output reg [7:0] rx_data,
    output reg rx_ready
);
    // UART parameters
    parameter BAUD_RATE = 115200;
    parameter CLOCK_FREQ = 27000000; // 27 MHz
    localparam DIVISOR = CLOCK_FREQ / BAUD_RATE;

    // UART state
    reg [15:0] divisor_cnt;
    reg [3:0] bit_cnt;
    reg [7:0] shift_reg;
    reg rx_busy;
    reg rx_start;
    reg rx_sample;
    
    always @(posedge clk or negedge resetn) begin
        if (~resetn) begin
            divisor_cnt <= 0;
            bit_cnt <= 0;
            shift_reg <= 0;
            rx_busy <= 0;
            rx_start <= 0;
            rx_ready <= 0;
        end else begin
            if (rx_busy) begin
                if (divisor_cnt < (DIVISOR - 1)) begin
                    divisor_cnt <= divisor_cnt + 1;
                end else begin
                    divisor_cnt <= 0;
                    if (bit_cnt < 8) begin
                        shift_reg <= {ser_rx, shift_reg[7:1]};
                        bit_cnt <= bit_cnt + 1;
                    end else begin
                        rx_data <= shift_reg;
                        rx_ready <= 1;
                        rx_busy <= 0;
                    end
                end
            end else if (!ser_rx && !rx_start) begin
                rx_start <= 1;
                rx_busy <= 1;
                bit_cnt <= 0;
                divisor_cnt <= 0;
            end else if (rx_ready) begin
                rx_ready <= 0;
            end
        end
    end
endmodule
