///////////////////////////////////////////////////////////////////////////////
//
// 2:1 multiplexer module
//
// A 2:1 mux module for your Computer Architecture Elements Catalog
//
// module: mux_2to1
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`ifndef MUX_2TO1
`define MUX_2TO1

module mux_2to1 #(
    parameter n = 8  
)(
    input en, 
    input wire [n-1:0] a,  
    input wire [n-1:0] b,  
    input wire sel,       
    output reg [n-1:0] y  
); 
    always @(*) begin
        if(en)
            y = sel ? b : a;  
        else
            y = {n{1'bz}}; 
    end
endmodule

`endif // MUX_2TO1