// Code your testbench here
// or browse Examples

/////aqui funciona hasta el scoreborad/////////////
`timescale 1ns/1ps
`include "fifo.sv"
`include "interface_transaction.sv"
`include "driver.sv"
`include "checker.sv"
`include "Library.sv"
`include "agent.sv"
`include "score_board.sv"


module tb_general;
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
  
  driver #(.pckg_sz(pckg_sz), .drvrs(drvrs), .deep_fifo(deep_fifo), .bits(bits)) driver_prueba;
  
  check #(.pckg_sz(pckg_sz), .drvrs(drvrs), .deep_fifo(deep_fifo)) checker_prueba;
  
  score_board  #(.pckg_sz(pckg_sz),.drvrs(drvrs)) sb_prueba;
  
  trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaccion;
  
  bus_if #(.drvrs(drvrs), .pckg_sz(pckg_sz)) vif (.clk(clk));
 
  
  
  
  trans_fifo_mbx agnt_drv_mbx_tb;
  trans_fifo_mbx tst_agnt_mbx;
  trans_fifo_mbx drv_chkr_mbx;
  trans_sb_mbx chkr_sb_mbx;	 
  solicitud_sb orden;
  
  
  //Comunicacion con el agente para pruebas // Lineas para simular el Test.sv------
  comando_test_agent_mbx test_agent_mbx; // Simulando que el test existe (Mailbox)
  instrucciones_agente instr_agent; // Aloja la instrucción que se va a enviar
  comando_test_sb_mbx test_sb_mbx; //simulando conexion sb a test
		  //------------------------------------------------------------------------------
  
  
 

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
    test_agent_mbx = new();
    drv_chkr_mbx = new();
    driver_prueba=new();
    checker_prueba = new;
    chkr_sb_mbx= new();
    sb_prueba=new();
    test_sb_mbx=new();
    driver_prueba.vif = vif;
    instr_agent = trans_especifica;    
    // Instanciando el MB 
   
    
    //Instruccion al mailbox del agente
     agente_prueba.test_agent_mbx = test_agent_mbx; // MB entre el TB y el agente
    test_agent_mbx.put(instr_agent);                                                                                             
    driver_prueba.drv_chkr_mbx = drv_chkr_mbx;
    agente_prueba.agnt_drv_mbx = agnt_drv_mbx_tb;
    driver_prueba.agnt_drv_mbx = agnt_drv_mbx_tb;
    checker_prueba.drv_chkr_mbx = drv_chkr_mbx;
    checker_prueba.chkr_sb_mbx = chkr_sb_mbx;
    sb_prueba. chkr_sb_mbx=chkr_sb_mbx;
    sb_prueba.test_sb_mbx=test_sb_mbx;
    
    fork
      agente_prueba.run();
      driver_prueba.run();
      checker_prueba.run();
      driver_prueba.fifos();
      driver_prueba.detec_pop();
      sb_prueba.run();
    join_none
    
  end
  initial begin
      #8000;
      $display("[%g]  Test: Se alcanza el tiempo límite de la prueba",$time);
      orden = retardo_promedio;
      test_sb_mbx.put(orden);
      orden = ancho_banda;
      test_sb_mbx.put(orden);
      orden = reporte;
      test_sb_mbx.put(orden);
      
    end
    initial begin
        #10000;
        $finish;
    end
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb_general);
    end

endmodule