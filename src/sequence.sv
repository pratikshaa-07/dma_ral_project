class main_seq extends uvm_sequence;

  `uvm_object_utils(main_seq)

  my_reg_block     reg_blk;
  uvm_status_e     status;
  uvm_reg_data_t   rdata_dv, rdata_mv;
  uvm_reg_data_t   read_data;
  uvm_reg_data_t   data;

  randc bit [31:0] wrt_data;

  function new(string name="");
    super.new(name);
  endfunction

  virtual task body();

    //--------------- MEM ADDR REG (RW) ------------------------//
    repeat (50) begin   

  // ---------------- LOW ----------------//
      repeat (20) begin
    assert(std::randomize(wrt_data) with {wrt_data inside {[0:500]};});
    operation_fd(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    operation_bd(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    combo1(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    combo2(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
  end

  // ---------------- MID ----------------//
      repeat (20) begin
    assert(std::randomize(wrt_data) with {
      wrt_data inside {[501:1000]};
    });
    operation_fd(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    operation_bd(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    combo1(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    combo2(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
  end

  // ---------------- MAX ----------------//
      repeat (20) begin
    assert(std::randomize(wrt_data) with {
      wrt_data inside {[1001:$]};
    });
    operation_fd(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    operation_bd(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    combo1(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    combo2(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
  end

end
//      //----------------------------------------------------------//

//     //--------------- INTR ADDR REG (RW) -----------------------//
    repeat (100) begin  

  // -------- LOW --------
      
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0000 : 32'h3FFF]};
  });
  operation_fd(reg_blk.intr_inst, wrt_data, "INTR_REG");
  operation_bd(reg_blk.intr_inst, wrt_data, "INTR_REG");
  combo1(reg_blk.intr_inst, wrt_data, "INTR_REG");
  combo2(reg_blk.intr_inst, wrt_data, "INTR_REG");

  // -------- MID --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h4000 : 32'h7FFF]};
  });
  operation_fd(reg_blk.intr_inst, wrt_data, "INTR_REG");
  operation_bd(reg_blk.intr_inst, wrt_data, "INTR_REG");
  combo1(reg_blk.intr_inst, wrt_data, "INTR_REG");
  combo2(reg_blk.intr_inst, wrt_data, "INTR_REG");

//   // -------- MAX --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h8000 : 32'hFFFF]};
  });
  operation_fd(reg_blk.intr_inst, wrt_data, "INTR_REG");
  operation_bd(reg_blk.intr_inst, wrt_data, "INTR_REG");
  combo1(reg_blk.intr_inst, wrt_data, "INTR_REG");
  combo2(reg_blk.intr_inst, wrt_data, "INTR_REG");

end

//     //----------------------------------------------------------//

    //--------------- CTRL ADDR REG (RW) -----------------------//
    repeat (100) begin   

//   // -------- LOW --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0000 : 32'h00FF]};
  });
  operation_fd(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  operation_bd(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  combo1(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  combo2(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");

  // -------- MID --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0100 : 32'h0FFF]};
  });
  operation_fd(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  operation_bd(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  combo1(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  combo2(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");

//   // -------- MAX --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h1000 : 32'hFFFF]};
  });
  operation_fd(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  operation_bd(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  combo1(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");
  combo2(reg_blk.ctrl_inst, wrt_data, "CTRL_ADDR");

end

    //----------------------------------------------------------//

//     //--------------- IO ADDR REG (RW) -------------------------//
    repeat (100) begin   // OUTER repeat loop

//   // -------- LOW --------//
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0000 : 32'h00FF]};
  });
  operation_fd(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  operation_bd(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  combo1(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  combo2(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");

//   // -------- MID --------//
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0100 : 32'h0FFF]};
  });
  operation_fd(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  operation_bd(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  combo1(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  combo2(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");

//   // -------- MAX --------//
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h1000 : 32'hFFFF]};
  });
  operation_fd(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  operation_bd(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  combo1(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");
  combo2(reg_blk.io_addr_inst, wrt_data, "IO_ADDR");

end


    //----------------------------------------------------------//

    //--------------- TRANSFER COUNT REG (RO) -----------------//
    repeat (100) begin
      assert(std::randomize(wrt_data));
      operation_fd(reg_blk.transfer_count_inst,wrt_data, "TRANSFER_COUNT");
      operation_bd(reg_blk.transfer_count_inst,wrt_data, "TRANSFER_COUNT");
      combo1     (reg_blk.transfer_count_inst,wrt_data, "TRANSFER_COUNT");
      combo2     (reg_blk.transfer_count_inst,wrt_data, "TRANSFER_COUNT");
    end
    //----------------------------------------------------------//

    //--------------- DESCRIPTOR REG (RW) ---------------------//
    repeat (100) begin  

  // -------- LOW --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0000 : 32'h03FF]};
  });
  operation_fd(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  operation_bd(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  combo1(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  combo2(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");

  // -------- MID --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0400 : 32'h0FFF]};
  });
  operation_fd(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  operation_bd(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  combo1(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  combo2(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");

  // -------- MAX --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h1000 : 32'hFFFF]};
  });
  operation_fd(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  operation_bd(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  combo1(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");
  combo2(reg_blk.descriptor_addr_inst, wrt_data, "DESCRIPTOR_REG");

end

    //----------------------------------------------------------//

    //--------------- EXTRA INFO REG(RW) ---------------------------//
    repeat (100) begin   

  // -------- LOW --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0000 : 32'h00FF]};
  });
  operation_fd(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  operation_bd(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  combo1(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  combo2(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");

  // -------- MID --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0100 : 32'h0FFF]};
  });
  operation_fd(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  operation_bd(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  combo1(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  combo2(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");

  // -------- MAX --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h1000 : 32'hFFFF]};
  });
  operation_fd(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  operation_bd(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  combo1(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");
  combo2(reg_blk.extra_info_inst, wrt_data, "EXTRA_INFO");

end

    //----------------------------------------------------------//

    //--------------- STATUS REG (RO) --------------------------//
    repeat (100) begin
      assert(std::randomize(wrt_data));
      operation_fd(reg_blk.status_inst,wrt_data, "STATUS_REG");
      operation_bd(reg_blk.status_inst, wrt_data , "STATUS_REG");
      combo1     (reg_blk.status_inst,wrt_data, "STATUS_REG");
      combo2     (reg_blk.status_inst, wrt_data, "STATUS_REG");
    end
    //----------------------------------------------------------//

    //--------------- ERROR STATUS REG (W1C) ------------------//
    repeat (100) begin   

//   // -------- LOW --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0000 : 32'h000F]};
  });
  operation_fd(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  operation_bd(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  combo1(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  combo2(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");

  -------- MID --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0010 : 32'h00FF]};
  });
  operation_fd(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  operation_bd(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  combo1(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  combo2(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");

  // -------- MAX --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0100 : 32'hFFFF]};
  });
  operation_fd(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  operation_bd(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  combo1(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
  combo2(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");

end

    //----------------------------------------------------------//

    //--------------- CONFIG REG (RW) --------------------------//
    repeat (100) begin   
  // -------- LOW --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0000 : 32'h00FF]};
  });
  operation_fd(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  operation_bd(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  combo1(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  combo2(reg_blk.config_inst, wrt_data, "CONFIG_REG");

//   // -------- MID --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h0100 : 32'h0FFF]};
  });
  operation_fd(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  operation_bd(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  combo1(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  combo2(reg_blk.config_inst, wrt_data, "CONFIG_REG");

//   // -------- MAX --------
  assert(std::randomize(wrt_data) with {
    wrt_data inside {[32'h1000 : 32'hFFFF]};
  });
  operation_fd(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  operation_bd(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  combo1(reg_blk.config_inst, wrt_data, "CONFIG_REG");
  combo2(reg_blk.config_inst, wrt_data, "CONFIG_REG");

end

    //----------------------------------------------------------//

  endtask
  
  //-------------------------------- FRONTDOOR ACCESS -------------------------------//
  task operation_fd(uvm_reg rg,uvm_reg_data_t wr_data,string name);
    $display("--------------------FRONTDOOR WRITE--------------------");

    // WRITE
    repeat (1) begin
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),$sformatf("[WRITE-%s][FD] Initial desired=%0d mirror=%0d",name, rdata_dv, rdata_mv),UVM_LOW);
      rg.write(status, wr_data, UVM_FRONTDOOR);

      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),$sformatf("[WRITE-%s][FD] After desired=%0d mirror=%0d",name, rdata_dv, rdata_mv),UVM_LOW);
    end

    // READ
    $display("--------------------FRONTDOOR READ--------------------");
    repeat (1) begin
      rg.read(status, read_data, UVM_FRONTDOOR);

      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),$sformatf("[READ-%s][FD] After desired=%0d mirror=%0d",name, rdata_dv, rdata_mv),UVM_LOW);
      
      //compare
      if (rdata_dv != rdata_mv) 
        begin
        `uvm_error("REG_MISMATCH",$sformatf("[%s][FD] FAIL: Desired (%0d) != Mirrored (%0d)",name, rdata_dv, rdata_mv))
      end
      else begin
        `uvm_info("REG_MATCH",$sformatf("[%s][FD] PASS: Desired (%0d) == Mirrored (%0d)",name, rdata_dv, rdata_mv),UVM_LOW)
      end
    end
  endtask


  //-------------------------------- BACKDOOR ACCESS --------------------------------//
  task operation_bd(uvm_reg rg,uvm_reg_data_t wr_data,string name);
    $display("--------------------BACKDOOR WRITE--------------------");

    // WRITE
    repeat (1) begin
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(), $sformatf("[WRITE-%s][BD] Initial desired=%0d mirror=%0d",name, rdata_dv, rdata_mv),UVM_LOW);

      rg.write(status, wr_data, UVM_BACKDOOR);
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(
        get_type_name(),
        $sformatf("[WRITE-%s][BD] After desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv),
        UVM_LOW
      );
    end

    // READ
    $display("--------------------BACKDOOR READ--------------------");
    repeat (1) begin
      rg.read(status, read_data, UVM_BACKDOOR);
      $display("[%s] Got data %0d", name, read_data);
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),$sformatf("[READ-%s][BD] After desired=%0d mirror=%0d",name, rdata_dv, rdata_mv),UVM_LOW);
    end
  endtask


  //---------------- BACKDOOR WRITE + FRONTDOOR READ -------------------------------//
  task combo1(uvm_reg rg,uvm_reg_data_t wr_data,string name);
    $display("----------------------BACKDOOR WRITE--------------------");

    // WRITE
    repeat (1) begin
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),$sformatf("[WRITE-%s][BD] Initial desired=%0d mirror=%0d", name, rdata_dv, rdata_mv), UVM_LOW);

      rg.write(status, wr_data, UVM_BACKDOOR);
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),$sformatf("[WRITE-%s][BD] After desired=%0d mirror=%0d", name, rdata_dv, rdata_mv),UVM_LOW);
    end

    // READ
    $display("----------------------FRONTDOOR READ--------------------");
    repeat (1) begin
      rg.read(status, read_data, UVM_FRONTDOOR);
      $display("[%s] Got data %0d", name, read_data);

      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(get_type_name(),$sformatf("[READ-%s][FD] after desired=%0d mirror=%0d",name, rdata_dv, rdata_mv),UVM_LOW);
      if (rdata_dv != rdata_mv) 
        begin
          `uvm_error("REG_MISMATCH",$sformatf("[%s][FD] FAIL: Desired (%0d) != Mirrored (%0d)",name, rdata_dv, rdata_mv))
      end
      else 
        begin
        `uvm_info("REG_MATCH",$sformatf("[%s][FD] PASS: Desired (%0d) == Mirrored (%0d)",name, rdata_dv, rdata_mv),UVM_LOW)
      end
    end
  endtask


  //---------------- FRONTDOOR WRITE + BACKDOOR READ -------------------------------//
  task combo2(
    uvm_reg        rg,
    uvm_reg_data_t wr_data,
    string         name
  );
    $display("--------------------FRONTDOOR WRITE--------------------");

    // WRITE
    repeat (1) begin
      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(
        get_type_name(),
        $sformatf("[WRITE-%s][FD] Initial desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv),
        UVM_LOW
      );

      rg.write(status, wr_data, UVM_FRONTDOOR);

      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(
        get_type_name(),
        $sformatf("[WRITE-%s][FD] After desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv),
        UVM_LOW
      );
    end

    // READ
    $display("----------------------BACKDOOR READ--------------------");
    repeat (1) begin
      rg.read(status, read_data, UVM_BACKDOOR);

      rdata_dv = rg.get();
      rdata_mv = rg.get_mirrored_value();
      `uvm_info(
        get_type_name(),
        $sformatf("[READ-%s][BD] After desired=%0d mirror=%0d",
                  name, rdata_dv, rdata_mv),
        UVM_LOW
      );
    end
  endtask

