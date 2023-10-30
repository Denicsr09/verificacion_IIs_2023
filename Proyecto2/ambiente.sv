class ambiente  #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  

  agent #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) agente_inst;
   
  driver #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) driver_inst [ROWS*2+COLUMS*2];
  
  monitor #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) monitor_inst [ROWS*2+COLUMS*2];
  
  check #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) check_inst;
  scoreboard #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) sb_inst;
  
  revision #(.pckg(pckg_sz)) revision_inst;
  
  //Declaración de la interface que conecta el DUT
  virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif;

  //declaracion de los maiboxes
  //trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx; //Mailbox del agente al driver
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx; //Mailbox del agente al driver
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx;
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx;     //Mailbox agente al scoreboard
  trans_sb_mbx  #(.pckg_sz(pckg_sz))  ckr_sb_mbx;
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;

  trans_revision_mbx revision_ckr_mbx; 
  comando_test_agent_mbx test_agent_mbx;    //Mailbox del test al agente 
  comando_test_sb_mbx   test_sb_mbx;
  

  function new();
    //Instanciación de los Mailboxes
    agnt_drv_mbx     = new();
    ckr_sb_mbx       = new();
    sb_ckr_mbx       = new(); 
    mnr_ckr_mbx      = new();
    agnt_sb_mbx      = new();
    revision_ckr_mbx = new();
    test_agent_mbx   = new();
    test_sb_mbx      = new();
   

    //Instaciación de los componentes del ambiente
    check_inst  = new();
    sb_inst     = new();
    agente_inst = new();
    revision_inst = new();

    //conexion de las interfaces y mailboxes en el ambiente
    agente_inst.vif =vif;
    agente_inst.agnt_drv_mbx = agnt_drv_mbx;
    agente_inst.test_agent_mbx = test_agent_mbx;
    agente_inst.agnt_sb_mbx = agnt_sb_mbx;

    check_inst.mnr_ckr_mbx=mnr_ckr_mbx;
    check_inst.sb_ckr_mbx=sb_ckr_mbx;
    check_inst.ckr_sb_mbx=ckr_sb_mbx;
    check_inst.revision_ckr_mbx=revision_ckr_mbx;

    sb_inst.ckr_sb_mbx =ckr_sb_mbx;
    sb_inst.agnt_sb_mbx=agnt_sb_mbx;
    sb_inst.sb_ckr_mbx=sb_ckr_mbx;
    sb_inst.test_sb_mbx = test_sb_mbx;
    revision_inst.revision_ckr_mbx=revision_ckr_mbx;
    

    for (int i=0; i<(ROWS*2+COLUMS*2);  i++) begin
      
      driver_inst[i]=new(i);
      monitor_inst[i]=new(i);
      monitor_inst[i].vif=vif;
      monitor_inst[i].mnr_ckr_mbx=mnr_ckr_mbx;
      driver_inst[i].fifo_in.vif=vif;
      driver_inst[i].agnt_drv_mbx = agnt_drv_mbx;
    end
  
  endfunction

  virtual task run();
    $display("[%g]  El ambiente fue inicializado",$time);
    for (int i=0; i<(ROWS*2+COLUMS*2);  i++) begin
      fork 
        automatic int n=i;
        driver_inst[n].run();
        monitor_inst[n].run();
      join_none
    end
    
    //vif.reset=1;
    //#20;
    //vif.reset=0;
    fork
      agente_inst.run();
      revision_inst.run();
      sb_inst.run();
      sb_inst.reporte();
      check_inst.run_mnr();
      check_inst.run_sb();
	  check_inst.recepcion();
    join_none
  endtask  
endclass