class driver #(parameter pckg_sz = 16, parameter deep_fifo = 10, parameter drvrs = 4, parameter bits = 1);
  virtual bus_if #(.pckg_sz(pckg_sz), .drvrs(drvrs), .bits(bits)) vif;
  
  trans_fifo_mbx agnt_drv_mbx;
  trans_fifo_mbx drv_chkr_mbx; 
  int espera;
  int dato_recibidos;
  int dato_enviados;
  bit [7 : 0] ID;
  
  //Fifo in
  colas #(.pckg_sz(pckg_sz), .deep_fifo(deep_fifo)) my_fifo[drvrs-1:0];
  //Fifo out
  
  task run();
    $display("[%g] El driver fue inicializado", $time);
    foreach (my_fifo[i]) begin
      my_fifo[i] = new();
      //vif.D_pop[0][i] = 0;
    end
    @(posedge vif.clk);
    vif.reset=1;
    @(posedge vif.clk);
    //Tengo revisar bandera de pending,revisar pop, revisar push
    forever begin
      trans_fifo #(.pckg_sz(pckg_sz), .drvrs(drvrs)) transaction;
      //@(posedge vif.clk);
      vif.reset = 0;
      
      $display("[%g] el Driver espera por una transacción",$time);
      espera = 0;
      
      @(posedge vif.clk);
      agnt_drv_mbx.get(transaction);
      transaction.print("Driver: Transaccion recibida");
      $display("Transacciones pendientes en el mbx agnt_drv = %g",agnt_drv_mbx.num());
      
      
      $display("El driver va a escribir el contenido de las fifo");
      while(espera < transaction.retardo) begin
        @(posedge vif.clk);
        espera = espera+1;
        foreach(transaction.dato[i])begin
          if (transaction.dato[i] != 0 && transaction.tipo == escritura)begin
            dato_enviados = dato_enviados + 1;
            this.my_fifo[i].cola_in.push_front(transaction.dato[i]);
          end
          $display("Numero de Driver: %0d", i );
          my_fifo[i].display();
          end
      end
      $display("Cantidad de datos enviados: %0d", dato_enviados);
      
      foreach (my_fifo[i]) begin
        //@(posedge vif.clk); Tengo que ver si este va aca
        if(my_fifo[i].cola_in.size() == 0) begin
          vif.pndng[0][i] = 0;
          $display("Pending no activo, pndng[%0d]  = %0d ", i ,vif.pndng[0][i] );
        end
        else begin
          vif.pndng[0][i] = 1;
          vif.D_pop[0][i] = this.my_fifo[i].cola_in.pop_front;
          transaction.tiempo[i] = $time;
          $display("Pending activo, pndng[%0d]  = %0d ", i ,vif.pndng[0][i]);
        end
      end
      
      
      case(transaction.tipo)
        escritura: begin
          drv_chkr_mbx.put(transaction);
          transaction.print("Driver: Transaccion ejecutada");
        end
        lectura: begin
          $display("El driver va a leer el contenido de las fifo");
          dato_recibidos = 0;
          while(dato_recibidos <= dato_enviados) begin
            @(posedge vif.clk);
            foreach(my_fifo[i]) begin
              if(my_fifo[i].cola_out.size() != 0)begin
                transaction.dato[dato_recibidos] = this.my_fifo[i].cola_out.pop_front;
                transaction.tiempo[dato_recibidos] = $time;
                dato_recibidos = dato_recibidos + 1;
                $display("Se recibio un dato = %0d",dato_recibidos );
              end
              if(dato_recibidos == dato_enviados) begin
                drv_chkr_mbx.put(transaction); 
	     		transaction.print("Driver: Transaccion ejecutada");
                dato_enviados = 0;
              end
            end
          end
        end
        default: begin
          $display("[%g] Driver Error: la transacción recibida no tiene tipo valido",$time);
          //$finish;
        end
        reset: begin
          vif.reset = 1;
          foreach(transaction.tiempo[i]) begin
            transaction.tiempo[i] = $time;
          end
	      drv_chkr_mbx.put(transaction); 
          transaction.print("Driver: Transaccion ejecutada de reset");
        end
      endcase
      @(posedge vif.clk);
    end
  endtask
  
  task detec_push();
    forever begin
      @(posedge vif.clk);
      foreach (my_fifo[i]) begin
        if(vif.push[0][i]) begin
          $display("Se ha detectado un dato");
          this.my_fifo[i].cola_out.push_front(vif.D_push[0][i]);
          $display("Numero de Driver: %0d", i );
          my_fifo[i].display();
        end
      end
    end
  endtask
endclass
