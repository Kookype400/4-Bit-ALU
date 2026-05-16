`include "Four_Bit_ALU.v"
module Four_Bit_ALU_tb;
    reg[3:0] A,B;
    reg F;
    reg[2:0] S;
    wire[3:0] O;
    Four_Bit_ALU ALU1(A,B,F,S,O);
    initial 
        begin
            $dumpfile("Four_Bit_ALU.vcd");
            $dumpvars(0,Four_Bit_ALU_tb);
            // AND Test
            A = 4'b0000; B = 4'b0000; F = 0; S = 3'b000;
            #1
            $display("AND: A=0000 B=0000 F = 0 Expected=0000 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b0000; F = 0; S = 3'b000;
            #1
            $display("AND: A=0000 B=0000 F = 0 Expected=0000 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b1111; F = 0; S = 3'b000;
            #1
            $display("AND: A=1111 B=1111 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b0000; B = 4'b1111; F = 0; S = 3'b000;
            #1
            $display("AND: A=0000 B=1111 F = 0 Expected=0000 Got=%b", O);
            #1
            // OR Test
            A = 4'b0000; B = 4'b0000; F = 0; S = 3'b001;
            #1
            $display("OR: A=0000 B=0000 F = 0 Expected=0000 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b0000; F = 0; S = 3'b001;
            #1
            $display("OR: A=1111 B=0000 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b1111; F = 0; S = 3'b001;
            #1
            $display("OR: A=1111 B=1111 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b0000; B = 4'b1111; F = 0; S = 3'b001;
            #1
            $display("OR: A=0000 B=1111 F = 0 Expected=1111 Got=%b", O);
            #1
            //XOR Test
            A = 4'b0000; B = 4'b0000; F = 0; S = 3'b010;
            #1
            $display("XOR: A=0000 B=0000 F = 0 Expected=0000 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b0000; F = 0; S = 3'b010;
            #1
            $display("XOR: A=1111 B=0000 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b1111; F = 0; S = 3'b010;
            #1
            $display("XOR: A=1111 B=1111 F = 0 Expected=0000 Got=%b", O);
            #1
            A = 4'b0000; B = 4'b1111; F = 0; S = 3'b010;
            #1
            $display("XOR: A=0000 B=1111 F = 0 Expected=1111 Got=%b", O);
            #1
            //ADD-SUB Test
            A = 4'b0000; B = 4'b0000; F = 0; S = 3'b011; // 0 + 0
            #1
            $display("ADD/SUB: A=0000 B=0000 F = 0 Expected=0000 Got=%b", O);
            #1
            A = 4'b0011; B = 4'b0001; F = 0; S = 3'b011; // 3 + 1
            #1
            $display("ADD/SUB: A=0011 B=0001 F = 0 Expected=0100 Got=%b", O);
            #1
            A = 4'b1000; B = 4'b0111; F = 0; S = 3'b011; // -8 + 7
            #1
            $display("ADD/SUB: A=1000 B=0111 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b0000; B = 4'b1111; F = 0; S = 3'b011; // -1 + 0
            #1
            $display("ADD/SUB: A=0000 B=1111 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b0000; B = 4'b0000; F = 1; S = 3'b011; // 0 - 0
            #1
            $display("ADD/SUB: A=0000 B=0000 F = 1 Expected=0000 Got=%b", O);
            #1
            A = 4'b0011; B = 4'b0001; F = 1; S = 3'b011; // 3 - 1
            #1
            $display("ADD/SUB: A=0011 B=0001 F = 1 Expected=0010 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b0111; F = 1; S = 3'b011; // -1 - 7
            #1
            $display("ADD/SUB: A=1111 B=0111 F = 1 Expected=1000 Got=%b", O);
            #1
            A = 4'b0000; B = 4'b1111; F = 1; S = 3'b011; // 0 - -1
            #1
            $display("ADD/SUB: A=0000 B=1111 F = 1 Expected=0001 Got=%b", O);
            #1
            //ALS Test
            A = 4'b1111; B = 4'b0000; F = 0; S = 3'b100; //Left Shift 0
            #1
            $display("ALS: A=1111 B=0000 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b0001; F = 0; S = 3'b100; //Left Shift 1
            #1
            $display("ALS: A=1111 B=0001 F = 0 Expected=1110 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b0010; F = 0; S = 3'b100; //Left Shift 2
            #1
            $display("ALS: A=1111 B=0010 F = 0 Expected=1100 Got=%b", O);
            #1
            A = 4'b1111; B = 4'b0011; F = 0; S = 3'b100; //Left Shift 3
            #1
            $display("ALS: A=1111 B=0011 F = 0 Expected=1000 Got=%b", O);
            #1
            A = 4'b0010; B = 4'b0000; F = 0; S = 3'b100; //Left Shift 0
            #1
            $display("ALS: A=0010 B=0000 F = 0 Expected=0010 Got=%b", O);
            #1
            A = 4'b0010; B = 4'b0001; F = 0; S = 3'b100; //Left Shift 1
            #1
            $display("ALS: A=0010 B=0001 F = 0 Expected=0100 Got=%b", O);
            #1
            A = 4'b0010; B = 4'b0010; F = 0; S = 3'b100; //Left Shift 2
            #1
            $display("ALS: A=0010 B=0010 F = 0 Expected=1000 Got=%b", O);
            #1
            A = 4'b0010; B = 4'b0011; F = 0; S = 3'b100; //Left Shift 3
            #1
            $display("ALS: A=0010 B=0011 F = 0 Expected=0000 Got=%b", O);
            #1
            //ARS Tests
            A = 4'b1000; B = 4'b0000; F = 0; S = 3'b101; //Right Shift 0
            #1
            $display("ARS: A=1000 B=0000 F = 0 Expected=1000 Got=%b", O);
            #1
            A = 4'b1000; B = 4'b0001; F = 0; S = 3'b101; //Right Shift 1
            #1
            $display("ARS: A=1000 B=0001 F = 0 Expected=1100 Got=%b", O);
            #1
            A = 4'b1000; B = 4'b0010; F = 0; S = 3'b101; //Right Shift 2
            #1
            $display("ARS: A=1000 B=0010 F = 0 Expected=1110 Got=%b", O);
            #1
            A = 4'b1000; B = 4'b0011; F = 0; S = 3'b101; //Right Shift 3
            #1
            $display("ARS: A=1000 B=0011 F = 0 Expected=1111 Got=%b", O);
            #1
            A = 4'b0111; B = 4'b0000; F = 0; S = 3'b101; //Right Shift 0
            #1
            $display("ARS: A=0111 B=0000 F = 0 Expected=0111 Got=%b", O);
            #1
            A = 4'b0111; B = 4'b0001; F = 0; S = 3'b101; //Right Shift 1
            #1
            $display("ARS: A=0111 B=0001 F = 0 Expected=0011 Got=%b", O);
            #1
            A = 4'b0111; B = 4'b0010; F = 0; S = 3'b101; //Right Shift 2
            #1
            $display("ARS: A=0111 B=0010 F = 0 Expected=0001 Got=%b", O);
            #1
            A = 4'b0111; B = 4'b0011; F = 0; S = 3'b101; //Right Shift 3
            #1
            $display("ARS: A=0111 B=0011 F = 0 Expected=0000 Got=%b", O);
            #1
            //Undefined Tests
            A = 4'b0111; B = 4'b0010; F = 0; S = 3'b110; //Undefined
            #1
            $display("Expected=0000 Got=%b", O);
            #1
            A = 4'b0111; B = 4'b0011; F = 0; S = 3'b111; //Undefined
            #1
            $display("Expected=0000 Got=%b", O);
            #1
            $finish;
        end
endmodule    
