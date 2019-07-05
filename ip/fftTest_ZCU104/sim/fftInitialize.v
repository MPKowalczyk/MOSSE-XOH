`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2019 12:58:10 PM
// Design Name: 
// Module Name: fftInitialize
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


module fftInitialize
  #(
    parameter CONFIG_WIDTH = 8,
    parameter [CONFIG_WIDTH-1:0] CONFIG_DATA = {1'b0, 6'b101010, 1'b1}
    )
   (
    input 		      s_axis_video_aclk,
    input 		      s_axis_video_aresetn,
    output [CONFIG_WIDTH-1:0] CONFIG_OUT_tdata,
    input 		      CONFIG_OUT_tready,
    output 		      CONFIG_OUT_tvalid
    );

   reg 			      prevRst = 1'b1;
   reg 			      initialize = 1'b0;
   reg 			      valid = 1'b0;

   always @(posedge s_axis_video_aclk)
     begin
	prevRst <= s_axis_video_aresetn;

	if (!prevRst && s_axis_video_aresetn) initialize <= 1'b1;

	if (initialize && CONFIG_OUT_tready) valid <= 1'b1;
	else valid <= 1'b0;

	if (valid && initialize) initialize <= 1'b0;
	
     end

   assign CONFIG_OUT_tdata = CONFIG_DATA;
   assign CONFIG_OUT_tvalid = valid;
   
   
endmodule
