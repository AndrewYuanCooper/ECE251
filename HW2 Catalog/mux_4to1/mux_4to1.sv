///////////////////////////////////////////////////////////////////////////////
//
// 4:1 multiplexer module
//
// A 4:1 mux module for your Computer Architecture Elements Catalog
//
// module: mux_4to1
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

`ifndef MUX_4TO1
`define MUX_4TO1

module mux_4to1 #(
    parameter n = 8  
)(
    input wire en,                   
    input wire [1:0] sel,              
  	input wire [n-1:0] a, b, c, d,   
  	output reg [n-1:0] y    
);

always @(*) begin
    if (en) begin
        case(sel)
            2'b00: y = a;  
            2'b01: y = b;  
            2'b10: y = c; 
            2'b11: y = d;  
        endcase
    end else begin
      	y = {n{2'bz}}; 
    end
end

endmodule

`endif // MUX_4TO1