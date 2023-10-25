class driver extends uvm_driver #(Item);
`uvm_component_utils(driver)
function new (string name= "driver", uvm_component parent = null);
    super.new(name,parent);
endfunction

virtual des_if vif;

virtual function void build_phase(uvm_phase phase);
    super.build_phase (phase);
    if (!uvm_config_db#)(virtual des_if)::get(this,"","des_vif",vif))
    `uvm_fatal("DRV", "Could not get vif")
endfunction

endclass