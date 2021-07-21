`timescale 1ns/1ns
module tb_row_weight;
//input
reg [3:0] addr;
//output
wire [191:0] W;
integer i;
initial begin
    for(i=0;i<=8;i=i+1)begin
        addr=i;
        #20;
    end
end
row_weight #(8,8,16,8,3) dut(addr,W);
endmodule