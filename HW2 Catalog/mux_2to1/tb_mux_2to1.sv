///////////////////////////////////////////////////////////////////////////////
//
// 2:1 multiplexer TESTBENCH module
//
// A 2:1 mux testbench module for your Computer Architecture Elements Catalog
//
// module: tb_mux_2to1
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./mux_2to1.sv"
module tb_mux_2to1;

    parameter N = 8;  
 	reg [N-1:0] A, B;  
    reg SEL, EN;	// 1 bit select 
  	wire [N-1:0] Y;    

   // UTT
  	mux_2to1 #(.n(N)) uut(
      .a(A), 
      .b(B), 
      .en(EN),
      .sel(SEL), 
      .y(Y)
    );

    // Start test
    initial begin
        $dumpfile("tb_mux_2to1.vcd"); 
        $dumpvars(0, tb_mux_2to1);
    end
  
  	initial begin
      		EN = 1'b0;
      		#10;
      	for (int i = 0; i < 2**N; i++) begin
            EN = 1'b1;
          	SEL = 1'b0;
            A = i; B = ~i; #10;
	
            SEL = 1;
            #10; 
        end

        $finish;
    end

    initial begin
      $monitor("Time = %t | a = %b | b = %b | sel = %b | en = %b | y = %b", $time, A, B, SEL, EN, Y);
    end
endmodule