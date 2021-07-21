`timescale 1ns/1ns
module adder_tree #(parameter m=8,
                    parameter n=32,
                    parameter intbits=12,
                    parameter fracbits=20 )
                    (
                    input [n*m-1:0] operand,
                    output reg [n-1:0] result
                    );
    
    reg [n-1:0] o_result;
    reg sign;
    integer i;
    always @(operand) begin
        
        for(i=0;i<=m;i=i+1) begin
            
            if(i==0)begin
                o_result=0;
            end
            else begin
                o_result=sum(o_result,operand[n*i-1 -: n]);
            
            end
        end

        if(o_result[n-1])
            o_result = 0;
        else
            o_result = o_result;
    
        result<=o_result[n-1:0];
    end
    
    
function [n-1:0] sum;
    input[n-1:0] a,b;
    reg [n-1:0] res;
begin
    // both negative or both positive
    if(a[n-1] == b[n-1]) begin				
		res[n-2:0] = a[n-2:0] + b[n-2:0];	 	
		res[n-1] = a[n-1];				
	end												
	//	one of them is negative...
	else if(a[n-1] == 0 && b[n-1] == 1) begin		
		if( a[n-2:0] > b[n-2:0] ) begin					
			res[n-2:0] = a[n-2:0] - b[n-2:0];			
			res[n-1] = 0;										
			end
		else begin												
			res[n-2:0] = b[n-2:0] - a[n-2:0];			
			if (res[n-2:0] == 0)
				res[n-1] = 0;										
			else
				res[n-1] = 1;										
			end
		end
	else begin												
		if( a[n-2:0] > b[n-2:0] ) begin					
			res[n-2:0] = a[n-2:0] - b[n-2:0];			
			if (res[n-2:0] == 0)
				res[n-1] = 0;										
			else
				res[n-1] = 1;										
			end
		else begin												
			res[n-2:0] = b[n-2:0] - a[n-2:0];			
			res[n-1] = 0;										
			end
		end
sum=res;
end
endfunction
endmodule