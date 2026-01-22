class main_seq extends uvm_sequence;

  `uvm_object_utils(main_seq)

  my_reg_block reg_blk;
  uvm_status_e status;
  bit [31:0] rdata_dv, rdata_mv;
  bit [31:0] read_data;
  bit [31:0] data;
  
  function new(string name="");
    super.new(name);
  endfunction

  virtual task body();
    operation_bd(reg_blk.mem_addr_inst, 32'h5, "MEM_ADDR");
  endtask
  
  task operation_fd(uvm_reg rg, uvm_reg_data_t wr_data, string name);
    
    // WRITE
    repeat(1) begin
      rdata_dv = rg.get();  
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),
        $sformatf("[WRITE-%s][FD] Initial desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv), UVM_LOW);
        
      rg.write(status, wr_data, UVM_FRONTDOOR);

      rdata_dv = rg.get();        
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),
        $sformatf("[WRITE-%s][FD] After desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv), UVM_LOW);
    end
    
    // READ
    repeat(1) begin
      rg.read(status, read_data, UVM_FRONTDOOR);
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      rg.mirror(status, UVM_CHECK);
      `uvm_info(get_type_name(),
        $sformatf("[READ-%s][FD] After desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv), UVM_LOW);
    end
  endtask
  
  task operation_bd(uvm_reg rg, uvm_reg_data_t wr_data, string name);
        
    // WRITE
    repeat(1) begin
      rdata_dv = rg.get();  
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),
                $sformatf("[WRITE-%s][BD] Initial desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv), UVM_LOW);

      rg.write(status, wr_data, UVM_FRONTDOOR);

      rdata_dv = rg.get();        
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),
                $sformatf("[WRITE-%s][BD] After desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv), UVM_LOW);
    end
    
    // READ
    repeat(1) begin
      rg.read(status, read_data, UVM_BACKDOOR);
      //$display("[%s] Got data %0d", name, read_data);

      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();

      rg.mirror(status, UVM_CHECK);

      `uvm_info(get_type_name(),
        $sformatf("[READ-%s][BD] after desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv), UVM_LOW);
    end
  endtask

endclass

