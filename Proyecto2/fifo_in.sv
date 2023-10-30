//Clase para emular el comportamiento de fifo
class fifo_in #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif;
  
	bit [pckg_sz - 1: 0] Din; 
	bit [pckg_sz - 1: 0] Dout;
	//bit push;
	//bit popin;
	bit pndng_i_in;
	bit [pckg_sz -1 : 0] cola [$:deep_fifo];
    int fifo_num;
			
  function new();
       
		this.Din = 0;
		this.Dout = 0;
		this.pndng_i_in = 0;
		this.cola = {};
    	
	endfunction

  task run();
   
    this.vif.pndng_i_in[fifo_num]=0;
    this.vif.data_out_i_in[fifo_num]=0;
    
    forever begin
      @(posedge vif.clk);
      //Si la fifo tiene un dato activa la bandera de pending
      if(this.cola.size() == 0) begin
        this.vif.pndng_i_in[fifo_num]=0;
      end
      else  this.vif.pndng_i_in[fifo_num]=1;
      //Si la fifo detecta una señal de pop del DUT, saca el dato de esta
      if(this.vif.popin[fifo_num]) begin
        $display("salió un dato");
        this.vif.data_out_i_in[fifo_num]=this.cola.pop_front();
      end
      //#5;
      
    end
    
  endtask
  //Task para meter datos a la fifo
  task fifo_push(bit[pckg_sz-1:0] dto);
    if(this.cola.size() == 0) begin
      this.Dout = dto;
      this.cola.push_back(dto);
    end
    else
    	this.cola.push_back(dto);
    $display("FiFo:Se ha ingresado el dato: %0h", dto);
    this.vif.data_out_i_in[fifo_num]=this.cola[0];
  endtask
    
  
	
    
endclass

