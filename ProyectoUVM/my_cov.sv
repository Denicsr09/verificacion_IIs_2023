`include "macros.sv"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* Se realizan cuatro grupos de cobertura, donde se toman las señales del DUT para revisar si sí se hizo un cambio en esos puntos
cada uno de estos se realizan en macros, excepto el de filas, para su rápida visualización */
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class my_cov extends uvm_component;
  
  `uvm_component_utils(my_cov)
  
  function new(string name="my_cov", uvm_component parent=null);
      super.new(name, parent);
       pop_drv_coverG = new();
		row_covG = new();
		colum_covG = new();
		pop = new();
    endfunction
  
  covergroup pop_drv_coverG;//grupo de cobertura para revisar si se utilizaron todos los drivers
		`pop_drv_coverG
	endgroup

	covergroup row_covG;//grupo de cobertura para revisar si se usaron todas las filas posibles
	  coverpoint tb_top.dut_wr0.dut.data_out[0][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[1][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[2][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[3][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[4][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[5][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[6][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[7][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[8][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[9][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[10][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[11][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[12][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[13][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[14][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}
      coverpoint tb_top.dut_wr0.dut.data_out[15][`pckg_sz-9:`pckg_sz-12]{bins r = {[0:5]};}

	endgroup	

	covergroup colum_covG;//grupo de cobertura para revisar si se usaron todas las columnas posibles
           `colum_cov
        endgroup

	covergroup pop;//grupo de cobertura para revisar si se usaron todas las terminales de los routers internos 
	`terminal_cov
	endgroup

   virtual task run_phase(uvm_phase phase);//se toman las muestras en el run phase 
     forever begin 
			#5
			pop_drv_coverG.sample();
			row_covG.sample();
			colum_covG.sample();
			pop.sample();
		end
      
   endtask 
  
   virtual function void check_phase (uvm_phase phase);//se crean los informes de UVM para indicar el porcentaje de cobertura de cobertura
     `uvm_info("COV",$sformatf("INICIANDO LA FASE DE CHEQUEO"),UVM_LOW)
     `uvm_info("COV",$sformatf("COBERTURA POP: %0.2f",  pop_drv_coverG.get_coverage()),UVM_LOW)
     `uvm_info("COV",$sformatf("COBERTURA ROW: %0.2f",  row_covG.get_coverage()),UVM_LOW)
     `uvm_info("COV",$sformatf("CBERTURA COLUMN: %0.2f",  colum_covG.get_coverage()),UVM_LOW)
     `uvm_info("COV",$sformatf("COBERTURA POP_TERMINALES: %0.2f",  pop.get_coverage()),UVM_LOW)
     
	
   endfunction
endclass
