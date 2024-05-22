///////////////////////////////////////////////////////////////////////////////
//
// Counter TESTBENCH module
//
// A counter testbench module for your Computer Architecture Elements Catalog
//
// module: tb_counter
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps
`include "./counter.sv"
module tb_counter;

    parameter N = 8;
    reg CLK, RST, EN, UP_D;
  	wire [N-1:0] COUNT;
  
    // (UUT)
  	counter #(.n(N)) uut(
      .clk(CLK), .rst(RST), .en(EN), .count(COUNT), .up_d(UP_D)
    );
    
  	initial begin
      $dumpfile("tb_counter.vcd");
      $dumpvars(0, uut);
    end
  
    initial CLK = 0;
    always #10 CLK = ~CLK;

    initial begin
        #0
      	EN = 1'b0;
        #10;
      	
      	EN = 1'b1;
      	RST = 1'b1;
      	#10;
     
      	RST = 1'b0; 
        UP_D = 1'b1;
      	#100;
	
      	UP_D = 1'b0;
        RST = 1'b0;
        #10;
      	#10;

        #10 $finish; 
    end
      
    // Monitor output
    initial begin
      $monitor("Time = %0t, reset = %b, en = %b, up_down = %b, count = %b", $time, RST, EN, UP_D, COUNT);
    end

endmodule