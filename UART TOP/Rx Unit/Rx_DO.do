vlib work
vlog Rx_FIFO.v Rx_Receiver.v  Error_Detector.v Tx_FIFO.v Tx_Transmitter.v Parity_Selector.v Rx_Unit.v Tx_Unit.v Baud_Rate_Generator.v UART_TOP.v UART_tb.sv
vsim -voptargs=+acc work.UART_tb -cover
add wave *
add wave -position insertpoint  \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/baud_clk \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/data_in \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/receive_order \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/RxFE \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/data_out \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/Rx_FIFO \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/RxFF \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/transfer_flag \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/done_receiving \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/R_bus \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/serial_counter \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/filling_counter \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/sending_counter \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/Rx_ready \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/FE \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/BE \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/OE \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/ns \
sim:/UART_tb/dut/Rx_unit/Rx_fifo/cs \
add wave -position insertpoint  \
sim:/UART_tb/dut/Rx_unit/Rx_receiver/data_in \
sim:/UART_tb/dut/Rx_unit/Rx_receiver/RxFE \
sim:/UART_tb/dut/Rx_unit/Rx_receiver/receive \
sim:/UART_tb/dut/Rx_unit/Rx_receiver/receive_order \
sim:/UART_tb/dut/Rx_unit/Rx_receiver/data_out \
add wave -position insertpoint  \
sim:/UART_tb/dut/Rx_unit/Error_detector/data_in \
sim:/UART_tb/dut/Rx_unit/Error_detector/OE \
sim:/UART_tb/dut/Rx_unit/Error_detector/BE \
sim:/UART_tb/dut/Rx_unit/Error_detector/FE
run -all