`include "macros2.sv"


class trans_sb extends uvm_object;
  
  bit [`pckg_sz-1:0] dato_enviado;//Dato enviado
  int drvSource_push;//Driver de destino
  int ID_pop;// Monitor de llegada
  bit mode;
  int tiempo_push;
  int tiempo_pop;
  bit completado;
  bit overflow;
  bit underflow;
  bit reset;
  int latencia; 

  function new(string name="trans_sb");
      super.new(name);
  endfunction
  
  `uvm_object_utils_begin(trans_sb)
  	`uvm_field_int(dato_enviado,UVM_DEFAULT)
  	`uvm_field_int(drvSource_push,UVM_DEC)
  	`uvm_field_int(ID_pop,UVM_DEC)
  	`uvm_field_int(mode,UVM_DEC)
  	`uvm_field_int(latencia,UVM_DEC)
  `uvm_object_utils_end
  
  virtual function void calc_latencia;
   this.latencia = this.tiempo_pop - this.tiempo_push;
  endfunction
  
  
    
 endclass





























