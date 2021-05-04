
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "mux_sequence_item.sv"        // transaction class
 `include "mux_sequence.sv"             // sequence class
 `include "mux_sequencer.sv"            // sequencer class
 `include "mux_driver.sv"               // driver class
 `include "mux_monitor.sv"
 `include "mux_agent.sv"                // agent class  
 `include "mux_coverage.sv"             // coverage class
 `include "mux_scoreboard.sv"
 `include "mux_env.sv"                  // environment class

 `include "mux_test.sv"                    // test1
 
endpackage
`endif 


