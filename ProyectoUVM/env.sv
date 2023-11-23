`include "agent.sv"
`include "scoreboard.sv"
class env extends uvm_env;
  `uvm_component_utils(env)
    
  agent agent_env;
  scoreboard scoreboard_env;
 
  
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
    
    function void build_phase(uvm_phase phase);
     
      agent_env = agent::type_id::create("agent_env", this);
      scoreboard_env = scoreboard::type_id::create("scoreboard_env", this);
    endfunction
    
	
  virtual function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
     for (int i=0; i<(`ROWS*2+`COLUMS*2);  i++) begin
       automatic int n=i;
      
       agent_env.monitor_ag[n].mon_analysis_port.connect(scoreboard_env.m_analysis_imp);
       agent_env.driver_ag[n].drv_analysis_port.connect(scoreboard_env.drv_analysis_imp);
    end
    
  endfunction
  
 endclass
