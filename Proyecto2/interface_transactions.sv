
//////////////////////////////////////////////////////////////
// Definición del tipo de transacciones posibles en la fifo //
//////////////////////////////////////////////////////////////

typedef enum { lectura, escritura, reset} tipo_trans; 

/////////////////////////////////////////////////////////////////////////////////////////
//Transacción: este objeto representa las transacciones que entran y salen de la fifo. //
/////////////////////////////////////////////////////////////////////////////////////////
class trans_fifo #(parameter pckg_sz = 40);
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
 
  constraint const_retardo {retardo < max_retardo; retardo>0;};
  constraint const_drvSource { 0 <= drvSource ; drvSource <= 15;};
  constraint const_target { target inside {01,02,03,04,10,15,20,25,30,35,40,45,51,52,53,54}; };


  function new(bit [pckg_sz-8 : pckg_sz-1] nxt_jump = 0,int ret =0,bit[pckg_sz-1:0] dto = 0,int tmp = 0, tipo_trans tpo = lectura, int mx_rtrd = 10);
    this.retardo = ret;
    this.dato = dto;
    this.tiempo = tmp;
    this.tipo = tpo;
    this.max_retardo = mx_rtrd;
    this.nxt_jump = nxt_jump;
  endfunction
  
  function clean;
    this.retardo = 0;
    this.dato = 0;
    this.tiempo = 0;
    this.tipo = lectura;
    
  endfunction
  
  function concatena;
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
  

  
    
  function void print(string tag = "");
    $display("[%g] %s Tiempo=%g Tipo=%s Retardo=%g Nxt_Jump=%h Target=%0d mode=%0b payload=%h Source = %0d",$time,tag,tiempo,this.tipo,this.retardo, this.nxt_jump, this.target, this.mode, this.payload, this.drvSource );
    
  endfunction
endclass


////////////////////////////////////////////////////////////////
// Interface: Esta es la interface que se conecta con la FIFO //
////////////////////////////////////////////////////////////////
/*
interface mesh_gnrtr_vif #(parameter ROWS = 4, parameter COLUMS =4, parameter pckg_sz =40, parameter fifo_depth = 4, parameter bdcst= {8{1'b1}}) (input clk);
  
  logic pndng[ROWS*2+COLUMS*2];
  logic [pckg_sz-1:0] data_out[ROWS*2+COLUMS*2];
  logic popin[ROWS*2+COLUMS*2];
  logic pop[ROWS*2+COLUMS*2];
  logic [pckg_sz-1:0]data_out_i_in[ROWS*2+COLUMS*2];
  logic pndng_i_in[ROWS*2+COLUMS*2];
  logic reset;


endinterface

*/


///////////////////////////////////////////////////////////////////////////////////////
// Definicion de mailboxes de tipo definido trans_fifo para comunicar las interfaces //
///////////////////////////////////////////////////////////////////////////////////////
typedef mailbox #(trans_fifo) trans_fifo_mbx;

/////////////////////////////////////////////////////////////////////////
// Definición de estructura para generar comandos hacia el agente      //
/////////////////////////////////////////////////////////////////////////
typedef enum {llenado_aleatorio,trans_filas,trans_colum,intersec_data_espec,intersec_data,envio_especfico} instrucciones_agente;


///////////////////////////////////////////////////////////////////////////////////////
// Definicion de mailboxes de tipo definido trans_fifo para comunicar las interfaces //
///////////////////////////////////////////////////////////////////////////////////////
typedef mailbox #(instrucciones_agente) comando_test_agent_mbx;
