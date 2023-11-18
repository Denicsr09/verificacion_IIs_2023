`include "sequence.svh"

class driver extends uvm_driver#(transaction);
  `uvm_component_utils (driver)
  
  virtual dut_if vif;
  int drv_num;

  function new(string  name, uvm_component parent);
    super.new(name,parent);
  endfunction
   

  virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);//fase de construccion
    if(! uvm_config_db #(virtual dut_if)::get (this,"","dut_if",vif))begin
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
   
   // phase.raise_objection(this, "starting test_seq");
    vif.reset=1;
  	#10;
    vif.reset=0;
    vif.data_out_i_in[drv_num]=0;
    vif.pndng_i_in[drv_num]=0;
  	#10;
    forever begin
      seq_item_port.get_next_item(req);
	  
      $display("dato enviado %b, drvSource %0d ,target row= %0d colum= %0d", req.dato,drv_num , req.row, req.colum);
      
      vif.data_out_i_in[drv_num]=req.dato;
      vif.pndng_i_in[drv_num]=1;
      
      @(posedge vif.popin[drv_num])begin
        
        vif.pndng_i_in[drv_num]=0;
        
      end
      
      seq_item_port.item_done();
      
      
      
    end
    
   // phase.drop_objection(this, "finished test_seq");
      
    
    
  endtask
  
endclass


