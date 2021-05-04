
class mux_driver extends uvm_driver #(mux_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(mux_driver)
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="mux_driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  //---------------------------------------------------------------------------- 

  //--------------------------  virtual interface handel -----------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------
  
  
  //------------------------ analysis port -------------------------------------
  uvm_analysis_port#(mux_sequence_item) drv2sb;
  //----------------------------------------------------------------------------
  
  //-------------------------  get interface handel from top -------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif))) begin
      `uvm_fatal("driver","unable to get interface");
    end
	drv2sb=new("drv2sb",this);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------------------- run task --------------------------------------
  task run_phase(uvm_phase phase);
    mux_sequence_item txn;
    forever begin
      seq_item_port.get_next_item(txn);
      vif.in  = txn.in;
	  vif.sel = txn.sel;
	  #4;
	  txn.input2string();
      drv2sb.write(txn);
      seq_item_port.item_done();
    end
  endtask
  //----------------------------------------------------------------------------
  
endclass:mux_driver