`timescale 1ns/1ps
`timescale 1ns/1ps
//Puse esto
`define FIFOS
`include "fifo.sv"
`include "Library.sv"
`define LIB
//hasta aca
`include "Router_library.sv"
`include "interface_transactions.sv"
`include "interface.sv"
`include "agent.sv"
`include "ambiente.sv"
`include "test.sv"
`include "my_package.sv"

module tb_no_ale;
  
  reg clk;

  import my_package::*;

  parameter pckg_sz = 41;
  parameter ROWS= 4;
  parameter COLUMS= 4;
  parameter fifo_depth = 8;
  parameter num_transacciones = 3; 
  parameter bdcst= {8{1'b1}};
  
  
  
  test #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(my_package::pckg_sz), .deep_fifo(my_package::fifo_depth), .num_transacciones(my_package::num_transacciones)) t0;
  
  mesh_gnrtr_vif #( .ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(my_package::pckg_sz), .fifo_depth(my_package::fifo_depth), .bdcst(bdcst) ) vif_tb (.clk(clk)); //Aqui instancio mi interface 
  
    mesh_gnrtr #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(my_package::pckg_sz), .fifo_depth(my_package::fifo_depth), .bdcst(bdcst)) dut (
    
    .pndng(vif_tb.pndng),
    .data_out(vif_tb.data_out),
    .popin(vif_tb.popin),
    .pop(vif_tb.pop),
    .data_out_i_in(vif_tb.data_out_i_in),
    .pndng_i_in(vif_tb.pndng_i_in),
    .clk(clk),
    .reset(vif_tb.reset)
    
  );//conecto mi interface con el RTL
  
  //Comunicacion con el agente para pruebas // Lineas para simular el Test.sv------
  comando_test_agent_mbx test_agent_mbx; // Simulando que el test existe (Mailbox)
  instrucciones_agente instr_agent; // Aloja la instrucción que se va a enviar
  
  initial begin 
        clk = 0;
        forever #1 clk = ~clk;
  end
  
  
  initial begin  
    t0 = new();
    //t0.ambiente_inst.agente_inst.num_transacciones = num_transacciones;
    t0.vif =vif_tb;
    t0.ambiente_inst.agente_inst.vif = vif_tb;
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
    //$dumpfile("agent_tb.vcd");
    $dumpvars(0, tb_no_ale);
  end
endmodule
