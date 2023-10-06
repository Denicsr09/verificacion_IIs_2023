class agent #(parameter pckg_sz = 16, parameter deep_fifo = 8, parameter drvrs = 4);
  trans_fifo_mbx agnt_drv_mbx; // Mailbox del agente al driver
  comando_test_agent_mbx test_agent_mbx; // Mailbox del test al agente
  int num_transacciones;                 // Número de transacciones para las funciones del agente
  int max_retardo; 
  int ret_spec;
  tipo_trans tpo_spec; 
  bit [pckg_sz-1:0] dto_spec;
  instrucciones_agente instruccion;      // para guardar la última instruccion leída
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion;
   
  function new;
    num_transacciones = 3;
    max_retardo = 10;
  endfunction
task run;
    $display("[%g]  El Agente fue inicializado",$time);
    forever begin
      #1
      if(test_agent_mbx.num() > 0)begin
        $display("[%g]  Agente: se recibe instruccion",$time);
        test_agent_mbx.get(instruccion);
        case(instruccion)
          IDaleatorio: begin  // Esta instruccion genera num_tranacciones escrituras seguidas del mismo número de lecturas
            $display("[%g]  Agente: entramos  a ID aleatorio ",$time);
            
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion =new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.finish_rand();
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
            end
          end
          trans_especifica: begin
            transaccion =new;
            transaccion.max_retardo = max_retardo;
            transaccion.randomize();
            transaccion.drvSource=2;
            transaccion.ID=0;
            transaccion.finish_rand();
            tpo_spec = escritura;
            transaccion.tipo = tpo_spec;
            transaccion.print("Agente: transacción creada");
            agnt_drv_mbx.put(transaccion);
          end
          
          ID_especifico: begin
            transaccion =new;
            transaccion.max_retardo = max_retardo;
            transaccion.randomize();
            transaccion.ID=0;
            transaccion.finish_rand();
            tpo_spec = escritura;
            transaccion.tipo = tpo_spec;
            transaccion.print("Agente: transacción creada");
            agnt_drv_mbx.put(transaccion);
          end
          
          payload_especifico: begin
            
          end
          
          
          broadcast: begin
            
          end
          
          
        endcase
      end
    end
  endtask
endclass
