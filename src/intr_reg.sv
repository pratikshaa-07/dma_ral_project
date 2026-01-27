class intr_reg extends uvm_reg;
  `uvm_object_utils(intr_reg)
  
  rand uvm_reg_field intr_status;
  rand uvm_reg_field intr_mask;
  
  covergroup intr_cov;
   option.per_instance=1;
    coverpoint intr_status.value{
      bins bin0 = {0};
    }
    coverpoint intr_mask.value{
      bins bin1 = {1};
      bins bin2 = {[2:$]};
    }
  endgroup
  
  function new(string name="");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      intr_cov=new();
  endfunction
    
  virtual function void sample(uvm_reg_data_t data,uvm_reg_data_t byte_en,bit is_read,uvm_reg_map map);
    intr_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    intr_cov.sample();
  endfunction
  
  function void build();
    intr_status = uvm_reg_field::type_id::create("intr_status");
    intr_status.configure(.parent(this),.size(16),.lsb_pos(0),.access("RO"),.volatile(0),.reset('h0),.has_reset(1),.is_rand(1),.individually_accessible(1));
    
    intr_mask = uvm_reg_field::type_id::create("intr_mask");
    intr_mask.configure(.parent(this),.size(16),.lsb_pos(16),.access("RW"),.volatile(0),.reset('h0),.has_reset(1),.is_rand(1),.individually_accessible(1));   

  endfunction
  
endclass






