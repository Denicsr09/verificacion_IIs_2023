class check #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx; 
  
  //trans_lista_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx; 
  
  //trans_lista #(.pckg_sz(pckg_sz)) transaccion_sb;
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion_ck;
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion_sb;
  
  int drvSource;
  int mnrSource;
  
  int num_transacciones;
  
  trans_fifo list_verificadas[int];
  trans_fifo list_mnr[int];
  trans_fifo list_sb[int];
  
  task run_mnr();
    
    forever begin   
      
      mnr_ckr_mbx.get(transaccion_ck);
      //$display("Dato del mnr al checker %b", transaccion_ck.dato);
      
      list_mnr[transaccion_ck.dato[pckg_sz-9:0]]=transaccion_ck;
      $display("tiempo de transaccion del monitor en checker %d",transaccion_ck.tiempo);
      
    end
     
  endtask
  
  task run_sb();
    
     forever begin   
      
      sb_ckr_mbx.get(transaccion_sb);
      //$display("Dato del mnr al checker %b", transaccion_ck.dato);
      
      list_sb[transaccion_sb.dato[pckg_sz-9:0]]=transaccion_sb;
       $display("tiempo de transaccion del scoreboard en checker %d",transaccion_sb.tiempo);
      
    end
  endtask
    task comparar();
      
      $display("list_sb %d",list_sb.size());
      $display("list_mnr %d",list_mnr.size());
      
      
      foreach (list_sb[i]) begin
      
       $display("list_sb %b",list_sb[i].dato);
       $display("list_mnr %b",list_mnr[i].dato);
        
        
       if(list_sb[i].dato[pckg_sz-9:0]==this.list_mnr[i].dato[pckg_sz-9:0]) begin
         $display("si hay un dato igual");
         list_verificadas[list_sb[i].dato[pckg_sz-9:0]]=list_sb[i];
       
         
       end

     end
      
      
    endtask
 
  
  task lista();
  	foreach (list_mnr[i])$display("list_mnr %b",list_mnr[i].dato);
    foreach (list_sb[i])$display("list_mnr %b",list_sb[i].dato);
    foreach (list_verificadas[i])$display("list_verificadas %b",list_verificadas[i].dato);
  endtask
  
  
endclass

