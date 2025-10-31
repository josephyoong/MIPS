// control_unit
// Control Unit

module control_unit #(
) (
    input [5:0] op,
    input [5:0] funct,
    output reg_write,
    output reg_dst, // controls destination register address
    output ALU_src, // controls srcB
    output [2:0] ALU_control, // controls ALU operation
    output mem_write, // controls whether data_memory gets written to or not
    output mem_to_reg, // controls whether result comes from ALU or data_memory
    output branch
);

wire [1:0] ALU_op;

main_decoder control_unit_main_decoder #(
) (
    .opcode(op),
    .reg_write(reg_write),
    .reg_dst(reg_dst),
    .ALU_src(ALU_src),
    .mem_write(mem_write),
    .mem_to_reg(mem_to_reg),
    .branch(branch),
    .ALU_op(ALU_op)
);

ALU_decoder control_unit_ALU_decoder #(
) (
    .funct(funct),
    .ALU_op(ALU_op),
    .ALU_control(ALU_control)
);

endmodule