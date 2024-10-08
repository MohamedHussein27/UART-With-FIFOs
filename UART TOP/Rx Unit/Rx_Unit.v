// this module is including all receiving modules instantiated 
module Rx_Unit #(
    parameter FIFO_WIDTH_R = 12 , // 8 bits for data, one for parity and three for errors
    parameter FIFO_DEPTH_R = 16
) (
    input baud_clk, rst,
    input data_in, // serial input data
    input receive, // order to receive data from external system
    output Rx_ready, // flag from Rx_FIFO to state that the FIFO is ready for receiving from Tx_FIFO
    output [8:0] data_out, // parallel output data, the output data increaced one bit due to the parity bit
    output OE, BE, FE // Error output signals
);
    // internal wires
    //signals for Rx_FIFO, Rx_Receiver and Error_Detector
    wire [FIFO_WIDTH_R-1:0] fifo_out;
    //signals for Rx_FIFO and Rx_Receiver
    wire RxFE;
    wire receive_order;



    //****************** Rx_FIFO ****************\\
    Rx_FIFO #(
        FIFO_WIDTH_R,
        FIFO_DEPTH_R
    ) Rx_fifo (
        .baud_clk(baud_clk),
        .rst(rst),
        .data_in(data_in),
        .receive_order(receive_order),
        .RxFE(RxFE),
        .Rx_ready(Rx_ready),
        .data_out(fifo_out)  
    );


    //****************** Rx_Receiver ****************\\
    Rx_Receiver Rx_receiver(
        .baud_clk(baud_clk),
        .rst(rst),
        .data_in(fifo_out),
        .RxFE(RxFE),
        .receive(receive),
        .receive_order(receive_order),
        .data_out(data_out)
    );


    //****************** Error_Detector ****************\\
    Error_Detector Error_detector(
        .rst(rst),
        .data_in(fifo_out),
        .OE(OE),
        .BE(BE),
        .FE(FE)
    );
    
endmodule