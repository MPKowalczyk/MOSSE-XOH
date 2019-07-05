`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Tomasz Kryjak / Marcin Kowalczyk
// 
// Create Date:    11:29:28 10/28/2013 
// Design Name: 
// Module Name:    tb_hdmi_uhd_4
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Wrapper for simulating UHD video processing modules - 4 pixels per clock cycle.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tb_hdmi_uhd_4(
		     );
   

   wire s_axis_video_aclk;

   wire rx_tlast;
   wire rx_tready;
   wire rx_tuser;
   wire rx_tvalid;

   wire [95:0] rx_tdata;

   wire [31:0] GRAY_tdata;
   wire        GRAY_tlast;
   wire        GRAY_tready;
   wire        GRAY_tuser;
   wire        GRAY_tvalid;

   wire        tx_tlast;
   wire        tx_tready;
   wire        tx_tuser;
   wire        tx_tvalid;

   wire [95:0] tx_tdata;

   // --------------------------------------
   // HDMI input
   // --------------------------------------

   hdmi_in_uhd_4 file_input
     (
      .s_axis_video_aclk(s_axis_video_aclk),
      .VIDEO_IN_tdata(rx_tdata),
      .VIDEO_IN_tlast(rx_tlast),
      .VIDEO_IN_tready(rx_tready),
      .VIDEO_IN_tuser(rx_tuser),
      .VIDEO_IN_tvalid(rx_tvalid)
      );

   // --------------------------------------
   // Video stream processing
   // --------------------------------------

   rgb2gray_test rgb2gray
     (
      .VIDEO_IN_tdata(rx_tdata),
      .VIDEO_IN_tlast(rx_tlast),
      .VIDEO_IN_tready(rx_tready),
      .VIDEO_IN_tuser(rx_tuser),
      .VIDEO_IN_tvalid(rx_tvalid),
      .s_axis_video_aclk(s_axis_video_aclk),
      .VIDEO_OUT_tdata(GRAY_tdata),
      .VIDEO_OUT_tlast(GRAY_tlast),
      .VIDEO_OUT_tready(GRAY_tready),
      .VIDEO_OUT_tuser(GRAY_tuser),
      .VIDEO_OUT_tvalid(GRAY_tvalid)
      );

   CF_bbox
     #(
       .NPPC(4),
       .DATA_WIDTH(8),
       .POSITION_WIDTH(12),
       .FFL_LENGTH(64),
       .HEIGHT(64)
       ) draw
       (
	.VIDEO_IN_tdata(GRAY_tdata),
	.VIDEO_IN_tvalid(GRAY_tvalid),
	.VIDEO_IN_tuser(GRAY_tuser),
	.VIDEO_IN_tlast(GRAY_tlast),
	.VIDEO_IN_tready(GRAY_tready),
	.xStart(10),
	.yStart(10),
	.VIDEO_OUT_tdata(tx_tdata),
	.VIDEO_OUT_tvalid(tx_tvalid),
	.VIDEO_OUT_tuser(tx_tuser),
	.VIDEO_OUT_tlast(tx_tlast),
	.VIDEO_OUT_tready(tx_tready),
	.s_axis_video_aclk(s_axis_video_aclk)
	);


   // --------------------------------------
   // HDMI output
   // --------------------------------------

   hdmi_out_uhd_4 file_output
     (
      .s_axis_video_aclk(s_axis_video_aclk),
      .VIDEO_OUT_tdata(tx_tdata),
      .VIDEO_OUT_tlast(tx_tlast),
      .VIDEO_OUT_tready(tx_tready),
      .VIDEO_OUT_tuser(tx_tuser),
      .VIDEO_OUT_tvalid(tx_tvalid)
      );

endmodule
