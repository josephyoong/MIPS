// instruction_memory
// Instruction Memory

module instruction_memory #(
    parameter INSTRUCTION_MEMORY_DEPTH = 256;
) (
    input [31:0] A,
    output [31:0] RD
);

reg [31:0] r_instruction [0:];

parameter ADDRESS_BIT_LENGTH = $clog2(INSTRUCTION_MEMORY_DEPTH);

assign RD = instruction[ADDRESS_BIT_LENGTH-1:0];

endmodule