module seq_moore_001(det, in, clk, reset);
    input in, clk, reset;
    output reg det;
    
    parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
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
                    nxt_state = s3;
                else
                    nxt_state = s2;
            end
            
            s3: begin
                if (in)
                    nxt_state = s0;
                else
                    nxt_state = s1;
            end
            
            default: nxt_state = s0;
                
        endcase
    end
    
    always@(pr_state)begin
        case (pr_state)
            s0: det = 0;
            s1: det = 0;
            s2: det = 0;
            s3: det = 1;
            default: det = 0;
        endcase
        
    end
    
    
endmodule
