// ALU_decoder
// ALU Decoder

module ALU_decoder (
    input [5:0] funct,
    input [1:0] ALU_op,
    output reg [2:0] ALU_control
);

// ALU_op == 2'b11 will never happen

always @(*) begin
    if (ALU_op[1] == 0) begin
        case (ALU_op[0])
        1'b0: ALU_control = 3'b010;
        1'b1: ALU_control = 3'b110; 
        endcase
    end
    else begin
        case (funct[3:0])
        4'b0000: ALU_control = 3'b010; // add
        4'b0001: ALU_control = 3'b110; // subtract
        4'b0100: ALU_control = 3'b000; // and
        4'b0101: ALU_control = 3'b001; // or
        4'b1010: ALU_control = 3'b111; // set less than
        default: ALU_control = 3'b000;
        endcase
    end
end
    
endmodule
