class check #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx; 
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion_ck;
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion_sb;
  
  trans_revision_mbx revision_ckr_mbx; 
  
  trans_revision #(.pckg_sz(pckg_sz)) transaccion;
  
  
  int drvSource;
  int mnrSource;
  int num_transacciones;
  
   
  trans_revision router11 [int];
  trans_revision router12 [int];
  trans_revision router13 [int];
  trans_revision router14 [int];
  trans_revision router21 [int];
  trans_revision router22 [int];
  trans_revision router23 [int];
  trans_revision router24 [int];
  trans_revision router31 [int];
  trans_revision router32 [int];
  trans_revision router33 [int];
  trans_revision router34 [int];
  trans_revision router41 [int];
  trans_revision router42 [int];
  trans_revision router43 [int];
  trans_revision router44 [int];
  
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
 
  
  task recepcion();
    
    forever begin
      revision_ckr_mbx.peek(transaccion);
      $display("row, colum %b",{transaccion.row,transaccion.colum});
      
        if ({transaccion.row,transaccion.colum}== 2'b11)begin
          revision_ckr_mbx.get(transaccion);
          router11[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      
      if ({transaccion.row,transaccion.colum}== 2'h12)begin
          revision_ckr_mbx.get(transaccion);
          router12[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      
      if ({transaccion.row,transaccion.colum}== 2'h13)begin
          revision_ckr_mbx.get(transaccion);
          router13[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      
      if ({transaccion.row,transaccion.colum}== 2'h14)begin
          revision_ckr_mbx.get(transaccion);
          router14[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h21)begin
          revision_ckr_mbx.get(transaccion);
          router21[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h22)begin
          revision_ckr_mbx.get(transaccion);
          router22[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h23)begin
          revision_ckr_mbx.get(transaccion);
          router23[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h24)begin
          revision_ckr_mbx.get(transaccion);
          router24[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h31)begin
          revision_ckr_mbx.get(transaccion);
          router31[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h32)begin
          revision_ckr_mbx.get(transaccion);
          router32[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h33)begin
          revision_ckr_mbx.get(transaccion);
          router33[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h34)begin
          revision_ckr_mbx.get(transaccion);
          router34[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h41)begin
          revision_ckr_mbx.get(transaccion);
          router41[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h42)begin
          revision_ckr_mbx.get(transaccion);
          router42[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h43)begin
          revision_ckr_mbx.get(transaccion);
          router43[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      if ({transaccion.row,transaccion.colum}== 2'h44)begin
          revision_ckr_mbx.get(transaccion);
          router44[transaccion.dato[pckg_sz-9:0]]=transaccion;
        end
      
    end
  endtask
  
  
  task lista();
  	foreach (list_mnr[i])$display("list_mnr %b",list_mnr[i].dato);
    foreach (list_sb[i])$display("list_mnr %b",list_sb[i].dato);
    foreach (list_verificadas[i])$display("list_verificadas %b",list_verificadas[i].dato);
  endtask
  
  
endclass

