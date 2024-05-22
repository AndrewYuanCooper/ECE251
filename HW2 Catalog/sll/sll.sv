///////////////////////////////////////////////////////////////////////////////
//
// Shift Logical Left module
//
// A shift logical left (sll) module for your Computer Architecture Elements Catalog
//
// module: sll
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`ifndef SLL
`define SLL

module sll #(
    parameter n = 8,  
    parameter shift = 1    
)(
  	input wire en,
  	input wire [n-1:0] in,  
  	output logic [n-1:0] out 
);
  
always @(*) begin
      if(en) begin
        out = in << shift;
      end
      else begin
        out = {n{1'bz}};
      end
end
endmodule

`endif // SLL