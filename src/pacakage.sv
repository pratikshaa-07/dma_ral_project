package dma_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "seq_item.sv"
  `include "sequencer.sv"
  `include "driver.sv"
  `include "monitor.sv"
  `include "agent.sv"

  `include "intr_reg.sv"
  `include "ctrl_reg.sv"
  `include "io_addr_reg.sv"
  `include "mem_addr_reg.sv"
  `include "extra_info_reg.sv"
  `include "status_reg.sv"
  `include "transfer_count_reg.sv"
  `include "descriptor_reg.sv"
  `include "error_status_reg.sv"
  `include "config_reg.sv"

  `include "reg_block.sv"
  `include "adapter.sv"

  `include "subscriber.sv"  
  `include "env.sv"

  `include "sequence.sv"
  `include "test.sv"

endpackage 

