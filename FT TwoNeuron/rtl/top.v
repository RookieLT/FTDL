`define M 8
`define S 8
`define N 8
`define n 16
`define addrwidth_1 3 //(squre root of S)
`define intbits 6
`define fracbits 10
`define cl 8
`define Mcl_1 191 //M*(cl+n)-1
`define Ncl_1 191 //N*(cl+n)-1
`define Mn_1 127  //M*n-1
`define Nn_1 127  //N*n-1
`define n_1 15      //n-1

module top(input clk,reset,
            input [`Mn_1 : 0] IN,
            output [`Nn_1: 0] Y);
    
    wire [`addrwidth_1:0] addr_r,addr_c;
    wire en_s2;
    wire rfflag,cfflag;
    wire [`Mcl_1 : 0] Wr;
    wire [`Ncl_1 : 0] Wc;
    wire [`n_1 : 0] H;
    reg [`n_1 : 0] H1;
    always@(posedge clk)begin
        H1<=H;
    end

    ctrl #(`S,`addrwidth_1) ctrl_path(clk,reset,rfflag,cfflag,en_s2,addr_r,addr_c);
    row_weight #(`M,`S,`n,`cl,`addrwidth_1) rw(addr_r,Wr);
    column_weight #(`N,`S,`n,`cl,`addrwidth_1) cw(addr_c,Wc);
    s1neuron #(`M,`n,`cl,`intbits,`fracbits) s1n(IN,Wr,clk,rfflag,H);
    s2neuron #(`N,`S,`n,`cl,`intbits,`fracbits) s2n(H1,Wc,clk,reset,en_s2,cfflag,Y);
endmodule
