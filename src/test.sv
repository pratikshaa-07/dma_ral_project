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

//intr reg seq

// class intr_test extends uvm_test;
//   `uvm_component_utils(intr_test)

//   function new(string name  = "", uvm_component parent= null);
//     super.new(name ,parent);
//   endfunction

//   environment env;
//   intr_reg_seq seq2;

//   virtual function void build_phase(uvm_phase phase);
//     super.build_phase(phase);
//     env   = environment::type_id::create("env", this);
//     seq2  = intr_reg_seq::type_id::create("seq2");
//   endfunction

//   virtual task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     seq2.reg_blk = env.regmodel;
//     seq2.start(env.agt.seqr);
//     phase.drop_objection(this);
//     //phase.phase_done.set_drain_time(this, 200);
//   endtask
// endclass

