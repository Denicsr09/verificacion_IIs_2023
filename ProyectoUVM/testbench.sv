`include "uvm_macros.svh"
`include "wrapper.svh"
`include "Router_library.sv"
`include "interface.sv"
`include "test.sv"
//`include "env.sv"
//`include "agent.sv"
//`include "driver.sv"
//`include "monitor.sv"

module tb_top;
  import uvm_pkg::*;
  
  bit clk;
  int pckg_sz = 40;
  
  always #10 clk <= ~clk;
  
  
  dut_if	dut_if1(clk);
  dut_wrapper	dut_wr0(.vif_tb(dut_if1));
  
  

  initial begin
    uvm_config_db #(virtual dut_if)::set (null, "*","dut_if",dut_if1);
    uvm_config_db #(int)::set (null, "*","pckg_sz",pckg_sz);
    run_test("test");
  end
  
  initial begin

    $dumpfile("dump.vcd");
    $dumpvars(0,tb_top);
  end
  /*initial begin
    $finish; 
  end*/
  
endmodule