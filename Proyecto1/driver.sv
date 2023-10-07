///////////////////////////////////////////////////////////////////////////////////////////////
//Driver: Esta clase se encarga de manejar las entradas y salidas del Dut y las FIFO        //
//////////////////////////////////////////////////////////////////////////////////////////////

class driver  #(parameter pckg_sz = 16, parameter deep_fifo = 8, parameter drvrs = 4, parameter bits = 1);
    virtual bus_if #(.pckg_sz(pckg_sz), .drvrs(drvrs), .bits(bits)) vif; //Interface de conexión del dut
    
    trans_fifo_mbx agnt_drv_mbx; // Mailbox entre el agente y el driver
    trans_fifo_mbx drv_chkr_mbx; // Mailbox entre el driver y el checker
    
    int espera; // Variable utilizada para cumplir con el tiempo de retardo en la entrega de un dato;

    //Se instancia las FIFOs
    ////Arreglo para generar las FIFO de entrada con la cantidad de drivers del DUT que se generaron
    fifo #(.pckg_sz(pckg_sz), .deep_fifo(deep_fifo), .bits(bits), .drvrs(drvrs)) fifo_in [drvrs - 1 : 0]; 
    
    //Task para escribir datos en la FIFO 
    task run();
        $display("[%g]  El driver fue inicializado",$time);
        foreach (fifo_in[i]) begin
            fifo_in [i] = new(); // Se inicializan las FIFO de entrada
        end
        @(posedge vif.clk);
        vif.reset=1; //Reset del DUT
        @(posedge vif.clk);
        forever begin
            trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaction; // Instancia para obtener el contenido del Mailbox agnt_drv_mbx
            foreach (fifo_in[i]) begin
                fifo_in[i].Din  = 0; 
            end
            $display("[%g] el Driver espera por una transacción",$time);
            espera = 0;
            vif.reset = 0;
            @(posedge vif.clk);
            agnt_drv_mbx.get(transaction); // Se obtiene el dato a escrbir proveniente del agente 
            transaction.print("Driver: Transaccion recibida");
            $display("Transacciones pendientes en el mbx agnt_drv = %g",agnt_drv_mbx.num());
            
            //Realiza el retardo que posee el dato antes de escribirse
            while(espera < transaction.retardo)begin
               @(posedge vif.clk);
              if((espera == transaction.retardo - 1) && transaction.tipo != reset )begin
                fifo_in[transaction.drvSource].fifo_push(transaction.dato);
                transaction.tiempo = $time;
	     		      drv_chkr_mbx.put(transaction); 
                $display("Se ha ingresado el dato %0h, desde el driver %d",transaction.dato, transaction.drvSource );
                transaction.print("Driver: Transaccion ejecutada");
              end
              espera = espera + 1;
                
            end
            //Si se realiza un evento reset 
            if(transaction.tipo == reset ) begin
              vif.reset =1;
              transaction.tiempo = $time;
              drv_chkr_mbx.put(transaction); 
              transaction.print("Driver: Transaccion ejecutada");
            end
          
          @(posedge vif.clk);
        end


    endtask

    //Task que corre las FIFos y actualiza las entradas del DUT que se conectan a las FIFO de entrada
    task fifos();
      forever begin
            foreach(fifo_in[i]) begin
              	fifo_in[i].run(); //task de las FIFO 
                fifo_in[i].pop = vif.pop[0][i]; // Conexion del POP de las FIFOs y el POP del DUT
              	vif.D_pop[0][i] = fifo_in[i].Dout; // Conexion de entrada del DUT y la salida de las FIFOs de entrada
             	vif.pndng[0][i] = fifo_in[i].pndng; // Conexion de bandera pending del DUT y las FIFO
            end
        @(posedge vif.clk);
      end
    endtask
  	
    //Task para que cuando el DUT realice un PoP se obtenga el dato y se envie al checker
   task detec_pop();
     
     forever begin
       trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaction; //Instancia para crear una transacción y enviarla al checker
       foreach(fifo_in[i]) begin
         if(vif.push[0][i]) begin
           //$display("Se ha detectado un dato en el driver");
           transaction =new;
           transaction.dato = vif.D_push[0][i]; // Salida del DUT para obtener el dato 
           transaction.tiempo = $time;
           transaction.tipo = lectura; 
           transaction.drvSource = i; //Guarda el driver del cual se obtuvo
           drv_chkr_mbx.put(transaction); // Envia el dato de lectura al checker
           transaction.print("Driver: Transaccion ejecutada");
         end
       end
       @(posedge vif.clk);
     end
   endtask


endclass