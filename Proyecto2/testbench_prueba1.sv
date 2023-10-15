`timescale 1ns/1ps
`include "Router_library.sv"
//`include "fifo.sv"
//`include "Library.sv"
`include "interface.sv"

module tb;
  
  parameter ROWS= 4;
  parameter COLUMS= 4;
  parameter pckg_sz= 40;
  parameter fifo_depth = 4;
  parameter bdcst= {8{1'b1}};
  //parameter drvs=(ROWS*2+COLUMS*2);
  
  reg clk;
  reg reset;

  
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
  
    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
  
   initial begin
     $dumpfile("tb.vcd");
     $dumpvars(0, tb);
    end
  
  bit [pckg_sz-1:pckg_sz-8] Nxtjp=0;
  bit [pckg_sz-9:pckg_sz-12] row=0;
  bit [pckg_sz-13:pckg_sz-16] colum=2;
  bit [pckg_sz-17]mode=1;
  bit [pckg_sz-18:0] payload=1;//7
  
  
  initial begin
    vif_tb.reset=1;
    vif_tb.pndng_i_in[1]=0;
    #15;
    vif_tb.reset=0;
    #15;
    //for (int i=0; i<1,i++) begin
    $display("row %b colum %b",row,colum);
    vif_tb.data_out_i_in[0]={Nxtjp,row,colum,mode,payload};
    $display("data_out_i_in: %b", vif_tb.data_out_i_in[0]);
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
   
    
    
    $finish;
  end
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
  end
 // initial begin
    //#10000;
   // $finish;
 // end
  
  
endmodule
