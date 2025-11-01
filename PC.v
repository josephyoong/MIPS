// PC
// Program Counter (PC)

module PC (
    input clk,
    input rst,
    input [31:0] PC_next,
    output [31:0] PC
);

reg [31:0] r_PC;

always @(posedge clk) begin
    if (rst) begin
        r_PC <= 32'h00000000;
    end
    else begin
        r_PC <= PC_next;
    end
end

assign PC = r_PC;

endmodule
