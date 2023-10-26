class scoreboard #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx;
  
  trans_lista_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  
  trans_lista #(.pckg_sz(pckg_sz)) transaccion_sb_ckr;
  
  int list_sb[bit];//arreglo asoc con indice de tipo bit 
  
  task run();
    
    forever begin 
      
      agnt_sb_mbx.get(transaccion);
      
      $display("Dato del agente al sb %b", transaccion.dato);

      /*list_sb = new [list_sb.size() + 1] (list_sb);  
      if (list_sb.size() == 0) list_sb[0] = transaccion;
      else list_sb[list_sb.size()-1] = transaccion;
      */
      
     /* mbx.get(t)
    array[t.tiempo] = t.dato;


    foreach(array[i]) begin
      $display("Arreglo de HASH [%0d] [%0d]",i, array[i]);
    end*/
      
      list_sb[transaccion.tiempo]=transaccion.dato;
      $display("tiempo de transaccion %d",transaccion.tiempo);
      
      foreach (list_sb[i]) begin
        
        $display("lista en scoreboard creada, key: %b, dato: %b",i,list_sb[i]);
      end
      
      
       
    end
    
    
  endtask 
    
 
 /* task lista();
    
    transaccion_sb_ckr= new;
    
    
     foreach (list_sb[i]) begin
      
      $display("lista en scoreboard %b",list_sb[i].dato);
      
      
       transaccion_sb_ckr.list_sb = new [transaccion_sb_ckr.list_sb.size() + 1] (transaccion_sb_ckr.list_sb);  
      if (transaccion_sb_ckr.list_sb.size() == 0) transaccion_sb_ckr.list_sb[0] = list_sb[i];
      else transaccion_sb_ckr.list_sb[transaccion_sb_ckr.list_sb.size()-1] = list_sb[i];
      
     
    
    
    end
    //sb_ckr_mbx.put(list_sb[list_sb.size()]);//funciona?
    //sb_ckr_mbx.put(list_sb[i]);//esta linea tendría que ir dentro del foreach
    sb_ckr_mbx.put(transaccion_sb_ckr); 
    
  endtask 
  */
  
endclass
