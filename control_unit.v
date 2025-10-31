// control_unit
// Control Unit

module control_unit #(
) (
    input [5:0] op;
    input [5:0] func;
    output reg_write;
    output reg_dst; // controls destination register address
    output [2:0] ALU_control; // controls ALU operation
    output mem_write; // controls whether data_memory gets written to or not
    output mem_to_reg; // controls whether result comes from ALU or data_memory
    output branch;
);

endmodule