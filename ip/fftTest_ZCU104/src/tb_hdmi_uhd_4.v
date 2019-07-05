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

   localparam NPPC = 4;
   localparam DATA_WIDTH = 8;
   localparam FFT_WIDTH = 32;
   localparam CONFIG_WIDTH = 8;
   localparam FFT_LENGTH = 64;
   localparam [CONFIG_WIDTH-1:0] CONFIG_FFT = {1'b0, 6'b101010, 1'b1};
   localparam [CONFIG_WIDTH-1:0] CONFIG_IFFT = {1'b0, 6'b101010, 1'b0};
   localparam HEIGHT = 720;
   
   wire s_axis_video_aclk;
   wire s_axis_video_aresetn;

   wire rx_tlast;
   wire rx_tready;
   wire rx_tuser;
   wire rx_tvalid;
   wire [95:0] rx_tdata;

/* -----\/----- EXCLUDED -----\/-----
   wire        tx_tlast;
   wire        tx_tready;
   wire        tx_tuser;
   wire        tx_tvalid;
   wire [95:0] tx_tdata;
 -----/\----- EXCLUDED -----/\----- */

   wire [31:0] GRAY_tdata;
   wire        GRAY_tlast;
   wire        GRAY_tready;
   wire        GRAY_tuser;
   wire        GRAY_tvalid;

   wire [FFT_WIDTH-1:0] OUT_treal;
   wire [FFT_WIDTH-1:0] OUT_timag;
   wire 		OUT_tlast;
   wire 		OUT_tvalid;

   // --------------------------------------
   // HDMI input
   // --------------------------------------

   hdmi_in_uhd_4 file_input
     (
      .s_axis_video_aclk(s_axis_video_aclk),
      .s_axis_video_aresetn(s_axis_video_aresetn),
      .VIDEO_IN_tdata(rx_tdata),
      .VIDEO_IN_tlast(rx_tlast),
      .VIDEO_IN_tready(rx_tready),
      .VIDEO_IN_tuser(rx_tuser),
      .VIDEO_IN_tvalid(rx_tvalid)
      );

   // --------------------------------------
   // Video stream processing
   // --------------------------------------

   rgb2gray_uhd_4ppc_0 rgb2gray
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

   fftTest
     #(
       .NPPC(NPPC),
       .DATA_WIDTH(DATA_WIDTH),
       .FFT_WIDTH(FFT_WIDTH),
       .CONFIG_WIDTH(CONFIG_WIDTH),
       .FFT_LENGTH(FFT_LENGTH),
       .CONFIG_FFT(CONFIG_FFT),
       .CONFIG_IFFT(CONFIG_IFFT),
       .HEIGHT(HEIGHT)
       ) fft1D
       (
	.VIDEO_IN_tdata(GRAY_tdata),
	.VIDEO_IN_tlast(GRAY_tlast),
	.VIDEO_IN_tready(GRAY_tready),
	.VIDEO_IN_tuser(GRAY_tuser),
	.VIDEO_IN_tvalid(GRAY_tvalid),
	.s_axis_video_aclk(s_axis_video_aclk),
	.s_axis_video_aresetn(s_axis_video_aresetn),
	.track(1'b1),
	.update(1'b1),
	.operate(1'b1),
	.OUT_treal( OUT_treal),
	.OUT_timag( OUT_timag),
	.OUT_tlast( OUT_tlast),
	.OUT_tvalid(OUT_tvalid)
	);

/* -----\/----- EXCLUDED -----\/-----
   visualizeGray_uhd_4ppc_0 gray2rgb
     (
      .VIDEO_IN_tdata(GRAY_tdata),
      .VIDEO_IN_tlast(GRAY_tlast),
      .VIDEO_IN_tready(GRAY_tready),
      .VIDEO_IN_tuser(GRAY_tuser),
      .VIDEO_IN_tvalid(GRAY_tvalid),
      .s_axis_video_aclk(s_axis_video_aclk),
      .VIDEO_OUT_tdata(tx_tdata),
      .VIDEO_OUT_tlast(tx_tlast),
      .VIDEO_OUT_tready(tx_tready),
      .VIDEO_OUT_tuser(tx_tuser),
      .VIDEO_OUT_tvalid(tx_tvalid)
      );
 -----/\----- EXCLUDED -----/\----- */
   

   // --------------------------------------
   // HDMI output
   // --------------------------------------

   hdmi_out32_uhd_4
     #(
       .FFT_WIDTH(FFT_WIDTH),
       .FFT_LENGTH(FFT_LENGTH),
       .NAME("real32")
       ) file_output_real
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.VIDEO_OUT_tdata(OUT_treal),
	.VIDEO_OUT_tlast(OUT_tlast),
	.VIDEO_OUT_tvalid(OUT_tvalid)
	);

   hdmi_out32_uhd_4
     #(
       .FFT_WIDTH(FFT_WIDTH),
       .FFT_LENGTH(FFT_LENGTH),
       .NAME("imag32")
       ) file_output_imag
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.VIDEO_OUT_tdata(OUT_timag),
	.VIDEO_OUT_tlast(OUT_tlast),
	.VIDEO_OUT_tvalid(OUT_tvalid)
	);

endmodule
