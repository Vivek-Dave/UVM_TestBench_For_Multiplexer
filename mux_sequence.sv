
/***************************************************
** class name  : mux_sequence 
** description : generate ramdom values for inputs
				 "in and sel"
***************************************************/
class mux_sequence extends uvm_sequence#(mux_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(mux_sequence)            
  //----------------------------------------------------------------------------

  mux_sequence_item txn;
  int N=10;
  //----------------------------------------------------------------------------
  function new(string name="mux_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
	for(int i=0;i<N;i++) begin 
		txn=mux_sequence_item::type_id::create("txn");
		start_item(txn);
		txn.randomize();
		finish_item(txn);
	end
  endtask:body
  //----------------------------------------------------------------------------
endclass:mux_sequence

/***************************************************
** class name  : sel_000
** description : value of sel reamains 000
***************************************************/
class sel_000 extends mux_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(sel_000)      
  //----------------------------------------------------------------------------
  
  mux_sequence_item txn;
  int N=10;
  //----------------------------------------------------------------------------
  function new(string name="sel_000");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
	for(int i=0;i<N;i++) begin 
		txn=mux_sequence_item::type_id::create("txn");
		start_item(txn);
      	txn.randomize()with{txn.sel==3'b000;};
		finish_item(txn);
	end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass

/***************************************************
** class name  : sel_111
** description : value of sel reamains 111 during 
				 randomization
***************************************************/
class sel_111 extends mux_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(sel_111)      
  //----------------------------------------------------------------------------
  
  mux_sequence_item txn;
  int N=10;
  
  //----------------------------------------------------------------------------
  function new(string name="sel_111");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    for(int i=0;i<N;i++) begin
		txn=mux_sequence_item::type_id::create("txn");
		start_item(txn);
      	txn.randomize()with{txn.sel==3'b111;};
		finish_item(txn);
	end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass

/***************************************************
** class name  : sel_all
** description : sel values from 0 to 7 continiously
***************************************************/
class sel_all extends mux_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(sel_all)      
  //----------------------------------------------------------------------------
  
  mux_sequence_item txn;
  int N=10;
  
  //----------------------------------------------------------------------------
  function new(string name="sel_all");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
	for(int i=0;i<=N;i++) begin
		if(i<8) begin
			txn=mux_sequence_item::type_id::create("txn");
			start_item(txn);
			txn.randomize()with{txn.sel==i;};
			finish_item(txn);
		end
		else begin
			break;
		end
	end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass

