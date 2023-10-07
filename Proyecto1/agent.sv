///Cumple una funcion entre generador y agente, tiene diferentes casos dependiendo de la instruccion que esté tomando. 

class agent #(parameter pckg_sz = 16, parameter deep_fifo = 8, parameter drvrs = 4);
  trans_fifo_mbx agnt_drv_mbx; // Mailbox del agente al driver
  comando_test_agent_mbx test_agent_mbx; // Mailbox del test al agente
  int num_transacciones;                 // Número de transacciones para las funciones del agente
  int max_retardo; 
  int ret_spec;
  tipo_trans tpo_spec; 
  bit [pckg_sz-1:0] dto_spec;
  instrucciones_agente instruccion;      // para guardar la última instruccion leída
  trans_fifo #(.pckg_sz(pckg_sz)) transaccion; //transaccion de tipo trans_fifo 
  int l; 
  function new;
    num_transacciones = 1;
    max_retardo = 10;
  endfunction
  
  reg [7:0] lista_especifica[0:3];
  
  

task run;
  
  lista_especifica[0] = 8'hFF;
  lista_especifica[1] = 8'h00;
  lista_especifica[2] = 8'hAA;
  lista_especifica[3] = 8'h55;
  
    //$display("[%g]  El Agente fue inicializado",$time);
    forever begin
      #1
      if(test_agent_mbx.num() > 0)begin
        $display("[%g]  Agente: recibe instruccion",$time);
        test_agent_mbx.get(instruccion);
        case(instruccion)
          
          trans_especifica: begin //Source, ID y payload específicos 
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion =new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();//aleatoriza, source, ID y payload
              transaccion.drvSource=1;//defino un driver source 
              transaccion.ID=2;//se define  a donde enviarlo 
              transaccion.concatena();//concatena el UD y payload
              tpo_spec = escritura; //escritura
              transaccion.tipo = tpo_spec;
              transaccion.print("Agente: transacción creada");
              agnt_drv_mbx.put(transaccion); //MB de agente a driver toma la transaccion
            end
          end
          
          IDaleatorio: begin  //ID random,  drvrSource especifico y payload especifico 
            for(int i = 0; i < num_transacciones;i++) begin //por cada transaccion que se desee
              transaccion =new; //nueva transaccion
              transaccion.max_retardo = max_retardo;//retardo especfico definido 
              transaccion.randomize(); 
              transaccion.drvSource=1;//defino un driver de salida 
              if (transaccion.ID != transaccion.drvSource) begin 
      			//si mi ID es dif del driver de salida si se hace 
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
              end else begin
                i=i-1;//como no se pudo realizar, no cuenta como un a transaccion
                //$display("[%g]  Agente: ID y Source iguales, no se puede realizar",$time);
              end 
         
            end
          end
          
          ID_especifico: begin //ID especifico, driverSource y payload random 
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion =new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.ID=1;//ID específico 
              if (transaccion.drvSource != transaccion.ID) begin 
                transaccion.concatena();
                tpo_spec = escritura;
                transaccion.tipo = tpo_spec;
                transaccion.print("Agente: transacción creada");
                agnt_drv_mbx.put(transaccion);
              end else begin
                i=i-1;
                //$display("[%g]  Agente: ID y Source iguales, no se puede realizar",$time);
              end 
              
             
            end   
          end
          
          payload_especifico: begin //ID random, driverSOurce random y payload especifico 
             l=0;
            
             for(int i = 0; i < num_transacciones;i++) begin
               transaccion =new;
               transaccion.max_retardo = max_retardo;
               transaccion.randomize();
               
               if (l==4)begin
                 l=0;
               end 
               transaccion.payload= lista_especifica[l]; //payload especifico de la lista de payloads
               //$display("valor de payload de lista %0h ", lista_especifica[l] );
               l=l+1;
               if (transaccion.drvSource != transaccion.ID) begin
                 transaccion.concatena();
                 tpo_spec = escritura;
                 transaccion.tipo = tpo_spec;
                 transaccion.print("Agente: transacción creada");
                 agnt_drv_mbx.put(transaccion);
               end else begin
                 i=i-1;
                 //$display("[%g]  Agente: ID y Source iguales, no se puede realizar",$time);
               end 
                 
             end
          end
          
          broadcast: begin //envia datos a todos los drivers
            for(int i = 0; i < num_transacciones;i++) begin
              transaccion =new;
              transaccion.max_retardo = max_retardo;
              transaccion.randomize();
              transaccion.ID=8'b11111111;//ID para generar el broadcast desde el checker 
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
