////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Checker/scoreboard: este objeto es responsable de verificar que el comportamiento del DUT sea el esperado //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
class check #(parameter pckg_sz = 16, parameter deep_fifo = 8, parameter drvrs = 4);
  trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaccion;
  trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) auxiliar;
  trans_sb   #(.pckg_sz(pckg_sz), .drvrs(drvrs)) to_sb;
  trans_fifo  emul_fifo[$];//this queue is going to be used as golden reference for the fifo
  trans_fifo_mbx drv_chkr_mbx; //Mailbox de comunicación entre el driver y el checker
  trans_sb_mbx  chkr_sb_mbx; //Mailbox de comunicación entre el scoreboard y el scoreboard
  int contador_auxiliar;
  int ID;
  
  function new();
    this.emul_fifo = {};
    this.contador_auxiliar = 0;
  endfunction 
  task run();
    $display("[%g]  El checker fue inicializado",$time);
   	to_sb = new();
    forever begin
      to_sb = new();
      drv_chkr_mbx.get(transaccion);
      transaccion.print("Checker: Se recibe trasacción desde el driver");
      to_sb.clean();
      case(transaccion.tipo)
        lectura: begin
          if(0 !== emul_fifo.size()) begin //Revisa si el Fifo no está vacía
            auxiliar = emul_fifo.pop_front();
            //$display("El dato auxiliar del checker: =%h",auxiliar.dato );
            while(auxiliar.dato != transaccion.dato) begin
              emul_fifo.push_back(auxiliar);
              //$display(" NOOO el auxiliar: %0h y transaccion: %0h", auxiliar.dato, transaccion.dato);
              auxiliar = emul_fifo.pop_front();
              //$display(" Dato que se le hizo pop front = %0h", auxiliar.dato);
            end
            //$display("Datooooo que quedo en el auxiliar: %0h", auxiliar.dato);
            if(auxiliar.dato == transaccion.dato) begin
                $display("Encontro el auxiliar: %0h y transaccion: %0h", auxiliar.dato, transaccion.dato);
              	to_sb.dato_enviado = auxiliar.dato;
              	to_sb.tiempo_push = auxiliar.tiempo;
              	to_sb.tiempo_pop = transaccion.tiempo;
                to_sb.drvSource_push = auxiliar.drvSource;
                to_sb.ID_pop = transaccion.drvSource;
                ID = transaccion.dato [pckg_sz -1: pckg_sz -8];
              if((transaccion.drvSource == ID) || (ID == 8'b1111_1111)) begin
                  to_sb.completado = 1;
                  $display("La transaccion ejecutadata llego a la terminal adecuada, terminal esperada: %0d, terminal llegada: %0d",transaccion.drvSource, ID );
              	end
                else begin
                  to_sb.completado = 0;
                  $display("La transaccion ejecutadata no llego a la terminal adecuada, terminal esperada: %0d, terminal llegada: %0d",transaccion.drvSource, transaccion.ID );
                end
              	to_sb.calc_latencia();
             	to_sb.print("Checker:Transaccion Completada");
             	chkr_sb_mbx.put(to_sb);
            end
          end
          else begin
            transaccion.print("Checker: Error el dato de la transacción no calza con el esperado");
            $display("Dato_leido= %0h, Dato_Esperado = %0h",transaccion.dato,auxiliar.dato);
            $finish; 
          end
        end
        escritura: begin
          transaccion.print("Checker: Escritura");
          if(transaccion.dato[pckg_sz -1: pckg_sz -8] == 8'b1111_1111) begin
            $display("Se ha detectado un dato con broadcast");
            for (int i = 0; i < drvrs - 1; i++) begin
              $display("Valor de i: %0d", i);
              emul_fifo.push_back(transaccion);
              $display("Checker: La FIFO EMULADA= %0h", transaccion.dato);
            end
          end
          else begin
            emul_fifo.push_back(transaccion);
          	$display("Checker: La FIFO EMULADA= %0h", transaccion.dato);
          end
           
        end
        reset: begin
          contador_auxiliar = emul_fifo.size();
          for(int i =0; i<contador_auxiliar; i++)begin
           auxiliar = emul_fifo.pop_front();
           to_sb.clean();
           to_sb.dato_enviado = auxiliar.dato;
           to_sb.tiempo_push = auxiliar.tiempo;
           to_sb.drvSource_push = auxiliar.drvSource;
           to_sb.reset = 1;
           to_sb.print("Checker: Reset");
           chkr_sb_mbx.put(to_sb);
         end
        end
        default: begin
         $display("[%g] Checker Error: la transacción recibida no tiene tipo valido",$time);
         $finish;
       	end
      endcase
    end
  endtask
  
endclass