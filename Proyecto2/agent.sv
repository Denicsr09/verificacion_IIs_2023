class agent #(parameter pckg_sz = 40, parameter deep_fifo = 8);
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx; 
  comando_test_agent_mbx test_agent_mbx; 
  int num_transacciones;             
  int max_retardo; 
  int ret_spec;
  tipo_trans tpo_spec; 
  bit [pckg_sz-1:0] dto_spec;
  instrucciones_agente instruccion; // para guardar la última instruccion leída
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion; //transaccion de tipo trans_fifo 
  int terminales [] = {01,02,03,04,10,20,30,40,51,52,53,54,15,25,35,45};
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
          llenado_aleatorio: begin
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              if (transaccion.target != terminales[transaccion.drvSource]) begin
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
              end
              else begin
                $display("No se puede realizar, target = %0d drvSource = %0d",transaccion.target, terminales[transaccion.drvSource]);
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
              end
              
              
            end
          end
        endcase
      end
    end
  endtask
endclass
