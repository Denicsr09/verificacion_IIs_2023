`include "env.sv"
class test extends uvm_test;
  `uvm_component_utils(test)
  
  env env_test; 
  my_sequence seq_test;
  
  typedef enum {prueba1, prueba2} pruebas;
  


  function new(string name = "test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
    
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_test = env::type_id::create("env_test", this);
    
    seq_test = my_sequence :: type_id::create("seq");
    seq_test.randomize();
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq_test.start(env_test.agent_env.sequencer_ag);
    #200
    phase.drop_objection(this);
  endtask
  

 endclass