endclass

//-------------peak poke sequence class--------------//
class peak_poke_seq extends uvm_sequence#(dma_seq_item);
  `uvm_object_utils(peak_poke_seq)
  
  my_reg_block reg_blk;
  uvm_status_e status;
  uvm_reg_data_t rdata_dv, rdata_mv;
  uvm_reg_data_t read_data;
  uvm_reg_data_t wrt_data;
  
  
  function new(string name="");
    super.new(name);
  endfunction
  
    virtual task body();

    //--------------- MEM ADDR REG (RW) ------------------------//
    repeat (10)  begin
      #30;
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.mem_addr_inst, wrt_data, "MEM_ADDR");
    end
    //----------------------------------------------------------//

    //--------------- INTR ADDR REG (RW) -----------------------//
    repeat (10)  begin
      assert(std::randomize(wrt_data) with {wrt_data inside {[32'h0 : 32'hFFFF]};});
      peak_poke(reg_blk.intr_inst, wrt_data, "INTR_REG");
    end
    //----------------------------------------------------------//

    //--------------- CTRL ADDR REG (RW) -----------------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.ctrl_inst,wrt_data, "CTRL_ADDR");
    end
    //----------------------------------------------------------//

    //--------------- IO ADDR REG (RW) -------------------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.io_addr_inst,wrt_data, "IO_ADDR");
    end
    //----------------------------------------------------------//

    //--------------- TRANSFER COUNT REG (RO) -----------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.transfer_count_inst,wrt_data, "TRANSFER_COUNT");
    end
    //----------------------------------------------------------//

    //--------------- DESCRIPTOR REG (RW) ---------------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.descriptor_addr_inst,wrt_data, "DESCRIPTOR_REG");
    end
    //----------------------------------------------------------//

    //--------------- EXTRA INFO REG ---------------------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.extra_info_inst,wrt_data, "EXTRA_INFO");
    end
    //----------------------------------------------------------//

    //--------------- STATUS REG (RO) --------------------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.status_inst, wrt_data, "STATUS_REG");
    end
    //----------------------------------------------------------//

    //--------------- ERROR STATUS REG (W1C) ------------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.error_status_inst, wrt_data, "ERROR_STATUS");
    end
    //----------------------------------------------------------//

    //--------------- CONFIG REG (RW) --------------------------//
    repeat (1) begin
      assert(std::randomize(wrt_data));
      peak_poke(reg_blk.config_inst, wrt_data, "CONFIG_REG");
    end
    //----------------------------------------------------------//

  endtask
  
   //--------------------------------------peak poke---------------------------//
    task peak_poke(uvm_reg rg, uvm_reg_data_t wr_data, string name);
        
    // WRITE
      $display("--------------------POKE--------------------");
      repeat(1) 
        begin
          rdata_dv = rg.get();  
          rdata_mv = rg.get_mirrored_value();
          `uvm_info(get_type_name(),$sformatf("[POKE-%s][BD] Initial desired=%0d mirror=%0d",name, rdata_dv, rdata_mv), UVM_LOW);

          rg.poke(status, wr_data);
          rdata_dv = rg.get();        
          rdata_mv = rg.get_mirrored_value();
          `uvm_info(get_type_name(), $sformatf("[POKE-%s][BD] After desired=%0d mirror=%0d",name, rdata_dv, rdata_mv), UVM_LOW);
    end
    
    // READ
      $display("----------------------PEEK--------------------");
    repeat(1) 
      begin
        rg.peek(status, read_data);
        $display("[%s] Got data %0d", name, read_data);

        rdata_dv = rg.get();
        rdata_mv = rg.get_mirrored_value();
     // rg.mirror(status, UVM_CHECK);
        `uvm_info(get_type_name(),$sformatf("[PEEK-%s][BD] After desired=%0d mirror=%0d",name, rdata_dv, rdata_mv), UVM_LOW);
    end
  endtask
  
