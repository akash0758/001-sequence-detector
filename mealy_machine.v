module seq_001(det, in, clk, reset);
    input in, clk, reset;
    output reg det;
    
    parameter s0=2'b00, s1=2'b01, s2=2'b10;
    reg [1:0] pr_state, nxt_state;
    
    
    always@(posedge clk)begin
        if(reset)
            pr_state <= s0;
        else
            pr_state <= nxt_state;
    end
    
    always@(in, pr_state)begin
        case(pr_state)
            s0: begin
                if (in)
                    nxt_state = s0;
                else
                    nxt_state = s1;
            end
            
            s1: begin
                if (in)
                    nxt_state = s0;
                else
                    nxt_state = s2;
            end
            
            s2: begin
                if (in)
                    nxt_state = s0;
                else
                    nxt_state = s2;
            end
            
            default: nxt_state = s0;
                
        endcase
    end
    
    always@(in, pr_state)begin
        case (pr_state)
            s0: det = 0;
            s1: det = 0;
            s2: begin
                if(in)
                    det = 1;
                else
                    det = 0;
            end
            default: det = 0;
        endcase
        
    end
    
    
endmodule
