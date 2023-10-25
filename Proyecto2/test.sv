class test #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
    //Nose si va el mailbox al score board 
    comando_test_agent_mbx test_agent_mbx;
    //Preguntar si los aleatorizo
    parameter num_transacciones = 10; 
    parameter max_retardo = 10;

    ambiente #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) ambiente_inst;
    // Definición de la interface a la que se conectará el DUT
    virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif;
    
    function new();
        test_agent_mbx = new();
        ambiente_inst = new();
        ambiente_inst.vif = vif; 
        ambiente_inst.agent_inst.test_agent_mbx = test_agent_mbx;
        ambiente_inst.agent_inst.num_transacciones = num_transacciones;
        ambiente_inst.agent_inst.max_retardo = max_retardo;
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

       instr_agent = intersec_data;
       test_agent_mbx.put(instr_agent);
       $display("[%g]  Test: Enviada la sexta instruccion al agente de envio_especfico",$time);

       #10000
       $display("[%g]  Test: Se alcanza el tiempo límite de la prueba",$time);
       //Envios al scoreboard


    endtask
endclass