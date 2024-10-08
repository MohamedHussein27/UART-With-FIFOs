vlib work
vlog Rx_FIFO.v Rx_Receiver.v  Error_Detector.v Tx_FIFO.v Tx_Transmitter.v Parity_Selector.v Rx_Unit.v Tx_Unit.v Baud_Rate_Generator.v UART_TOP.v UART_tb.sv
vsim -voptargs=+acc work.UART_tb -cover
add wave *
add wave -position insertpoint  \
sim:/UART_tb/SysClk \
sim:/UART_tb/rst \
sim:/UART_tb/baud_selector \
sim:/UART_tb/data_in \
sim:/UART_tb/parity_sel
add wave -position insertpoint  \
sim:/UART_tb/dut/baud_generator/baud_clk \
sim:/UART_tb/dut/baud_generator/DIVISOR \
sim:/UART_tb/dut/baud_generator/counter
add wave -position insertpoint  \
sim:/UART_tb/dut/Tx_unit/data_Trans_FIFO \
add wave -position insertpoint  \
sim:/UART_tb/dut/Tx_unit/TxFF \
add wave -position insertpoint  \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/start_Tx \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/start_Rx \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/parity_bit \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/data_in \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/TxFF \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/data_out \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/Tx_FIFO \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/TxFE \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/active_flag \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/done_transmission \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/serial_counter \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/filling_counter \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/sending_counter \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/Rx_ready \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/bus \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/ns \
sim:/UART_tb/dut/Tx_unit/Tx_fifo/cs
add wave -position insertpoint  \
sim:/UART_tb/dut/Tx_unit/transmitter/data_in \
sim:/UART_tb/dut/Tx_unit/transmitter/data_out \
sim:/UART_tb/dut/Tx_unit/transmitter/start_Rx \
sim:/UART_tb/dut/Tx_unit/transmitter/new \
sim:/UART_tb/dut/Tx_unit/transmitter/next \
sim:/UART_tb/dut/Tx_unit/transmitter/prev \
run -all