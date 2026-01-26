class dma_seq_item extends uvm_sequence_item;
  rand bit [31:0] addr;
  rand bit [31:0] wdata;
  rand bit  wr_en;
  rand bit  rd_en;
   
  bit [31:0] rdata;

  `uvm_object_utils_begin(dma_seq_item)
    `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_int(wdata,UVM_ALL_ON)
    `uvm_field_int(rdata,UVM_ALL_ON)
    `uvm_field_int(wr_en,UVM_ALL_ON)
    `uvm_field_int(rd_en,UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name = "");
    super.new(name);
  endfunction
endclass
