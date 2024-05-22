///////////////////////////////////////////////////////////////////////////////
//
// Full Adder module
//
// Full adder module for your Computer Architecture Elements Catalog
//
// module: adder
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef ADDER
`define ADDER

`timescale 1ns/100ps

module adder #(parameter n = 8)(  
    input wire [n - 1:0] a,
    input wire [n - 1:0] b,
    input wire c_in,
    input wire en,
    output wire [n - 1:0] s,
    output wire c_out
);
    wire [n:0] carry; 
    assign carry[0] = c_in;

    genvar i;
    generate
        for (i = 0; i < n; i = i + 1) begin : full_adder_loop
            wire s_internal; 
            wire c_out_internal; 
            full_adder fa (
                .a(a[i]),
                .b(b[i]),
                .c_in(carry[i]),
                .s(s_internal),
                .c_out(c_out_internal)
            );
          	assign s[i] = en ? s_internal : 1'bz; 
          	assign carry[i + 1] = en ? c_out_internal : 1'bz; 
        end
    endgenerate

  	assign c_out = en ? carry[n] : 1'bz; 

endmodule

module full_adder(
    input a,
    input b,
    input c_in,
    output s,
    output c_out
);
    assign s = a ^ b ^ c_in;
    assign c_out = (a & b) | (a & c_in) | (b & c_in);
endmodule

`endif // ADDER