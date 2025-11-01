// main_decoder
// Main Decoder

module main_decoder (
    input [5:0] opcode,
    output reg reg_write,
    output reg reg_dst, // controls destination register address
    output reg ALU_src, // controls srcB
    output reg mem_write, // controls whether data_memory gets written to or not
    output reg mem_to_reg, // controls whether result comes from ALU or data_memory
    output reg branch,
    output reg [1:0] ALU_op
);

parameter Rtype = 6'b000000; //
parameter lw = 6'b100011; // load word
parameter sw = 6'b101011; // store word
parameter beq = 6'b000100; // branch if equal

always @(*) begin
    
    case (opcode)
    Rtype: begin
        reg_write   = 1'b1;
        reg_dst     = 1'b1;
        ALU_src     = 1'b0;
        mem_write   = 1'b0;
        mem_to_reg  = 1'b0;
        branch      = 1'b0;
        ALU_op      = 2'b10;
    end
    lw: begin
        reg_write   = 1'b1;
        reg_dst     = 1'b0;
        ALU_src     = 1'b1;
        mem_write   = 1'b0;
        mem_to_reg  = 1'b1;
        branch      = 1'b0;
        ALU_op      = 2'b00;
    end
    sw: begin
        reg_write   = 1'b0;
        reg_dst     = 1'b0;
        ALU_src     = 1'b1;
        mem_write   = 1'b1;
        mem_to_reg  = 1'b0;
        branch      = 1'b0;
        ALU_op      = 2'b00;
    end
    beq: begin
        reg_write   = 1'b0;
        reg_dst     = 1'b0;
        ALU_src     = 1'b0;
        mem_write   = 1'b0;
        mem_to_reg  = 1'b0;
        branch      = 1'b1;
        ALU_op      = 2'b01;
    end
    default: begin
        reg_write   = 1'b0;
        reg_dst     = 1'b0;
        ALU_src     = 1'b0;
        mem_write   = 1'b0;
        mem_to_reg  = 1'b0;
        branch      = 1'b0;
        ALU_op      = 2'b00;
    end
    endcase
end
    
endmodule
