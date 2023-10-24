`timescale 1ns/1ps
`timescale 1ns/1ps
//Puse esto
`define FIFOS
`include "fifo.sv"
`include "Library.sv"
`define LIB
//hasta aca
`include "Router_library.sv"
`include "interface_transaction.sv"
`include "interface.sv"
`include "agent.sv"

module agent_tb ;
  
  reg clk;
  
  parameter pckg_sz = 40;
  parameter ROWS= 4;
  parameter COLUMS= 4;
  parameter fifo_depth = 4;
  parameter bdcst= {8{1'b1}};
  
  tipo_trans tpo_spec;
  
  
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx_tb;
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) tst_agnt_mbx;
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  agent #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(fifo_depth)) agente_prueba;
  
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
    agnt_drv_mbx_tb = new();
    agnt_sb_mbx = new();
    test_agent_mbx = new();
    agente_prueba  = new();
    transaccion= new();
    // Instanciando el MB 
   
    
   
    
    
   
   
    agente_prueba.agnt_drv_mbx = agnt_drv_mbx_tb;
    agente_prueba.test_agent_mbx = test_agent_mbx; // MB entre el TB y el agente la
    agente_prueba.agnt_sb_mbx = agnt_sb_mbx;
  	agente_prueba.vif =vif_tb;
    
    //Instruccion al mailbox del agente
    instr_agent = envio_especfico;
    test_agent_mbx.put(instr_agent);
    
    fork
      
      agente_prueba.run();
      
    join_none
    #10
    agnt_drv_mbx_tb.get(transaccion);
    $display("Transaccion RECIBIDA Source= %d dato=%0h", transaccion.drvSource,transaccion.dato);
    agnt_sb_mbx.get(transaccion);
    $display("Transaccion RECIBIDA Score Source= %d dato=%0h", transaccion.drvSource,transaccion.dato);
    
  end
  initial begin
    #5000;
    $finish;
  end
  initial begin
    //$dumpfile("agent_tb.vcd");
    $dumpvars(0, agent_tb);
  end
endmodule