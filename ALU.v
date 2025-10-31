// ALU
// (ALU)

module ALU #(
) (
    input [31:0] srcA,
    input [31:0] srcB,
    input [2:0] ALU_control,
    output [31:0] ALU_result,
    output zero // for >, if zero srcA = src B
);

endmodule