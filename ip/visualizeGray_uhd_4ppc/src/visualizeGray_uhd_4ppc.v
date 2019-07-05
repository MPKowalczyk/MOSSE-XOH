`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2018 04:57:51 PM
// Design Name: 
// Module Name: visualizeBin_uhd_4ppc
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


module visualizeGray_uhd_4ppc
   (
    input [31:0]  VIDEO_IN_tdata,
    input 	  VIDEO_IN_tlast,
    output 	  VIDEO_IN_tready,
    input 	  VIDEO_IN_tuser,
    input 	  VIDEO_IN_tvalid,
    input 	  s_axis_video_aclk,
    output [95:0] VIDEO_OUT_tdata,
    output 	  VIDEO_OUT_tlast,
    input 	  VIDEO_OUT_tready,
    output 	  VIDEO_OUT_tuser,
    output 	  VIDEO_OUT_tvalid
    );

   assign VIDEO_OUT_tdata[95-:24] = {VIDEO_IN_tdata[31-:8], VIDEO_IN_tdata[31-:8], VIDEO_IN_tdata[31-:8]};
   assign VIDEO_OUT_tdata[71-:24] = {VIDEO_IN_tdata[23-:8], VIDEO_IN_tdata[23-:8], VIDEO_IN_tdata[23-:8]};
   assign VIDEO_OUT_tdata[47-:24] = {VIDEO_IN_tdata[15-:8], VIDEO_IN_tdata[15-:8], VIDEO_IN_tdata[15-:8]};
   assign VIDEO_OUT_tdata[23-:24] = {VIDEO_IN_tdata[7 -:8], VIDEO_IN_tdata[7 -:8], VIDEO_IN_tdata[7 -:8]};

   assign VIDEO_OUT_tlast = VIDEO_IN_tlast;
   assign VIDEO_IN_tready = VIDEO_OUT_tready;
   assign VIDEO_OUT_tuser = VIDEO_IN_tuser;
   assign VIDEO_OUT_tvalid = VIDEO_IN_tvalid;

endmodule
