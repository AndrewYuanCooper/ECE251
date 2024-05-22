///////////////////////////////////////////////////////////////////////////////
//
// 4:1 Multiplexer TESTBENCH module
//
// A 4:1 mux testbench module for your Computer Architecture Elements Catalog
//
// module: tb_mux_4to1
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./mux_4to1.sv"
module tb_mux_4to1;

    parameter N = 8;  
  	reg [N-1:0] A, B, C, D;  
  	reg [1:0] SEL; 
  	reg EN;	 
  	wire [N-1:0] Y;    

   // UTT
  	mux_4to1 #(.n(N)) uut(
      .a(A), 
      .b(B),
      .c(C),
      .d(D),
      .en(EN),
      .sel(SEL), 
      .y(Y)
    );

    // Start test
    initial begin
      	$dumpfile("tb_mux_4to1.vcd"); 
        $dumpvars(0, tb_mux_4to1);
    end
  
  	initial begin
      		EN = 1'b0;
      		#10;
      	for (int i = 0; i < 2**N; i++) begin
            EN = 1'b1;
          	SEL = 2'b00;
          	A = i; B = ~i; C = 8'b10101010; D = 8'b11110000; 
          	#10;
           	SEL = 2'b01;
            #10; 
          	
          	SEL = 2'b10;
            #10;
          	
          	SEL = 2'b11;
            #10; 
        end

        $finish;
    end

    initial begin
      $monitor("Time = %t | a = %b | b = %b | c = %b | d = %b |sel = %b | en = %b | y = %b", $time, A, B, C, D, SEL, EN, Y);
    end
endmodule
