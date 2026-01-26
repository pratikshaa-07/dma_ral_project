class adapter extends uvm_reg_adapter;
  `uvm_object_utils(adapter)
  function new(string name="");
    super.new(name);
  endfunction
  
  function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    dma_seq_item bus_req;
    bus_req   = dma_seq_item::type_id::create("bus");
    bus_req.addr  = rw.addr;
    bus_req.wdata = rw.data;
    bus_req.wr_en = (rw.kind == UVM_WRITE) ? 1'b1 : 1'b0;
    bus_req.rd_en = (rw.kind == UVM_READ)  ? 1'b1 : 1'b0;
    return bus_req;
  endfunction
  
  function void bus2reg(uvm_sequence_item bus_item,ref uvm_reg_bus_op rw);
    dma_seq_item bus_req;
    assert($cast(bus_req, bus_item));
    if (bus_req.wr_en) 
      begin
      rw.kind = UVM_WRITE;
      rw.data = bus_req.wdata;
    end 
    else 
      begin
      rw.kind = UVM_READ;
      rw.data = bus_req.rdata;
    end
    rw.addr   = bus_req.addr;
    rw.status = UVM_IS_OK;
  endfunction
endclass
