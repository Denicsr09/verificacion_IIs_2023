module fifo_flops #(parameter depth = 16, parameter bits = 32 )(
  input [bits-1: 0] Din,
  output reg [bits-1:0] }t,
  input push,
  input pop,
  input clk,
  output reg full,
  output reg pndng,
  input rst
  
);
  wire [depth-1:0][bits-1 : 0] d;
  //wire [bits-1 : 0] q;
  wire [$clog2(depth)-1:0] select;
  
  reg[1:0] state;
  logic[1:0] nxt_state;
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  
  genvar i;
  generate
    for(i=0, i < depth, i + 1)begin: bit_
      if(i == 0)begin
        ff_d dff_i(.d(Din), .clk(clk), .rst(rst), .q(d[i]));
      end
      else
        ff_d dff_r(.d(d[i-1]]), .clk(clk), .rst(rst), q(d[i]));

    end
  endgenerate
  mux muxito(.data_in(d), .select(select), .data_out(Dout));
  
  assign ctr={push,pop};
    
  always_ff @ (posedge clk) begin
    
    if (rst)begin
      state<=s0;
      
    end else begin
      state<=nxt_state;
    end
    always_comb begin
      case(state)
        s0: next_state= select? s0:s0;
        s1: next_state= select? s1:s0;
        s2: next_state= select? s2:s0;
        s3: next_state= select? s3:s0;
        
      endcase
      
      case(state)
        s1: 
        
        
        
  end
  

endmodulev