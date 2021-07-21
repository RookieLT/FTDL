`timescale 1ns/1ns
module tb_tmr_adder_tree;

//input
reg [127:0] operand;
//output
wire [15:0] r;

tmr_adder_tree #(8,16,6,10) adder(operand,invalid,r);

initial begin
    operand = {16'h007a,16'h0031,16'h04d7,16'h83e1,16'h81cc,16'h801b,16'h0040,16'h020a};
    //sum=0.12+0.048+1.21-1.03-0.45-0.027+0.063+0.51=0.444
    #100;
    operand = {16'h007a,16'h0031,16'h04d7,16'h83e1,16'h81cc,16'h801b,16'h0040,16'h80f5};
    //operand = {16'h80f5,16'h0040,16'h801b,16'h81cc,16'h83e1,16'h04d7,16'h0031,16'h007a};
     //sum=0.12+0.048+1.21-1.03-0.45-0.027+0.063-0.24=0.306
    /*#100;
    operand = {32'b0000_0000_0001_0000_0000_0000_0000_0000,
    32'b0000_0000_0001_1000_0000_0000_0000_0000,
    32'b0000_0000_0001_1100_0000_0000_0000_0000,
    32'b0000_0000_0001_1110_0000_0000_0000_0000,
    32'b0000_0000_0001_1111_0000_0000_0000_0000,
    32'b0000_0000_0001_0000_1000_0000_0000_0000,
    32'b0000_0000_0001_0000_1000_0000_0000_0000,
    32'b0000_0000_0001_0000_1000_0000_0000_0000};
    #1000;
    operand = {32'b0000_0000_0001_0000_0000_0000_0000_0000,
    32'b0000_0000_0001_1000_0000_0000_0000_0000,
    32'b0000_0000_0001_1100_0000_0000_0000_0000,
    32'b0000_0000_0011_1110_0000_0000_0000_0000,
    32'b0000_0000_0111_1111_0000_0000_0000_0000,
    32'b0000_0000_1111_0000_1000_0000_0000_0000,
    32'b0000_0000_0001_1000_1000_0000_0000_0000,
    32'b0000_0000_0001_1100_1000_0000_0000_0000};*/
end
endmodule