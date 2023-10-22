`timescale 1ns/1ps
`include "Router_library.sv"
//`include "fifo.sv"
//`include "Library.sv"
`include "interface_transactions.sv"
`include "interface.sv"
`include "fifo_in.sv"
`include "driver.sv"
`include "agent.sv"

module tb;
  
  parameter ROWS= 4;
  parameter COLUMS= 4;
  parameter pckg_sz= 40;
  parameter fifo_depth = 4;
  parameter bdcst= {8{1'b1}};
  //parameter drvs=(ROWS*2+COLUMS*2);
  
  reg clk;
  reg reset;

  tipo_trans tpo_spec;
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx_tb;
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) tst_agnt_mbx;
  
  comando_test_agent_mbx test_agent_mbx; // Simulando que el test existe (Mailbox)
  instrucciones_agente instr_agent; // Aloja la instrucción que se va a enviar
  
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  
  agent #(.pckg_sz(pckg_sz), .deep_fifo(fifo_depth)) agente_prueba;
  
  mesh_gnrtr_vif #( .ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(fifo_depth), .bdcst(bdcst) ) vif_tb (.clk(clk)); //Aqui instancio mi interface 
  
  driver #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(fifo_depth)) driver_tb [ROWS*2+COLUMS*2];
  
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
  
  
    initial begin 
        clk = 0;
        forever #1 clk = ~clk;
    end
  
   initial begin
     //$dumpfile("tb.vcd");
     $dumpvars(0, tb);
    end
  
  bit [pckg_sz-1:pckg_sz-8] Nxtjp=0;
  bit [pckg_sz-9:pckg_sz-12] row=0;
  bit [pckg_sz-13:pckg_sz-16] colum=2;
  bit mode=1;
  bit [pckg_sz-18:0] payload=1;//7
  
  initial begin 
    agnt_drv_mbx_tb = new();
    agente_prueba  = new();
    transaccion= new();
    test_agent_mbx = new();
    agente_prueba.test_agent_mbx = test_agent_mbx; 
    agente_prueba.agnt_drv_mbx = agnt_drv_mbx_tb;

    fork
      
      agente_prueba.run();
     
    join_none
    
  end
  
  
  initial begin
  
    vif_tb.reset=1;
    //vif_tb.pndng_i_in[1]=0;
    
    #15;
    vif_tb.reset=0;
    #15;
    
    for (int i=0; i<(ROWS*2+COLUMS*2);  i++) begin
      
      driver_tb[i]=new(i);
      driver_tb[i].fifo_in.vif=vif_tb;
   
    end
    
    #15;
    
    for (int i=0; i<(ROWS*2+COLUMS*2);  i++) begin
       
      fork 
        automatic int n=i;
        driver_tb[n].agnt_drv_mbx = agnt_drv_mbx_tb;
        driver_tb[n].run();
      join_none
      
    end
    #15;
    
    driver_tb[0].data_in=({Nxtjp,row,colum,mode,payload}); 
    #20;
    /*
    #15;
    //for (int i=0; i<1,i++) begin
    //$display("row %b colum %b",row,colum);
    //vif_tb.data_out_i_in[0]={Nxtjp,row,colum,mode,payload};
    //$display("data_out_i_in: %b", vif_tb.data_out_i_in[0]);
    //end
    #15;
    vif_tb.pndng_i_in[0]=1;//5to bit en 1
    #15;
    vif_tb.pndng_i_in[0]=0;//5to bit en 1
    #15;
	
    vif_tb.pop[2]=1;
    #1000;
    vif_tb.pop[2]=0;
    #1000;
    */
    instr_agent = llenado_aleatorio;
    test_agent_mbx.put(instr_agent);
    #200;

    
 
    
    
    $finish;
  end
  initial begin
    //$dumpfile("tb.vcd");
    $dumpvars(0, tb);
  end
 // initial begin
    //#10000;
   // $finish;
 // end
  
  
endmodule
