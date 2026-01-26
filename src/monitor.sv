class monitor extends uvm_monitor;
  
  virtual inf vif;
  dma_seq_item req;
  static int i;
  
  uvm_analysis_port#(dma_seq_item) send_port;
  
  `uvm_component_utils(monitor)
  
  function new(string name="",uvm_component parent);
    super.new(name,parent);
    send_port = new("send_port", this);
    i=0;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual inf)::get(this,"","vif",vif))
      `uvm_fatal("MONITOR-VIF","virtual interface not set");  
  endfunction
  

    
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(4) @(vif.mon_cb);
    forever 
      begin
        mon();
        repeat(1) @(vif.mon_cb);
        i++;
    end
  endtask
  
  task mon();
    req = dma_seq_item::type_id::create("req", this);
    req.addr  = vif.mon_cb.addr;
    req.wr_en = vif.mon_cb.wr_en;
    req.rd_en = vif.mon_cb.rd_en;
    req.wdata = vif.mon_cb.wdata;
    req.rdata = vif.mon_cb.rdata;
    `uvm_info("MONITOR", $sformatf("[MON-%0d] Got wr_en=%0d | rd_en=%0d | addr=%0h | wdata=%0d | rdata = %0d",i,req.wr_en,req.rd_en,req.addr,req.wdata,req.rdata), UVM_LOW)

    send_port.write(req);

  endtask

  
endclass
