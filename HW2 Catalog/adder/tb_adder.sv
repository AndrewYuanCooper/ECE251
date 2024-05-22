///////////////////////////////////////////////////////////////////////////////
//
// Full Adder TESTBENCH module
//
// An adder testbench module for your Computer Architecture Elements Catalog
//
// module: tb_adder
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./adder.sv"

module tb_adder;
  parameter N = 8;  	
  reg [N - 1:0] A, B; 
  reg C_IN, EN;           
  wire [N - 1:0] S;  	
  wire C_OUT;         

  // UUT
  adder #(.n(N)) uut(
      .a(A), 
      .b(B), 
      .c_in(C_IN), 
      .s(S), 
    	.en(EN),
      .c_out(C_OUT)
    );

    // Initialize testbench
    initial begin
        $dumpfile("tb_adder.vcd"); 
        $dumpvars(0, uut);         
        
        // Test specific A = 10101010 and B = 00110011 => sum = 11011101
        EN= 1'b0;
      	#10
      	
      	EN =1'b1;
      	A = 8'b10101010; 
        B = 8'b00110011;
        C_IN = 0; 
        #10;
   
        A = 8'b10000001; 
        B = 8'b00100100; 
        C_IN = 1; 
        #10;

        A = 8'b11111111; 
        B = 8'b00000001; 
        C_IN = 0; 
        #10;

        $finish;
    end
  
    initial begin
      $monitor("Time = %0t: a = %b, b = %b, c_in = %b -> s = %b, en = %b, c_out = %b", $time, A, B, C_IN, S, EN, C_OUT);
    end

endmodule