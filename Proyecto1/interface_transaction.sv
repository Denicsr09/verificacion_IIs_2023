
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
  rand bit[7:0] ID ; 
  rand bit[pckg_sz-9:0] payload;
  rand bit [drvs-1:0] drvSource;
  int tiempo; //Representa el tiempo  de la simulación en el que se ejecutó la transacción 
  rand tipo_trans tipo; // lectura, escritura, reset;
  int max_retardo;
 
  constraint const_retardo {retardo < max_retardo; retardo>0;};
  constraint const_ID  { ID < (drvrs)};
  constraint const_ID_unique{
    unique{ID};
    }
  constraint const_drvSource {drvSource < (drvrs)};

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
  
  function finish_rand;
    dato= {ID,payload};
    $display("fifo_if: ID[%0d]: %0h ",ID);
    $display("fifo_if: payload: %0h ",payload);
    $display("fifo_if: Dato concatenado: %0h ",dato);

  endfunction;
    
  function void print(string tag = "");
    $display("[%g] %s Tiempo=%g Tipo=%s Retardo=%g Source= %0d dato=0x%h",$time,tag,tiempo,this.tipo,this.retardo,this.drvSource,this.dato);
  endfunction
endclass

////////////////////////////////////////////////////////////////
// Interface: Esta es la interface que se conecta con la FIFO //
////////////////////////////////////////////////////////////////
interface bus_if #(parameter bits = 1, parameter drvrs = 4, parameter pckg_sz =16, parameter broadcast = {8{1'b1}}) (
  input clk
);
  logic reset;
  logic pndng [bits-1:0][drvrs-1:0];
  logic push[bits-1:0][drvrs-1:0];
  logic pop[bits-1:0][drvrs-1:0];
  logic [pckg_sz-1:0] D_pop[bits-1:0][drvrs-1:0];
  logic [pckg_sz-1:0] D_push[bits-1:0][drvrs-1:0];
endinterface


///////////////////////////////////////////////////////////////////////////////////////
// Definicion de mailboxes de tipo definido trans_fifo para comunicar las interfaces //
///////////////////////////////////////////////////////////////////////////////////////
typedef mailbox #(trans_fifo) trans_fifo_mbx;