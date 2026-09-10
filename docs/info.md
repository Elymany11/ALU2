<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a 16-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs various arithmetic and logical operations based on an input control signal (opcode). Internally, the design utilizes sub-modules such as Ripple Carry Adders for arithmetic addition and subtraction, as well as Array and Wallace tree structures for efficient multiplication operations.

## How to test

To test the ALU:
1. Apply the 16-bit input values for Operand A and Operand B.
2. Set the operation code (opcode) to select the desired function (e.g., Addition, Multiplication, AND, OR).
3. Observe the output result on the designated output pins.
You can run the provided Verilog testbench to simulate the design and verify the outputs against expected values across different operations and edge cases.

## External hardware

No specific external hardware is required. The design can be tested using standard input switches (for operands and opcode) and output LEDs or a 7-segment display (for the result) on the development board.
