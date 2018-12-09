module state_machine (clk, rst_n, w, b);

parameter A_STATE = 2'b00;
parameter B_STATE = 2'b01;
parameter C_STATE = 2'b10;
parameter F_STATE = 2'b11;

input clk;
input rst_n;
input w;

output b;
reg b;

//interal signal
reg [1:0] state;
reg [1:0] next_state;
wire [2:0] pre_state;
reg state_ena;

always@(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin  
         state <= 2'b00;
    end
    else begin
        state <= next_state;
    end 
end
assign pre_state = state;

//for next state
always@(state or w) begin
   case (state) 
      A_STATE: begin
         if(w == 1'b0) begin
             next_state <= B_STATE;
         end
         else begin
             next_state <= F_STATE;
         end
      end
      B_STATE: begin
      if(w == 1'b0) begin
             next_state <= C_STATE;
         end
         else begin
             next_state <= F_STATE;
         end
      end
      C_STATE: begin
          if(w == 1'b0) begin
                 next_state <= C_STATE;
          end
          else begin
                 next_state <= F_STATE;
          end
      end
      default: begin  //F_STATE
          if(w == 1'b0) begin
              next_state <= B_STATE;
          end
          else begin
              next_state <= F_STATE;
          end
      end
   endcase
end
//For output
always@(state) begin
   case (state) 
      A_STATE: begin
         b <= 1'b0;
      end
      B_STATE: begin
         b <= 1'b0;
      end
      C_STATE: begin
         b <= 1'b1;
      end     
      default: begin  //F_STATE
         b <= 1'b1;
      end
   endcase
end

endmodule
