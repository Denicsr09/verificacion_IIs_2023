//////////////////////////////////////////////////////////////
// Definición del tipo de transacciones posibles en la fifo //
//////////////////////////////////////////////////////////////

typedef enum { lectura, escritura, reset} tipo_trans; 


/////////////////////////////////////////////////////////////////////////////////////////
//Transacción: este objeto representa las transacciones que entran y salen de la fifo. //
/////////////////////////////////////////////////////////////////////////////////////////

class trans_fifo #(parameter pckg_sz = 40) extends uvm_sequence_item;
  rand int retardo; // tiempo de retardo en ciclos de reloj que se debe esperar antes de ejecutar la transacción
  bit[pckg_sz-1:0] dato ; // este es el dato de la transacción
  rand bit [pckg_sz-18:0] payload;//informacion  enviada
  rand bit [pckg_sz-17:pckg_sz-17] mode;
  rand bit [pckg_sz-9 : pckg_sz-16] target;
  bit [pckg_sz-9: pckg_sz-12] row;
  bit [pckg_sz-13: pckg_sz-16] colum;
  bit [pckg_sz-8 : pckg_sz-1] nxt_jump;
  rand int drvSource;//driver de donde sale el dato enviado 
  int tiempo; //Representa el tiempo  de la simulación en el que se ejecutó la transacción 
  rand tipo_trans tipo; // lectura, escritura, reset;
  int max_retardo; //tiempo de retardo entre transaccion
  int completo;
  
  constraint const_retardo {retardo < max_retardo; retardo>0;};
  constraint const_drvSource { 0 <= drvSource ; drvSource <= 15;};
  constraint const_target { target inside {01,02,03,04,10,15,20,25,30,35,40,45,51,52,53,54}; };
  
  //Utilización de macros para implementar funciones standard
  // Como print, copy, clone, etc
  `uvm_object_utils_begin(trans_fifo)
    `uvm_filed_int(payload,     UVM_default)
    `uvm_filed_int(mode,        UVM_default)
    `uvm_filed_int(target,      UVM_default)
    `uvm_filed_int(row,         UVM_default)
    `uvm_filed_int(colum,       UVM_default)
    `uvm_filed_int(nxt_jump,    UVM_default)
    `uvm_filed_int(dato,        UVM_default)
    `uvm_filed_int(drvSource,   UVM_default)
    `uvm_filed_int(tiempo,      UVM_default)
    `uvm_filed_int(retardo,     UVM_default)
    `uvm_filed_int(max_retardo, UVM_default)
    `uvm_filed_int(completo,    UVM_default)
    `uvm_filed_string(tipo,     UVM_default)
  `uvm_object_utils_end

  function new(string name = "trans_fifo", bit [pckg_sz-8 : pckg_sz-1] nxt_jump = 0)
    super.new(name)
    this.nxt_jump = nxt_jump;
  endfunction

  function void concatena;
    row = target/10;
    colum = target%10;
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