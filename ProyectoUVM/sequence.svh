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
  bit [`pckg_sz-8 : `pckg_sz-1] nxt_jump;
  rand int drvSource;//driver de donde sale el dato enviado
  int tiempo; //Representa el tiempo  de la simulación en el que se ejecutó la transacción 
  //rand tipo_trans tipo; // lectura, escritura, reset;
  int max_retardo; //tiempo de retardo entre transaccion
  int completo;
  
  constraint const_retardo {retardo < 15; retardo>0;};
  constraint const_payload {payload>0;};
  //constraint const_mode {mode==1;};
  constraint const_drvSource { 0 <= drvSource ; drvSource <= 15;};
  constraint const_row { row inside {0,1,2,3,4,5}; };
  constraint const_colum { colum inside {0,1,2,3,4,5}; };
  constraint const_target { if (row==0 | row==`ROWS+1) colum!=0 & colum!=`COLUMS+1 ;};
  constraint const_target2 { if (colum==0 | colum==`COLUMS+1) row!=0 & row!=`ROWS+1 ;};
  constraint const_target3 { if (row!=0 & row!=`ROWS+1) colum==0 | colum==`COLUMS+1 ;};
  constraint const_target4 { if (colum!=0 & colum!=`ROWS+1) row==0 | row==`COLUMS+1 ;};
  
  
  virtual function string convert2str();
    return $sformatf("Nxt Jump: %b, Row: %0d, Colum: %0d, Mode: %0b, Payload: %0d, DrvSource: %0d, dato:%0b"
                     ,nxt_jump,row,colum,mode, payload, drvSource, dato);
  endfunction
  
  function new(string name = "transaction", bit [`pckg_sz-8 : `pckg_sz-1] nxt_jump = 0);
    super.new(name);
    this.nxt_jump = nxt_jump;
  endfunction
  

   function void build_phase(uvm_phase phase);
    /* if(! uvm_config_db #(int)::get (this,"*","pckg_sz",pckg_sz))begin
      `uvm_fatal(get_type_name(),"Didn't get handle to virtual interface dut_if");
      end*/
   endfunction
  
  function void concatena;
    //row = target/10;
    //colum = target%10;
    //$display("row = %0d colum= %0d target = %d", this.row, this.colum, this.target );
    dato= {nxt_jump,row,colum,mode,payload};//se concatena el ID con el payload 
    //$display("Dato concatenado:%b", this.dato);
    $display("dato partes: nxt_jump=%h, row=%d, colum =%d, mode=%b, payload =%b",
            this.nxt_jump,
            this.row,
            this.colum,
            this.mode,
            this.payload);
  endfunction;
   
   
endclass

class my_sequence extends uvm_sequence #(transaction);
  
  `uvm_object_utils(my_sequence)
  
  function new (string name = "my_sequence");
    super.new(name);
  endfunction
  
  randc int numTrans=1; 
  constraint const_numTrans { numTrans>=0; numTrans<=4 ;};
  	
  
  
  virtual task body();
    for (int i = 0; i < numTrans; i ++)begin
      transaction m_trans = transaction :: type_id::create("m_trans");
      start_item(m_trans);
      m_trans.randomize();
      m_trans.concatena();
      `uvm_info("SEQ", $sformatf("Generate new item: %s", m_trans.convert2str()),UVM_LOW)
      finish_item(m_trans);
    end
    `uvm_info("SEQ", $sformatf("Done of generation of %0d items",numTrans), UVM_LOW)
  endtask
  
    
endclass
