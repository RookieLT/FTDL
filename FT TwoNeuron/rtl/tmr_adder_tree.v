module tmr_adder_tree #(parameter m=8,
                    parameter n=16,
                    parameter intbits=6,
                    parameter fracbits=10 )
                    (
                    input [n*m-1:0] operand,
                    output reg invalid,
                    output reg [n-1:0] result
                    );
    
    wire [n-1 : 0] result1,result2,result3;
    wire ovf1,ovf2,ovf3;
    wire diff12,diff23,diff13;

    adder_tree #(m,n,intbits,fracbits) adder1(operand,result1);
    adder_tree #(m,n,intbits,fracbits) adder2(operand,result2);
    adder_tree #(m,n,intbits,fracbits) adder3(operand,result3);

    assign diff12=|(result1^result2);
    assign diff23=|(result3^result2);
    assign diff13=|(result1^result3);

        always @(*) begin
        invalid = 0;
        case({diff12,diff13,diff23})
            3'b000: begin result=result1;  end
            3'b011: begin result=result1;  end
            3'b110: begin result=result2;  end
            3'b101: begin result=result1;  end
            default: begin
                result=result1;
                invalid = 1;
            end
        endcase
    end
endmodule
