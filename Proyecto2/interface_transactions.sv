
//////////////////////////////////////////////////////////////
// Definición del tipo de transacciones posibles en la fifo //
//////////////////////////////////////////////////////////////

typedef enum { lectura, escritura, reset} tipo_trans; 

/////////////////////////////////////////////////////////////////////////////////////////
//Transacción: este objeto representa las transacciones que entran y salen de la fifo. //
/////////////////////////////////////////////////////////////////////////////////////////
class trans_fifo #(parameter pckg_sz = 16, parameter drvrs = 4);
  rand int retardo; // tiempo de retardo en ciclos de reloj que se debe esperar antes de ejecutar la transacción
  bit[pckg_sz-1:0] dato ; // este es el dato de la transacción
  rand bit[7:0] ID ; //ID del driver donde se va a enviar
  rand bit[pckg_sz-9:0] payload;//informacion  enviada
  rand bit [drvrs-1:0] drvSource;//driver de donde sale el dato enviado 
  int tiempo; //Representa el tiempo  de la simulación en el que se ejecutó la transacción 
  rand tipo_trans tipo; // lectura, escritura, reset;
  int max_retardo; //tiempo de retardo entre transaccion
 
  constraint const_retardo {retardo < max_retardo; retardo>0;};
  constraint const_ID  { ID < (drvrs);ID >= 0;};//el ID mayor igual que cero y menor que numero de drivers definio 
  constraint const_ID_unique{
    unique{ID};};//otra manera de hacer randc mi dato 
  constraint const_drvSource {drvSource < (drvrs); drvSource >= 0;};//el driver de salida es del numero de drivers a los que está conectado 

  function new(int ret =0,bit[pckg_sz-1:0] dto = 0,int tmp = 0, tipo_trans tpo = lectura, int mx_rtrd = 10);
    this.retardo = ret;
    this.dato = dto;
    this.tiempo = tmp;
    this.tipo = tpo;
    this.max_retardo = mx_rtrd;
  endfunction
  
  function clean;
    this.retardo = 0;
    this.dato = 0;
    this.tiempo = 0;
    this.tipo = lectura;
    
  endfunction
  
  function concatena;
    dato= {ID,payload};//se concatena el ID con el payload 
    $display("fifo_if: ID: %0h payload: %0h Dato concatenado: %0h",ID,payload,dato);

  endfunction;
  

  
    
  function void print(string tag = "");
    $display("[%g] %s Tiempo=%g Tipo=%s Retardo=%g Source= %0d dato=0x%h",$time,tag,tiempo,this.tipo,this.retardo,this.drvSource,this.dato);
  endfunction
endclass


////////////////////////////////////////////////////////////////
// Interface: Esta es la interface que se conecta con la FIFO //
////////////////////////////////////////////////////////////////
interface mesh_gnrtr_vif #(parameter ROWS = 4, parameter COLUMS =4, parameter pckg_sz =40, parameter fifo_depth = 4, parameter bdcst= {8{1'b1}}) (input clk);
  
  logic pndng[ROWS*2+COLUMS*2];
  logic [pckg_sz-1:0] data_out[ROWS*2+COLUMS*2];
  logic popin[ROWS*2+COLUMS*2];
  logic pop[ROWS*2+COLUMS*2];
  logic [pckg_sz-1:0]data_out_i_in[ROWS*2+COLUMS*2];
  logic pndng_i_in[ROWS*2+COLUMS*2];
  logic reset;


endinterface




///////////////////////////////////////////////////////////////////////////////////////
// Definicion de mailboxes de tipo definido trans_fifo para comunicar las interfaces //
///////////////////////////////////////////////////////////////////////////////////////
typedef mailbox #(trans_fifo) trans_fifo_mbx;
