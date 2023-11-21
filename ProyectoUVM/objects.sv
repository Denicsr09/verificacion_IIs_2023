`include "macros.sv"


class transaction_monitor extends uvm_object;
  
  int retardo; 
  bit[`pckg_sz-9:0] dato; 

  `uvm_object_utils_begin(transaction_monitor)
  
  `uvm_field_int(retardo,UVM_DEFAULT)
  //`uvm_field_bit(dato,UVM_DEFAULT)
  
  `uvm_object_utils_end
  
  function new(string name="transaction_monitor");
      super.new(name);
  endfunction
    
 endclass





























