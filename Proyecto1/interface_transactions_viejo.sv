//////////////////////////////////////////////////////////////
// Definición del tipo de transacciones posibles en la fifo //
//////////////////////////////////////////////////////////////

typedef enum { lectura, escritura, reset} tipo_trans; 

/////////////////////////////////////////////////////////////////////////////////////////
//Transacción: este objeto representa las transacciones que entran y salen de la fifo. //
/////////////////////////////////////////////////////////////////////////////////////////
class trans_fifo #(parameter pckg_sz = 16, parameter drvrs = 4);
  rand int retardo; // tiempo de retardo en ciclos de reloj que se debe esperar antes de ejecutar la transacción
  bit[pckg_sz-1:0] dato [drvrs-1:0]; // este es el dato de la transacción
  rand bit[7:0] ID [drvrs-1:0]; 
  rand bit[pckg_sz-9:0] payload [drvrs-1:0];
  int tiempo [drvrs -1 : 0]; //Representa el tiempo  de la simulación en el que se ejecutó la transacción 
  rand tipo_trans tipo; // lectura, escritura, reset;
  int max_retardo;
 
  constraint const_retardo {retardo < max_retardo; retardo>0;};
  constraint const_ID  {foreach(ID[i]){ID[i] < (drvrs)};};
  constraint const_ID_unique{
    unique{ID};
  }

  function new(int ret =0,bit[pckg_sz-1:0] dto = 0,int tmp = 0, tipo_trans tpo = lectura, int mx_rtrd = 10);
    this.retardo = ret;
    foreach(this.dato[i]) begin
      this.dato[i] = dto;
      this.tiempo[i] = tmp;
    end
    //this.tiempo= tmp;
    this.tipo = tpo;
    this.max_retardo = mx_rtrd;
  endfunction
  
  function clean;
    this.retardo = 0;
    foreach(this.dato[i]) begin
      this.dato[i] = 0;
      this.tiempo[i] = 0;
    end
    //this.tiempo = 0;
    this.tipo = lectura;
    
  endfunction
  
  function finish_rand;
    for (int i = 0; i < drvrs; i++) begin
      dato[i] = {ID[i],payload[i]};
      $display("fifo_if: ID[%0d]: %0h ",i,ID[i]);
      $display("fifo_if: payload: %0h ",payload[i]);
      $display("fifo_if: Dato concatenado: %0h ",dato[i]);
      
    end
  endfunction;
    
  function void print(string tag = "");
    foreach (this.dato[i]) begin
      $display("[%g] %s Tiempo=%g Tipo=%s Retardo=%g dato=0x%h",$time,tag,tiempo[i],this.tipo,this.retardo,this.dato[i], i);
    end
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

////////////////////////////////////////////////////
// Objeto de transacción usado en el scroreboard  //
////////////////////////////////////////////////////

class trans_sb #(parameter pckg_sz = 16, parameter drvrs = 4);
  bit [pckg_sz-1:0] dato_enviado [drvrs-1 : 0];
  int tiempo_push [drvrs-1 : 0];
  int tiempo_pop  [drvrs-1 : 0];
  bit completado;
  bit overflow;
  bit underflow;
  bit reset;
  int latencia    [drvrs-1 : 0];
  
  function clean();
    foreach(this.dato_enviado[i])begin
      this.dato_enviado[i] = 0;
      this.tiempo_push[i] = 0;
      this.tiempo_pop[i] = 0;
      this.latencia[i] = 0;
    end
    //this.dato_enviado = 0;
    //this.tiempo_push = 0;
    //this.tiempo_pop = 0;
    this.completado = 0;
    this.overflow = 0;
    this.underflow = 0;
    this.reset = 0;
    //this.latencia = 0;
  endfunction

  task calc_latencia;
    foreach(this.dato_enviado[i])begin
      this.latencia[i] = this.tiempo_pop[i] - this.tiempo_push[i];
    end
    
    
  endtask
  
  function print (string tag);
    foreach(dato_enviado[i])begin
      $display("[%g] %s dato=%h,t_push=%g,t_pop=%g,cmplt=%g,ovrflw=%g,undrflw=%g,rst=%g,ltncy=%g", 
               $time,
               tag, 
               this.dato_enviado[i], 
               this.tiempo_push[i],
               this.tiempo_pop[i],
               this.completado,
               this.overflow,
               this.underflow,
               this.reset,
               this.latencia[i],i);
    end
    
  endfunction
endclass
/////////////////////////////////////////////////////////////////////////
// Definición de estructura para generar comandos hacia el agente      //
/////////////////////////////////////////////////////////////////////////
typedef enum {llenado_aleatorio,IDaleatorio,trans_especifica} instrucciones_agente;

///////////////////////////////////////////////////////////////////////////////////////
// Definicion de mailboxes de tipo definido trans_fifo para comunicar las interfaces //
///////////////////////////////////////////////////////////////////////////////////////
typedef mailbox #(trans_fifo) trans_fifo_mbx;

///////////////////////////////////////////////////////////////////////////////////////
// Definicion de mailboxes de tipo definido trans_fifo para comunicar las interfaces //
///////////////////////////////////////////////////////////////////////////////////////
typedef mailbox #(trans_sb) trans_sb_mbx;

///////////////////////////////////////////////////////////////////////////////////////
// Definicion de mailboxes de tipo definido trans_fifo para comunicar las interfaces //
///////////////////////////////////////////////////////////////////////////////////////
typedef mailbox #(instrucciones_agente) comando_test_agent_mbx;