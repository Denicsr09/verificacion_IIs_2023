class revision #(parameter pckg_sz = 40);
  
  trans_revision_mbx revision_ckr_mbx; 
  
  trans_revision #(.pckg_sz(pckg_sz)) transaccion;
  

// En esta funcion, por cada pop que se detecte desde el DUT se hace el eenvio del dato por medio de un mailbox, en el cual se le definen los atributos de fila y columna dependiendo de cual router vienen. 
  
  task run(); 
    fork
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 1;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 2;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 2;
        transaccion.dato =tb.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 3;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 1;
        transaccion.dato = tb.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 2;
        transaccion.dato = tb.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 3;
        transaccion.dato = tb.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
begin
    forever begin
        @(posedge tb.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop);
        transaccion = new();
        transaccion.row = 4;
        transaccion.colum = 4;
        transaccion.dato = tb.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out;
        revision_ckr_mbx.put(transaccion);
    end
end
        
    
    join_none
  endtask
  
  
   
endclass






