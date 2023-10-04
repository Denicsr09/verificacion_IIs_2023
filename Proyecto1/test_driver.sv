// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
`include "fifo.sv"
`include "Library.sv"
`include "driver.sv"
`include "interface_transaction.sv"
module test_driver;
    parameter pckg_sz = 16;
    parameter deep_fifo = 8;
  	parameter drvrs = 4;
    parameter bits = 1;
    reg clk;

    bit [pckg_sz-1:0] dto_spec [drvrs-1: 0];
    tipo_trans tpo_spec;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    trans_fifo_mbx agnt_drv_mbx;
    trans_fifo_mbx drv_chkr_mbx;

    trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaccion;
    driver #(.pckg_sz(pckg_sz), .drvrs(drvrs), .deep_fifo(deep_fifo), .bits(bits)) driver_prueba;
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
    
        agnt_drv_mbx = new;
        drv_chkr_mbx = new;
        driver_prueba  = new;
        driver_prueba.vif = vif;
        
        

        transaccion = new;
        tpo_spec = escritura;
        transaccion.tipo = tpo_spec;
        transaccion.dato =  16'b00000001_00000010;
        transaccion.retardo = 1;
        transaccion.print("Agente: transacción creada");
        agnt_drv_mbx.put(transaccion);
        
        
        driver_prueba.agnt_drv_mbx  = agnt_drv_mbx; 

        
        fork

            driver_prueba.run();

        join_none
        
    end
    initial begin
        #10000;
        $finish;
    end
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, test_driver);
    end

endmodule