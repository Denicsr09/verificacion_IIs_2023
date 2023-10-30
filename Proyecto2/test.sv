class test #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4, parameter num_transacciones);
    //Nose si va el mailbox al score board 
    comando_test_agent_mbx test_agent_mbx;
    comando_test_sb_mbx   test_sb_mbx;
  
    parameter max_retardo = 10;
  	instrucciones_agente instr_agent;
    
    solicitud_sb instr_sb;
   
    ambiente #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) ambiente_inst;
    // Definición de la interface a la que se conectará el DUT
    virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif;
    
    function new;
        test_agent_mbx = new();
        test_sb_mbx = new();
        ambiente_inst = new();
        ambiente_inst.vif = vif; 
        ambiente_inst.agente_inst.test_agent_mbx = test_agent_mbx;
      	ambiente_inst.sb_inst.test_sb_mbx = test_sb_mbx;
        ambiente_inst.agente_inst.num_transacciones = num_transacciones;
        ambiente_inst.agente_inst.max_retardo = max_retardo;
    endfunction

    task run;
        $display("[%g]  El Test fue inicializado",$time);
        fork
        	ambiente_inst.run();
        join_none

        instr_agent = llenado_aleatorio; 
        test_agent_mbx.put(instr_agent);//envia la instruccion que se desea al agente 
        $display("[%g]  Test: Enviada la primera instruccion al agente de llenado_aleatorio con num_transacciones %g",$time,num_transacciones);

        instr_agent = trans_filas;
        test_agent_mbx.put(instr_agent);
        $display("[%g]  Test: Enviada la segunda instruccion al agente de trans_filas con num_transacciones %g",$time,num_transacciones);

        instr_agent = trans_colum;
        test_agent_mbx.put(instr_agent);
        $display("[%g]  Test: Enviada la tercera instruccion al agente de trans_colum con num_transacciones %g",$time,num_transacciones);

       instr_agent = intersec_data_espec;
       test_agent_mbx.put(instr_agent);
       $display("[%g]  Test: Enviada la cuarta instruccion al agente de intersec_data_espec",$time);

       instr_agent = intersec_data;
       test_agent_mbx.put(instr_agent);
       $display("[%g]  Test: Enviada la quinta instruccion al agente de intersec_data",$time);

       instr_agent = envio_especfico;
       test_agent_mbx.put(instr_agent);
       $display("[%g]  Test: Enviada la sexta instruccion al agente de envio_especfico",$time);

       #10000
       $display("[%g]  Test: Se alcanza el tiempo límite de la prueba",$time);
       //Envios al scoreboard
       instr_sb = retardo_promedio;
       test_sb_mbx.put(instr_sb);
  
       instr_sb = ancho_banda;
       test_sb_mbx.put(instr_sb);
   
       instr_sb = reporte;
       test_sb_mbx.put(instr_sb);
  
      #20
      $finish;
    endtask
endclass