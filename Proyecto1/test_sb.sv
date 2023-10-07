///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//test_driver: Test bench utilizado para probar el driver, el checker y el scoreboard simulando el agente y el test //
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`include "fifo.sv"
`include "interface_transaction.sv"
`include "Library.sv"
`include "driver.sv"
`include "checker.sv"
`include "score_board.sv"

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

    

    trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaccion;
    driver #(.pckg_sz(pckg_sz), .drvrs(drvrs), .deep_fifo(deep_fifo), .bits(bits)) driver_prueba;
    check #(.pckg_sz(pckg_sz), .drvrs(drvrs), .deep_fifo(deep_fifo)) checker_prueba;
    bus_if #(.drvrs(drvrs), .pckg_sz(pckg_sz)) vif (.clk(clk));
  	
   score_board #(.drvrs(drvrs), .pckg_sz(pckg_sz)) score_board_prueba;
    
    trans_fifo_mbx agnt_drv_mbx;
    trans_fifo_mbx drv_chkr_mbx;
  	trans_sb_mbx chkr_sb_mbx;
  	comando_test_sb_mbx test_sb_mbx;
    solicitud_sb orden;
  	
  	
  
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
      	chkr_sb_mbx  = new;
        test_sb_mbx  = new;
      	
    	driver_prueba = new;
      	checker_prueba = new;
      	score_board_prueba = new;
      	
      	 
      
        driver_prueba.vif = vif;
      
        driver_prueba.agnt_drv_mbx  = agnt_drv_mbx;
      	driver_prueba.drv_chkr_mbx = drv_chkr_mbx;
      
        checker_prueba.drv_chkr_mbx = drv_chkr_mbx;
    	checker_prueba.chkr_sb_mbx = chkr_sb_mbx;
      
      	score_board_prueba.chkr_sb_mbx = chkr_sb_mbx;
        score_board_prueba.test_sb_mbx =  test_sb_mbx;
      
      	
      
        transaccion = new;
        tpo_spec = escritura;
        transaccion.tipo = tpo_spec;
        transaccion.dato =  16'b00000010_00000010;
        transaccion.drvSource = 1;
        transaccion.retardo = 1;
        transaccion.print("Agente: transacción creada");
        agnt_drv_mbx.put(transaccion);
      
      	transaccion = new;
        tpo_spec = escritura;
        transaccion.tipo = tpo_spec;
      	transaccion.ID = 2;
      	transaccion.payload = 3;
        transaccion.finish_rand();
        //transaccion.dato =  16'b00000010_00000011;
        transaccion.drvSource = 0;
        transaccion.retardo = 1;
        transaccion.print("Agente: transacción creada");
        agnt_drv_mbx.put(transaccion);
      	
      	transaccion = new;
        tpo_spec = escritura;
        transaccion.tipo = tpo_spec;
        //transaccion.dato =  16'b11111111_00000100;
        transaccion.dato = 16'b00000010_00000111;
        transaccion.drvSource = 0;
        transaccion.retardo = 1;
        transaccion.print("Agente: transacción creada");
        agnt_drv_mbx.put(transaccion);
        
      	transaccion = new;
        tpo_spec = escritura;
        transaccion.tipo = tpo_spec;
        transaccion.dato = 16'b00000010_00000111;
        transaccion.drvSource = 3;
        transaccion.retardo = 1;
        transaccion.print("Agente: transacción creada");
        agnt_drv_mbx.put(transaccion);
        
        

      	
      
        fork

            driver_prueba.run();
            checker_prueba.run();
            score_board_prueba.run();
            driver_prueba.fifos();
          	driver_prueba.detec_pop();
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
        $dumpvars(0, test_driver);
    end

endmodule