module tmr_multiplier #(parameter n=16, 
                    parameter intbits=6,
                    parameter fracbits=10)
                    (input [n-1:0] a,b,
                    output reg [n-1:0] result,
                    output reg invalid,
                    output reg ovf);
    
    wire [n-1 : 0] result1,result2,result3;
    wire ovf1,ovf2,ovf3;
    wire diff12,diff23,diff13;

    multiplier #(n,intbits,fracbits) multi1 (a,b,result1,ovf1);
    multiplier #(n,intbits,fracbits) multi2 (a,b,result2,ovf2);
    multiplier #(n,intbits,fracbits) multi3 (a,b,result3,ovf3);

    
    assign diff12=|(result1^result2);
    assign diff23=|(result3^result2);
    assign diff13=|(result1^result3);

    
    always @(*) begin
        invalid = 0;
        case({diff12,diff13,diff23})
            3'b000: begin result=result1; ovf=ovf1;  end
            3'b011: begin result=result1; ovf=ovf1;  end
            3'b110: begin result=result2; ovf=ovf2;  end
            3'b101: begin result=result1; ovf=ovf1;  end
            default: begin
                result=result1;
                ovf=ovf1;
                invalid = 1;
            end
        endcase
    end
endmodule
