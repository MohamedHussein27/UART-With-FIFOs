// this is the top module connecting between Baud Generator, Tx_Unit and Rx_Unit
module UART_TOP #(
    parameter CLK_FREQ = 50_000_000, // System clock frequency in Hz
    parameter SAMPLE = 16     // Most common oversampling in UART 
) (
    input SysClk, // system clock
    input rst,  // reset signal is universal 
    input [1:0] baud_selector,
    input [7:0] data_in,  // external system input data
    input parity_sel,
    input start_Tx, // to start the transaction between the two FIFOs 
    input receive, // order to receive data from external system
    output [8:0] data_out, // parallel output data, the output data increaced one bit
    output OE, BE, FE // Error output signals
);
    // internal wires
    // baud clocl wire (universal)
    wire baud_clk;
    // signal between the two FIFOs (serial data)
    wire piso_out ;  // output from Tx_FIFO to Rx_FIFO
    wire Rx_ready;  // signal from Rx_FIFO to Tx_FIFO


    //****************** Baud_Rate_Generator ****************\\
    Baud_Rate_Generator #(
        CLK_FREQ,
        SAMPLE
    ) baud_generator (
        .SysClk(SysClk),
        .rst(rst),
        .baud_selector(baud_selector),
        .baud_clk(baud_clk)
    );


    //****************** Tx_Unit ****************\\
    Tx_Unit Tx_unit(
        .baud_clk(baud_clk),
        .rst(rst),
        .data_in(data_in),
        .parity_sel(parity_sel),
        .start_Tx(start_Tx),
        .Rx_ready(Rx_ready),
        .data_out(piso_out)
    );


    //****************** Rx_Unit ****************\\
    Rx_Unit Rx_unit(
        .baud_clk(baud_clk),
        .rst(rst),
        .data_in(piso_out),
        .receive(receive),
        .Rx_ready(Rx_ready),
        .data_out(data_out),
        .OE(OE),
        .BE(BE),
        .FE(FE)
    );
endmodule