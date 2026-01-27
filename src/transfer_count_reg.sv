class transfer_count_reg extends uvm_reg;
  `uvm_object_utils(transfer_count_reg)
  
  rand uvm_reg_field transfer_count;

  function new(string name="");
    super.new(name,32,UVM_NO_COVERAGE);
  endfunction

  function void build();
    
    transfer_count = uvm_reg_field::type_id::create("transfer_count"); transfer_count.configure(.parent(this),.size(32),.lsb_pos(0),.access("RO"),.volatile(0),.reset('h0),.has_reset(1),.is_rand(1),.individually_accessible(1));  
    
  endfunction
endclass
