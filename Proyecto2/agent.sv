class agent #(parameter ROWS=4,parameter COLUMS=4, parameter pckg_sz = 40, parameter deep_fifo = 4);
  
  virtual mesh_gnrtr_vif  #(.ROWS(ROWS), .COLUMS(COLUMS), .pckg_sz(pckg_sz), .fifo_depth(deep_fifo)) vif; //Interface virtual
 
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_drv_mbx; //Mailbox entre el agente y el driver
  trans_fifo_mbx #(.pckg_sz(pckg_sz)) agnt_sb_mbx; //Mailbox entre el agente y el scoreboard
  
  comando_test_agent_mbx test_agent_mbx;  //mailbox de comunicacion entre el test y el agente
  
  int num_transacciones; // Cantidad de transacciones a realizar en la prueba  
  int max_retardo;       //maximo retardo por transaccion
  int ret_spec;
  tipo_trans tpo_spec;  
  bit [pckg_sz-1:0] dto_spec;
  instrucciones_agente instruccion; // para guardar la última instruccion leída
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion; //transaccion de tipo trans_fifo 
  int terminales [] = {01,02,03,04,10,20,30,40,51,52,53,54,15,25,35,45};
  int l; //Para recolrrer la lista de datos especificos
  int espera; //para realizar la espera del retardo
  reg [pckg_sz-18:0] lista_especifica [] = '{{pckg_sz{4'hF}},{pckg_sz{4'h0}},{pckg_sz{4'hA}}, {pckg_sz{4'h5}}};
  
  
  function new;
    num_transacciones = 10;
    max_retardo = 10;
  endfunction
  //Generacion de los pruebas
  task run();
    forever begin
      #1
      if(test_agent_mbx.num() > 0)begin
        $display("[%g]  Agente: recibe instruccion",$time);
        test_agent_mbx.get(instruccion);
        case(instruccion)
          llenado_aleatorio: begin
            for(int i = 0; i < num_transacciones;i++) begin
              espera = 0;
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              if (transaccion.target != terminales[transaccion.drvSource]) begin
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
                end
                transaccion.tiempo = $time;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
                agnt_sb_mbx.put(transaccion);  
              end
              else begin
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
              end
            end
          end
          trans_filas: begin
            for(int i = 0; i < num_transacciones;i++) begin
              espera = 0;
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.mode = 1;
              if (transaccion.target != terminales[transaccion.drvSource]) begin
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
                end
                transaccion.tiempo = $time;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
                agnt_sb_mbx.put(transaccion);
              end
              else begin
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
              end
            end
          end
          trans_colum: begin
            for(int i = 0; i < num_transacciones;i++) begin
              espera = 0;
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.mode = 0;
              if (transaccion.target != terminales[transaccion.drvSource]) begin
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
                end
                transaccion.tiempo = $time;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
                agnt_sb_mbx.put(transaccion);
              end
              else begin
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
              end
            end
          end
          intersec_data_espec: begin
            for(int i = 0; i < 4;i++) begin
              espera = 0;
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.retardo = 1;
              transaccion.drvSource = 0;
              transaccion.target = 51;
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
              end
              transaccion.tiempo = $time;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              agnt_sb_mbx.put(transaccion);
            end
            for(int i = 0; i < 4;i++) begin
              espera = 0;
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.retardo = 1;
              transaccion.drvSource = 5;
              transaccion.target = 25;
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
              end
              transaccion.tiempo = $time;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              agnt_sb_mbx.put(transaccion);
            end 
          end
          intersec_data: begin
            l = 0;
            for(int i = 0; i < 8;i++) begin
              if(l == 4) begin
                l = 0;
              end
              espera = 0;
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
              while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
              end
              transaccion.tiempo = $time;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              agnt_sb_mbx.put(transaccion);
              espera = 0;
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
              while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
              end
              transaccion.tiempo = $time;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              agnt_sb_mbx.put(transaccion);
              l=l+1;
            end
          end
          envio_especfico: begin
            for(int i = 1; i < 16;i++) begin
              espera = 0;
              transaccion = new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.drvSource = i;
              transaccion.target = 01;
              transaccion.concatena();
              tpo_spec = escritura;
              transaccion.tipo = tpo_spec;
              while(espera < transaccion.retardo) begin
                  @(posedge vif.clk);
                  espera = espera  + 1;
              end
              transaccion.tiempo = $time;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion);
              agnt_sb_mbx.put(transaccion);
            end
          end
        endcase
      end
    end
  endtask
endclass