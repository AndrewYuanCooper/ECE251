///////////////////////////////////////////////////////////////////////////////
//
// Sign Extender module
//
// A sign extension module for your Computer Architecture Elements Catalog
//
// module: signext
// hdl: Verilog
//
// author: Andrew Yuan <andrew.yuan@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`ifndef SIGNEXT
`define SIGNEXT

module signext #(
    parameter in_n = 2, 
    parameter out_n = 8  
)(
  	input wire en,
  	input logic [in_n-1:0] in,    
  	output logic [out_n-1:0] out  
);

always @* begin
  	if(en) begin
        if (out_n <= in_n) begin
          $error("OUT_WIDTH must be greater than IN_WIDTH."); //Added from Kristof 
        end
  		else
          out <= {{(out_n-in_n){in[in_n-1]}}, in};
		end
  	else begin
      	out <= {out_n{1'bz}};
    end
end
endmodule

`endif // SIGNEXT