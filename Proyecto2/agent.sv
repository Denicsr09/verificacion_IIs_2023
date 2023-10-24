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
  reg [pckg_sz-18:0] lista_especifica [] = '{{pckg_sz{4'hF}},{pckg_sz{4'h0}},{pckg_sz{4'hA}}, {pckg_sz{4'h5}}};
  
  
  function new;
    num_transacciones = 10;
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
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
              end
            end
          end
          trans_filas: begin
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.mode = 1;
              if (transaccion.target != terminales[transaccion.drvSource]) begin
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
              end
              else begin
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
              end
            end
          end
          trans_colum: begin
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.mode = 0;
              if (transaccion.target != terminales[transaccion.drvSource]) begin
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
              end
              else begin
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
              end
            end
          end
          intersec_data_espec: begin
            for(int i = 0; i < 4;i++) begin
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.retardo = 1;
              transaccion.drvSource = 0;
              transaccion.target = 51;
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
            end
            for(int i = 0; i < 4;i++) begin
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.retardo = 1;
              transaccion.drvSource = 5;
              transaccion.target = 25;
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
            end 
          end
          intersec_data: begin
            l = 0;
            for(int i = 0; i < 8;i++) begin
              if(l == 4) begin
                l = 0;
              end
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.retardo = 1;
              transaccion.drvSource = i;
              transaccion.target = terminales[i+8];
              transaccion.payload = lista_especifica[l];
              transaccion.concatena();
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.retardo = 1;
              transaccion.drvSource = i+8;
              transaccion.target = terminales[i];
              transaccion.payload = lista_especifica[l];
              transaccion.concatena();
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              l=l+1;
            end
          end
          envio_especfico: begin
            for(int i = 1; i < 16;i++) begin
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.drvSource = i;
              transaccion.target = 01;
              transaccion.concatena();
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              
            end
            
          end
          
        endcase
      end
    end
  endtask
endclass