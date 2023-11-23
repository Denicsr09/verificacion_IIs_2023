`include "macros2.sv"

/////////////////////////////////////////////////////////////////////////
// Definición de estructura para las pruebas a realizar                //
/////////////////////////////////////////////////////////////////////////

typedef enum {llenado_aleatorio,trans_filas,trans_colum,intersec_data_espec,intersec_data,envio_especfico} pruebas;


//////////////////////////////////////////////////////////////
// Definición del tipo de transacciones posibles en la fifo //
//////////////////////////////////////////////////////////////

typedef enum { lectura, escritura, reset} tipo_trans; 

class transaction extends uvm_sequence_item;
  
  `uvm_object_utils(transaction)
  
 
  rand int retardo; // tiempo de retardo en ciclos de reloj que se debe esperar antes de ejecutar la transacción
  bit[`pckg_sz-1:0] dato ; // este es el dato de la transacción
  rand bit [`pckg_sz-18:0] payload;//informacion  enviada
  rand bit [`pckg_sz-17:`pckg_sz-17] mode;
  bit [31 : 24] target;
  rand bit [`pckg_sz-9: `pckg_sz-12] row;
  rand bit [`pckg_sz-13: `pckg_sz-16] colum;
  bit [`pckg_sz-8 : `pckg_sz-1] nxt_jump;
  rand int drvSource;//driver de donde sale el dato enviado
  int tiempo; //Representa el tiempo  de la simulación en el que se ejecutó la transacción 
  tipo_trans tipo; // lectura, escritura, reset;
  int max_retardo; //tiempo de retardo entre transaccion
  int completo;
  
  constraint const_retardo {retardo < max_retardo; retardo>0;};
  constraint const_payload {payload>0;};
  //constraint const_mode {mode==1;};
  constraint const_drvSource { 0 <= drvSource ; drvSource <= 15;};
  constraint const_row { row inside {0,1,2,3,4,5}; };
  constraint const_colum { colum inside {0,1,2,3,4,5}; };
  //los siguientes cuatro constraints no permiten que se de el caso de que haga targets que se salgan de los rangos 
  constraint const_target { if (row==0 | row==`ROWS+1) colum!=0 & colum!=`COLUMS+1 ;};
  constraint const_target2 { if (colum==0 | colum==`COLUMS+1) row!=0 & row!=`ROWS+1 ;};
  constraint const_target3 { if (row!=0 & row!=`ROWS+1) colum==0 | colum==`COLUMS+1 ;};
  constraint const_target4 { if (colum!=0 & colum!=`ROWS+1) row==0 | row==`COLUMS+1 ;};
  
  
  virtual function string convert2str();
    return $sformatf("Nxt Jump: %b, Row: %0d, Colum: %0d, Mode: %0b, Payload: %0d, DrvSource: %0d, dato:%b"
                     ,nxt_jump,row,colum,mode, payload, drvSource, dato);
  endfunction
  
  function new(string name = "transaction", bit [`pckg_sz-8 : `pckg_sz-1] nxt_jump = 0);
    super.new(name);
    this.nxt_jump = nxt_jump;
  endfunction
  

   function void build_phase(uvm_phase phase);
 
   endfunction
  
  function void concatena;
   
    target = row*10+colum; 
    dato= {nxt_jump,row,colum,mode,payload};//se concatena el ID con el payload 
 
  endfunction;
   
   
endclass
//////////////////////////////////////////////////////////////
// Generador de sequence item utilizados para las pruebas   //
//////////////////////////////////////////////////////////////
class my_sequence extends uvm_sequence #(transaction);
  
  `uvm_object_utils(my_sequence)
  
  function new (string name = "my_sequence");
    super.new(name);
  endfunction
  
  randc int numTrans=1; 
  constraint const_numTrans { numTrans>=0; numTrans<=4 ;};
  
  int terminales [] = {01,02,03,04,10,20,30,40,51,52,53,54,15,25,35,45};
  int max_retardo = 10; //Maximo tiempo de espera en 
  int l = 0;
  int i = 0;
  reg [`pckg_sz-18:0] lista_especifica [] = '{{`pckg_sz{4'hF}},{`pckg_sz{4'h0}},{`pckg_sz{4'hA}}, {`pckg_sz{4'h5}}};//Lista de payload especificos
  rand int seqdrvSource; //Para aleatorizar el el driver en el cual se escribe
  pruebas instr_agnt; //Contiene la instruccion de cual prueba se va a realizar
  
  tipo_trans tpo_spec;  
  
  virtual task body();
    case(instr_agnt)
      llenado_aleatorio: begin
        transaction m_trans = transaction :: type_id::create("m_trans");
        start_item(m_trans);
        m_trans.max_retardo = max_retardo;
        m_trans.randomize() with { row != terminales[seqdrvSource]/10; colum != terminales[seqdrvSource]%10;};
        m_trans.drvSource = seqdrvSource;
        m_trans.concatena();
        tpo_spec = escritura;
        m_trans.tipo = tpo_spec;
        `uvm_info("SEQ", $sformatf("Generate new item: %s", m_trans.convert2str()),UVM_LOW)
        `uvm_info("SEQ",$sformatf("Generate new item:Dato: %0h Retardo: %0d Tipo: %s", 
                                  m_trans.dato,m_trans.retardo,m_trans.tipo),UVM_LOW);
        //m_trans.print();
    	finish_item(m_trans);
      end
      trans_filas:begin
        transaction m_trans = transaction :: type_id::create("m_trans");
        start_item(m_trans);
        m_trans.max_retardo = max_retardo;
        m_trans.randomize() with { row != terminales[seqdrvSource]/10; colum != terminales[seqdrvSource]%10;};
        m_trans.mode = 1;
        m_trans.drvSource = seqdrvSource;
        m_trans.concatena();
        tpo_spec = escritura;
        m_trans.tipo = tpo_spec;
        `uvm_info("SEQ", $sformatf("Generate new item: %s", m_trans.convert2str()),UVM_LOW)
        `uvm_info("SEQ",$sformatf("Generate new item:Dato: %0d Retardo: %0d Tipo: %s", 
                                  m_trans.dato,m_trans.retardo,m_trans.tipo),UVM_LOW);
        //m_trans.print();
    	finish_item(m_trans);
      end
      trans_colum: begin
        transaction m_trans = transaction :: type_id::create("m_trans");
        start_item(m_trans);
        m_trans.max_retardo = max_retardo;
        m_trans.randomize() with { row != terminales[seqdrvSource]/10; colum != terminales[seqdrvSource]%10;};
        m_trans.mode = 0;
        m_trans.drvSource = seqdrvSource;
        m_trans.concatena();
        tpo_spec = escritura;
        m_trans.tipo = tpo_spec;
        `uvm_info("SEQ", $sformatf("Generate new item: %s", m_trans.convert2str()),UVM_LOW)
        `uvm_info("SEQ",$sformatf("Generate new item:Dato: %0d Retardo: %0d Tipo: %s", 
                                  m_trans.dato,m_trans.retardo,m_trans.tipo),UVM_LOW);
        //m_trans.print();
    	finish_item(m_trans);
      end
      intersec_data_espec: begin
        transaction m_trans = transaction :: type_id::create("m_trans");
        start_item(m_trans);
        m_trans.max_retardo = max_retardo;
        m_trans.randomize();
        m_trans.retardo = 1;
        if (seqdrvSource  == 0) begin
          m_trans.row = 5;
          m_trans.colum = 1;
          m_trans.drvSource = seqdrvSource;
        end
        else begin
          m_trans.row = 2;
          m_trans.colum = 5;
          m_trans.drvSource = seqdrvSource;
        end
        m_trans.concatena();
        tpo_spec = escritura;
        m_trans.tipo = tpo_spec;
        `uvm_info("SEQ", $sformatf("Generate new item: %s", m_trans.convert2str()),UVM_LOW)
        `uvm_info("SEQ",$sformatf("Generate new item:Dato: %0d Retardo: %0d Tipo: %s", 
                                  m_trans.dato,m_trans.retardo,m_trans.tipo),UVM_LOW);
        //m_trans.print();
    	finish_item(m_trans);
      end
      intersec_data: begin
        transaction m_trans = transaction :: type_id::create("m_trans");
        if(l == 4) begin
          l=0;
        end
        start_item(m_trans);
        m_trans.max_retardo = max_retardo;
        m_trans.randomize();
        m_trans.retardo = 1;
        if(seqdrvSource >= 8)begin
          m_trans.drvSource = seqdrvSource;
          m_trans.row = terminales[seqdrvSource-8]/10;
          m_trans.colum = terminales[seqdrvSource-8]%10;
          m_trans.payload = lista_especifica[l];
        end
        else begin
          m_trans.drvSource = seqdrvSource;
          m_trans.row = terminales[seqdrvSource+8]/10;
          m_trans.colum = terminales[seqdrvSource+8]%10;
          m_trans.payload = lista_especifica[l];
        end
        m_trans.concatena();
        tpo_spec = escritura;
        m_trans.tipo = tpo_spec;
        `uvm_info("SEQ", $sformatf("Generate new item: %s", m_trans.convert2str()),UVM_LOW)
        `uvm_info("SEQ",$sformatf("Generate new item:Dato: %0h Retardo: %0d Tipo: %s", 
                                  m_trans.dato,m_trans.retardo,m_trans.tipo),UVM_LOW);
        l = l+1;
        finish_item(m_trans);
      end
      envio_especfico: begin
        transaction m_trans = transaction :: type_id::create("m_trans");
        start_item(m_trans);
        m_trans.max_retardo = max_retardo;
        m_trans.randomize();
        m_trans.drvSource = seqdrvSource;
        m_trans.row = 0;
        m_trans.colum = 1;
        m_trans.concatena();
        tpo_spec = escritura;
        m_trans.tipo = tpo_spec;
        `uvm_info("SEQ", $sformatf("Generate new item: %s", m_trans.convert2str()),UVM_LOW)
        `uvm_info("SEQ",$sformatf("Generate new item:Dato: %0d Retardo: %0d Tipo: %s", 
                                  m_trans.dato,m_trans.retardo,m_trans.tipo),UVM_LOW);
        //m_trans.print();
    	finish_item(m_trans);
      end
    endcase
    
  
    
  endtask
  
    
endclass
