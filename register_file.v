// register_file
// Register File

module register_file #(
) (
    input clk,
    input rst,
    input WE3, // write enable
    input [31:0] A1, // address
    input [31:0] A2,
    input [31:0] A3, // destination address
    input [31:0] WD3, // write data
    output [31:0] RD1, // read data
    output [31:0] RD2, 
);

endmodule