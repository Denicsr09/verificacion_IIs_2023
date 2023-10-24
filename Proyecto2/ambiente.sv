class ambiente  #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  //Declaración de los componentes del ambiente
  //Driver
  //Monitor
  //checker
  //scoreboard
  agent #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) agente_inst;
  
  //Declaración de la interface que conecta el DUT
  virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif;

  //declaracion de los maiboxes
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx; //Mailbox del agente al driver
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) test_agnt_mbx;    //Mailbox del test al agente 
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx;     //Mailbox agente al scoreboard
  //mailbox del test al scoreboard
  comando_test_agent_mbx test_agent_mbx; //mailbox del test al agente
  //mailbox monitor

  function new();
    //Instanciación de los Mailboxes
    agnt_drv_mbx   = new();
    tst_agnt_mbx   = new();
    agnt_sb_mbx    = new();
    test_agent_mbx = new();

    //Instaciación de los componentes del ambiente
    //driver_inst
    //checker_inst
    //scoreboard inst
    agente_inst = new();

    //conexion de las interfaces y mailboxes en el ambiente
    //Conexiones Fifos, driver y Monitor
    //checker
    //scoreboard
    agente_inst.vif =vif_tb;
    agente_inst.agnt_drv_mbx = agnt_drv_mbx;
    agente_inst.test_agent_mbx = test_agnt_mbx;
    agente_inst.agnt_sb_mbx = agnt_sb_mbx;
  endfunction

  virtual task run();
    $display("[%g]  El ambiente fue inicializado",$time);
    fork
        agent_inst.run();
    join_none


  endtask  
endclass