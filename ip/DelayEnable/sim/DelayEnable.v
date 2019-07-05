`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2017 04:39:47 PM
// Design Name: 
// Module Name: Delay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DelayEnable
  #(
    parameter WIDTH = 1,
    parameter DELAY = 1
    )
   (
    input [WIDTH-1:0]  Input,
    input 	       CLK_in,
    input 	       CLK_en,
    output [WIDTH-1:0] Output
    );

   wire [WIDTH-1:0]    chain[DELAY:0];
   assign chain[0] = Input;
   assign Output = chain[DELAY];

   genvar 	       i;

   generate
      for(i=0;i<DELAY;i=i+1)
	begin
           RegisterEnable #(.WIDTH(WIDTH)) reg_i
            (
             .CLK_in(CLK_in),
	     .CLK_en(CLK_en),
             .d(chain[i]),
             .q(chain[i+1])
             );
	end
   endgenerate

endmodule

module RegisterEnable
  #(
    parameter WIDTH=1
    )
   (
    input 	       CLK_in,
    input 	       CLK_en,
    input [WIDTH-1:0]  d,
    output [WIDTH-1:0] q
    );

   reg [WIDTH-1:0]     val=0;

   always @(posedge CLK_in)
     begin
	if (CLK_en) val<=d;
     end

   assign q=val;

endmodule
