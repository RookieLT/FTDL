module crc_checker#(parameter n=16,
                    parameter cl=8
                    )
                    (input [n+cl-1 : 0] din,
                    output [n-1 : 0] dout,
                    output fflag);
    wire [cl-1 : 0] cd;
    
    crc crc1(.data(din[n+cl-1 -: cl]),.newcrc(cd));
    assign dout = din[n+cl-1 -: n];
    assign fflag=|(cd^din[cl-1 : 0]);
endmodule