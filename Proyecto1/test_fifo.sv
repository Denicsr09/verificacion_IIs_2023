// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
`include "fifo.sv"
`include "Library.sv"
`include "interface_transaction.sv"
module test_fifo;
    parameter pckg_sz = 16;
    parameter deep_fifo = 8;
  	parameter drvrs = 4;
    reg clk;
    bit [pckg_sz - 1: 0] Dato_in;
    bit [pckg_sz - 1: 0] Dato_out;

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
        clk = 0;
        forever #5 clk = ~clk;
    end
  fifo #( .pckg_sz(pckg_sz), .deep_fifo(deep_fifo), .drvrs(drvrs)) fifo_prueba;
  

    initial begin
      	
        fifo_prueba = new();
     	fifo_prueba.vif = vif;
      
      fork
        fifo_prueba.run();
      join_none

      
        //@(posedge clk);
     	#1;
        Dato_in = 20;
        fifo_prueba.Din = Dato_in;
        fifo_prueba.push = 1;
      	#40;
      	fifo_prueba.Din = 10;
      	fifo_prueba.push = 1;
      
      	//fifo_prueba.push = 0;
      	//@(posedge clk);
      	#80;
      	fifo_prueba.pop = 1;
      	
      	
      
    end
    initial begin
    	#1000;
    	$finish;
    end
  
	initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test_fifo);
  end    
  

endmodule
