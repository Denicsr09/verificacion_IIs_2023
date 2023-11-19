`include "driver.sv"
`include "monitor.sv"
`include "macros.sv"

class agent extends uvm_agent;
  
  `uvm_component_utils(agent)//fabrica
  
  driver driver_ag[15:0]; 
  monitor monitor_ag[15:0];
  //uvm_sequencer #(transaction) sequencer_ag[15:0]; 
  uvm_sequencer #(transaction) sequencer_ag; 
  int caso;
  
  function new(string name="agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
    
  //construccion
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sequencer_ag = uvm_sequencer #(transaction)::type_id::create("uvm_sequencer",this);
    for (int i=0;  i<(`ROWS*2+`COLUMS*2);  i++) begin
      automatic int n=i;
      driver_ag[n] = driver::type_id::create($sformatf("driver%0d",n), this);
      monitor_ag[n] = monitor::type_id::create($sformatf("monitor%0d",n), this);
      monitor_ag[n].drv_num=n;
      //sequencer_ag[n] = uvm_sequencer #(transaction)::type_id::create($sformatf("uvm_sequencer%0d",n), this);
    end
  endfunction
    
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    for (int i=0; i<(`ROWS*2+`COLUMS*2);  i++) begin
       automatic int n=i;
      
      driver_ag[n].seq_item_port.connect(sequencer_ag.seq_item_export);
      driver_ag[n].drv_num=n;
      
    end
    
  endfunction
  
 /*
    task run_phase(uvm_phase phase);
      
      phase.raise_objection(this); begin
        if (caso==0) begin 
            my_sequence secuencia;
            secuencia = my_sequence::type_id::create("secuencia");

             for (int i=0; i<(`ROWS*2+`COLUMS*2);  i++) begin
                 automatic int n=i;
               secuencia.randomize();

               repeat(secuencia.numTrans) begin 
                 secuencia.start(sequencer_ag[n]);//aqui envia los paquetes
               end 
             end
        end 
        if (caso==1) begin 
            my_sequence secuencia;
            secuencia = my_sequence::type_id::create("secuencia");

             //for (int i=0; i<(`ROWS*2+`COLUMS*2);  i++) begin
               //  automatic int n=i;
               secuencia.randomize();

               repeat(secuencia.numTrans) begin 
                 secuencia.start(sequencer_ag[5]);//aqui envia los paquetes
               end 
             //end
        end 
      end
      phase.drop_objection(this);
	
    endtask
    */
 endclass