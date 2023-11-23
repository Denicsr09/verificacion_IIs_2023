`include "driver.sv"
`include "monitor.sv"
`include "macros.sv"

class agent extends uvm_agent;
  
  `uvm_component_utils(agent)//fabrica
  
  driver driver_ag[15:0]; 
  monitor monitor_ag[15:0];
  uvm_sequencer #(transaction) sequencer_ag[15:0]; 
  
  int caso;
  
  function new(string name="agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
    
  //construccion
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    for (int i=0;  i<(`ROWS*2+`COLUMS*2);  i++) begin
      automatic int n=i;
      driver_ag[n] = driver::type_id::create($sformatf("driver%0d",n), this);
      monitor_ag[n] = monitor::type_id::create($sformatf("monitor%0d",n), this);
      sequencer_ag[n] = uvm_sequencer #(transaction)::type_id::create($sformatf("uvm_sequencer%0d",n), this);
    end
  endfunction
    
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    for (int i=0; i<(`ROWS*2+`COLUMS*2);  i++) begin
       automatic int n=i;
      driver_ag[n].drv_num=n;
      monitor_ag[n].drv_num=n;
      driver_ag[n].seq_item_port.connect(sequencer_ag[n].seq_item_export);
    end
    
  endfunction
  
 
 endclass
