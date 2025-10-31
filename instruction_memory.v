// instruction_memory
// Instruction Memory

module instruction_memory #(
) (
    input [31:0] A,
    output [31:0] RD
);

reg [31:0] instruction [0:99];

assign RD = instruction[A];

endmodule