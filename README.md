# 4-Bit-ALU
My implementation of a 4 bit 2s complement ALU with basic operations

# Description

This is my design of a 2s complement 4 Bit ALU capable of AND, OR, XOR, Addition, Subtraction, Arithmetic Left Shift, and Arithmetic Right Shift. In implementing this
project, I started by using logic gates to draw out the design of these operation in Logisim. Once I had made the Logisim Diagram, I moved onto implementing the ALU in 
Verilog and writing testbenches to verify that my Verilog implementation worked as expected. My ALU has 4 inputs: A (4 bits), B (4 Bits), F (1 Bit), and S (3 bits), and 
one output: O (4 bits). My ALU works by using A and B (and for addition/subtraction F) as inputs to all the operations, and producing an output for each one. Each of these outputs are fed into a 8-1 Multiplexer, whose select bits are the S input. Thus, from the outside, the S input essentially determines what operation the ALU does. Below is
a table showing what operation corresponds to what value of the S input

# Operation Table

| S   | Operation |
| -------- | ------- |
| 000  | AND    |
| 001 | OR     |
| 010    | XOR    |
| 011    | ADD/SUB    |
| 100    | Arithmetic Left Shift    |
| 101    | Arithmetic Right Shift   |
| 110    | Undefined    |
| 111    | Undefined    |

If the S input is one of the Undefined Values, in the simulation I have it display an error message, but on the Logisim Diagram I do not really have a way to alert the user.

# AND, OR, XOR

These operations are as follows: If the S input corresponds to these operations, O is assigned to either A & B, A | B, or A ^ B.

## AND Testbench Screenshots
![My Image](C:\Users\conne\OneDrive\Pictures)

# ADD/SUB

For this operation, the 3 important inputs are A, B, and F. Since the circuitry for 2s Complement Addition and Subtraction are very similar, I used the F input to signal
which operation I want to do. If F = 0, O is simply assigned to A + B, but if F = 1, O is assigned to A + (~B + 1), which is equivalent to A - B. I chose to use that
syntax, as that is the process I use to find the negative version of a number in 2s complement. One thing to note about addition/subtraction is that I do not have a way to
flag overflow, meaning that sometimes you may add 2 negative numbers or 2 positive numbers, and get an answer that is opposite sign of what you were expecting.

# Arithmetic Left Shift/ Arithmetic Right Shift

In order to implement these operations, I treated A as the number I was shifting Left or Right, while using the least 2 significant bits of B to signify how much I was
shifting A by. The reason I opted to use the 2 Least Significant Bits of B is because this is a 4 bit ALU with the "Numbers" (A,B) being 4 bits. Thus, if you shift in either
direction more than 3 bits, you are not really changing anything. Thus, I only need to use the Lowest 2 bits of B to signify all the possible shifts I can do. The basic 
idea on how I implemented this operation was by essentially hard coding a shift of A by 0-3 bits, and putting those outputs in a 4-1 Multiplexer, with the select bits being
the 2 Least Significant Bits of B. The only difference in how I implemented Right Shift vs. Left Shift, is that for Right Shift I preserved the MSB, while Left Shift adds 0
as the new bit. If you select this operation with a B value that is greater than 3 (0011), then the amount you shift by is still determined by the 2 Least Significant Bits
(Ex: 1101 will shift by 1 bit). It is also worth mentioning that for this operation, the lower 2 bits of B are treated as an unsigned, not 2s complement, but A is still
treated as a 2s complement input. 

# How to run

Commands to Run Testbench
1. iverilog -o Four_Bit_ALU_tb.vvp Four_Bit_ALU_tb.v
2. vvp Four_Bit_ALU_tb.vvp
3. gtkwave
