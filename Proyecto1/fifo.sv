//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// FIFO: Este objeto se encarga de encarga de simular el comportamiento de una FIFO                                     //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class fifo #(parameter pckg_sz = 16, parameter deep_fifo = 10, parameter bits = 1, parameter drvrs = 4 );

	bit [pckg_sz - 1: 0] Din;   //Variable de entrada de la FIFO
	bit [pckg_sz - 1: 0] Dout;  //Variable de Salida de la FIFO
	bit push;                   //Variable para meter un dato en la FIFO
	bit pop;                   //Variable para sacar un dato de la FIFO
	bit pndng;                 //Variable para indicar si la fifo esta vacia o llena
	bit [pckg_sz -1 : 0] cola [$:deep_fifo];
  
  //Funcion para inicializar las propiedad del objeto
	function new();
		this.Din = 0;
		this.Dout = 0;
		this.push = 0;
		this.pop = 0;
		this.pndng = 0;
		this.cola = {};
	endfunction
  
  //Task para revisar si hay una señal de pop y si la FIFO se encuentra vacía o llena
	task run();
      //Revisar si hay un pop
      if(this.pop) begin
        this.Dout = this.cola.pop_front();
      end
      //Revisar si la FIFO se encuentra vacía o llena
      if(this.cola.size() == 0) begin
        this.pndng = 0;
        this.Dout = 0; 
      end
      else begin
        this.pndng = 1;
      end
	endtask
  
  //Task para realizar Push en la FIFO
  task fifo_push(bit[pckg_sz-1:0] dto);
    //Condición para poner el dato en el DOUT y que cuando se realize un pop saque el dato que esta en el tope de la Pila
    //El this.DOUT = dto, porque sino cuando el DUT realiza pop no agarra el dato correcto.
    if(this.cola.size() == 0) begin
      this.Dout = dto;
      this.cola.push_front(dto);
    end
    else
    	this.cola.push_front(dto);
    //$display("FiFo:Se ha ingresado el dato: %0h", dto);
  endtask
  

    
    
endclass
