class check #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx; 
  
  trans_lista_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx; 
  
  trans_lista #(.pckg_sz(pckg_sz)) transaccion_sb;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion_ck;
  
  int drvSource;
  int mnrSource;
  
  int num_transacciones;//tengo que buscar como traer el numero de transacciones que se hicieron solo para tener  un número de las que se hicieron bien y ver cuantas se perdieron
  int list_verificadas[];
  
  trans_fifo list_mnr[];
  
  
  task run_mnr();
    
    forever begin   
      
      mnr_ckr_mbx.get(transaccion_ck);
      $display("Dato del mnr al checker %b", transaccion_ck.dato);
      
      list_mnr = new [list_mnr.size() + 1] (list_mnr);
      
      if (list_mnr.size() == 0) list_mnr[0] = transaccion_ck;
      
      else list_mnr[list_mnr.size()-1] = transaccion_ck;
     
    end
     
  endtask
  
  task run_sb();
     
     sb_ckr_mbx.get(transaccion_sb);
     
     foreach (transaccion_sb.list_sb[i]) begin
      
       $display("list_sb %b",transaccion_sb.list_sb[i].dato);
       
     end
  endtask
  
  task comparar();
    
    
    
  endtask
  
  task lista();
  	foreach (list_mnr[i])$display("list_mnr %b",list_mnr[i].dato);
  endtask
  
  
endclass

