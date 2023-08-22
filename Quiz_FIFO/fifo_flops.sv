module fifo_flops #(parameter depth = 16, parameter bits = 32 )(
  input [bits-1: 0] Din,
  output reg [bits-1:0] Dout,
  input push,
  input pop,
  input clk,
  output reg full,
  output reg pndng,
  input rst
  
);
  wire [bits-1 : 0] d [depth-1:0];
  //wire [bits-1 : 0] q;
  logic [$clog2(depth)-1:0] select = '1; //No estoy seguro de esto 
  
  reg[1:0] state;
  logic[1:0] nxt_state;
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  
  genvar i;
  generate
    for(i=0, i < depth, i + 1)begin: bit_
      if(i == 0)begin
        ff_d dff_i(.d(Din), .clk(push), .rst(rst), .q(d[i]));
      end
      else
        ff_d dff_r(.d(d[i-1]]), .clk(push), .rst(rst), q(d[i]));

    end
  endgenerate
  mux muxito(.data_in(d), .select(select), .data_out(Dout));
  
  assign ctr={push,pop};
    
  always_ff @ (posedge clk) begin
    
    if (rst)begin
      state<=s0;
    end 
    else begin
      state<=nxt_state;
    end
  end
  always_comb begin
    next_state = current_state; //default state: the same
    case(state)
      s0:begin
        if(ctr == 2'b00)begin
          nxt_state = s0;
        end else begin
          nxt_state = s1;
        end
      end
      s1:begin
        if(ctr == 2'b01) begin
          select = select - 1; 
          nxt_state = s0;
        end else begin
          nxt_state = s2;
        end
      end
      s2:begin
        if(ctr == 2'b10)begin
          nxt_state = s0;
        end else begin
          nxt_state = s3;
        end
      end
      s3:begin
        select = select - 1;
        nxt_state = s0;
        end
      end
        
    endcase
        
           
  end
  

endmodule