endclass

//-----------------RESET CHECHK SEQUENCE-------------------//
class reset_seq extends uvm_sequence #(dma_seq_item);
  `uvm_object_utils(reset_seq)

  my_reg_block   reg_blk;
  uvm_status_e   status;
  uvm_reg_data_t exp_reset;
  uvm_reg_data_t mirr_val;

  function new(string name="");
    super.new(name);
  endfunction

  virtual task body();

    `uvm_info(get_type_name(),
              "Starting RESET CHECK sequence",
              UVM_LOW)
    
    reg_blk.reset();  

    check_reg(reg_blk.mem_addr_inst,"MEM_ADDR");
    check_reg(reg_blk.intr_inst,"INTR_REG");
    check_reg(reg_blk.ctrl_inst,"CTRL_REG");
    check_reg(reg_blk.io_addr_inst,"IO_ADDR");
    check_reg(reg_blk.transfer_count_inst,"TRANSFER_COUNT");
    check_reg(reg_blk.descriptor_addr_inst,"DESCRIPTOR_REG");
    check_reg(reg_blk.extra_info_inst,"EXTRA_INFO");
    check_reg(reg_blk.status_inst,"STATUS_REG");
    check_reg(reg_blk.error_status_inst, "ERROR_STATUS");
    check_reg(reg_blk.config_inst,"CONFIG_REG");

    `uvm_info(get_type_name(),
              "RESET CHECK sequence completed",
              UVM_LOW)

  endtask

  task check_reg(uvm_reg rg, string name);

    // Read DUT → update mirror and compare
    rg.mirror(status, UVM_CHECK);

    exp_reset = rg.get_reset();
    mirr_val  = rg.get_mirrored_value();

    if (mirr_val !== exp_reset) begin
      `uvm_error(get_type_name(),
        $sformatf("[RESET_FAIL-%s] Expected=%0h Got=%0h",
                  name, exp_reset, mirr_val))
    end
    else begin
      `uvm_info(get_type_name(),
        $sformatf("[RESET_PASS-%s] Reset value=%0h",
                  name, mirr_val),
        UVM_LOW)
    end

  endtask

endclass



//------------regression sequence------------//
class regression_seq extends uvm_sequence #(dma_seq_item);
  `uvm_object_utils(regression_seq)

  my_reg_block   reg_blk;
  main_seq       seq1;
  peak_poke_seq  seq2;
  reset_seq      seq3;

  function new(string name="regression_seq");
    super.new(name);
  endfunction

  virtual task body();

    // ---------------- CREATE ----------------
    seq1 = main_seq::type_id::create("seq1");
    seq2 = peak_poke_seq::type_id::create("seq2");
    seq3 = reset_seq::type_id::create("seq3");
    // ---------------- PASS REG MODEL ----------------
    seq1.reg_blk = reg_blk;
    seq2.reg_blk = reg_blk;
    seq3.reg_blk = reg_blk;
    // ---------------- RUN SEQUENCES ----------------
    `uvm_info(get_type_name(), "Starting reset_seq", UVM_LOW)
    seq3.start(m_sequencer);
    
    `uvm_info(get_type_name(), "Starting main_seq", UVM_LOW)
    seq1.start(m_sequencer);

    `uvm_info(get_type_name(), "Starting peak_poke_seq", UVM_LOW)
    seq2.start(m_sequencer);
    
    

  endtask
endclass
