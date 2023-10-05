// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
//`include "fifo.sv"
`include "interface_transaction.sv"
//`include "driver.sv"
//`include "checker.sv"
`include "Library.sv"
`include "agent.sv"

module tb_driver_dut;
  reg clk;
  parameter pckg_sz = 16;
  parameter deep_fifo = 8;
  parameter drvrs = 4;
  parameter bits = 1;
  bit [pckg_sz-1:0] dto_spec [drvrs-1: 0];
  
  tipo_trans tpo_spec;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  
  agent #(.width(pckg_sz), .depth(deep_fifo), .drvrs(drvrs)) agente_prueba;
  
  trans_fifo_mbx agnt_drv_mbx_tb;
  trans_fifo_mbx tst_agnt_mbx;
  

  
  trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaccion;
  
  //Comunicacion con el agente para pruebas // Lineas para simular el Test.sv------
  comando_test_agent_mbx test_agent_mbx; // Simulando que el test existe (Mailbox)
  instrucciones_agente instr_agent; // Aloja la instrucción que se va a enviar
  //-------------------------------------------------------------------------------
  
  bus_if #(.drvrs(drvrs), .pckg_sz(pckg_sz)) vif (.clk(clk));
 
  
  bs_gnrtr_n_rbtr dut (.clk(vif.clk),
                       .reset(vif.reset),
                       .pndng(vif.pndng),
                       .push(vif.push),
                       .pop(vif.pop),
                       .D_pop(vif.D_pop),
                       .D_push(vif.D_push)
                        );
  initial begin
    
    agnt_drv_mbx_tb = new();
    agente_prueba  = new();
    transaccion= new();
    // Instanciando el MB 
    test_agent_mbx = new();
    
    agente_prueba.test_agent_mbx = test_agent_mbx; // MB entre el TB y el agente la
    //Instruccion al mailbox del agente
    instr_agent = IDaleatorio;
    test_agent_mbx.put(instr_agent);
   
   
    agente_prueba.agnt_drv_mbx = agnt_drv_mbx_tb;
  	
    
    fork
      
      agente_prueba.run();
      
    join_none
    
    agnt_drv_mbx.get(transaccion);
    $display("Transaccion RECIBIDA Source= %d dato=%0h", transaccion.drvSource,transaccion.dato);
    
  end
  initial begin
    #5000;
    $finish;
  end
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, tb_driver_dut);
  end

endmodule