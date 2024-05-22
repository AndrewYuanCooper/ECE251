///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Left (sll) TESTBENCH module
//
// A sll testbench module for your Computer Architecture Elements Catalog
//
// module: tb_sll
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./sll.sv"
module tb_sll;

   parameter N = 8;   
   parameter SHIFT = 1;
  	reg EN;
  	reg [N-1:0] IN;    
  	logic [N-1:0] OUT;  

    // UTT
  sll #(.n(N), .shift(SHIFT)) uut(
    	.en(EN),
    	.in(IN),
    	.out(OUT)
    );

    // Start test
    initial begin
      $dumpfile("tb_sll.vcd"); 
      $dumpvars(0, tb_sll);
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