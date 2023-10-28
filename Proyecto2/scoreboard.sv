class scoreboard #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx;
  
  //trans_lista_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  
  //trans_lista #(.pckg_sz(pckg_sz)) transaccion_sb_ckr;
  //trans_fifo #(.pckg_sz(pckg_sz)) transaccion_sb_ckr;
  
  trans_fifo list_sb[int];//arreglo asoc con indice de tipo int 
  
  task run();
    
    forever begin 
      
      agnt_sb_mbx.get(transaccion);
      
      $display("Dato del agente al sb %0b", transaccion.dato);

      /*list_sb = new [list_sb.size() + 1] (list_sb);  
      if (list_sb.size() == 0) list_sb[0] = transaccion;
      else list_sb[list_sb.size()-1] = transaccion;
      */
      
      //voy a crearla  aqui solo para tenerla pero lo que paso aal checker es dato por dato 
      list_sb[transaccion.dato]=transaccion;
     
      
      sb_ckr_mbx.put(transaccion); 
       
    end
    
    
  endtask 
  
  task lista ();
    
    
    foreach (list_sb[i]) begin
        
        $display("lista en scoreboard creada, key: %0d, dato: %b",i,list_sb[i].dato);
      end
      
  endtask
  

  
  
endclass

