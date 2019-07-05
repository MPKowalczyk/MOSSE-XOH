`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2019 12:00:19 PM
// Design Name: 
// Module Name: Conjugate
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


module Conjugate
  #(
    parameter WIDTH = 32
    )
   (
    input [2*WIDTH-1 : 0] in,
    output [2*WIDTH-1 :0] out
    );

   wire signed [WIDTH-1 : 0] 	  in_imag = in[2*WIDTH-1 : WIDTH];
   wire signed [WIDTH-1 : 0] 	  in_real = in[WIDTH-1 : 0];
   wire signed [WIDTH-1 : 0] 	  out_imag = -in_imag;
   wire signed [WIDTH-1 : 0] 	  out_real = in_real;

   assign out = {out_imag, out_real};
   
endmodule
