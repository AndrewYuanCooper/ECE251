///////////////////////////////////////////////////////////////////////////////
//
// D Flip Flop TESTBENCH module
//
// A DFF testbench module for your Computer Architecture Elements Catalog
//
// module: tb_DFF
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "./dff.sv"
module tb_DFF;
    parameter N = 8;
    reg CLK, RST, EN;
  	  logic [N-1:0] D;
  	  logic [N-1:0] Q;
      logic [N-1:0] NQ;
  
     // UUT
     DFF #(.n(N)) uut (
        .en(EN),
        .rst(RST),
        .clk(CLK),
        .d(D),
        .q(Q),
        .nq(NQ)
      );

    initial begin
      $dumpfile("tb_DFF.vcd"); 
      $dumpvars(0, tb_DFF);
    end

       initial CLK = 0;
    always #5 CLK = !CLK;


    // Test 
    initial begin
      	EN = 0;
      	RST = 1; 
        D = 0;      
        #10;
      
      	EN = 1;
        RST = 1;  
        D = 0;     
        #10;

      	EN = 1;
        RST = 0;
        for (int i = 0; i < 2**N; i++) begin
            D = i;
            #10;   
        end

        // End
        #20 $finish;
    end

       // Monitor output
    initial begin
      $monitor("Time = %0t, en = %b,  rst = %b, d = %b, q = %b, nq = %b", $time, EN, RST, D, Q, NQ);
    end

endmodule