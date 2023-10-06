///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Ambiente: este módulo es el encargado de conectar todos los elementos del ambiente para que puedan ser usados por el test //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ambiente #(parameter pckg_sz =16, parameter deep_fifo = 8,parameter drvrs = 4);
  
  // Declaración de los componentes del ambiente
  driver #(.pckg_sz(pckg_sz),.deep_fifo(deep_fifo),.drvrs(drvrs),.bits(bits)) driver_inst;
  check #(.pckg_sz(pckg_sz),.deep_fifo(deep_fifo),.drvrs(drvrs)) checker_inst;
  score_board #(.pckg_sz(pckg_sz),.drvrs(drvrs)) scoreboard_inst;
  agent #(.pckg_sz(width),.deep_fifo(deep_fifo),.drvrs(drvrs)) agent_inst;
    
  
  // Declaración de la interface que conecta el DUT 
  virtual bus_if #(.pckg_sz(pckg_sz), .drvrs(drvrs), .bits(bits)) vif; //Interface de conexión del dut

  //declaración de los mailboxes  
  trans_fifo_mbx agnt_drv_mbx;           //mailbox del agente al driver
  trans_fifo_mbx drv_chkr_mbx;           //mailbox del driver al checher
  trans_sb_mbx chkr_sb_mbx;              //mailbox del checker al scoreboard
  comando_test_sb_mbx test_sb_mbx;       //mailbox del test al scoreboard
  comando_test_agent_mbx test_agent_mbx; //mailbox del test al agente
  
  function new();
    // Instanciación de los mailboxes
    drv_chkr_mbx   = new();
    agnt_drv_mbx   = new();
    chkr_sb_mbx    = new();
    test_sb_mbx    = new();
    test_agent_mbx = new();

    // instanciación de los componentes del ambiente
    driver_inst     = new();
    checker_inst    = new();
    scoreboard_inst = new();
    agent_inst      = new();
    // conexion de las interfaces y mailboxes en el ambiente
    driver_inst.vif             = _if;
    driver_inst.drv_chkr_mbx    = drv_chkr_mbx;
    driver_inst.agnt_drv_mbx    = agnt_drv_mbx;
    checker_inst.drv_chkr_mbx   = drv_chkr_mbx;
    checker_inst.chkr_sb_mbx    = chkr_sb_mbx;
    scoreboard_inst.chkr_sb_mbx = chkr_sb_mbx;
    scoreboard_inst.test_sb_mbx = test_sb_mbx;
    agent_inst.test_agent_mbx   = test_agent_mbx;
    agent_inst.agnt_drv_mbx = agnt_drv_mbx;
  endfunction

  virtual task run();
    $display("[%g]  El ambiente fue inicializado",$time);
    fork
      driver_inst.run();
      checker_inst.run();
      scoreboard_inst.run();
      agent_inst.run();
    join_none
  endtask 
endclass
