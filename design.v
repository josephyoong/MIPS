// MIPS 

module MIPS #(
) (
    input clk
);

wire [31:0] PC;
wire [31:0] PC_next;
wire [31:0] instr;
wire [4:0] write_reg; // address to write to register_file
wire [31:0] result;
wire [31:0] srcA;
wire [31:0] srcB_Rtype; //  srcB for R-type
wire [31:0] sign_extended_imm; // srcB for I-type-lw
wire [31:0] srcB;

// control signals
wire reg_write;
wire reg_dst; // 1: R-type, 0: I-type-lw, Either: I-type-sw
wire ALU_control;

PC MIPS_PC #(
) (
    .clk(clk),
    .PC(PC),
    .PC_next(PC_next)
);

instruction_memory MIPS_instruction_memory #(
) (
    .A(PC), // address of instruction memory is the PC
    .RD(instr) // reads the instruction
);

MUX2to1 MUX2to1_write_reg #(
) (
    .control(reg_dst), // control signal: write_reg depends on instr type
    .I0(instr[20:16]), 
    .I1(instr[15:11]),
    .O(write_reg)
)

register_file MIPS_register_file #(
) (
    .clk(clk),
    .WE3(reg_write), // control signal
    .A1(instr[25:21]), // rs 
    .A2(instr[20:16]), // rt
    .A3(write_reg), // destination R-type:rd (new register), I-type-addi/lw: rt (replace a source register)
    .WD3(result),
    .RD1(srcA),
    .RD2(srcB_Rtype)
);

sign_extend MIPS_sign_extend #(
) (
    .I(instr[15:0]),
    .O(sign_extended_imm)
);

MUX2to1 MUX2to1_srcB #(
) (
    .control(ALUsrc), // control signal: srcB depends on instr type
    .I0(srcB_Rtype), 
    .I1(sign_extended_imm),
    .O(srcB)
)

ALU MIPS_ALU #(
) (
    .srcA(srcA),
    .srcB(srcB),
    .ALU_control(ALU_control), // control signal: ALU operation depends on instr type
);

PC_plus4 MIPS_PC_plus4 #(
) (
);

data_memory MIPS_data_memory #(
) (
);

endmodule