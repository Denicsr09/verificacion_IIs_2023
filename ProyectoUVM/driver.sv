`include "sequence.svh"
`include "objects.sv"
class driver extends uvm_driver#(transaction);
  `uvm_component_utils (driver)
  
  virtual dut_if vif;
  int drv_num;
  transaction req;
  int espera;
  
  
  function new(string  name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //Puerto de analisis para enviar los datos escritos del driver al scoreboard
  //transaction_driver transaction_drv; 
  
  uvm_analysis_port#(transaction) drv_analysis_port;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);//fase de construccion
    if(! uvm_config_db #(virtual dut_if)::get (this,"","dut_if",vif))begin
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
    end
     drv_analysis_port=new("drv_analysis_port",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
   // phase.raise_objection(this, "starting test_seq");
    //vif.reset=1;
  	//#10;
    //vif.reset=0;
    //vif.data_out_i_in[drv_num]=0;
    //vif.pndng_i_in[drv_num]=0;
  	//#10;
    forever begin
      @(posedge vif.clk);
      //`uvm_info("DRV",$sformatf("Wait for item from sequencer"), UVM_LOW);
      seq_item_port.get_next_item(req);
      espera = 0;
      $display("DatoSource: %0d y drv_num: %0d",req.drvSource,drv_num);
      if(req.drvSource == drv_num) begin
        while(espera < req.retardo)begin
          if(espera == req.retardo -1) begin
            vif.data_out_i_in[drv_num]=req.dato;
            vif.pndng_i_in[drv_num]=1;
            req.tiempo = $time;
            `uvm_info("DRIVER", $sformatf("Dato enviado %d, Tiempo: %0d, drvSource %0d ,target row= %0d colum= %0d", 
                                          req.dato,$time,drv_num , req.row, req.colum), UVM_LOW)
            drv_analysis_port.write(req);
            
          end
          espera = espera + 1;
        end
        
        @(posedge vif.popin[drv_num])begin
          vif.pndng_i_in[drv_num]=0;
        end
       
      end
      seq_item_port.item_done();
      
      
      
      
    end
    
   // phase.drop_objection(this, "finished test_seq");
      
  endtask
  
endclass

