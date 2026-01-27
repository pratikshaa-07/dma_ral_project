class environment extends uvm_env;
  `uvm_component_utils(environment)

  agent agt;
  my_reg_block regmodel;
  adapter adapt;
  uvm_reg_predictor#(dma_seq_item) predict;
  subscriber sub;
  
  
  function new(string name = "", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt     = agent::type_id::create("agt", this);
    sub     = subscriber::type_id::create("sub",this);
    //regmodel.set_hdl_path_root("top.dut");
    regmodel= my_reg_block::type_id::create("regmodel", this);
    regmodel.build();
    regmodel.set_hdl_path_root("top.dut");
    
    adapt   = adapter::type_id::create("adapt");
    predict = uvm_reg_predictor#(dma_seq_item)::type_id::create("predict", this);
  endfunction

function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  // connect reg model with sequencer and adapter
  regmodel.default_map.set_sequencer(agt.seqr, adapt);

  // base address
  regmodel.default_map.set_base_addr(0);

  // predictor setup
  predict.map     = regmodel.default_map;
  predict.adapter = adapt;
  agt.mon.send_port.connect(predict.bus_in);
  
  //monitor to subscriber
  agt.mon.send_port.connect(sub.inp_fifo.analysis_export);
  
endfunction

endclass
