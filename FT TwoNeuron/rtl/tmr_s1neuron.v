module tmr_s1neuron #(parameter M=8,          //# of input layer
                  parameter n=32,
                  parameter cl=8,          //# of bits of fixed number 
                  parameter intbits=12,
                  parameter fracbits=20)(
    input [M*n-1:0] X,
    input [M*(n+cl)-1:0] Wcrc,
    input clk,
    output invalid,
    output reg rfflag,
    output [n-1:0] H
);

    wire [M*n-1 : 0] W;
    wire [M*n-1:0] WX;
    wire [M-1:0] ovf;
    wire [M-1:0] rfflag_vec;
    wire [M-1:0] invalid1,invalid2;
    wire invalid3;
    genvar i,j;
    generate
        for(j=1;j<=M;j=j+1) begin:gen_checker
            tmr_crc_checker #(n,cl) checker(Wcrc[(n+cl)*j-1 -: (n+cl)],W[j*n-1 -: n],invalid1[j-1],rfflag_vec[j-1]);
        end
    endgenerate
    generate
        for (i=1;i<=M;i=i+1) begin:gen_mult
            tmr_multiplier #(n,intbits,fracbits)mul(.a(X[n*i-1 -:n]),
                           .b(W[n*i-1 -:n]),
                           .result(WX[n*i-1 -:n]),
                           .invalid(invalid2[i-1]),
                           .ovf(ovf[i-1])
                            );
        end
    endgenerate
    tmr_adder_tree #(M,n,intbits,fracbits) adder(WX,invalid3,H);
    //assign rfflag=|rfflag_vec;
    always @(negedge clk) begin
        rfflag<=|rfflag_vec;
    end
    assign invalid=(|invalid1)|(|invalid2)|invalid3;
endmodule
