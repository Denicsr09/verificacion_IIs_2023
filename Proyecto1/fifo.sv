// Code your design here
class fifo #(parameter pckg_sz = 16, parameter deep_fifo = 10, parameter bits = 1, parameter drvrs = 4 );

	bit [pckg_sz - 1: 0] Din;
	bit [pckg_sz - 1: 0] Dout;
	bit push;
	bit pop;
	bit pndng;
	bit [pckg_sz -1 : 0] cola [$:deep_fifo];

	function new();
		this.Din = 0;
		this.Dout = 0;
		this.push = 0;
		this.pop = 0;
		this.pndng = 0;
		this.cola = {};
	endfunction
  
	task run();
        if(this.pop) begin
          this.Dout = this.cola.pop_front();
          //$display("FiFo:Se ha sacado el dato: %0h", this.Dout);
          //$display("Tamaño cola: %0d", cola.size());
        end
      	
      if(this.cola.size() == 0) begin
          this.pndng = 0;
        	this.Dout = 0; 
          //$display("El pending esta bajo");
        end
        else begin
          this.pndng = 1;
				//$display("El pending esta alto");
        end
      
      	

	endtask
  
  task fifo_push(bit[pckg_sz-1:0] dto);
    if(this.cola.size() == 0) begin
      this.Dout = dto;
      this.cola.push_front(dto);
    end
    else
    	this.cola.push_front(dto);
    $display("FiFo:Se ha ingresado el dato: %0h", dto);
  endtask
  

    
    
endclass
