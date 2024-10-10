# UART Protocol with FIFOs

## Overview
The **Universal Asynchronous Receiver/Transmitter (UART)** is a popular communication protocol used for serial communication between devices. It allows for full-duplex data exchange, meaning data can be sent and received simultaneously. UART is commonly used in embedded systems, microcontrollers, and FPGA designs for communication between hardware and peripheral devices.

This repository contains the Verilog implementation of a UART protocol with FIFOs for handling data transmission and reception. The design includes features such as configurable baud rates, parity error detection, and FIFO buffers for more efficient data handling.

---

## UART Structure
*Image placeholder for UART structure*

---

## Signals

| **Signal**         | **Direction** | **Description**                                                                                   |
|--------------------|---------------|---------------------------------------------------------------------------------------------------|
| **TXD**            | Input         | Transmit data input.                                                                               |
| **RXD**            | Input         | Receive data input.                                                                                |
| **Baud Clock**     | Input         | Controls the baud rate of the UART communication.                                                  |
| **Parity Enable**  | Input         | Enables or disables parity checking.                                                               |
| **Parity Type**    | Input         | Determines whether parity is even or odd when parity is enabled.                                   |
| **Reset**          | Input         | Resets the UART logic and FIFOs.                                                                   |
| **TX Ready**       | Output        | Indicates that the transmitter is ready to accept new data.                                        |
| **RX Ready**       | Output        | Indicates that there is valid data available in the receive buffer.                                |
| **Error Signal**   | Output        | Signals an error such as framing error, parity error, or buffer overflow.                          |
| **Parity Error**   | Output        | Indicates a parity mismatch when enabled.                                                          |
| **Frame Error**    | Output        | Raised when the received data frame does not match the expected format (start, stop, data bits).    |
| **Overflow**       | Output        | Raised if the FIFO buffer overflows before the data can be read.                                   |

---

## Verifying Functionality

> **Note:** In the waveform visualizations:
> - **Baud Generator signals** are shown in **magenta**.
> - **TX Unit** signals are highlighted in **blue**.
> - **RX Unit** signals are highlighted in **gold**.

In this section, we verify the functionality of the UART design through various test scenarios, including normal data transmission, corner cases, and error handling. The following scenarios will demonstrate the correctness of the UART implementation:

### First Scenario
we will write in the Tx_FIFO four different values, transmit two values to Rx_FIFO and then receive just one value from Rx_FIFO
- **Four different values** written into **Tx_FIFO**:
![Project Image](https://github.com/MohamedHussein27/FIFO-Verification/blob/main/Doc/FIFO.png)

- **Two values** from Tx_FIFO are transmitted to **Rx_FIFO** and data_out is the **first element** in Rx_FIFO:
![Project Image](https://github.com/MohamedHussein27/FIFO-Verification/blob/main/Doc/FIFO.png)

- Full wave of first scenario:
![Project Image](https://github.com/MohamedHussein27/FIFO-Verification/blob/main/Doc/FIFO.png)

### Second Scenario
_Description of the second scenario goes here..._

### Third Scenario
_Description of the third scenario goes here..._

---

## General Mechanism
- _First bullet point_
- _Second bullet point_
- _Third bullet point_

---

## Explanation & Speed
All design files have detailed comments within them, so if anyone gets confused about a specific part, they can refer to the design file for clarity.

Additionally, to streamline the testing process, I created a **do file** for the **TX Unit** and another for the **RX Unit**, enabling faster execution and simulation.

---

## Vivado
*Image placeholder for Vivado simulation and synthesis results*
