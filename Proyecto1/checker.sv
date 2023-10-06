//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Scoreboard: Este objeto se encarga de llevar un estado del comportamiento de la prueba y es capa de generar reportes //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class score_board  #(parameter pckg_sz = 16, parameter drvrs = 4);
  trans_sb_mbx  chkr_sb_mbx; //Mailbox de Comunicación entre el checker y el score board
  comando_test_sb_mbx test_sb_mbx; //Mailbox de Comunicación entre test y el score board
  trans_sb   #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaccion_entrante; // transaccion entrante que viene del checker
  trans_sb scoreboard[$]; // esta es la estructura dinámica que maneja el scoreboard  
  trans_sb auxiliar_array[$]; // estructura auxiliar usada para explorar el scoreboard;  
  trans_sb auxiliar_trans;
  shortreal retardo_promedio;
  solicitud_sb orden;
  int tamano_sb = 0;
  int transacciones_completadas =0;
  int retardo_total = 0;
  shortreal ancho_banda_min = 0;
  shortreal ancho_banda_max = 0;
   
  task run();
    $display("[%g] El Score Board fue inicializado",$time);
    forever begin
      #5;
      if(chkr_sb_mbx.num() > 0) begin
        chkr_sb_mbx.get(transaccion_entrante);
        transaccion_entrante.print("Score Board: transacción recibida desde el checker");
        if(transaccion_entrante.completado) begin
            retardo_total = retardo_total + transaccion_entrante.latencia;
            transacciones_completadas++;
        end
        scoreboard.push_back(transaccion_entrante);
        $display("Retardo total del breteeee: %0d",  retardo_total);
      end
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
              $display("pckg_sz: %0d",retardo_promedio );
              ancho_banda_min = (1*pckg_sz*drvrs)/(retardo_promedio);
              ancho_banda_max = (transacciones_completadas*pckg_sz*drvrs )/retardo_promedio;
              $display("[%g] Score board: El Ancho de Banda Minimo: %0.3f y el Ancho Banda Maximo  %0.5f", $time, ancho_banda_min, ancho_banda_max);
            end
            reporte: begin
              $display("Score Board: Recibida Orden Reporte");
              tamano_sb = this.scoreboard.size();
              for(int i=0;i<tamano_sb;i++) begin
                auxiliar_trans = scoreboard.pop_front;
                auxiliar_trans.print("SB_Report:");
                auxiliar_array.push_back(auxiliar_trans);
              end
              scoreboard = auxiliar_array;
            end
          endcase
        end
      end
    end
    
    
    
  endtask
endclass