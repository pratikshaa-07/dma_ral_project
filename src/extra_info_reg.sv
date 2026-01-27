class extra_info_reg extends uvm_reg;
  `uvm_object_utils(extra_info_reg)
  
  rand uvm_reg_field extra_info;
  
  covergroup extra_cov;
    option.per_instance=1;
    coverpoint extra_info.value{
      bins low = {[0:500]};
      bins mid = {[501:1000]};
      bins high = {[1001:$]};
    } 
  endgroup
  
  function new(string name="");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      extra_cov=new();
  endfunction
  
    virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    extra_cov.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    extra_cov.sample();
  endfunction
  
  function void build();
    
    extra_info = uvm_reg_field::type_id::create("extra_info");
extra_info.configure(.parent(this),.size(32),.lsb_pos(0),.access("RW"),.volatile(0),.reset('h0),.has_reset(1),.is_rand(1),.individually_accessible(1));  
    
  endfunction
endclass
