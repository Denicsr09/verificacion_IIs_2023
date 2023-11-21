`include "env.sv"
class test extends uvm_test;
  `uvm_component_utils(test)
  
  env env_test; 
  my_sequence seq_test;
  int cant_trans;
  virtual dut_if vif; 
  
  //typedef enum {prueba1, prueba2} pruebas;
  pruebas instr_test;

  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
    
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_test = env::type_id::create("env_test", this);
    // Get vitual IF handle from top level and pass it to everything
    //In env level
    if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_if",vif))
      `uvm_fatal("TEST", "Did not get vif")
    uvm_config_db #(virtual dut_if)::set(this,"env_test.agent_env.*","dut_if" ,vif);

      
    seq_test= my_sequence :: type_id::create("seq_test");
    seq_test.randomize();
    //cant_trans = seq_test.numTrans;
    cant_trans = 3;
    
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    instr_test = llenado_aleatorio;
    seq_test.instr_agnt =instr_test;
    `uvm_info("SEQ",$sformatf("Prueba de llenado aleatorio"), UVM_LOW)
    for (int i=0; i< cant_trans;i++)begin
      seq_test.randomize() with {seqdrvSource inside{[0:15]};};
      //$display("El Driver randomizado desde afuera es %0d",seq_test.seqdrvSource);
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i), UVM_LOW)
    end
    /*
    instr_test = trans_filas;
    seq_test.instr_agnt =instr_test;
    `uvm_info("TEST", $sformatf("Prueba de transaccion filas"), UVM_LOW)
    for (int i=0; i< cant_trans;i++)begin
      seq_test.randomize() with {seqdrvSource inside{[0:15]};};
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i), UVM_LOW)
    end
    
    
    instr_test = trans_colum;
    seq_test.instr_agnt =instr_test;
    `uvm_info("TEST", $sformatf("Prueba de transaccion columnas"), UVM_LOW)
    for (int i=0; i< cant_trans;i++)begin
      seq_test.randomize() with {seqdrvSource inside{[0:15]};};
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i), UVM_LOW)
    end
    
    instr_test = intersec_data_espec;
    seq_test.instr_agnt =instr_test;
    `uvm_info("TEST", $sformatf("Prueba de intersección de dato especifico"), UVM_LOW)
    for(int i = 0; i < 4;i++) begin
      seq_test.seqdrvSource =0;
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i), UVM_LOW)
    end
    for(int i = 0; i < 4;i++) begin
      seq_test.seqdrvSource =5;
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i), UVM_LOW)
    end
    
    instr_test = intersec_data;
    seq_test.instr_agnt =instr_test;
    `uvm_info("TEST", $sformatf("Prueba de intersección de datos"), UVM_LOW)
    for(int i = 0; i < 8;i++) begin
      seq_test.seqdrvSource = i;
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i), UVM_LOW)
      seq_test.seqdrvSource = i+8;
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i+2), UVM_LOW)
      
    end
    
    instr_test = envio_especfico;
    seq_test.instr_agnt =instr_test;
    `uvm_info("TEST", $sformatf("Prueba de envio especifico"), UVM_LOW)
    for(int i = 0; i < 16;i++) begin
      seq_test.seqdrvSource = i;
      seq_test.start(env_test.agent_env.sequencer_ag[seq_test.seqdrvSource]);
      `uvm_info("TEST", $sformatf("Done of generation of %0d items",i+2), UVM_LOW)
    end
    */
    
    #2000
    phase.drop_objection(this);
  endtask
  

 endclass