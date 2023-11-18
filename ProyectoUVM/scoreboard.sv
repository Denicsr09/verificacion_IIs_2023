class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
  uvm_analysis_imp #(transaction_monitor,scoreboard) m_analysis_imp;
  
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      m_analysis_imp=new("m_analysis_imp",this);
      
    endfunction
    
  
  function void write(transaction_monitor transaction_mnr);
    
    $display("dato de llegada al scoreboard %b", transaction_mnr.dato);
      
  endfunction
  
    task run_phase(uvm_phase phase);
      
        
    endtask

 endclass
