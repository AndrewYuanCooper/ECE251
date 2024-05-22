///////////////////////////////////////////////////////////////////////////////
//
// D Flip Flow (DFF) module
//
// A DFF module for your Computer Architecture Elements Catalog
//
// module: dff
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef _DFF_SV
`define _DFF_SV

`timescale 1ns/100ps

module DFF
    # (parameter n = 8)
(
  input clk, rst, en,
  input  logic [n-1:0] d,
  output logic [n-1:0] q,
  output logic [n-1:0] nq
);
    always @(posedge clk, posedge rst) begin
        if (en)
            begin
                if (rst)
                    begin
                        q  = 0;
                        nq = ~q;
                    end
                else
                    begin
                        q  <= d;
                        nq <= ~d;
                    end
            end
        else
            begin
                q = 8'bz;
                nq =8'bz;
            end
    end
endmodule
`endif // _DFF_SV