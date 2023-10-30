`timescale 1ns/1ps
`timescale 1ns/1ps
//Puse esto
//`define FIFOS
//`include "fifo.sv"
//`include "Library.sv"
//`define LIB
//hasta aca
`include "Router_library.sv"
`include "interface_transactions.sv"
`include "interface.sv"
`include "fifo_in.sv"
`include "agent.sv"
`include "driver.sv"
`include "monitor.sv"
`include "check.sv"
`include "scoreboard.sv"
`include "revision.sv"
`include "ambiente.sv"
`include "test.sv"


module tb;
  
  reg clk;
  
  parameter pckg_sz = 40;
  parameter ROWS= 4;
  parameter COLUMS= 4;
  parameter fifo_depth = 8;
  parameter num_transacciones = 3; 
  parameter bdcst= {8{1'b1}};
  
  
  
  test #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(fifo_depth), .num_transacciones(num_transacciones)) t0;
  
  mesh_gnrtr_vif #( .ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth), .bdcst(bdcst) ) vif_tb (.clk(clk)); //Aqui instancio mi interface 
  
    mesh_gnrtr #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth), .bdcst(bdcst)) dut (
    
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
    for (int i=0; i<(ROWS*2+COLUMS*2);  i++) begin
      t0.ambiente_inst.monitor_inst[i].vif=vif_tb;
      t0.ambiente_inst.driver_inst[i].fifo_in.vif=vif_tb;
    end
    vif_tb.reset=1;
    #20;
    vif_tb.reset=0;
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
    $dumpvars(0, tb);
  end
endmodule
