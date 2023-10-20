`timescale 1ns/1ps

`include "interface_transaction.sv"
//`include "driver.sv"
//`include "checker.sv"
`include "agent.sv"

module agent_tb;
  
  reg clk;
  
  parameter pckg_sz = 40;
  parameter deep_fifo = 8;
  agent #(.pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) agente_prueba;
  
  tipo_trans tpo_spec;
  
  trans_fifo_mbx agnt_drv_mbx_tb;
  trans_fifo_mbx tst_agnt_mbx;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  
  //Comunicacion con el agente para pruebas // Lineas para simular el Test.sv------
  comando_test_agent_mbx test_agent_mbx; // Simulando que el test existe (Mailbox)
  instrucciones_agente instr_agent; // Aloja la instrucción que se va a enviar
  
  initial begin 
    agnt_drv_mbx_tb = new();
    agente_prueba  = new();
    transaccion= new();
    // Instanciando el MB 
    test_agent_mbx = new();
    
    agente_prueba.test_agent_mbx = test_agent_mbx; // MB entre el TB y el agente la
    
    //Instruccion al mailbox del agente
    instr_agent = trans_especifica;
    test_agent_mbx.put(instr_agent);
   
   
    agente_prueba.agnt_drv_mbx = agnt_drv_mbx_tb;
  	
    
    fork
      
      agente_prueba.run();
      
    join_none
    
    agnt_drv_mbx_tb.get(transaccion);
    $display("Transaccion RECIBIDA Source= %d dato=%0h", transaccion.drvSource,transaccion.dato);
    
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