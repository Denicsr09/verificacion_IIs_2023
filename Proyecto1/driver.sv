///////////////////////////////////////////////////////////////////////////////////////////////
//Transacción: Esta clase se encarga de manejar las entradas y salidas del Dut y las FIFO    //
//////////////////////////////////////////////////////////////////////////////////////////////

class driver  #(parameter pckg_sz = 16, parameter deep_fifo = 10, parameter drvrs = 4, parameter bits = 1);
    virtual bus_if #(.pckg_sz(pckg_sz), .drvrs(drvrs), .bits(bits)) vif; //Interface de conexión del dut
    
    trans_fifo_mbx agnt_drv_mbx; // Mailbox entre el agente y el driver
    trans_fifo_mbx drv_chkr_mbx; // Mailbox entre el driver y el checker
    
    int espera; // Variable utilizada para cumplir con el tiempo de retardo en la entrega de un dato;

    //Se instancia las FIFOs
    fifo #(.pckg_sz(pckg_sz), .deep_fifo(deep_fifo), .bits(bits), .drvrs(drvrs)) fifo_in [drvrs - 1 : 0];

    task run();
        $display("[%g]  El driver fue inicializado",$time);
        foreach (fifo_in[i]) begin
            fifo_in [i] = new();
        end
        @(posedge vif.clk);
        vif.reset=1;
        @(posedge vif.clk);
        forever begin
            trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaction;
            foreach (fifo_in[i]) begin
                //fifo_in[i].push = 0;
                fifo_in[i].Din  = 0;
            end
            $display("[%g] el Driver espera por una transacción",$time);
            espera = 0;
            vif.reset = 0;
            @(posedge vif.clk);
            agnt_drv_mbx.get(transaction); 
            transaction.print("Driver: Transaccion recibida");
            $display("Transacciones pendientes en el mbx agnt_drv = %g",agnt_drv_mbx.num());

            while(espera < transaction.retardo)begin
               @(posedge vif.clk);
              if(espera == transaction.retardo - 1)begin
                fifo_in[transaction.drvSource].fifo_push(transaction.dato);
                transaction.tiempo = $time;
	     		      drv_chkr_mbx.put(transaction); 
                $display("Se ha ingresado el dato %0h, desde el driver %d",transaction.dato, transaction.drvSource );
                transaction.print("Driver: Transaccion ejecutada");
              end
              espera = espera + 1;
              //$display("espera: %0d", espera);
              //fifo_in[transaction.drvSource].Din = transaction.dato;
                
            end
          @(posedge vif.clk);
        end


    endtask


    task fifos();
      forever begin
            foreach(fifo_in[i]) begin
              	fifo_in[i].run();
                fifo_in[i].pop = vif.pop[0][i];
              	vif.D_pop[0][i] = fifo_in[i].Dout;
             	vif.pndng[0][i] = fifo_in[i].pndng;
            end
        @(posedge vif.clk);
      end
    endtask
  	
   task detec_pop();
     
     forever begin
       trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaction;
       foreach(fifo_in[i]) begin
         if(vif.push[0][i]) begin
           $display("Se ha detectado un dato");
           transaction =new;
           transaction.dato = vif.D_push[0][i];
           transaction.tiempo = $time;
           transaction.drvSource= i;
           transaction.tipo = lectura;
           drv_chkr_mbx.put(transaction);
           transaction.print("Driver: Transaccion ejecutada");
         end
       end
       @(posedge vif.clk);
     end
   endtask


endclass