///////////////////////////////////////////////////////////////////////////////
//
// Counter module
//
// A counter module for your Computer Architecture Elements Catalog
//
// module: counter
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`ifndef COUNTER
`define COUNTER

module counter
    #(
        parameter n = 8
    ) 
  	(
    input clk,
    input rst,
    input en,
    input up_d,
    output reg [(n-1):0] count
);

  always @(posedge clk) begin
    if (rst) begin
            count <= 0;  
      end else if (en) begin
        if (up_d) begin
                count <= count + 1;  
          end else begin
                count <= count - 1; 
          end
      end
  end
endmodule

`endif // COUNTER
