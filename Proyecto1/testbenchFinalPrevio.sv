`timescale 1ns/1ps
`include "fifo.sv"
`include "interface_transaction.sv"
`include "driver.sv"
`include "checker.sv"
`include "score_board.sv"
`include "agent.sv"
`include "ambiente.sv"
`include "test.sv"
`include "Library.sv"

///////////////////////////////////
// Módulo para correr la prueba  //
///////////////////////////////////
module test_bench; 
  reg clk;
  parameter pckg_sz = 16;
  parameter deep_fifo = 8;
  parameter bits = 1;
  parameter drvrs = 4;
  
  test #(.deep_fifo(deep_fifo),.pckg_sz(pckg_sz),.drvrs(drvrs)) t0;

  bus_if  #(.pckg_sz(pckg_sz),.drvrs(drvrs)) vif(.clk(clk));
  always #5 clk = ~clk;

  bs_gnrtr_n_rbtr dut (.clk(vif.clk),
                       .reset(vif.reset),
                       .pndng(vif.pndng),
                       .push(vif.push),
                       .pop(vif.pop),
                       .D_pop(vif.D_pop),
                       .D_push(vif.D_push)
    );


  initial begin
    clk = 0;
    t0 = new();
    t0.vif = vif;
    t0.ambiente_inst.driver_inst.vif = vif;
    fork
      t0.run();
    join_none
  end
 
  always@(posedge clk) begin
    if ($time > 100000)begin
      $display("Test_bench: Tiempo límite de prueba en el test_bench alcanzado");
      $finish;
    end
  end
  initial begin
    $dumpfile("test_bench.vcd");
    $dumpvars(0, test_bench);
  end

endmodule
