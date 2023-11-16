 class transaction extends uvm_sequence_item;
  
    `uvm_object_utils(transaction)
  
  rand int retardo; // tiempo de retardo en ciclos de reloj que se debe esperar antes de ejecutar la transacción
  int pckg_sz=40;
   bit[39:0] dato ; // este es el dato de la transacción
   rand bit [22:0] payload;//informacion  enviada
   rand bit [23] mode;
   //rand bit [31 : 24] target;
   bit [31: 28] row=2;
   bit [27: 24] colum=5;
   bit [32 : 39] nxt_jump=0;
  
   constraint const_retardo {retardo < 15; retardo>0;};
   constraint const_payload {payload>0;};
   constraint const_mode {mode==1;};

  function new (string name = "");
      super.new(name);
  endfunction

   function void build_phase(uvm_phase phase);
    /* if(! uvm_config_db #(int)::get (this,"*","pckg_sz",pckg_sz))begin
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
      end*/
   endfunction
   
   
endclass

class my_sequence extends uvm_sequence #(transaction);
  
    `uvm_object_utils(my_sequence)
    
    function new (string name = "");
      super.new(name);
    endfunction

    task body;
      /*if (starting_phase != null)
        starting_phase.raise_objection(this);
*/
      repeat(2)
      begin
        req = transaction::type_id::create("req");
        start_item(req);
        if( !req.randomize() )
          `uvm_error("", "Randomize failed")
          req.dato={req.nxt_jump,req.row,req.colum,req.mode,req.payload};
        finish_item(req);
      end
      
  /*    if (starting_phase != null)
        starting_phase.drop_objection(this);*/
    endtask: body
   
  endclass: my_sequence
  