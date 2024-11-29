
`timescale 1ns / 1ps
module uart_tx (
    input wire clk,
    output reg tx
);

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

    reg [7:0] data [0:12];

    initial begin
        data[0] = 8'h48;
        data[1] = 8'h65;
        data[2] = 8'h6C;
        data[3] = 8'h6F;
        data[4] = 8'h20;
        data[5] = 8'h57;
        data[6] = 8'h6F;
        data[7] = 8'h72;
        data[8] = 8'h6C;
        data[9] = 8'h64;
        data[10] = 8'h21;
        data[11] = 8'h0D;
        data[12] = 8'h00;
    end

    always @(posedge clk) begin
        if (baud_count == 325) begin
            baud_clk <= 1;
            baud_count <= 0;
        end else begin
            baud_count <= baud_count + 1;
            baud_clk <= 0;
        end
    end

    always @(posedge baud_clk) begin
        case (present_state)
            READY: begin
                if (j < 13) begin
                    store <= data[j];
                    tx <= 0;
                    bit_index <= 0;
                    present_state <= START;
                end else begin
                    tx <= 1;
                end
            end

            START: present_state <= DATA;

            DATA: begin
                if (bit_index < 8) begin
                    tx <= store[bit_index];
                    bit_index <= bit_index + 1;
                end else begin
                    tx <= 1;
                    present_state <= STOP;
                end
            end

            STOP: begin
                if (j < 12) begin
                    j <= j + 1;
                    present_state <= READY;
                end else begin
                    j <= 0;
                    present_state <= READY;
                end
            end
        endcase
    end
endmodule
