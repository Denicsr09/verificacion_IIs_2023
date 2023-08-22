`timescale 1ps/1ps
`default_nettype none
`define bits 32
`define depth 16
`define TESTING
`include "fifo_flops.sv"
`include "ff_d.sv"
`include "mux.sv"

module fifo_tb;
    //Inputs:
    reg clk;
    reg [`bits-1:0] Din;
    reg push;
    reg pop;
    reg rst;
    //Outputs:
    wire ['bits-1:0] Dout;
    wire full;
    wire pndng;

    fifo_flops DUT(.clk(clk),.Din(Din),.push(push),.pop(pop),.(rst),.Dout(Dout),.full(full),.pndng(pndng));

    initial begin
        clk = 0;
        Din = 0;
        push = 0;
        pop = 0;
        rst = 0;
    end

    always #50 clk = ~clk;

    always @(posedge clk)begin
        prueba();
    end

    int ciclo = 0;
    int dato = 0;
    task prueba();
        if(full == 1)begin
            ciclo = 1;
        end
    
    case(ciclo)
        0: begin
            rst = 1;
            push = 0;
            pop = 0;
            Din = 0;
            ciclo = 1;
        end
        1: begin

        end

        
    endcase





