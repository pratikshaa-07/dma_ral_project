class driver extends uvm_driver#(dma_seq_item);
  
  virtual inf.DRV vif;
  static int i;
  `uvm_component_utils(driver)
  
  function new(string name="",uvm_component parent);
    super.new(name,parent);
    i=0;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual inf)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER-VIF","virtual interface not set");
    
  endfunction
  
  task drive();    
    vif.drv_cb.wr_en<=req.wr_en;
    vif.drv_cb.rd_en<=req.rd_en;
    vif.drv_cb.addr<=req.addr;
    vif.drv_cb.wdata<=req.wdata;
    `uvm_info("DRIVER", $sformatf("[drv-%0d] sent wr_en =%0d | rd_en = %0d | addr =%0d | wdata=%0d ",i,req.wr_en,req.rd_en,req.addr,req.wdata), UVM_LOW)
    @(vif.drv_cb);
    i++;
  endtask
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(3) @(vif.drv_cb);
    forever
      begin
        seq_item_port.get_next_item(req);     
        drive();
        seq_item_port.item_done();            
      end
  endtask
  
endclass
