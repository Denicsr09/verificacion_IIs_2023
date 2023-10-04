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
        this.fifo_prueba = clk;
        #1;
        Dato_in = 20;
        this.Din = Dato_in;
        this.put = 1;
    end

  

endmodule