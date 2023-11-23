`include "macros2.sv"

module dut_wrapper(dut_if vif_tb);
  mesh_gnrtr  #(.ROWS(`ROWS), .COLUMS(`COLUMS), .pckg_sz(`pckg_sz), .fifo_depth(`deep_fifo)) dut(
    
    .pndng(vif_tb.pndng),
    .data_out(vif_tb.data_out),
    .popin(vif_tb.popin),
    .pop(vif_tb.pop),
    .data_out_i_in(vif_tb.data_out_i_in),
    .pndng_i_in(vif_tb.pndng_i_in),
    .clk(vif_tb.clk),
    .reset(vif_tb.reset)
    
  );//conecto mi interface con el RTL
endmodule
