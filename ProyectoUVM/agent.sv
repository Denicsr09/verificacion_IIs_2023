`include "driver.sv"
`include "monitor.sv"


class agent extends uvm_agent;
  
  `uvm_component_utils(agent)//fabrica
  
  driver driver_ag[15:0]; 
  monitor monitor_ag[15:0];
  uvm_sequencer #(transaction) sequencer_ag[15:0]; 
    
  
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
  //construccion
    function void build_phase(uvm_phase phase);
      
      
      for (int i=0; i<16;  i++) begin
        automatic int n=i;
        driver_ag[n] = driver::type_id::create($sformatf("driver%0d",n), this);
        monitor_ag[n] = monitor::type_id::create($sformatf("monitor%0d",n), this);
        sequencer_ag[n] = uvm_sequencer #(transaction)::type_id::create($sformatf("uvm_sequencer%0d",n), this);
      end
      
    endfunction
    
  function void connect_phase(uvm_phase phase);
    for (int i=0; i<16;  i++) begin
       automatic int n=i;
      
      driver_ag[n].seq_item_port.connect(sequencer_ag[n].seq_item_export);
      driver_ag[n].drv_num=n;
      
    end
    
  endfunction
  
    task run_phase(uvm_phase phase);
      
      phase.raise_objection(this);
      begin
        my_sequence secuencia;
        secuencia = my_sequence::type_id::create("secuencia");
         for (int i=0; i<16;  i++) begin
      		 automatic int n=i;
           secuencia.start(sequencer_ag[n]);
         end
      end
      phase.drop_objection(this);
 		
    endtask

 endclass