`timescale 1ns/1ps
`include "fifo.sv"
module test_fifo;
    parameter pckg_sz = 16;
    parameter deep_fifo = 8;
    reg clk;
    bit [pckg_sz - 1: 0] Dato_in;
    bit [pckg_sz - 1: 0] Dato_out;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    fifo #( .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) fifo_prueba;

    initial begin
        fifo_prueba = new();
        fifo_prueba.clk = clk;
        #1;
        Dato_in = 20;
        fifo_prueba.Din = Dato_in;
        fifo_prueba.push = 1;
    end
    initial begin
    	#10000;
    	$finish;
    end
	initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, test_fifo);
  end    
  

endmodule
