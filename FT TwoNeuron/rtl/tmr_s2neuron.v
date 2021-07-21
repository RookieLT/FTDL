module tmr_s2neuron #(parameter N=8,
                parameter S=8,
                parameter n=32,
                parameter cl=8, 
                parameter intbits=12,
                parameter fracbits=32)
                (
                input [n-1 : 0] H,
                //input [N*n-1 : 0] W,
                input [N*(n+cl)-1 : 0] Wcrc,
                input clk,
                input reset,
                input en_s2,
                output invalid,
                output reg cfflag,
                output [N*n-1 : 0] Y
                );
                wire [N*n-1:0] W;
                wire [N-1:0] cfflag_vec;
                wire local_en;
                wire [N-1:0] invalid1,invalid2;
        
    genvar i,j;

    generate
        for(j=1;j<=N;j=j+1)begin:gen_checker
            tmr_crc_checker#(n,cl) checker(Wcrc[(n+cl)*j-1 -: (n+cl)],W[n*j-1 -: n],invalid1[j-1],cfflag_vec[j-1]);
        end
    endgenerate

    generate
        for(i=1;i<=N;i=i+1) begin:gen
            tmr_rmac #(S,n,intbits,fracbits) mac (.W(W[n*i-1 -:n]),
                                              .X(H),
                                              .clk(clk),
                                              .reset(reset),
                                              .en_s2(en_s2),
                                              .local_en(local_en),
                                              .invalid(invalid2[i-1]),
                                              .sum(Y[n*i-1 -:n]));
        end
    endgenerate

    always@(negedge clk)
        cfflag<=|cfflag_vec;
        
    assign local_en=!cfflag;
    assign invalid=(|invalid1)|(|invalid2);
endmodule