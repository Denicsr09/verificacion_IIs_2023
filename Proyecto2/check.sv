class check #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) mnr_ckr_mbx; 
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;
  trans_sb_mbx  #(.pckg_sz(pckg_sz))  ckr_sb_mbx;
  
  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion_ck;
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion_sb;
  trans_sb  #(.pckg_sz(pckg_sz))  transaccion_sb_ckr;
  
  trans_revision_mbx revision_ckr_mbx; 
  
  trans_revision #(.pckg_sz(pckg_sz)) transaccion;
  
  
  int drvSource;
  int mnrSource;
  int num_transacciones;
  int router_num;
  int row_source;
  int colum_source;
  int terminales [] = {01,02,03,04,10,20,30,40,51,52,53,54,15,25,35,45};
  int contador;
  int caminador;
  int destino;
  int source;
  int posicion;
  int router;
  
  string dato_string; 
  string dato_revision;
  int gold_path[string][int]; 
  int revision_path[string][int];
  
 
  trans_fifo list_verificadas[int];
  trans_fifo list_mnr[int];
  trans_fifo list_sb[int];
  
  int list_transaccion_path[int];
  
  task run_mnr();
    
    forever begin   
      transaccion_sb_ckr = new();
      mnr_ckr_mbx.get(transaccion_ck);
      //$display("Dato del mnr al checker %b", transaccion_ck.dato);
      
      list_mnr[transaccion_ck.dato[pckg_sz-9:0]]=transaccion_ck;
      $display("tiempo de transaccion del monitor en checker %d",transaccion_ck.tiempo);
      foreach (list_sb[i]) begin
        if(list_sb[i].dato[pckg_sz-9:0]==transaccion_ck.dato[pckg_sz-9:0]) begin
          $display("si hay un dato igual");
          $display("list_sb %b",list_sb[i].dato);
          $display("list_mnr %b",transaccion_ck.dato);
          list_verificadas[list_sb[i].dato[pckg_sz-9:0]]=list_sb[i];
          transaccion_sb_ckr.clean();
          transaccion_sb_ckr.dato_enviado = list_sb[i].dato;
          transaccion_sb_ckr.tiempo_push =  list_sb[i].tiempo;
          transaccion_sb_ckr.tiempo_pop  = transaccion_ck.tiempo;
          transaccion_sb_ckr.drvSource_push = terminales[list_sb[i].drvSource];
          transaccion_sb_ckr.ID_pop = list_sb[i].target;
          transaccion_sb_ckr.mode = list_sb[i].mode;
          transaccion_sb_ckr.calc_latencia();
          transaccion_sb_ckr.completado = 1;
          transaccion_sb_ckr.print("Checker:Transaccion Completada");
          ckr_sb_mbx.put(transaccion_sb_ckr);
          //Agregar clase de interface_transactions
        end
      end
    end
     
  endtask
  
  
  //Aqui se recibe el dato del scoreboard y se inicia la creacion del camino que debe de realizar cada uno de los datos, primeramente se limitan las sumas y restas a los limites de la cantidad de filas y columnas (numeros  de routers), luego se realizan los movimientos para llegar al destino y se van guardando en orden en el gold_path[string][int].  
  task run_sb();
     forever begin   
       sb_ckr_mbx.get(transaccion_sb);
       contador = 1;
       posicion = 0;
       dato_string = $sformatf("%0h", transaccion_sb.dato[pckg_sz-9:0]);
       //$display("Dato del mnr al checker %b", transaccion_ck.dato);
       list_sb[transaccion_sb.dato[pckg_sz-9:0]]=transaccion_sb;
       $display("tiempo de transaccion del scoreboard en checker %d",transaccion_sb.tiempo);
       source = terminales[transaccion_sb.drvSource];
       row_source = terminales[transaccion_sb.drvSource]/10;
       colum_source = terminales[transaccion_sb.drvSource]%10;
       $display(" En DrvSource = %d, row = %d, colum = %d", transaccion_sb.drvSource, row_source, colum_source);
       $display("En el target = %d, row = %d, colum = %d",transaccion_sb.target, transaccion_sb.row,transaccion_sb.colum );
       $display("Checker creando golden path");
       transaccion_sb.print();
       if(transaccion_sb.row == 5) begin
         destino = transaccion_sb.target -10;
         $display("Destino = %d", destino);
       end
       else if (transaccion_sb.colum == 5) begin
         destino = transaccion_sb.target - 1;
         $display("Destino = %d", destino);
       end
       else if (transaccion_sb.row == 0) begin
         destino = transaccion_sb.target + 10;
         $display("Destino = %d", destino);
       end
       else if (transaccion_sb.colum == 0) begin
         destino = transaccion_sb.target + 1;
         $display("Destino = %d", destino);
       end
       else begin
         destino = transaccion_sb.target;
         $display("Destino = %d", destino);
       end
       
       
       if(row_source == 5) begin
         source = terminales[transaccion_sb.drvSource] -10;
         $display("Source = %d", source);
       end
       else if(colum_source == 5)begin
         source = terminales[transaccion_sb.drvSource] - 1;
         $display("Source = %d", source);
       end
       else if(row_source == 0) begin
         source = terminales[transaccion_sb.drvSource] + 10;
         $display("Source = %d", source);
       end
       else if(colum_source == 0) begin
         source = terminales[transaccion_sb.drvSource] + 1;
         $display("Source = %d", source);
       end
       else begin
         source = terminales[transaccion_sb.drvSource];
         $display("Source = %d", source);
       end
       row_source = source/10;
       colum_source = source%10;
       $display(" row = %d, colum = %d", row_source, colum_source);
       
       
       if(transaccion_sb.mode == 0) begin
         $display("Entramos modo 0");
         contador = 1;
         contador = source%10;
         $display("Contador=%d,Caminador =%d , destino colum =%d",contador,caminador,destino%10);
         if(colum_source < destino%10) begin
           caminador = source - 1;
           while(contador <= destino%10) begin
             caminador = caminador + 1;
             gold_path[dato_string][posicion]=caminador;
          
             posicion = posicion +1;
             $display("columnas movidas = %d", caminador );
             contador = contador + 1;
           end
         end
         else if (colum_source > destino%10)begin
           $display("Entro al otro");
           caminador = source +1;
           contador = destino%10;
           while(contador <= source%10) begin  
             caminador = caminador - 1;
             gold_path[dato_string][posicion]=caminador;
           
             posicion = posicion +1;
             $display("columnas movidas = %d", caminador );
             contador = contador +1 ;
           end
         end
         else begin
           caminador = source;
           gold_path[dato_string][posicion]=caminador;
          
           posicion = posicion +1;
           $display("filas movidas = %d",caminador);
         end
         if(caminador < transaccion_sb.target)begin
           while(caminador < destino) begin
             caminador = caminador + 10;
             gold_path[dato_string][posicion]=caminador;
             
             posicion = posicion +1;
             $display("filas movidas = %d", caminador);
           end
         end
         else if((caminador > transaccion_sb.target)) begin
           while(caminador > destino) begin
             caminador = caminador - 10;
             gold_path[dato_string][posicion]=caminador;
             posicion = posicion +1;
             $display("filas movidas = %d", caminador);
           end
         end
         $display("El golden path para este dato llega hasta: %d",caminador);
       end
       else begin
         $display("Modo 1");
         //contador = 1;
         $display("Contador=%d,Caminador =%d , destino row =%d",contador,caminador,destino%10);
         if(row_source < destino/10) begin
           caminador = source-10;
           contador = source/10;
           while(contador <= destino/10) begin
             caminador = caminador + 10;
             gold_path[dato_string][posicion]=caminador;
             posicion = posicion +1;
             $display("filas movidas = %d", caminador );
             contador = contador + 1;
           end
         end
         else if (row_source > destino/10) begin
           $display("Entro al otro");
           caminador = source +10;
           contador = destino/10;
           while(contador <= source/10) begin  
             caminador = caminador - 10;
             gold_path[dato_string][posicion]=caminador;
             posicion = posicion +1;
             $display("filas movidas = %d", caminador );
             contador = contador +1 ;
           end
         end
         else begin
           caminador = source;
           gold_path[dato_string][posicion]=caminador;
           posicion = posicion +1;
           $display("filas movidas = %d",caminador);
         end
         if(caminador < destino)begin
           while(caminador < destino) begin
             caminador = caminador + 1;
             gold_path[dato_string][posicion]=caminador;
             posicion = posicion +1;
             $display("columnas movidas = %d", caminador);
           end
         end
         else if((caminador > destino)) begin
           while(caminador > destino) begin
             caminador = caminador - 1;
             gold_path[dato_string][posicion]=caminador;
             posicion = posicion +1;
             $display("columnas movidas = %d", caminador);
           end
         end
         $display("El golden path para este dato llega hasta: %d",caminador); 
       end
       
       $display("El camino de este dato=%s:", dato_string);
       foreach (gold_path[dato_string][i]) begin
         
          $display("  Valor: %0d", gold_path[dato_string][i]);
        
    	end
       
    end
    
  endtask
  
  //inicio de revision si el dato cumplio el camino correcto, la idea es la creación de otra lista con los datos que provienen de "revision.sv", esos datos son por cada pop que venga de los routers y de esa manera  se  revisa si el arreglo creado es igual al arreglo del gold reference. 
  
  task recepcion();
      
      
      forever begin 
        #1;
        revision_ckr_mbx.get(transaccion);
        dato_revision = $sformatf("%0h", transaccion.dato[pckg_sz-9:0]);
        foreach (gold_path[dato_revision][i]) begin
        router={transaccion.row,transaccion.colum};
          if (router==gold_path[dato_revision][i])begin
            $display("  if de recepcion");
            revision_path[dato_revision][i]=router;
            
            
          end
    	end
         foreach (revision_path[dato_revision][i]) begin
         
        $display("  revision path: %0d", revision_path[dato_revision][i]);
        
      end
      
      end
       
     
    endtask
 
  
  
  //EN esta funcion solo se se realizan  displays de arreglos. 
  
  task lista();
  	foreach (list_mnr[i])$display("list_mnr %b",list_mnr[i].dato);
    foreach (list_sb[i])$display("list_mnr %b",list_sb[i].dato);
    foreach (list_verificadas[i])$display("list_verificadas %b",list_verificadas[i].dato);
    //foreach (list_transaccion_path[i])$display("list_transaccion_path %b",list_transaccion_path[i].router_num);
    $display("list_transaccion_path %b",list_transaccion_path.size());
     
  endtask
  
  
endclass

