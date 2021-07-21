`timescale 1ns/1ns
module tb_crc_checker;
parameter n=16;
parameter cl=8;

reg [n+cl-1 : 0] din;
wire fflag;

crc_checker dut(din,fflag);
initial begin
    din=24'h840095; //fault free
    #5;
    din=24'h04001c;//fault free
    #5;
    din=24'h840096; //faulty
    #5;
    din=24'h05001c; //faulty
end
endmodule