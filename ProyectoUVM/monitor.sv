`include "macros.sv"
class monitor extends uvm_monitor;
  `uvm_component_utils (monitor)
  
  
  virtual dut_if vif;
  int drv_num;
  bit [`pckg_sz -1 : 0] dato; 
  int tiempo=0; 
  
  function new(string  name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  transaction transaction_mnr;
	
  //transaction_monitor transaction_mnr; 
  
  uvm_analysis_port#(transaction) mon_analysis_port;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);//fase de construccion
    if(! uvm_config_db #(virtual dut_if)::get (this,"","dut_if",vif))begin
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
    end
    mon_analysis_port=new("mon_analysis_port",this);
  endfunction
  
  
  virtual task run_phase(uvm_phase phase);
	
    //vif.pop[drv_num]=0;
    //#10;
    phase.raise_objection(this);
     forever begin
      
      
         @(posedge vif.clk)begin
        	
         	if(this.vif.pndng[drv_num]) begin
              
        	  transaction_mnr = transaction::type_id::create("transaction_mnr", this);
              transaction_mnr.dato=vif.data_out[drv_num][`pckg_sz-9:0];
              transaction_mnr.tiempo = $time;
              transaction_mnr.tipo = lectura;
              mon_analysis_port.write(transaction_mnr);
              
              vif.pop[drv_num]=1;
              
              @(posedge vif.clk);
      		end
           else begin
           vif.pop[drv_num]=0;
      	   end
           if (tiempo>1000)break;
           tiempo=tiempo+1;
         end
           
    end
    phase.drop_objection(this);
  
  endtask
  
endclass

