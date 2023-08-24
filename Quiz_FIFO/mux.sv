module mux #(parameter bits = 32, parameter depth = 16) (
  input [bits*depth-1:0] data_in, // Entradas de datos
  input logic [$clog2(depth)-1:0] select,  // Señales de selección
  output reg [bits-1:0]  data_out    // Salida de datos
);


always_comb
begin
    data_out = data_in[select * bits +: bits]; // Agarrando desde N hasta N+bits.
end

endmodule



