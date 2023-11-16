class monitor extends uvm_monitor;
  `uvm_component_utils (monitor)
  
  
  virtual dut_if vif;
  
 
  function new(string  name, uvm_component parent);
    super.new(name,parent);
  endfunction
   
//se declara el manejador de clase virtual
  virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);//fase de construccion
    if(! uvm_config_db #(virtual dut_if)::get (this,"","dut_if",vif))begin
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);

    
  endtask
  
endclass

