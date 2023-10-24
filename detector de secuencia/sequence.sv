class gen_item_seq extends uvm_sequence;
  
  `uvm_object_utils(gen_item_seq);
  
  function new(string name = "gen_item_seq");
    
    super.new(name);
    
  endfunction
  
  rand int num;
  
  constraint c1 {soft num inside {[10:50]};}
  
  
  
  
endclass