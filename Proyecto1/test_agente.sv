// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
`include "fifo.sv"
`include "interface_transactions.sv"
`include "driver.sv"
`include "checker.sv"
`include "Library.sv"
`include "agent.sv"

module tb_driver_dut;
  reg clk;
  parameter pckg_sz = 16;
  parameter deep_fifo = 8;
  parameter drvrs = 4;
  parameter bits = 1;
  //reg                reset;
  //reg                pndng  [bits-1:0][drvrs-1:0];
  //reg [pckg_sz-1:0]  D_pop  [bits-1:0][drvrs-1:0];
  //wire               push   [bits-1:0][drvrs-1:0];
  //wire               pop    [bits-1:0][drvrs-1:0];
  //wire [pckg_sz-1:0] D_push [bits-1:0][drvrs-1:0];
  bit [pckg_sz-1:0] dto_spec [drvrs-1: 0];
  
  tipo_trans tpo_spec;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  driver #(.pckg_sz(pckg_sz), .drvrs(drvrs), .deep_fifo(deep_fifo), .bits(bits)) driver_prueba;
  
  check #(.pckg_sz(pckg_sz), .drvrs(drvrs)) checker_prueba;
  //bus_if #(.drvrs(drvrs), .pckg_sz(pckg_sz)) _if (.clk(clk));
  
  agent #(.width(pckg_sz), .depth(deep_fifo), .drvrs(drvrs)) agente_prueba;
  
  trans_fifo_mbx agnt_drv_mbx;
  trans_fifo_mbx drv_chkr_mbx;
  trans_fifo_mbx tst_agnt_mbx;
  
  trans_sb_mbx chkr_sb_mbx;
  
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
    
  	//reset= 1;
  	//#10
  	//reset = 0;
    agnt_drv_mbx = new;
    drv_chkr_mbx = new;
    chkr_sb_mbx  = new;
    driver_prueba  = new;
    checker_prueba = new;
    agente_prueba  = new;
    
   	driver_prueba.vif = vif;
    
    // Instanciando el MB 
    test_agent_mbx = new;
    agente_prueba.test_agent_mbx = test_agent_mbx; // MB entre el TB y el agente la
    //Instruccion al mailbox del agente
    instr_agent = IDaleatorio;
    test_agent_mbx.put(instr_agent);
    
    
    //transaccion = new;
    //tpo_spec = escritura;
    //transaccion.tipo = tpo_spec;
    //transaccion.dato [0] =  16'b00000001_00000010;
    //transaccion.dato [1] =  16'b00000010_00000011;
    //transaccion.dato [2] =  16'b00000001_00000001;
    //transaccion.retardo = 1;
    //transaccion.print("Agente: transacción creada");
    //agnt_drv_mbx.put(transaccion);
    
    
    
    //transaccion = new;
    //transaccion.tipo = lectura;
    //transaccion.retardo = 1;
    //transaccion.print("Agente: transacción creada");
    //agnt_drv_mbx.put(transaccion);
    
    
   
    agente_prueba.agnt_drv_mbx  = agnt_drv_mbx;
    driver_prueba.agnt_drv_mbx  = agnt_drv_mbx;
    driver_prueba.drv_chkr_mbx = drv_chkr_mbx;
    checker_prueba.drv_chkr_mbx = drv_chkr_mbx;
    checker_prueba.chkr_sb_mbx = chkr_sb_mbx;
    
    
    fork
      driver_prueba.run();
      driver_prueba.detec_push();
      checker_prueba.run();
      agente_prueba.run();
    join_none
    
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