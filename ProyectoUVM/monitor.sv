`include "macros2.sv"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* Se reciben los datos provenientes del DUT y se envian por medio del puerto de análisis al scoreboard*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	
  
  uvm_analysis_port#(transaction) mon_analysis_port;
  
  virtual function void build_phase(uvm_phase phase);//fase de construccion
    super.build_phase (phase);
    if(! uvm_config_db #(virtual dut_if)::get (this,"","dut_if",vif))begin//en caso de que no se haya creado bien la fase virtual, indica un error fatal
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
    end
    mon_analysis_port=new("mon_analysis_port",this);//se crea el puerto de analisis conectado al scoreboard
  endfunction
  
  
  virtual task run_phase(uvm_phase phase);
	
   
     forever begin
      
      
         @(posedge vif.clk)begin
        	
         	if(this.vif.pndng[drv_num]) begin
              
              transaction_mnr = transaction::type_id::create("transaction_mnr", this);//se crea la transaccion del monitor 
              transaction_mnr.dato=vif.data_out[drv_num][`pckg_sz-9:0];
              transaction_mnr.tiempo = $time;//se setea el tiempo en el que llega el dato 
              transaction_mnr.tipo = lectura;//se setea que es de tipo lectura, ya que sale del DUT y se toma en el monitorr
              mon_analysis_port.write(transaction_mnr);//se envia la transaccion al puerto de analsis 
              
              vif.pop[drv_num]=1;
              
              @(posedge vif.clk);
      		end
           else begin
           vif.pop[drv_num]=0;
      	   end
         
         end
           
    end

  
  endtask
  
endclass

