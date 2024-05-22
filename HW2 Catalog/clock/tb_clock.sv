///////////////////////////////////////////////////////////////////////////////
//
// Clock TESTBENCH module
//
// A clock testbench module for your Computer Architecture Elements Catalog
//
// module: tb_clock
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./clock.sv"
module tb_clock;
  	parameter P = 20;
  	reg RST;
	reg EN;
  	wire CLK;
  
  // UUT
  	clock #(.period(P)) uut (
      .rst(RST),
      .en(EN),
      .clk(CLK)
    );  
  
  initial begin
        $dumpfile("tb_clock.vcd"); 
    $dumpvars(0, uut);
  end

  initial begin
    EN = 1'b0;
    RST = 1'b0;
    #10;
      
    EN = 1'b1;
    RST = 1'b0;
    #10;
    
    RST = 1'b1;
    #10;
    
    RST = 1'b0;
    #10;
  end
  
   initial begin
        #100;
        $finish;
    end
  
  initial begin
    $monitor("Time = %0t, clk = %b, en = %b, rst = %b", $time, CLK, EN, RST);
  end
  
endmodule