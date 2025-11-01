// PC
// Program Counter (PC)

module PC #(
) (
    input clk,
    input rst,
    input [31:0] PC_next,
    output reg [31:0] PC
);

reg [31:0] r_PC;

always @(posedge clk) begin
    if (rst) begin
        r_PC <= 0;
    end
    else begin
        PC <= PC_next;
    end
end

endmodule