// MIPS 

module MIPS (
    input clk,
    input rst
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
wire [31:0] ALU_result;
wire ALU_zero; // if ALU_result == 0
wire [31:0] read_data;
wire [31:0] PC_plus4;
wire [31:0] PC_branch;
wire PC_next_control;

// control signals
wire reg_write;
wire reg_dst; // controls destination register address
wire ALU_src;
wire [2:0] ALU_control; // controls ALU operation
wire mem_write; // controls whether data_memory gets written to or not
wire mem_to_reg; // controls whether result comes from ALU or data_memory
wire branch;

PC MIPS_PC (
    .clk(clk),
    .rst(rst),
    .PC_next(PC_next),
    .PC(PC)
);

instruction_memory MIPS_instruction_memory (
    .A(PC), // address of instruction memory is the PC
    .RD(instr) // reads the instruction
);

MUX2to1 MUX2to1_write_reg (
    .control(reg_dst), // control signal: write_reg depends on instr type
    .I0(instr[20:16]), 
    .I1(instr[15:11]),
    .O(write_reg)
);

register_file MIPS_register_file (
    .clk(clk),
    .rst(rst),
    .WE3(reg_write), // control signal
    .A1(instr[25:21]), // rs 
    .A2(instr[20:16]), // rt
    .A3(write_reg), // destination R-type:rd (new register), I-type-addi/lw: rt (replace a source register)
    .WD3(result),
    .RD1(srcA),
    .RD2(srcB_Rtype)
);

sign_extend MIPS_sign_extend (
    .I(instr[15:0]),
    .O(sign_extended_imm)
);

MUX2to1 MUX2to1_srcB (
    .control(ALU_src), // control signal: srcB depends on instr type
    .I0(srcB_Rtype), 
    .I1(sign_extended_imm),
    .O(srcB)
);

ALU MIPS_ALU (
    .srcA(srcA),
    .srcB(srcB),
    .ALU_control(ALU_control), // control signal: ALU operation depends on instr type
    .ALU_result(ALU_result),
    .zero(ALU_zero)
);

data_memory #(.DATA_MEMORY_DEPTH(256)) MIPS_data_memory (
    .clk(clk),
    .WE(mem_write),
    .WD(srcB_Rtype),
    .A(ALU_result),
    .RD(read_data)
);

MUX2to1 MUX2to1_result (
    .control(mem_to_reg),
    .I0(ALU_result),
    .I1(read_data),
    .O(result)
);

PC_plus4 MIPS_PC_plus4 (
    .I(PC),
    .O(PC_plus4)
);

PC_branch MIPS_PC_branch (
    .sign_extended_imm(sign_extended_imm),
    .PC_plus4(PC_plus4),
    .PC_branch(PC_branch)
);

assign PC_next_control = branch & ALU_zero;

MUX2to1 MUX2to1_PC_next (
    .control(PC_next_control),
    .I0(PC_plus4),
    .I1(PC_branch),
    .O(PC_next)
);

control_unit MIPS_control_unit (
    .op(instr[31:26]),
    .funct(instr[5:0]), // function of R-type
    .reg_write(reg_write),
    .reg_dst(reg_dst), // controls destination register address
    .ALU_src(ALU_src),
    .ALU_control(ALU_control), // controls ALU operation
    .mem_write(mem_write), // controls whether data_memory gets written to or not
    .mem_to_reg(mem_to_reg), // controls whether result comes from ALU or data_memory
    .branch(branch) // 1 for beq instr, 0 for all other
);

endmodule
