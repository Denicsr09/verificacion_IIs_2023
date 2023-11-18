`include "macros.sv"
class transaction extends uvm_sequence_item;
  
  `uvm_object_utils(transaction)
  
 
  rand int retardo; // tiempo de retardo en ciclos de reloj que se debe esperar antes de ejecutar la transacción
  bit[`pckg_sz-1:0] dato ; // este es el dato de la transacción
  rand bit [`pckg_sz-18:0] payload;//informacion  enviada
  rand bit [`pckg_sz-17:`pckg_sz-17] mode;
  //rand bit [31 : 24] target;
  rand bit [`pckg_sz-9: `pckg_sz-12] row;
  rand bit [`pckg_sz-13: `pckg_sz-16] colum;
  bit [`pckg_sz-8 : `pckg_sz-1] nxt_jump=0;
  constraint const_retardo {retardo < 15; retardo>0;};
  constraint const_payload {payload>0;};
  constraint const_mode {mode==1;};
  constraint const_row { row inside {0,1,2,3,4,5}; };
  constraint const_colum { colum inside {0,1,2,3,4,5}; };
  constraint const_target { if (row==0 | row==`ROWS+1) colum!=0 & colum!=`COLUMS+1 ;};
  constraint const_target2 { if (colum==0 | colum==`COLUMS+1) row!=0 & row!=`ROWS+1 ;};
  constraint const_target3 { if (row!=0 & row!=`ROWS+1) colum==0 | colum==`COLUMS+1 ;};
  constraint const_target4 { if (colum!=0 & colum!=`ROWS+1) row==0 | row==`COLUMS+1 ;};
  
  
  
  
  
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
    randc int numTrans=1; 
  	constraint const_numTrans { numTrans>=0; numTrans<=4 ;};
  	
  
  
  
    function new (string name = "");
      super.new(name);
    endfunction

    task body;
      /*if (starting_phase != null)
        starting_phase.raise_objection(this);
*/
      
        req = transaction::type_id::create("req");
        start_item(req);
        if( !req.randomize() )
          
          `uvm_error("", "Randomize failed")
          req.dato={req.nxt_jump,req.row,req.colum,req.mode,req.payload};
          $display("Prueba num trans %0d",numTrans );
     
        finish_item(req);
    
      
      
  /*    if (starting_phase != null)
        starting_phase.drop_objection(this);*/
    endtask: body
   
  endclass: my_sequence


