`timescale 1ns/1ns
module tb_tmr_s1neuron;
parameter M=8;         //# of input layer
parameter n=16;
parameter cl=8;          //# of bits of fixed number 
parameter intbits=6;
parameter fracbits=10;
//input 
reg [M*n-1 : 0] X;
reg [M*(n+cl)-1:0] Wcrc;

//output
wire [n-1 : 0] H;
wire rfflag;

tmr_s1neuron #(M,n,cl,intbits,fracbits) dut (X,Wcrc,rfflag,H);

initial begin
    X =  {16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400,
        16'h0400};
    Wcrc={24'h006600,24'h006600,24'h806689,24'h006600,24'h806689,24'h806689,24'h006600,24'h806689};
    #5;
    Wcrc={24'h006600,24'h006600,24'h806689,24'h006600,24'h806689,24'h806689,24'h006600,24'h816689};
    #5;
    Wcrc={24'h006600,24'h006600,24'h806689,24'h006600,24'h806689,24'h806689,24'h006600,24'h806688};
end

endmodule