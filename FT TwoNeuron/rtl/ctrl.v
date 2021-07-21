module ctrl #(parameter S=8,
            parameter addrwidth = 3)(
    input clk,
    input reset,
    input rfflag,
    input cfflag,
    output reg en_s2,
    output reg [addrwidth :0] addr_r,addr_c
);
    integer state;
    always @(posedge clk) begin
        if(reset) begin
            state<=0;
        end
        else begin
            if(state == 0) begin
                state <= state + 1;
            end
            else if(state <= S+1 )begin
                if( (!rfflag) && (!cfflag))begin
                    state <= state + 1;
                    en_s2 <= 1;
                end
                else begin
                    state <= state;
                    en_s2 <=(rfflag == 1) ? 0:1;
                end
            end
        end
    end

    always @(state) begin
        if(state==0)begin
            addr_r<=8;
            addr_c<=8;
        end
        else if(state==1)begin
            addr_r<=state-1;
            addr_c<=8;
        end
        else if(state<=S)begin
            addr_r<=state-1;
            addr_c<=state-2;
        end
        else if(state==S+1) begin
            addr_r <=8;
            addr_c <=state-2;
        end
        else begin
            addr_r<=8;
            addr_c<=8;
        end
    end
endmodule