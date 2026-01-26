`include "uvm_macros.svh"
`include "pacakage.sv"
`include "interface.sv"
`include "design.sv"

 import uvm_pkg::*;
 import dma_pkg::*;

module top;

 // import uvm_pkg::*;
 // import dma_pkg::*;

  bit clk = 0;
  bit rst_n;

  always #5 clk = ~clk;

  inf intf(clk, rst_n);
  
  dma_design dut(.clk(intf.clk),.rst_n(intf.rst_n),.wr_en(intf.wr_en),.rd_en(intf.rd_en),.wdata(intf.wdata),.addr(intf.addr),.rdata(intf.rdata));

  initial 
    begin
    rst_n = 0;
    #20 rst_n = 1;
  end

  initial 
    begin
      uvm_config_db#(virtual inf)::set(null,"*","vif",intf);
 //     $dumpfile("dump.vcd");
 //     $dumpvars;
    end
  
  initial
    begin
      run_test("regression_test");
      //run_test("mem_addr_test");
      //run_test("peak_poke_test");
      $finish;
    end

endmodule

