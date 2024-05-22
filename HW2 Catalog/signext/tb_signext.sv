///////////////////////////////////////////////////////////////////////////////
//
// EXAMPLE TESTBENCH module
//
// An example testbench module for your Computer Architecture Elements Catalog
//
// module: tb_example_module
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./signext.sv"
module tb_signext;

    parameter IN_N = 2;
    parameter OUT_N = 8; 
  	reg EN;
  	reg [IN_N-1:0] IN;   
  	wire [OUT_N-1:0] OUT; 

    // UTT
  signext #(.in_n(IN_N), .out_n(OUT_N)) uut(
    	.en(EN),
    	.in(IN),
    	.out(OUT)
    );

   // Start test
    initial begin
        $dumpfile("tb_signext.vcd"); 
        $dumpvars(0, tb_signext);    

        
        // Test some cases to enure it works for a range of values 
        EN = 0;
      	#10;
      
      	EN = 1;
      	IN = 0;
        #10; 
        for (int i = -2; i <= 2; i++) begin
            IN = i; 
            #10;    
        end

      	IN = {1'b1, {(IN_N-1){1'b0}}}; // Smallest negative number
        #10;
      	IN = {1'b0, {(IN_N-1){1'b1}}}; // Largest positive number
        #10;

    end

    // Monitor signals and display changes
    initial begin
      $monitor("Time = %0t | in = %b | EN = %b | out = %b", $time, IN, EN, OUT);
    end

endmodule