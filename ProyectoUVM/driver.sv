`include "sequence.svh"

/////////////////////////////////////////////////////////////////////////////////////////////
/*Recibe el sequence item proveniente del sequence y lo envia al dut por medio de la interfaz*/
////////////////////////////////////////////////////////////////////////////////////////////
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
  uvm_analysis_port#(transaction) drv_analysis_port;

  virtual function void build_phase(uvm_phase phase);//fase de construccion
    super.build_phase (phase);
    if(! uvm_config_db #(virtual dut_if)::get (this,"","dut_if",vif))begin
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
    end
     drv_analysis_port=new("drv_analysis_port",this);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
 
    forever begin
      @(posedge vif.clk);
      //`uvm_info("DRV",$sformatf("Wait for item from sequencer"), UVM_LOW);
      seq_item_port.get_next_item(req);//Comando de UVM para tomar el sequence item 
      espera = 0;
      //$display("DatoSource: %0d y drv_num: %0d",req.drvSource,drv_num);
      if(req.drvSource == drv_num) begin//si es el driver del que se desea enviar 
        while(espera < req.retardo)begin
          if(espera == req.retardo -1) begin
            vif.data_out_i_in[drv_num]=req.dato;//Se envia el dato 
            vif.pndng_i_in[drv_num]=1;
            req.tiempo = $time;//se toma el tiempo en el que se envía el dato 
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
    

      
  endtask
  
endclass

