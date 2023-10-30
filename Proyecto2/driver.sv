class driver  #(parameter ROWS=4, parameter COLUMS=4, parameter pckg_sz = 16, parameter deep_fifo = 4);
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx; 
  
  fifo_in #(.pckg_sz(pckg_sz), .deep_fifo(deep_fifo),.COLUMS(COLUMS),.ROWS(ROWS) ) fifo_in;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  
  bit [pckg_sz - 1: 0] data_in=0;
  int drv_num;
  bit [pckg_sz-1:pckg_sz-8] Nxtjp=0;
  bit [pckg_sz-9:pckg_sz-12] row=0;
  bit [pckg_sz-13:pckg_sz-16] colum=0;
  bit mode=0;
  bit [pckg_sz-18:0] payload=0;
  
  function new(int drv_num);
    
    fifo_in=new();
    this.drv_num=drv_num;
    fifo_in.fifo_num=drv_num;
    
  endfunction
  
   task run();
     
      fork 
        fifo_in.run();
      join_none
      
     forever begin
       
       agnt_drv_mbx.peek(transaccion);
       if (transaccion.drvSource==drv_num)begin
         assert(transaccion.drvSource==drv_num)
           else $fatal("El dato se escribio en el driver incorrecto");
         agnt_drv_mbx.get(transaccion);
         $display("Transaccion RECIBIDA Source= %d dato=%d", drv_num,transaccion.dato);
         fifo_in.fifo_push(transaccion.dato);
       end
       
       #1;
     end
   endtask
 
  
endclass
  
  