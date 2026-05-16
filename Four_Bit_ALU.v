// Determine Input Signals, Output Signals, and Intermediate Logic
// Build Out Components Individually
// Figure out how to create Muxes and Connect Components together
// Write Testcases

module Four_Bit_ALU(input signed [3:0] A, input[3:0] B, input F, input [2:0] S, output reg[3:0]O);
    always @(*) 
        case(S)
            3'b000 : O = A & B;
            3'b001 : O = A | B;
            3'b010 : O = A ^ B;
            3'b011 : begin
                case(F)
                    1'b0 : O = A + B;
                    1'b1 : O = A + (~B + 4'b0001);
                endcase
            end
            3'b100: O = A <<< B;
            3'b101: O = A >>> B;
            default : begin
                $display("Invalid Select Bits: Undefined Behavior");
                O = 4'b0000;
            end
        endcase
endmodule
        
    

    