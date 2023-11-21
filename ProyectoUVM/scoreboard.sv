class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
  uvm_analysis_imp #(transaction,scoreboard) m_analysis_imp;
  uvm_analysis_imp #(transaction,scoreboard) drv_analysis_imp;
  
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      m_analysis_imp=new("m_analysis_imp",this);
      drv_analysis_imp=new("drv_analysis_imp",this);
    endfunction
    
  
  function void write(transaction transaction_sb);
    
    
    if (transaction_sb.tipo ==  escritura)begin
      $display("Algo entro aquiii");
      `uvm_info("SB", $sformatf("Dato en el tiempo: %0d recibido desde el driver %b",
                                transaction_sb.tiempo,transaction_sb.dato ), UVM_LOW)
      
    end
    else if (transaction_sb.tipo ==  lectura) begin
      //$display("Dato recibido desde el monitor %b", transaction_sb.dato);
      `uvm_info("SB", $sformatf("Dato en el tiempo: %0d recibido desde el monitor %b",
                                transaction_sb.tiempo,transaction_sb.dato ), UVM_LOW)
      
      
      
    end
    else begin
      `uvm_warning("SB", $sformatf("El Dato: %0h no presenta tipo definido",transaction_sb.dato ))
    end
      
  endfunction
  

  
    task run_phase(uvm_phase phase);
      
        
    endtask

 endclass