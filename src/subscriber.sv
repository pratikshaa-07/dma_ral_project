class subscriber extends uvm_component;
  `uvm_component_utils(subscriber)
  
  //analysis fifo
  uvm_tlm_analysis_fifo#(dma_seq_item)inp_fifo;
  
  dma_seq_item inp_item;
  real cov_result;
  
  covergroup covg;
    WR_EN : coverpoint inp_item.wr_en;
    RD_EN : coverpoint inp_item.rd_en;
    WDATA : coverpoint inp_item.wdata{
      
      bins w_low  = {[0:1000]};
      bins w_mid1 = {[1001:10000]};
      bins w_mid2 = {[10001:80000]};
      bins w_mid3 = {[80001:5000000]};
      bins w_high = {[5000001:$]};
      
    }
    
    RDATA :coverpoint inp_item.rdata {
      
      bins r_low  = {[0:1000]};
      bins r_mid1 = {[1001:10000]};
      bins r_mid2 = {[10001:80000]};
      bins r_mid3 = {[80001:5000000]};
      bins r_high = {[5000001:$]};
      
    }
    
    ADDR:coverpoint inp_item.addr{
      bins intr            = {32'h400};
      bins ctrl            = {32'h404};
      bins io_addr         = {32'h408};
      bins mem_addr        = {32'h40C};
      bins extra_info      = {32'h410};
      bins status          = {32'h414};
      bins transfer_count  = {32'h418};
      bins descriptor_addr = {32'h41C};
      bins error_status    = {32'h420};
      bins configer        = {32'h424};
    }

    cross RD_EN,WR_EN {
        ignore_bins ig = binsof(RD_EN) intersect {0} && binsof(WR_EN) intersect {0};
    ignore_bins ig2 = binsof(RD_EN) intersect {1} && binsof(WR_EN) intersect {1};
    }
    cross ADDR,RD_EN;
    cross ADDR,WR_EN;
      
  endgroup
  
  function new(string name="",uvm_component parent);
    super.new(name,parent);
    inp_fifo=new("inp_fifo",this);
    covg=new();
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever
      begin
        inp_fifo.get(inp_item);
        covg.sample();
      end
  endtask
  
  
  virtual function void extract_phase(uvm_phase phase);
    super.extract_phase(phase);
    cov_result = covg.get_coverage();
  endfunction

  virtual function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("FINAL COVERAGE",  $sformatf("Coverage sampled = %0.2f%%", cov_result),UVM_LOW)
  endfunction
  
endclass
