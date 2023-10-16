class driver  #(parameter ROWS=4, parameter COLUMS=4, parameter pckg_sz = 16, parameter deep_fifo = 4);
  
  fifo_in #(.pckg_sz(pckg_sz), .deep_fifo(deep_fifo),.COLUMS(COLUMS),.ROWS(ROWS) ) fifo_in;
  
  bit [pckg_sz - 1: 0] data_in=0;
  int drv_num;
  bit [pckg_sz-1:pckg_sz-8] Nxtjp=0;
  bit [pckg_sz-9:pckg_sz-12] row=0;
  bit [pckg_sz-13:pckg_sz-16] colum=0;
  bit mode=0;
  bit [pckg_sz-18:0] payload=0;
  bit cor=0;
  
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
      
       //this.data_in=({Nxtjp,row,colum,mode,payload});
       if (cor) fifo_in.fifo_push(this.data_in);
       
       #3;
     end
   endtask
 
  
  
  
endclass
  
  
