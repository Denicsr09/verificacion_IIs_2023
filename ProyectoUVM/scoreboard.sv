`include "objects.sv"
`include "my_cov.sv"
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
  uvm_analysis_imp #(transaction,scoreboard) m_analysis_imp;
  uvm_analysis_imp #(transaction,scoreboard) drv_analysis_imp;
  
  my_cov coverage_sb;
  transaction list_sb[int];//arreglo asoc con indice de tipo int 
  transaction list_mnr[int]; //Lista para guardar los datos del monitor
  trans_sb    list_verif[int];
  
  //Variables utilizadas para generar el gold reference
  int contador;//utilizado para recorrer las fifo 
  int posicion;//Utilizado para en el golden reference guardar las fifo por las cuales paso 
  int terminales [] = {01,02,03,04,10,20,30,40,51,52,53,54,15,25,35,45};
  int source;
  int row_source;
  int colum_source;
  int destino; //El destino al que se piensa llegar
  int caminador; //numero de fifo que se guarda enel golden reference
  int gold_path[int][int]; //donde se guardan las numeros del golden reference
  
  int transacciones_totales = 0;
  int transacciones_completadas = 0;
  int transacciones_perdidas = 0;
  int retardo_total = 0; 
  //Variables utilizadas para el reporte
  int fa;
  shortreal  retardo_promedio;
  shortreal ancho_banda_min;
  shortreal ancho_banda_max;
  
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
     
      m_analysis_imp=new("m_analysis_imp",this);
      drv_analysis_imp=new("drv_analysis_imp",this);
      coverage_sb = my_cov::type_id::create("coverage_sb ", this);
    endfunction
    
  
  function void write(transaction transaction_sb);
    
    
    if (transaction_sb.tipo ==  escritura)begin
      `uvm_info("SB", $sformatf("En el tiempo: %0h se recibe desde el driver el dato %h",
                                transaction_sb.tiempo,transaction_sb.dato[`pckg_sz-9:0] ), UVM_LOW)
      transaction_sb.completo = 0;
      list_sb[transaction_sb.dato[`pckg_sz-9:0]] = transaction_sb;
      source = terminales[transaction_sb.drvSource];
      row_source = terminales[transaction_sb.drvSource]/10;
      colum_source = terminales[transaction_sb.drvSource]%10;
      //$display(" En DrvSource = %d, row = %d, colum = %d", transaction_sb.drvSource, row_source, colum_source);
      //$display("En el target = %d, row = %d, colum = %d",transaction_sb.target, transaction_sb.row,transaction_sb.colum );
      `uvm_info("SB",$sformatf("Creando golden path Para el Dato: %0h DRV_SOURCE: %0d%0d MNR_SOURCE: %0d en modo: %0d",
                              transaction_sb.dato,row_source,colum_source, transaction_sb.target,transaction_sb.mode),UVM_LOW)
      
      if(transaction_sb.row == 5) begin
         destino = transaction_sb.target -10;
         //$display("Destino = %d", destino);
       end
      else if (transaction_sb.colum == 5) begin
         destino = transaction_sb.target - 1;
         //$display("Destino = %d", destino);
      end
      else if (transaction_sb.row == 0) begin
         destino = transaction_sb.target + 10;
         //$display("Destino = %d", destino);
      end
      else if (transaction_sb.colum == 0) begin
         destino = transaction_sb.target + 1;
         //$display("Destino = %d", destino);
      end
      else begin
         destino = transaction_sb.target;
         //$display("Destino = %d", destino);
      end
      
      
      if(row_source == 5) begin
         source = terminales[transaction_sb.drvSource] -10;
         //$display("Source = %d", source);
      end
      else if(colum_source == 5)begin
         source = terminales[transaction_sb.drvSource] - 1;
         //$display("Source = %d", source);
      end
      else if(row_source == 0) begin
         source = terminales[transaction_sb.drvSource] + 10;
         //$display("Source = %d", source);
      end
      else if(colum_source == 0) begin
         source = terminales[transaction_sb.drvSource] + 1;
         //$display("Source = %d", source);
      end
      else begin
         source = terminales[transaction_sb.drvSource];
         //$display("Source = %d", source);
      end
      
      row_source = source/10;
      colum_source = source%10;
      //$display(" row = %d, colum = %d", row_source, colum_source);
      
      if(transaction_sb.mode == 0) begin
        //$display("Entramos modo 0");
        contador = 1;
        contador = source%10;
        //$display("Contador=%d,Caminador =%d , destino colum =%d",contador,caminador,destino%10);
        if(colum_source < destino%10) begin
          caminador = source - 1;
          while(contador <= destino%10) begin
            caminador = caminador + 1;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
            
            posicion = posicion +1;
            //$display("columnas movidas = %d", caminador );
            contador = contador + 1;
          end
        end
        else if (colum_source > destino%10)begin 
          //$display("Entro al otro");
          caminador = source +1;
          contador = destino%10;
          while(contador <= source%10) begin  
            caminador = caminador - 1;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
           
            posicion = posicion +1;
            //$display("columnas movidas = %d", caminador );
            contador = contador +1 ;
          end
        end
        else begin
          caminador = source;
          gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
          
          posicion = posicion +1;
          //$display("filas movidas = %d",caminador);
        end
        if(caminador < transaction_sb.target)begin
          while(caminador < destino) begin
            caminador = caminador + 10;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
             
            posicion = posicion +1;
            //$display("filas movidas = %d", caminador);
          end
        end
        else if((caminador > transaction_sb.target)) begin
          while(caminador > destino) begin
            caminador = caminador - 10;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
            posicion = posicion +1;
            //$display("filas movidas = %d", caminador);
          end
        end
        //$display("El golden path para este dato llega hasta: %d",caminador);
      end
      else begin
        //$display("Modo 1");
        //contador = 1;
        //$display("Contador=%d,Caminador =%d , destino row =%d",contador,caminador,destino%10);
        if(row_source < destino/10) begin
          caminador = source-10;
          contador = source/10;
          while(contador <= destino/10) begin 
            caminador = caminador + 10;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
            posicion = posicion +1;
            //$display("filas movidas = %d", caminador );
            contador = contador + 1;
          end
        end
        else if (row_source > destino/10) begin
          //$display("Entro al otro");
          caminador = source +10;
          contador = destino/10;
          while(contador <= source/10) begin  
            caminador = caminador - 10;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
            posicion = posicion +1;
            //$display("filas movidas = %d", caminador );
            contador = contador +1 ;
          end
        end
        else begin
           caminador = source;
           gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
           posicion = posicion +1;
           //$display("filas movidas = %d",caminador);
        end
        if(caminador < destino)begin
          while(caminador < destino) begin
            caminador = caminador + 1;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
            posicion = posicion +1;
            //$display("columnas movidas = %d", caminador);
          end
        end
        else if((caminador > destino)) begin
          while(caminador > destino) begin
            caminador = caminador - 1;
            gold_path[transaction_sb.dato[`pckg_sz-9:0]][posicion]=caminador;
            posicion = posicion +1;
            //$display("columnas movidas = %d", caminador);
          end
        end
        //$display("El golden path para este dato llega hasta: %d",caminador);  
      end
      `uvm_info("SB", $sformatf("El camino del dato %h es el siguiente ", transaction_sb.dato[`pckg_sz-9:0]), UVM_LOW)
      foreach (gold_path[transaction_sb.dato[`pckg_sz-9:0]][i]) begin
         //$display("  Valor: %0d", gold_path[transaction_sb.dato[`pckg_sz-9:0]][i]);
      end
    end
    else if (transaction_sb.tipo ==  lectura) begin
      //$display("Dato recibido desde el monitor %b", transaction_sb.dato);
      `uvm_info("SB", $sformatf("En el tiempo: %0d se recibe desde el monitor el dato: %h",
                                transaction_sb.tiempo,transaction_sb.dato ), UVM_LOW)
      list_mnr[transaction_sb.dato[`pckg_sz-9:0]] = transaction_sb;	
      
    end
    else begin
      `uvm_warning("SB", $sformatf("El Dato: %0h no presenta tipo definido",transaction_sb.dato ))
    end
      
  endfunction
  
   virtual task run_phase(uvm_phase phase);
       phase.raise_objection(this);
     
     `revision
     
       phase.drop_objection(this);
   endtask 
  

  
    virtual function void check_phase (uvm_phase phase);
      `uvm_info("SB",$sformatf("INICIANDO LA FASE DE CHEQUEO"),UVM_LOW)
      foreach(list_sb[i])begin
        foreach(list_mnr[j])begin 
          
          //$display("Dato list_sb %b",list_sb[i].dato);
          //$display("Dato list_sb %h",list_sb[i].dato);
          //$display("Dato list_mnr %b",list_mnr[j].dato);
          //$display("Dato list_mnr %h",list_mnr[j].dato);
          
          //$display("Dato list_sb cortado %b",list_sb[i].dato[`pckg_sz-9:0]);
          //$display("Dato list_mnr cortado %b",list_mnr[j].dato[`pckg_sz-9:0]);
          
          if(list_sb[i].dato[`pckg_sz-9:0]==list_mnr[j].dato[`pckg_sz-9:0]) begin
            list_verif[transacciones_completadas] = trans_sb::type_id::create($sformatf("list_verif[%0d]", transacciones_completadas));
          	list_verif[transacciones_completadas].dato_enviado = list_sb[i].dato;
          	list_verif[transacciones_completadas].dato_enviado = list_sb[i].dato;
          	list_verif[transacciones_completadas].tiempo_push  = list_sb[i].tiempo;
          	list_verif[transacciones_completadas].tiempo_pop   = list_mnr[j].tiempo;
          	list_verif[transacciones_completadas].drvSource_push = terminales[list_sb[i].drvSource];
          	list_verif[transacciones_completadas].ID_pop = list_sb[i].target;
          	list_verif[transacciones_completadas].mode = list_sb[i].mode;
          	list_verif[transacciones_completadas].calc_latencia();
          	list_verif[transacciones_completadas].completado = 1;
          	list_verif[transacciones_completadas].print();
          	list_sb[i].completo = 1;
          	retardo_total = retardo_total + list_verif[transacciones_completadas].latencia;
          	transacciones_completadas =transacciones_completadas +1;
          end
          
          
        end
       
      end
       foreach (gold_path[i])begin
          //$display("  Tamaño del goldpath: %0d", gold_path[i].size());
          if (gold_path[i].size()!=0)begin  
           `uvm_info("SB",$sformatf("Dato perdido %0b ,tamaño del goldpath %0d", i ,gold_path[i].size()),UVM_LOW)
           end 
        end
        
    endfunction
  virtual function void report_phase (uvm_phase phase);
    `uvm_info("SB",$sformatf("INICIANDO LA FASE DE REPORTE"),UVM_LOW)
    `uvm_info("SB",$sformatf("El retardo total es de %0d", retardo_total),UVM_LOW)
    foreach(list_sb[i]) begin
      if(list_sb[i].completo != 1) begin
        transacciones_perdidas = transacciones_perdidas +1;
      end
      transacciones_totales =transacciones_totales +1;
    end
    retardo_promedio = retardo_total/transacciones_completadas;
    `uvm_info("SB",$sformatf("El retardo promedio es de %0.3f", retardo_promedio),UVM_LOW)
    
    ancho_banda_min = (1*`pckg_sz)/retardo_promedio;
    `uvm_info("SB",$sformatf("El ancho de manda minimo es de %0.3f", ancho_banda_min),UVM_LOW)
    
    ancho_banda_max = (transacciones_completadas*`pckg_sz*16)/retardo_promedio;
    `uvm_info("SB",$sformatf("El ancho de manda minimo es de %0.3f", ancho_banda_max),UVM_LOW)
    
    
    //Creacion del REPORTE CSV
    fa = $fopen("INFORME.csv","a");
    //$fdisplay(fa,"Reporte Scoreboard");
    //$fdisplay(fa,"pckg_size= %d, depth_fifo= %d, retardo promedio= %0.3f, ancho de banda minima= %0.3f, ancho de banda maximo= %0.3f",
              //`pckg_sz,`deep_fifo, retardo_promedio,ancho_banda_min,ancho_banda_max );
    $fclose(fa);
    
    fa = $fopen("Reporte.csv","a");
    //$fdisplay(fa,"Reporte Scoreboard");
    //$fdisplay(fa,"REPORTE DE TRANSACCIONES REALIZADAS");
    foreach(list_verif[i]) begin
      //$fdisplay(fa,"dato=  %0h , Tiempo de escritura= %d, Driver de salida= %d, Tiempo de lectura= %d, Driver de llegada= %d , Latencia=%d "
                //, list_verif[i].dato_enviado , list_verif[i].tiempo_push, list_verif[i].drvSource_push , list_verif[i].tiempo_pop , list_verif[i].ID_pop , list_verif[i].latencia);
    end
    `uvm_info("SB",$sformatf("Se realizo un total de %0d, se completaron %0d y se perdieron %0d transacciones",
                             transacciones_totales, transacciones_completadas, transacciones_perdidas),UVM_LOW)
    
  endfunction

 endclass
