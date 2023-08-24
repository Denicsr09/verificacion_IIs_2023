module mux #(parameter bits = 32, parameter depth = 16) (
  input logic [bits-1:0] data_in [depth-1:0], // Entradas de datos
  input logic [$clog2(depth)-1:0] select,  // Señales de selección
  output logic [bits-1:0] data_out    // Salida de datos
);

always_comb begin
  case (select)
    default: data_out = '0; // Valor predeterminado en caso de selección inválida
    for (int i = 0; i < depth; i = i + 1) begin
      if (select == i) begin
        data_out = data_in[i];
      end
    end
  endcase
end

endmodule

