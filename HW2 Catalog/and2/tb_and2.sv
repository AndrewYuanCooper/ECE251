///////////////////////////////////////////////////////////////////////////////
//
// Module: tb_and2
//
// Testbench for and2
//
// module: tb_and2
// hdl: SystemVerilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./and2.sv"
module tb_and2;

    localparam N = 8;  
  	reg EN;
  	reg [N-1:0] X1, X2;  
  	wire [N-1:0] Q1;     

  	// (UUT)
  	and2 #(.n(N)) uut(
      .x1(X1), .x2(X2), .en(EN), .q1(Q1)
    );
  
    initial begin
        $dumpfile("tb_and2.vcd"); 
      	$dumpvars(0, uut);
    end

    initial begin
      $monitor ("Time = %t, en = %b, x1 = %b, x2 = %b, q1 = %b", $time, EN,  X1, X2, Q1);
    end

    initial begin
    #0
    	EN = 1'b0;
    #10
      	EN = 1'b1;
        X1 = 2'b00;
        X2 = 2'b00;
    #10
        X1 = 2'b01;
        X2 = 2'b01;
    #10
        X1 = 2'b10;
        X2 = 2'b10;
    #10
        X1 = 2'b11;
        X2 = 2'b11;
    #10
        X1 = 2'b01;
        X2 = 2'b10;
    #10
        X1 = 2'b01;
        X2 = 2'b11;
    #10
        $finish;
    end
endmodule
