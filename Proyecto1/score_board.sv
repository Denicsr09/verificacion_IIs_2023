//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Scoreboard: Este objeto se encarga de llevar un estado del comportamiento de la prueba y es capa de generar reportes //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class score_board  #(parameter pckg_sz = 16, parameter drvrs = 4);
  trans_sb_mbx  chkr_sb_mbx; //Mailbox de Comunicación entre el checker y el score board
  comando_test_sb_mbx test_sb_mbx; //Mailbox de Comunicación entre test y el score board
  trans_sb   #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaccion_entrante; // transaccion entrante que viene del checker
  trans_sb scoreboard[$]; // esta es la estructura dinámica que maneja el scoreboard  
  trans_sb auxiliar_array[$]; // estructura auxiliar usada para explorar el scoreboard;  
  trans_sb auxiliar_trans;    // Me permite sacar el dato de cola scoreboard para imprimirlo en el reporte final
  shortreal retardo_promedio; //Varaible para almacenar el valor del retardo promedio
  solicitud_sb orden;  //Variable para definir la solicitud utilizada en el scoreboard
  int tamano_sb = 0;   //Variable para definir el tamaño de la cola de scoreboard para el reporte
  int transacciones_completadas =0; // Cantidad de transacciones completadas 
  int retardo_total = 0;           //Suma de todas las latencias de las transacciones
  int fa;
  //variables para almacenar el valor del ancho minimo y maximo
  shortreal ancho_banda_min = 0;
  shortreal ancho_banda_max = 0;
   
  task run();
    $display("[%g] El Score Board fue inicializado",$time);
    forever begin
      #5;
      //Revisa la cantidad de transacciones del checker al scoreboard y realiza el calculo del retardo total
      if(chkr_sb_mbx.num() > 0) begin
        chkr_sb_mbx.get(transaccion_entrante);
        transaccion_entrante.print("Score Board: transacción recibida desde el checker");
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
              ancho_banda_min = (1*pckg_sz*drvrs)/(retardo_promedio);
              ancho_banda_max = (transacciones_completadas*pckg_sz*drvrs )/retardo_promedio;
              $display("[%g] Score board: El Ancho de Banda Minimo: %0.3f y el Ancho Banda Maximo  %0.5f", $time, ancho_banda_min, ancho_banda_max);
            end
            reporte: begin
              $display("Score Board: Recibida Orden Reporte");
              tamano_sb = this.scoreboard.size();

              
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
