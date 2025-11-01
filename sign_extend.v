// sign_extend
// Sign Extend

module sign_extend (
    input [15:0] I,
    output [31:0] O
);

assign O[15:0] = I[15:0];
assign O[31:16] = {16{I[15]}};

endmodule
