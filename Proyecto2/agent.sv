class agent #(parameter pckg_sz = 40, parameter deep_fifo = 8);
  trans_fifo_mbx agnt_drv_mbx; // Mailbox del agente al driver
  comando_test_agent_mbx test_agent_mbx; // Mailbox del test al agente
  int num_transacciones;                 // Número de transacciones para las funciones del agente
  int max_retardo; 
  int ret_spec;
  tipo_trans tpo_spec; 
  bit [pckg_sz-1:0] dto_spec;
  instrucciones_agente instruccion; // para guardar la última instruccion leída
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion; //transaccion de tipo trans_fifo 
  int l; 
  function new;
    num_transacciones = 20;
    max_retardo = 10;
  endfunction
  
  task run();
    forever begin
      #1
      if(test_agent_mbx.num() > 0)begin
        $display("[%g]  Agente: recibe instruccion",$time);
        test_agent_mbx.get(instruccion);
        case(instruccion)
          trans_especifica: begin
            $display("Si llego");
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion = new;
              transaccion.randomize();
              transaccion.concatena();
              transaccion.print("Agente: transacción creada");
            end
          end
        endcase
      end
    end
  endtask
endclass