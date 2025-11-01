// instruction_memory
// Instruction Memory

module instruction_memory (
    input [31:0] A,
    output [31:0] RD
);

reg [31:0] r_instruction [0:31];

// SIMULATION: MACHINE LANGUAGE
initial begin
    r_instruction[0]  = 32'h02328020; // add $s0, $s1, $s2 => rs=$s1(17) rt=$s2(18) rd=$s0(16) 
    r_instruction[1]  = 32'hXXXXXXXX;
    r_instruction[2]  = 32'hXXXXXXXX;
    r_instruction[3]  = 32'hXXXXXXXX;
    r_instruction[4]  = 32'hXXXXXXXX;
    r_instruction[5]  = 32'hXXXXXXXX;
    r_instruction[6]  = 32'hXXXXXXXX;
    r_instruction[7]  = 32'hXXXXXXXX;
    r_instruction[8]  = 32'hXXXXXXXX;
    r_instruction[9]  = 32'hXXXXXXXX;
    r_instruction[10] = 32'hXXXXXXXX;
    r_instruction[11] = 32'hXXXXXXXX;
    r_instruction[12] = 32'hXXXXXXXX;
    r_instruction[13] = 32'hXXXXXXXX;
    r_instruction[14] = 32'hXXXXXXXX;
    r_instruction[15] = 32'hXXXXXXXX;
    r_instruction[16] = 32'hXXXXXXXX;
    r_instruction[17] = 32'hXXXXXXXX;
    r_instruction[18] = 32'hXXXXXXXX;
    r_instruction[19] = 32'hXXXXXXXX;
    r_instruction[20] = 32'hXXXXXXXX;
    r_instruction[21] = 32'hXXXXXXXX;
    r_instruction[22] = 32'hXXXXXXXX;
    r_instruction[23] = 32'hXXXXXXXX;
    r_instruction[24] = 32'hXXXXXXXX;
    r_instruction[25] = 32'hXXXXXXXX;
    r_instruction[26] = 32'hXXXXXXXX;
    r_instruction[27] = 32'hXXXXXXXX;
    r_instruction[28] = 32'hXXXXXXXX;
    r_instruction[29] = 32'hXXXXXXXX;
    r_instruction[30] = 32'hXXXXXXXX;
    r_instruction[31] = 32'hXXXXXXXX;
end

assign RD = r_instruction[A[4:0]];

endmodule
