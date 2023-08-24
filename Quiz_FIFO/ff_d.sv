module ff_d #(parameter bits = 32)(
  input [bits - 1 : 0] d,
  input rst,
  input clk, 
  output reg [bits - 1 : 0] q
);

always_ff @(posedge clk or posedge rst)
  begin
    if (rst == 1'b1 )
        q <= 1'b0;
    else
        q <= d;
  end
endmodule
