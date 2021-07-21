module tmr_crc_checker#(parameter n=16,
                    parameter cl=8
                    )
                    (input [n+cl-1 : 0] din,
                    output reg [n-1 : 0] dout,
                    output reg invalid,
                    output reg fflag);
    
    wire [n-1 : 0] dout1,dout2,dout3;
    wire fflag1,fflag2,fflag3;
    wire diff12,diff23,diff13;

    crc_checker #(n,cl) crc_checker1 (din,dout1,fflag1);
    crc_checker #(n,cl) crc_checker2 (din,dout2,fflag2);
    crc_checker #(n,cl) crc_checker3 (din,dout3,fflag3);

    assign diff12=|(dout1^dout2);
    assign diff23=|(dout3^dout2);
    assign diff13=|(dout1^dout3);

    always @(*) begin
        invalid = 0;
        case({diff12,diff13,diff23})
            3'b000: begin dout=dout1; fflag=fflag1;  end
            3'b011: begin dout=dout1; fflag=fflag1;  end
            3'b110: begin dout=dout2; fflag=fflag2;  end
            3'b101: begin dout=dout1; fflag=fflag1;  end
            default: begin
                dout = dout1;
                fflag=fflag1;
                invalid = 1;
            end
        endcase
    end
endmodule