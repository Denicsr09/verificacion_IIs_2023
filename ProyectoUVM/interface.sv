`include "macros2.sv"
interface dut_if #(parameter ROWS =`ROWS, parameter COLUMS = `COLUMS, parameter pckg_sz =`pckg_sz, parameter fifo_depth = `deep_fifo, parameter bdcst= {8{1'b1}}) (input clk);
  
  logic pndng[ROWS*2+COLUMS*2];
  logic [pckg_sz-1:0] data_out[ROWS*2+COLUMS*2];
  logic popin[ROWS*2+COLUMS*2];
  logic pop[ROWS*2+COLUMS*2];
  logic [pckg_sz-1:0]data_out_i_in[ROWS*2+COLUMS*2];
  logic pndng_i_in[ROWS*2+COLUMS*2];
  logic reset;


endinterface
