class mem_addr_test extends uvm_test;
  `uvm_component_utils(mem_addr_test)

  function new(string name  = "", uvm_component parent= null);
    super.new(name ,parent);
  endfunction

  environment env;
  main_seq seq1;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env   = environment::type_id::create("env", this);
    seq1  = main_seq::type_id::create("seq1");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    seq1.reg_blk = env.regmodel;
    seq1.start(env.agt.seqr);
    
    phase.drop_objection(this);
    //phase.phase_done.set_drain_time(this, 200);
  endtask
endclass

//peak poke seq

class peak_poke_test extends uvm_test;
  `uvm_component_utils(peak_poke_test)

  function new(string name  = "", uvm_component parent= null);
    super.new(name ,parent);
  endfunction

  environment env;
  peak_poke_seq seq2;

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env   = environment::type_id::create("env", this);
    seq2  = peak_poke_seq::type_id::create("seq2");
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq2.reg_blk = env.regmodel;
    seq2.start(env.agt.seqr);
    phase.drop_objection(this);
    //phase.phase_done.set_drain_time(this, 200);
  endtask
endclass

//regression test seq

class regression_test extends uvm_test;
  `uvm_component_utils(regression_test)

  environment         env;
  regression_seq  reg_seq;

  function new(string name="", uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    env     = environment::type_id::create("env", this);
    reg_seq = regression_seq::type_id::create("reg_seq");
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    reg_seq.reg_blk = env.regmodel;
    reg_seq.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask
endclass
