//////////////////////////////////////////////////////////////////////////////
//
// Module: and2
//
// 2-input AND gate
//
// module: and2
// hdl: SystemVerilog
// modeling: Gate Level Modeling
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`ifndef AND2
`define AND2 

module and2 #(
    parameter n = 8
)(
  input wire en,
  input logic [n-1:0] x1, x2, 
  output logic [n-1:0] q1      
);
always @* begin
    if (en) begin
        q1 = x1 & x2; 
    end else begin
        q1 = {n{1'bz}}; 
    end
end
endmodule

`endif // AND2
