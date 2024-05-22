///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Right (slr) TESTBENCH module
//
// A slr testbench module for your Computer Architecture Elements Catalog
//
// module: tb_slr
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./slr.sv"
module tb_slr;

    parameter N = 8;   
    parameter SHIFT = 1;
  	reg EN;
  	reg [N-1:0] IN;    
  	logic [N-1:0] OUT;  

    // UTT
  slr #(.n(N), .shift(SHIFT)) uut(
    	.en(EN),
    	.in(IN),
    	.out(OUT)
    );

    // Start test
    initial begin
      $dumpfile("tb_slr.vcd"); 
      $dumpvars(0, tb_slr);
    end
  
  	initial begin
      EN = 1'b0;
      #10
      
      EN = 1'b1;
      for (int i = 0; i < (1 << N); i++) begin
            IN = i;
            #10; 
        end

        $finish;
    end

    // Monitor output
    initial begin
      	$monitor("Time = %0t, en = %b, in = %b, out = %b", $time, EN, IN, OUT);
    end

endmodule