///////////////////////////////////////////////////////////////////////////////
//
// Clock module
//
// A clock module for your Computer Architecture Elements Catalog
//
// module: clock
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`ifndef CLOCK
`define CLOCK

module clock #(
    parameter period = 20  
)(
  	input wire rst,
  	input wire en,
    output reg clk = 1'b0
);
  
 always begin
   if(en) begin
     #(period / 2) clk = ~clk;  // 50% Duty Cycle	
     if (rst) begin
       clk = 1'b0;
       #(period / 2);
     end
   end else begin
       clk = 1'bz;
       @(posedge en);
   end
   if(rst) begin
     clk = 1'b0;
   end
 end
endmodule

`endif // CLOCK
