class ambiente  #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  //Declaración de los componentes del ambiente
  //driver #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) driver_inst [ROWS*2+COLUMS*2];
  //monitor #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) monitor_inst [ROWS*2+COLUMS*2];
  //check #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(fifo_depth)) check_inst;
  //scoreboard #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(fifo_depth)) sb_inst;
  agent #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) agente_inst;
  
  //Declaración de la interface que conecta el DUT
  virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif;

  //declaracion de los maiboxes
  //trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx; //Mailbox del agente al driver
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx; //Mailbox del agente al driver
  comando_test_agent_mbx test_agnt_mbx;    //Mailbox del test al agente 
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx;     //Mailbox agente al scoreboard
  //mailbox del test al scoreboard
  comando_test_agent_mbx test_agent_mbx; //mailbox del test al agente
  //mailbox monitor

  function new();
    //Instanciación de los Mailboxes
    agnt_drv_mbx   = new();
    agnt_sb_mbx    = new();
    test_agent_mbx = new();
    //mnr_ckr_mbx=new();
    //sb_ckr_mbx=new();

    //Instaciación de los componentes del ambiente
    //check_inst = new();
    //sb_inst = new ();
    agente_inst = new();
    /*
    for (int i=0; i<(ROWS*2+COLUMS*2);  i++) begin
      
      driver_inst[i]=new(i);
      monitor_inst[i]=new(i);
      driver_inst[i].fifo_in.vif=vif;
      monitor_inst[i].vif=vif;
      driver_inst[i].agnt_drv_mbx = agnt_drv_mbx_tb;
      monitor_inst[i].mnr_ckr_mbx=mnr_ckr_mbx;
      
    end
    */
    //conexion de las interfaces y mailboxes en el ambiente
    //Conexiones Fifos, driver y Monitor
    //check_inst.mnr_ckr_mbx=mnr_ckr_mbx;
    //check_inst.sb_ckr_mbx=sb_ckr_mbx;
    //sb_inst.agnt_sb_mbx=agnt_sb_mbx;
    //sb_inst.sb_ckr_mbx=sb_ckr_mbx;
    agente_inst.vif =vif;
    agente_inst.agnt_drv_mbx = agnt_drv_mbx;
    agente_inst.test_agent_mbx = test_agnt_mbx;
    agente_inst.agnt_sb_mbx = agnt_sb_mbx;
  endfunction

  virtual task run();
    $display("[%g]  El ambiente fue inicializado",$time);
    fork
      agente_inst.run();
    join_none
    /*
    for (int i=0; i<(ROWS*2+COLUMS*2);  i++) begin
       
      fork 
        automatic int n=i;
        driver_tb[n].agnt_drv_mbx = agnt_drv_mbx_tb;
        monitor_tb[n].mnr_ckr_mbx=mnr_ckr_mbx;
        driver_tb[n].run();
        monitor_tb[n].run();
      join_none
      
    end
    */
  endtask  
endclass