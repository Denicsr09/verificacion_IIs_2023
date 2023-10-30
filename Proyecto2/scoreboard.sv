class scoreboard #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  deep_fifo
  comando_test_sb_mbx test_sb_mbx; //Mailbox de Comunicación entre test y el score board
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx;
  

  trans_sb  #(.pckg_sz(pckg_sz))  transaccion_entrante;
  
  //trans_lista_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx
  
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) sb_ckr_mbx;
  trans_sb_mbx   #(.pckg_sz(pckg_sz)) ckr_sb_mbx;

  
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
  
  //trans_lista #(.pckg_sz(pckg_sz)) transaccion_sb_ckr;
  //trans_fifo #(.pckg_sz(pckg_sz)) transaccion_sb_ckr;
  //a
  trans_fifo #(.pckg_sz(pckg_sz)) list_sb[int];//arreglo asoc con indice de tipo int 

  
  trans_sb #(.pckg_sz(pckg_sz)) scoreboard[$]; // esta es la estructura dinámica que maneja el scoreboard  
  trans_sb #(.pckg_sz(pckg_sz)) auxiliar_array[$]; // estructura auxiliar usada para explorar el scoreboard;  
  trans_sb  #(.pckg_sz(pckg_sz)) auxiliar_trans;    // Me permite sacar el dato de cola scoreboard para imprimirlo en el reporte final
  shortreal retardo_promedio; //Varaible para almacenar el valor del retardo promedio
  solicitud_sb orden;  //Variable para definir la solicitud utilizada en el scoreboard
  int tamano_sb = 0;   //Variable para definir el tamaño de la cola de scoreboard para el reporte
  int transacciones_completadas =0; // Cantidad de transacciones completadas 
  int retardo_total = 0;           //Suma de todas las latencias de las transacciones
  int fa;
  int perdidas = 0;
  //variables para almacenar el valor del ancho minimo y maximo
  shortreal ancho_banda_min = 0;
  shortreal ancho_banda_max = 0;
 
  task run();
    
    forever begin 
      
      agnt_sb_mbx.get(transaccion);

      $display("Dato del agente al sb %0b", transaccion.dato);

      /*list_sb = new [list_sb.size() + 1] (list_sb);  
      if (list_sb.size() == 0) list_sb[0] = transaccion;
      else list_sb[list_sb.size()-1] = transaccion;
      */

      //voy a crearla  aqui solo para tenerla pero lo que paso al checker es dato por dato 
      list_sb[transaccion.dato[pckg_sz-9:0]]=transaccion;

      sb_ckr_mbx.put(transaccion); 

    end
    
    
  endtask 
  
  task lista ();
    
    
    foreach (list_sb[i]) begin
        
        $display("lista en scoreboard creada, key: %0d, dato: %b",i,list_sb[i].dato);
      end
      

  endtask
  
  task reporte();
  $display("[%g] El Score Board fue inicializado",$time);
    forever begin
      #5;
      //Revisa la cantidad de transacciones del checker al scoreboard y realiza el calculo del retardo total
      if(ckr_sb_mbx.num() > 0) begin
        ckr_sb_mbx.get(transaccion_entrante);
        transaccion_entrante.print("Score Board: transacción recibida desde el checker");
        list_sb[transaccion.dato[pckg_sz-9:0]].completo = 1;
        if(transaccion_entrante.completado) begin
            retardo_total = retardo_total + transaccion_entrante.latencia;
            transacciones_completadas++;
        end
        scoreboard.push_back(transaccion_entrante);
        //$display("Retardo total del brete: %0d",  retardo_total);
      end
      //Cuando termina de calcular el retardo realiza el reporte donde se calcula retardo promedio, ancho de banda y se muestra el reporte
      else begin
        if(test_sb_mbx.num()>0)begin
          test_sb_mbx.get(orden);
          case(orden)
            retardo_promedio: begin
              $display("Score Board: Recibida Orden Retardo_Promedio");
              retardo_promedio = retardo_total/transacciones_completadas;
              $display("[%g] Score board: el retardo promedio es: %0.3f", $time, retardo_promedio);
            end
            ancho_banda:begin
              $display("Score Board: Recibida Orden Ancho de banda");
              ancho_banda_min = (1*pckg_sz)/(retardo_promedio);
              ancho_banda_max = (transacciones_completadas*pckg_sz*16 )/retardo_promedio;
              $display("[%g] Score board: El Ancho de Banda Minimo: %0.3f y el Ancho Banda Maximo  %0.5f", $time, ancho_banda_min, ancho_banda_max);
            end
            reporte: begin
              $display("Score Board: Recibida Orden Reporte");
              foreach(list_sb[i]) begin
                if(list_sb[i].completo != 1) begin
                  perdidas = perdidas +1;
                end
              end
              $display("Se perdieron %d datos", perdidas);
              tamano_sb = this.scoreboard.size();

              fa = $fopen("INFORME.csv","a");
              $fdisplay(fa,"Reporte Scoreboard");
              $fdisplay(fa,"pckg_size= %d, depth_fifo= %d, retardo promedio= %d, ancho de banda minima= %d, ancho de banda maximo= %d", pckg_sz,deep_fifo, retardo_promedio,ancho_banda_min,ancho_banda_max );
              $fclose(fa);

              fa = $fopen("Reporte.csv","a");
              $fdisplay(fa,"Reporte Scoreboard");
              $fdisplay(fa,"REPORTE DE TRANSACCIONES REALIZADAS");
              
              for(int i=0;i<tamano_sb;i++) begin
                auxiliar_trans = scoreboard.pop_front;
                $fdisplay(fa," ID = %d, dato=  %0h , Tiempo de escritura= %d, Driver de salida= %d, Tiempo de lectura= %d, Driver de llegada= %d , Latencia=%d ", auxiliar_trans.ID_pop , auxiliar_trans.dato_enviado , auxiliar_trans.tiempo_push, auxiliar_trans.drvSource_push , auxiliar_trans.tiempo_pop , auxiliar_trans.ID_pop , auxiliar_trans.latencia);
                //$fdisplay(fa,"data= %0h, tiempo= %0d", auxiliar_trans.dato , auxiliar_trans.tiempo_push );
                auxiliar_trans.print("SB_Report:");
                auxiliar_array.push_back(auxiliar_trans);
              end
              $fclose(fa);

              
              scoreboard = auxiliar_array;
            end
          endcase
        end
      end
    end

  endtask
  


  
  
endclass
