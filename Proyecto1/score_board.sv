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
      
    end
    
    
    
  endtask
endclass