`include "env.sv"
class test extends uvm_test;
    `uvm_component_utils(test)
  
    env env_test;
  
   	

    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
      env_test = env::type_id::create("env_test", this);
    endfunction
    
    task run_phase(uvm_phase phase);

    endtask

 endclass