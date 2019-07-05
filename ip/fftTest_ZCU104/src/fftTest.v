`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Marcin Kowalczyk
// 
// Create Date: 01/22/2019 12:46:55 PM
// Design Name: 
// Module Name: fftTest
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


module fftTest
  #(
    parameter NPPC = 4,
    parameter DATA_WIDTH = 8,
    parameter FFT_WIDTH = 32,
    parameter CONFIG_WIDTH = 8,
    parameter NFFT = 6,
    parameter FFT_LENGTH = 64,
    parameter [CONFIG_WIDTH-1:0] CONFIG_FFT = {1'b0, 6'b101010, 1'b1},
    parameter [CONFIG_WIDTH-1:0] CONFIG_IFFT = {1'b0, 6'b101010, 1'b0},
    parameter HEIGHT = 2160,
    parameter BRAM_ADDR_WIDTH = 12,
    parameter BIGBRAM_ADDR_WIDTH = 14,
    parameter POSITION_WIDTH = 12
    )
   (
    input [NPPC * DATA_WIDTH-1:0]   VIDEO_IN_tdata,
    input 			    VIDEO_IN_tlast,
    output 			    VIDEO_IN_tready,
    input 			    VIDEO_IN_tuser,
    input 			    VIDEO_IN_tvalid,
    input 			    track,
    input 			    update,
    input 			    operate,
    input 			    s_axis_video_aclk,
    input 			    s_axis_video_aresetn,
    output [FFT_WIDTH-1:0] 	    OUT_treal,
    output [FFT_WIDTH-1:0] 	    OUT_timag,
    output 			    OUT_tlast,
    output 			    OUT_tvalid,
    output [POSITION_WIDTH - 1 : 0] OUT_xPos,
    output [POSITION_WIDTH - 1 : 0] OUT_yPos
    );
   
   wire [CONFIG_WIDTH-1:0] 	    CONFIG_IN_tdata;
   wire 			    CONFIG_IN_tready;
   wire 			    CONFIG_IN_tvalid;

   wire [CONFIG_WIDTH-1:0] 	    CONFIG_IN2_tdata;
   wire 			    CONFIG_IN2_tready;
   wire 			    CONFIG_IN2_tvalid;

   wire [CONFIG_WIDTH-1:0] 	    CONFIG_IN3_tdata;
   wire 			    CONFIG_IN3_tready;
   wire 			    CONFIG_IN3_tvalid;

   wire [CONFIG_WIDTH-1:0] 	    CONFIG_IN4_tdata;
   wire 			    CONFIG_IN4_tready;
   wire 			    CONFIG_IN4_tvalid;

   wire [CONFIG_WIDTH-1:0] 	    BIGCONFIG_IN_tdata;
   wire 			    BIGCONFIG_IN_tready;
   wire 			    BIGCONFIG_IN_tvalid;

   wire [CONFIG_WIDTH-1:0] 	    BIGCONFIG_IN2_tdata;
   wire 			    BIGCONFIG_IN2_tready;
   wire 			    BIGCONFIG_IN2_tvalid;

   wire 			    BIGFIFO_tvalid;
   wire 			    BIGFIFO_tready;
   wire [NPPC * DATA_WIDTH-1:0]     BIGFIFO_tdata;
   wire 			    BIGFIFO_tlast;

   wire [DATA_WIDTH - 1 : 0] 	    BIGCONVERTER_tdata;
   wire 			    BIGCONVERTER_tlast;
   wire 			    BIGCONVERTER_tready;
   wire 			    BIGCONVERTER_tvalid;

   reg [BIGBRAM_ADDR_WIDTH / 2 - 1 : 0] BIGBRAM_xPos = 7'b0;
   reg [BIGBRAM_ADDR_WIDTH / 2 - 1 : 0] BIGBRAM_yPos = 7'b0;

   wire [BIGBRAM_ADDR_WIDTH - 1 : 0] 	BIGBRAM_addr;
   wire [DATA_WIDTH - 1 : 0] 		BIGBRAM_out;

   reg 					BIGBRAM_tlast = 1'b0;
   wire 				dBIGBRAM_tlast;

   wire 				dBIGBRAM_tvalid;
   wire 				BIGBRAM_tready;

   reg 					saved_BIGBRAM = 1'b0;
   reg 					read_BIGBRAM = 1'b0;
   reg 					completed_IFFT2 = 1'b0;

   reg 					centerLocation = 1'b0;

   wire [FFT_WIDTH - 1 : 0] 		BIGLUT_tdata;
   wire 				BIGLUT_tlast;
   wire 				BIGLUT_tready;
   wire 				BIGLUT_tvalid;

   wire [FFT_WIDTH - 1 : 0] 		dBIGLUT_tdata;
   wire 				dBIGLUT_tvalid;
   wire 				dBIGLUT_tlast;


   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BIGHANN_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BIGHANN_yPos = 6'b0;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	BIGHANN_addr;
   wire [FFT_WIDTH - 1 : 0] 		BIGHANN_tdata;
   wire 				BIGHANN_tready;

   wire [FFT_WIDTH - 1 : 0] 		MULT_BIGHANN_tdata;
   wire 				MULT_BIGHANN_tready;
   wire 				MULT_BIGHANN_tvalid;
   wire 				MULT_BIGHANN_tlast;

   wire [2 * FFT_WIDTH - 1 : 0] 	BIGFFT_tdata;
   wire [FFT_WIDTH - 1 : 0] 		BIGFFT_treal;
   wire [FFT_WIDTH - 1 : 0] 		BIGFFT_timag;
   wire 				BIGFFT_tvalid;
   wire 				BIGFFT_tlast;
   wire 				BIGFFT_tready; 			  
   wire 				event_frame_started5;
   wire 				event_tlast_unexpected5;
   wire 				event_tlast_missing5;
   wire 				event_data_in_channel_halt5;

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BRAM_BIGFFT_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BRAM_BIGFFT_yPos = 6'b0;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	BRAM_BIGFFT_addr;
   wire [2*FFT_WIDTH - 1 : 0] 		BRAM_BIGFFT_out;
   wire [FFT_WIDTH - 1 : 0] 		BRAM_BIGFFT_treal;
   wire [FFT_WIDTH - 1 : 0] 		BRAM_BIGFFT_timag;

   reg 					BRAM_BIGFFT_tlast = 1'b0;
   wire 				dBRAM_BIGFFT_tlast;

   wire 				dBRAM_BIGFFT_tvalid;
   wire 				BRAM_BIGFFT_tready;
   
   reg 					read_BRAM_BIGFFT = 1'b0;

   wire [2*FFT_WIDTH-1:0] 		BIGFFT2_tdata;
   wire [FFT_WIDTH-1:0] 		BIGFFT2_treal;
   wire [FFT_WIDTH-1:0] 		BIGFFT2_timag;
   wire 				BIGFFT2_tlast;
   wire 				BIGFFT2_tvalid;
   wire 				BIGFFT2_tready; 
   wire 				event_frame_started6;
   wire 				event_tlast_unexpected6;
   wire 				event_tlast_missing6;
   wire 				event_data_in_channel_halt6;

   //------------------Update filter coefficients-------------------------

   wire [2*FFT_WIDTH-1 : 0] 		Fconj;

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	GAUSS_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	GAUSS_yPos = 6'b0;
   
   wire [BRAM_ADDR_WIDTH - 1 : 0] 	GAUSS_addr;
   wire [2*FFT_WIDTH-1:0] 		GAUSS_tdata;
   wire [FFT_WIDTH-1 :0] 		GAUSS_treal;
   wire [FFT_WIDTH-1 :0] 		GAUSS_timag;
   wire 				GAUSS_tready;

   wire [2*FFT_WIDTH-1:0] 		dBIGFFT2_tdata;
   wire 				dBIGFFT2_tlast;
   wire 				dBIGFFT2_tvalid;

   wire [136 : 0] 			eAMULT_tdata;
   wire signed [2 * FFT_WIDTH : 0] 	eAMULT_treal;
   wire signed [2 * FFT_WIDTH : 0] 	eAMULT_timag;
   wire signed [2 * FFT_WIDTH : 0] 	mAMULT_treal;
   wire signed [2 * FFT_WIDTH : 0] 	mAMULT_timag;
   wire [4 * FFT_WIDTH - 1 : 0] 	AMULT_tdata;
   wire 				AMULT_tvalid;
   wire 				AMULT_tlast;
   wire [2 * FFT_WIDTH - 1 : 0] 	AMULT_treal;
   wire [2 * FFT_WIDTH - 1 : 0] 	AMULT_timag;
   wire 				AMULT_tready;

   wire [136 : 0] 			eBMULT_tdata;
   wire signed [2 * FFT_WIDTH : 0] 	eBMULT_treal;
   wire signed [2 * FFT_WIDTH : 0] 	eBMULT_timag;
   wire signed [2 * FFT_WIDTH : 0] 	mBMULT_treal;
   wire signed [2 * FFT_WIDTH : 0] 	mBMULT_timag;
   wire [4 * FFT_WIDTH - 1 : 0] 	BMULT_tdata;
   wire 				BMULT_tvalid;
   wire 				BMULT_tlast;
   wire [2 * FFT_WIDTH - 1 : 0] 	BMULT_treal;
   wire [2 * FFT_WIDTH - 1 : 0] 	BMULT_timag;
   wire 				BMULT_tready;

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	A_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	A_yPos = 6'b0;
   
   wire [BRAM_ADDR_WIDTH - 1 : 0] 	A_addr;
   wire [4*FFT_WIDTH-1:0] 		A_tdata;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	A_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	A_timag;
   wire 				A_tready;

   wire signed [2 * FFT_WIDTH - 1 : 0] 	Ats_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	Ats_timag;

   wire signed [2 * FFT_WIDTH - 1 : 0] 	As_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	As_timag;

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	B_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	B_yPos = 6'b0;
   
   wire [BRAM_ADDR_WIDTH - 1 : 0] 	B_addr;
   wire [4*FFT_WIDTH-1:0] 		B_tdata;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	B_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	B_timag;
   wire 				B_tready;

   wire signed [2 * FFT_WIDTH - 1 : 0] 	Bts_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	Bts_timag;
   
   wire signed [2 * FFT_WIDTH - 1 : 0] 	Bs_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	Bs_timag;

   wire [4*FFT_WIDTH-1:0] 		dAMULT_tdata;
   wire 				dAMULT_tlast;
   wire 				dAMULT_tvalid;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dAMULT_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dAMULT_timag;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dAMULTs_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dAMULTs_timag;

   wire [4*FFT_WIDTH-1:0] 		dBMULT_tdata;
   wire 				dBMULT_tlast;
   wire 				dBMULT_tvalid;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dBMULT_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dBMULT_timag;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dBMULTs_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	dBMULTs_timag;
   
   wire [BRAM_ADDR_WIDTH - 1 : 0] 	dB_addr;
   wire [BRAM_ADDR_WIDTH - 1 : 0] 	dA_addr;

   wire signed [2 * FFT_WIDTH - 1 : 0] 	ASUM_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	ASUM_timag;

   wire signed [2 * FFT_WIDTH - 1 : 0] 	BSUM_treal;
   wire signed [2 * FFT_WIDTH - 1 : 0] 	BSUM_timag;

   wire [4*FFT_WIDTH-1:0] 		ASUM_tdata;
   wire [4*FFT_WIDTH-1:0] 		BSUM_tdata;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	AWrite_addr;
   wire [BRAM_ADDR_WIDTH - 1 : 0] 	BWrite_addr;

   wire 				ASUM_tvalid;
   wire 				BSUM_tvalid;
   wire 				ASUM_tlast;
   wire 				BSUM_tlast;

   wire [3 * FFT_WIDTH-1:0] 		ABDIV_REAL_tout;
   wire 				ABDIV_REAL_tvalid;

   wire [2 * FFT_WIDTH - 1 : 0] 	ABDIV_REAL_tquot;
   wire [FFT_WIDTH - 1 : 0] 		ABDIV_REAL_tfrac;

   wire [3 * FFT_WIDTH - 2 : 0] 	ABDIV_REAL_tdata;
   wire [FFT_WIDTH - 1 : 0] 		ABDIV_treal;

   wire [3 * FFT_WIDTH-1:0] 		ABDIV_IMAG_tout;
   wire 				ABDIV_IMAG_tvalid;

   wire [2 * FFT_WIDTH - 1 : 0] 	ABDIV_IMAG_tquot;
   wire [FFT_WIDTH - 1 : 0] 		ABDIV_IMAG_tfrac;

   wire [3 * FFT_WIDTH - 2 : 0] 	ABDIV_IMAG_tdata;
   wire [FFT_WIDTH - 1 : 0] 		ABDIV_timag;

   wire [2 * FFT_WIDTH - 1 : 0] 	ABDIV_tdata;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	HWrite_addr;
   wire 				ABDIV_tlast;
   
   //------------------Update filter coefficients-------------------------

   wire 				FIFO_tvalid;
   wire 				FIFO_tready;
   wire [NPPC * DATA_WIDTH-1:0] 	FIFO_tdata;
   wire 				FIFO_tlast;

   wire [DATA_WIDTH - 1 : 0] 		CONVERTER_tdata;
   wire 				CONVERTER_tlast;
   wire 				CONVERTER_tready;
   wire 				CONVERTER_tvalid;

   wire [FFT_WIDTH - 1 : 0] 		LUT_tdata;
   wire 				LUT_tlast;
   wire 				LUT_tready;
   wire 				LUT_tvalid;

   wire [FFT_WIDTH - 1 : 0] 		dLUT_tdata;
   wire 				dLUT_tvalid;
   wire 				dLUT_tlast;

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	HANN_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	HANN_yPos = 6'b0;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	HANN_addr;
   wire [FFT_WIDTH - 1 : 0] 		HANN_tdata;
   wire 				HANN_tready;

   wire [FFT_WIDTH - 1 : 0] 		MULT_HANN_tdata;
   wire 				MULT_HANN_tready;
   wire 				MULT_HANN_tvalid;
   wire 				MULT_HANN_tlast;

   //wire signed [DATA_WIDTH-1:0]   scaled = CONVERTER_tdata - 128;

   reg [POSITION_WIDTH - 1 : 0] 	xStart = 12'd500;//500;//12'd40;
   reg [POSITION_WIDTH - 1 : 0] 	xStartTemp = 12'd500;//500;//12'd40;
   reg [POSITION_WIDTH - 1 : 0] 	xPos = 12'b0;

   reg [POSITION_WIDTH - 1 : 0] 	yStart = 12'd500;//500;//12'd40;
   reg [POSITION_WIDTH - 1 : 0] 	yStartTemp = 12'd500;//500;//12'd40;
   reg [POSITION_WIDTH - 1 : 0] 	yPos = 12'b0;

   wire [POSITION_WIDTH - 1 : 0] 	xStartNPPC = (xStart/NPPC) * NPPC;

   reg 					rOperate = 1'b0;

   wire 				PixelValid = VIDEO_IN_tvalid && VIDEO_IN_tready;
   wire 				LastPixel = VIDEO_IN_tvalid && VIDEO_IN_tready && VIDEO_IN_tlast;

   wire 				BIGROI_tvalid;
   wire 				BIGROI_tlast;

   wire 				xBigRange;
   wire 				xBigLast;
   wire 				yBigRange;
   
   wire 				ROI_tvalid;
   wire 				ROI_tlast;

   wire 				xRange;
   wire 				xLast;
   wire 				yRange;

   wire [2 * FFT_WIDTH - 1 : 0] 	FFT_tdata;
   wire [FFT_WIDTH - 1 : 0] 		FFT_treal;
   wire [FFT_WIDTH - 1 : 0] 		FFT_timag;
   wire 				FFT_tvalid;
   wire 				FFT_tlast;
   wire 				FFT_tready; 			  
   wire 				event_frame_started;
   wire 				event_tlast_unexpected;
   wire 				event_tlast_missing;
   wire 				event_data_in_channel_halt;

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BRAM_FFT_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BRAM_FFT_yPos = 6'b0;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	BRAM_FFT_addr;
   wire [2*FFT_WIDTH - 1 : 0] 		BRAM_FFT_out;
   wire [FFT_WIDTH - 1 : 0] 		BRAM_FFT_treal;
   wire [FFT_WIDTH - 1 : 0] 		BRAM_FFT_timag;

   reg 					BRAM_FFT_tlast = 1'b0;
   wire 				dBRAM_FFT_tlast;

   wire 				dBRAM_FFT_tvalid;
   wire 				BRAM_FFT_tready;
   
   reg 					read_BRAM_FFT = 1'b0;

   wire [2*FFT_WIDTH-1:0] 		FFT2_tdata;
   wire [FFT_WIDTH-1:0] 		FFT2_treal;
   wire [FFT_WIDTH-1:0] 		FFT2_timag;
   wire 				FFT2_tlast;
   wire 				FFT2_tvalid;
   wire 				FFT2_tready; 
   wire 				event_frame_started2;
   wire 				event_tlast_unexpected2;
   wire 				event_tlast_missing2;
   wire 				event_data_in_channel_halt2;

   /* -----\/----- EXCLUDED -----\/-----
    wire [BRAM_ADDR_WIDTH / 2 - 1 : 0] dBRAM_FFT_xPos;
    wire [BRAM_ADDR_WIDTH / 2 - 1 : 0] dBRAM_FFT_yPos;
    -----/\----- EXCLUDED -----/\----- */

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	COEF_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	COEF_yPos = 6'b0;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	COEF_addr;
   wire [2*FFT_WIDTH - 1 : 0] 		COEF_out;
   wire [FFT_WIDTH - 1 : 0] 		COEF_treal;
   wire [FFT_WIDTH - 1 : 0] 		COEF_timag;
   wire 				COEF_tready;

   wire [2 * FFT_WIDTH - 1 : 0] 	dFFT2_tdata;
   wire 				dFFT2_tvalid;
   wire 				dFFT2_tlast;

   wire [72 : 0] 			eMULT_tdata;
   wire signed [FFT_WIDTH : 0] 		eMULT_treal;
   wire signed [FFT_WIDTH : 0] 		eMULT_timag;
   wire signed [FFT_WIDTH : 0] 		mMULT_treal;
   wire signed [FFT_WIDTH : 0] 		mMULT_timag;
   wire [2 * FFT_WIDTH - 1 : 0] 	MULT_tdata;
   wire 				MULT_tvalid;
   wire 				MULT_tlast;
   wire [FFT_WIDTH - 1 : 0] 		MULT_treal;
   wire [FFT_WIDTH - 1 : 0] 		MULT_timag;
   wire 				MULT_tready;

   wire [2 * FFT_WIDTH - 1 : 0] 	IFFT_tdata;
   wire [FFT_WIDTH - 1 : 0] 		IFFT_treal;
   wire [FFT_WIDTH - 1 : 0] 		IFFT_timag;
   wire 				IFFT_tvalid;
   wire 				IFFT_tlast;
   wire 				IFFT_tready; 
   wire 				event_frame_started3;
   wire 				event_tlast_unexpected3;
   wire 				event_tlast_missing3;
   wire 				event_data_in_channel_halt3;

   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BRAM_IFFT_xPos = 6'b0;
   reg [BRAM_ADDR_WIDTH / 2 - 1 : 0] 	BRAM_IFFT_yPos = 6'b0;

   wire [BRAM_ADDR_WIDTH - 1 : 0] 	BRAM_IFFT_addr;
   wire [2*FFT_WIDTH - 1 : 0] 		BRAM_IFFT_out;
   wire [FFT_WIDTH - 1 : 0] 		BRAM_IFFT_treal;
   wire [FFT_WIDTH - 1 : 0] 		BRAM_IFFT_timag;

   reg 					BRAM_IFFT_tlast = 1'b0;
   wire 				dBRAM_IFFT_tlast;

   wire 				dBRAM_IFFT_tvalid;
   wire 				BRAM_IFFT_tready;
   
   reg 					read_BRAM_IFFT = 1'b0;

   wire [2 * FFT_WIDTH - 1 : 0] 	IFFT2_tdata;
   wire signed [FFT_WIDTH - 1 : 0] 	IFFT2_treal;
   wire signed [FFT_WIDTH - 1 : 0] 	IFFT2_timag;
   wire 				IFFT2_tvalid;
   wire 				IFFT2_tlast;
   wire 				IFFT2_tready; 
   wire 				event_frame_started4;
   wire 				event_tlast_unexpected4;
   wire 				event_tlast_missing4;
   wire 				event_data_in_channel_halt4;

   reg [NFFT - 1 : 0] 			IFFT2_xPos = 0;
   reg [NFFT - 1 : 0] 			IFFT2_yPos = 0;
   reg [NFFT - 1 : 0] 			IFFT2_xMax = 0;
   reg [NFFT - 1 : 0] 			IFFT2_yMax = 0;
   reg [NFFT - 1 : 0] 			IFFT2_xMaxLocked = 0;
   reg [NFFT - 1 : 0] 			IFFT2_yMaxLocked = 0;
   reg signed [FFT_WIDTH - 1 : 0] 	IFFT2_valMax = 0;

   fftInitialize
     #(
       .CONFIG_WIDTH(CONFIG_WIDTH),
       .CONFIG_DATA(CONFIG_FFT)
       ) Init
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.s_axis_video_aresetn(s_axis_video_aresetn),
	.CONFIG_OUT_tdata(CONFIG_IN_tdata),
	.CONFIG_OUT_tready(CONFIG_IN_tready),
	.CONFIG_OUT_tvalid(CONFIG_IN_tvalid)
	);

   fftInitialize
     #(
       .CONFIG_WIDTH(CONFIG_WIDTH),
       .CONFIG_DATA(CONFIG_FFT)
       ) Init2
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.s_axis_video_aresetn(s_axis_video_aresetn),
	.CONFIG_OUT_tdata(CONFIG_IN2_tdata),
	.CONFIG_OUT_tready(CONFIG_IN2_tready),
	.CONFIG_OUT_tvalid(CONFIG_IN2_tvalid)
	);

   fftInitialize
     #(
       .CONFIG_WIDTH(CONFIG_WIDTH),
       .CONFIG_DATA(CONFIG_IFFT)
       ) Init3
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.s_axis_video_aresetn(s_axis_video_aresetn),
	.CONFIG_OUT_tdata(CONFIG_IN3_tdata),
	.CONFIG_OUT_tready(CONFIG_IN3_tready),
	.CONFIG_OUT_tvalid(CONFIG_IN3_tvalid)
	);

   fftInitialize
     #(
       .CONFIG_WIDTH(CONFIG_WIDTH),
       .CONFIG_DATA(CONFIG_IFFT)
       ) Init4
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.s_axis_video_aresetn(s_axis_video_aresetn),
	.CONFIG_OUT_tdata(CONFIG_IN4_tdata),
	.CONFIG_OUT_tready(CONFIG_IN4_tready),
	.CONFIG_OUT_tvalid(CONFIG_IN4_tvalid)
	);

   fftInitialize
     #(
       .CONFIG_WIDTH(CONFIG_WIDTH),
       .CONFIG_DATA(CONFIG_FFT)
       ) BigInit
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.s_axis_video_aresetn(s_axis_video_aresetn),
	.CONFIG_OUT_tdata(BIGCONFIG_IN_tdata),
	.CONFIG_OUT_tready(BIGCONFIG_IN_tready),
	.CONFIG_OUT_tvalid(BIGCONFIG_IN_tvalid)
	);

   fftInitialize
     #(
       .CONFIG_WIDTH(CONFIG_WIDTH),
       .CONFIG_DATA(CONFIG_FFT)
       ) BigInit2
       (
	.s_axis_video_aclk(s_axis_video_aclk),
	.s_axis_video_aresetn(s_axis_video_aresetn),
	.CONFIG_OUT_tdata(BIGCONFIG_IN2_tdata),
	.CONFIG_OUT_tready(BIGCONFIG_IN2_tready),
	.CONFIG_OUT_tvalid(BIGCONFIG_IN2_tvalid)
	);

   always @(posedge s_axis_video_aclk)
     begin
	if (VIDEO_IN_tuser && track)
	  begin
	     xStart <= xStartTemp;
	     yStart <= yStartTemp;
	  end
     end

   always @(posedge s_axis_video_aclk)
     begin
	if (rOperate)
	  begin
	     if (PixelValid) xPos <= xPos + 1;
	     if (LastPixel)
	       begin
		  xPos <= 12'b0;
		  if (yPos == HEIGHT - 1) yPos <= 12'b0;
		  else yPos <= yPos + 1;
	       end
	  end
	if (VIDEO_IN_tuser) 
	  begin
	     yPos <= 12'b0;
	     if(operate) rOperate <= 1'b1;
	  end
     end // always @ (posedge s_axis_video_aclk)

   assign xBigRange = (xPos >= (xStart/NPPC - FFT_LENGTH/2/NPPC)) && (xPos < (xStart/NPPC + FFT_LENGTH/NPPC + FFT_LENGTH/2/NPPC));
   assign xBigLast = xPos == xStart/NPPC + FFT_LENGTH/NPPC + FFT_LENGTH/2/NPPC - 1;

   assign yBigRange = (yPos >= yStart - FFT_LENGTH/2) && (yPos < yStart + FFT_LENGTH + FFT_LENGTH/2);

   assign BIGROI_tvalid = VIDEO_IN_tvalid && xBigRange && yBigRange;
   assign BIGROI_tlast = VIDEO_IN_tvalid && xBigLast;

   BIGFIFO BIGFIFO
     (
      .s_axis_tvalid(BIGROI_tvalid),
      //.s_axis_tready(VIDEO_IN_tready),
      .s_axis_tdata(VIDEO_IN_tdata),
      .s_axis_tlast(BIGROI_tlast),
      .s_aresetn(s_axis_video_aresetn),
      .s_aclk(s_axis_video_aclk),
      .m_axis_tvalid(BIGFIFO_tvalid),
      .m_axis_tready(BIGFIFO_tready),
      .m_axis_tdata(BIGFIFO_tdata),
      .m_axis_tlast(BIGFIFO_tlast)
      );

   WidthConverter BigConversionNPPC
     (
      .s_axis_tdata(BIGFIFO_tdata),
      .s_axis_tlast(BIGFIFO_tlast),
      .s_axis_tready(BIGFIFO_tready),
      .s_axis_tvalid(BIGFIFO_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_tdata(BIGCONVERTER_tdata),
      .m_axis_tlast(BIGCONVERTER_tlast),
      .m_axis_tready(BIGCONVERTER_tready),
      .m_axis_tvalid(BIGCONVERTER_tvalid)
      );

   assign BIGCONVERTER_tready = 1'b1;

   always @(posedge s_axis_video_aclk)
     begin
	if(BIGCONVERTER_tvalid)
	  begin
	     BIGBRAM_xPos <= BIGBRAM_xPos + 1;
	     if(BIGCONVERTER_tlast)
	       begin
		  BIGBRAM_yPos <= BIGBRAM_yPos + 1;
		  if (&BIGBRAM_yPos) saved_BIGBRAM <= 1'b1;
	       end
	  end
	else if (read_BIGBRAM && BIGBRAM_tready)
	  begin
	     BIGBRAM_xPos <= BIGBRAM_xPos + 1;
	     if (BIGBRAM_xPos == IFFT2_xMaxLocked + FFT_LENGTH - 2) BIGBRAM_tlast <= 1'b1;
	     else BIGBRAM_tlast <= 1'b0;
	     if (BIGBRAM_xPos == IFFT2_xMaxLocked + FFT_LENGTH - 1)
	       begin
		  BIGBRAM_xPos <= IFFT2_xMaxLocked;
		  BIGBRAM_yPos <= BIGBRAM_yPos + 1;
		  if(BIGBRAM_yPos == IFFT2_yMaxLocked + FFT_LENGTH - 1)
		    begin
		       read_BIGBRAM <= 1'b0;
		       BIGBRAM_xPos <= 7'b0;
		       BIGBRAM_yPos <= 7'b0;
		    end
	     end
	  end // if (read_BIGBRAM && BIGBRAM_tready)
	else if (completed_IFFT2 && saved_BIGBRAM)
	  begin
	     read_BIGBRAM <= 1'b1;
	     completed_IFFT2 <= 1'b0;
	     saved_BIGBRAM <= 1'b0;
	     if(track)
	       begin
		  if(centerLocation)
		    begin
		       IFFT2_xMaxLocked <= IFFT2_xMax;// +1
		       IFFT2_yMaxLocked <= IFFT2_yMax;
		       BIGBRAM_xPos <= IFFT2_xMax;
		       BIGBRAM_yPos <= IFFT2_yMax;
		    end
		  else
		    begin
		       IFFT2_xMaxLocked <= IFFT2_xMax + 1;// +1
		       IFFT2_yMaxLocked <= IFFT2_yMax + 1;
		       BIGBRAM_xPos <= IFFT2_xMax + 1;
		       BIGBRAM_yPos <= IFFT2_yMax + 1;
		    end
		  centerLocation <= !centerLocation;
	       end
	     else
	       begin
		  IFFT2_xMaxLocked <= 7'd32;
		  IFFT2_yMaxLocked <= 7'd32;
		  BIGBRAM_xPos <= 7'd32;
		  BIGBRAM_yPos <= 7'd32;
	       end
	     //xStartTemp <= xStart + IFFT2_xMax - 31;
	     yStartTemp <= yStart + IFFT2_yMax - 31;
	     xStartTemp <= xStartNPPC + IFFT2_xMax - 31;
	  end
	if (&IFFT2_xPos && &IFFT2_yPos) completed_IFFT2 <= 1'b1;
     end // always @ (posedge s_axis_video_aclk)

   assign BIGBRAM_addr = {BIGBRAM_xPos, BIGBRAM_yPos};

   BIGBRAM BRAM_BIG
     (
      .addra(BIGBRAM_addr),
      .clka(s_axis_video_aclk),
      .dina(BIGCONVERTER_tdata),
      .douta(BIGBRAM_out),
      .wea(BIGCONVERTER_tvalid),
      .regcea(BIGBRAM_tready)
      );

   assign BIGBRAM_tready = BIGLUT_tready;

   DelayEnable_BRAM_tvalid Delay_BIGBRAM_tvalid
     (
      .Input(read_BIGBRAM),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BIGBRAM_tready),
      .Output(dBIGBRAM_tvalid)
      );

   DelayEnable_BRAM_tvalid Delay_BIGBRAM_tlast
     (
      .Input(BIGBRAM_tlast),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BIGBRAM_tready),
      .Output(dBIGBRAM_tlast)
      );

   LogLUT BigLog
     (
      .addra(BIGBRAM_out),
      .clka(s_axis_video_aclk),
      .douta(BIGLUT_tdata),
      .regcea(BIGLUT_tready)
      );

   DelayEnable_BRAM_tvalid Delay_BIGLUT_tvalid
     (
      .Input(dBIGBRAM_tvalid),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BIGLUT_tready),
      .Output(BIGLUT_tvalid)
      );

   DelayEnable_BRAM_tvalid Delay_BIGLUT_tlast
     (
      .Input(dBIGBRAM_tlast),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BIGLUT_tready),
      .Output(BIGLUT_tlast)
      );

   //Hanning window BRAM

   always @(posedge s_axis_video_aclk)
     begin
	if(BIGLUT_tvalid && BIGLUT_tready)
	  begin
	     BIGHANN_yPos <= BIGHANN_yPos + 1;
	     if(BIGLUT_tlast)
	       begin
		  BIGHANN_xPos <= BIGHANN_xPos + 1;
		  //if(&BRAM_FFT_yPos) read_BRAM <= 1'b1;
	       end
	  end // if (FFT_tvalid)
	/* -----\/----- EXCLUDED -----\/-----
	 if (read_BRAM && BRAM_FFT_tready)
	 begin
	 BRAM_FFT_yPos <= BRAM_FFT_yPos + 1;
	 if (BRAM_FFT_yPos == FFT_LENGTH - 2) BRAM_FFT_tlast <= 1'b1;
	 else BRAM_FFT_tlast <= 1'b0;
	 if (&BRAM_FFT_yPos)
	 begin
	 BRAM_FFT_xPos <= BRAM_FFT_xPos + 1;
	 if(&BRAM_FFT_xPos) read_BRAM <= 1'b0;
	       end
	  end // if (read_BRAM && BRAM_FFT_tready)
	 -----/\----- EXCLUDED -----/\----- */
     end // always @ (posedge s_axis_video_aclk)

   assign BIGHANN_addr = {BIGHANN_xPos, BIGHANN_yPos};

   HANN_BRAM BigHann_coef
     (
      .addra(BIGHANN_addr),
      .clka(s_axis_video_aclk),
      .douta(BIGHANN_tdata),
      .regcea(BIGHANN_tready)
      );

   assign BIGHANN_tready = MULT_BIGHANN_tready;

   DelayEnable_LUT Delay_BIGLUT
     (
      .Input({BIGLUT_tdata, BIGLUT_tvalid, BIGLUT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BIGLUT_tready),
      .Output({dBIGLUT_tdata, dBIGLUT_tvalid, dBIGLUT_tlast})
      );

   assign BIGLUT_tready = MULT_BIGHANN_tready;

   //Hanning multiplier

   Mult_LUT_HANN Mult_BigHann
     (
      .CLK(s_axis_video_aclk),
      .A(dBIGLUT_tdata),
      .B(BIGHANN_tdata),
      .CE(MULT_BIGHANN_tready),
      .P(MULT_BIGHANN_tdata)
      );

   DelayEnable_MULT_HANN DEL_Mult_BigHann
     (
      .Input({dBIGLUT_tvalid, dBIGLUT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(MULT_BIGHANN_tready),
      .Output({MULT_BIGHANN_tvalid, MULT_BIGHANN_tlast})
      );

   //-------------------------BIGFFT---------------------------------------
   xFFT BIGFFT
     (
      .s_axis_data_tdata({32'b0, MULT_BIGHANN_tdata}),
      .s_axis_data_tlast(MULT_BIGHANN_tlast),
      .s_axis_data_tready(MULT_BIGHANN_tready),
      .s_axis_data_tvalid(MULT_BIGHANN_tvalid),
      .s_axis_config_tdata(BIGCONFIG_IN_tdata),
      .s_axis_config_tready(BIGCONFIG_IN_tready),
      .s_axis_config_tvalid(BIGCONFIG_IN_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_data_tdata(BIGFFT_tdata),
      .m_axis_data_tlast(BIGFFT_tlast),
      .m_axis_data_tvalid(BIGFFT_tvalid),
      .m_axis_data_tready(BIGFFT_tready),
      .event_frame_started(event_frame_started5),
      .event_tlast_unexpected(event_tlast_unexpected5),
      .event_tlast_missing(event_tlast_missing5),
      .event_data_in_channel_halt(event_data_in_channel_halt5)
      );

   assign BIGFFT_tready = 1'b1;

   always @(posedge s_axis_video_aclk)
     begin
	if(BIGFFT_tvalid)
	  begin
	     BRAM_BIGFFT_xPos <= BRAM_BIGFFT_xPos + 1;
	     if(BIGFFT_tlast)
	       begin
		  BRAM_BIGFFT_yPos <= BRAM_BIGFFT_yPos + 1;
		  if(&BRAM_BIGFFT_yPos) read_BRAM_BIGFFT <= 1'b1;
	       end
	  end // if (BIGFFT_tvalid)
	if (read_BRAM_BIGFFT && BRAM_BIGFFT_tready)
	  begin
	     BRAM_BIGFFT_yPos <= BRAM_BIGFFT_yPos + 1;
	     if (BRAM_BIGFFT_yPos == FFT_LENGTH - 2) BRAM_BIGFFT_tlast <= 1'b1;
	     else BRAM_BIGFFT_tlast <= 1'b0;
	     if (&BRAM_BIGFFT_yPos)
	       begin
		  BRAM_BIGFFT_xPos <= BRAM_BIGFFT_xPos + 1;
		  if(&BRAM_BIGFFT_xPos) read_BRAM_BIGFFT <= 1'b0;
	       end
	  end // if (read_BRAM_FFT && BRAM_FFT_tready)
     end // always @ (posedge s_axis_video_aclk)

   assign BRAM_BIGFFT_addr = {BRAM_BIGFFT_xPos, BRAM_BIGFFT_yPos};

   FFT_BRAM BRAM_BIGFFT
     (
      .addra(BRAM_BIGFFT_addr),
      .clka(s_axis_video_aclk),
      .dina(BIGFFT_tdata),
      .douta(BRAM_BIGFFT_out),
      .wea(BIGFFT_tvalid),
      .regcea(BRAM_BIGFFT_tready)
      );

   /* -----\/----- EXCLUDED -----\/-----
    DelayEnable_BRAM_Pos Delay_BRAM_Pos
    (
    .Input(BRAM_FFT_addr),
    .CLK_in(s_axis_video_aclk),
    .CLK_en(BRAM_FFT_tready),
    .Output({dBRAM_FFT_xPos, dBRAM_FFT_yPos})
    );
    -----/\----- EXCLUDED -----/\----- */

   DelayEnable_BRAM_tvalid Delay_BRAM_BIGFFT_tvalid
     (
      .Input(read_BRAM_BIGFFT),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BRAM_BIGFFT_tready),
      .Output(dBRAM_BIGFFT_tvalid)
      );

   DelayEnable_BRAM_tvalid Delay_BRAM_BIGFFT_tlast
     (
      .Input(BRAM_BIGFFT_tlast),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BRAM_BIGFFT_tready),
      .Output(dBRAM_BIGFFT_tlast)
      );
   
   xFFT BIGFFT2
     (
      .s_axis_data_tdata(BRAM_BIGFFT_out),
      .s_axis_data_tlast(dBRAM_BIGFFT_tlast),
      .s_axis_data_tready(BRAM_BIGFFT_tready),
      .s_axis_data_tvalid(dBRAM_BIGFFT_tvalid),
      .s_axis_config_tdata(BIGCONFIG_IN2_tdata),
      .s_axis_config_tready(BIGCONFIG_IN2_tready),
      .s_axis_config_tvalid(BIGCONFIG_IN2_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_data_tdata(BIGFFT2_tdata),
      .m_axis_data_tlast(BIGFFT2_tlast),
      .m_axis_data_tvalid(BIGFFT2_tvalid),
      .m_axis_data_tready(BIGFFT2_tready),
      .event_frame_started(event_frame_started6),
      .event_tlast_unexpected(event_tlast_unexpected6),
      .event_tlast_missing(event_tlast_missing6),
      .event_data_in_channel_halt(event_data_in_channel_halt6)
      );

   assign BIGFFT_treal = BIGFFT_tdata[FFT_WIDTH-1:0];
   assign BIGFFT_timag = BIGFFT_tdata[2*FFT_WIDTH-1:FFT_WIDTH];

   assign BIGFFT2_treal = BIGFFT2_tdata[FFT_WIDTH-1:0];
   assign BIGFFT2_timag = BIGFFT2_tdata[2*FFT_WIDTH-1:FFT_WIDTH];

   assign BRAM_BIGFFT_treal = BRAM_BIGFFT_out[FFT_WIDTH - 1 : 0];
   assign BRAM_BIGFFT_timag = BRAM_BIGFFT_out[2*FFT_WIDTH - 1 : FFT_WIDTH];
   //-------------------------BIGFFT--------------------------------------

   //------------------Update filter coefficients-------------------------

   always @(posedge s_axis_video_aclk)
     begin
	if(BIGFFT2_tvalid && BIGFFT2_tready)
	  begin
	     GAUSS_yPos <= GAUSS_yPos + 1;
	     if(BIGFFT2_tlast)
	       begin
		  GAUSS_xPos <= GAUSS_xPos + 1;
	       end
	  end // if (BIGFFT2_tvalid && BIGFFT2_tready)
     end // always @ (posedge s_axis_video_aclk)

   assign GAUSS_addr = {GAUSS_xPos, GAUSS_yPos};

   GAUSS_BRAM GAUSS
     (
      .addra(GAUSS_addr),
      .clka(s_axis_video_aclk),
      .douta(GAUSS_tdata), //s1q4f27
      .regcea(GAUSS_tready)
      );

   assign GAUSS_treal = GAUSS_tdata[FFT_WIDTH-1:0];
   assign GAUSS_timag = GAUSS_tdata[2*FFT_WIDTH-1:FFT_WIDTH];

   DelayEnable_FFT2 Delay_BIGFFT2
     (
      .Input({BIGFFT2_tdata, BIGFFT2_tvalid, BIGFFT2_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BIGFFT2_tready),
      .Output({dBIGFFT2_tdata, dBIGFFT2_tvalid, dBIGFFT2_tlast})
      );

   Conjugate_0 Conj_F
     (
      .in(dBIGFFT2_tdata),
      .out(Fconj)
      );

   //ComplexMult_FFT2_COEF CONJ_GAUSS
   ComplexMult_AB CONJ_GAUSS
     (
      .s_axis_a_tdata(GAUSS_tdata),
      .s_axis_a_tvalid(dBIGFFT2_tvalid),
      .s_axis_a_tready(GAUSS_tready),
      .s_axis_b_tdata(Fconj),
      .s_axis_b_tvalid(dBIGFFT2_tvalid),
      .s_axis_b_tlast(dBIGFFT2_tlast),
      .s_axis_b_tready(BIGFFT2_tready),
      .aclk(s_axis_video_aclk),
      .m_axis_dout_tdata(eAMULT_tdata),
      .m_axis_dout_tvalid(AMULT_tvalid),
      .m_axis_dout_tlast(AMULT_tlast),
      .m_axis_dout_tready(AMULT_tready)
      );

   assign AMULT_tready = 1'b1;

   assign eAMULT_treal = eAMULT_tdata[2 * FFT_WIDTH : 0];
   assign eAMULT_timag = eAMULT_tdata[136 : 72];
   assign mAMULT_treal = eAMULT_treal <<< 1;
   assign mAMULT_timag = eAMULT_timag <<< 1;
   assign AMULT_tdata = {mAMULT_timag[2 * FFT_WIDTH : 1], mAMULT_treal[2 * FFT_WIDTH : 1]};
   
   assign AMULT_treal = AMULT_tdata[2 * FFT_WIDTH - 1 : 0];
   assign AMULT_timag = AMULT_tdata[4*FFT_WIDTH - 1 : 2 * FFT_WIDTH];

   ComplexMult_AB CONJ_dBIGFFT2
     (
      .s_axis_a_tdata(dBIGFFT2_tdata),
      .s_axis_a_tvalid(dBIGFFT2_tvalid),
      .s_axis_a_tready(),
      .s_axis_b_tdata(Fconj),
      .s_axis_b_tvalid(dBIGFFT2_tvalid),
      .s_axis_b_tlast(dBIGFFT2_tlast),
      .s_axis_b_tready(),
      .aclk(s_axis_video_aclk),
      .m_axis_dout_tdata(eBMULT_tdata),
      .m_axis_dout_tvalid(BMULT_tvalid),
      .m_axis_dout_tlast(BMULT_tlast),
      .m_axis_dout_tready(BMULT_tready)
      );

   assign BMULT_tready = 1'b1;

   assign eBMULT_treal = eBMULT_tdata[2 * FFT_WIDTH : 0];
   assign eBMULT_timag = eBMULT_tdata[136 : 72];
   assign mBMULT_treal = eBMULT_treal <<< 1;
   assign mBMULT_timag = eBMULT_timag <<< 1;
   assign BMULT_tdata = {mBMULT_timag[2 * FFT_WIDTH : 1], mBMULT_treal[2 * FFT_WIDTH : 1]};
   
   assign BMULT_treal = BMULT_tdata[2 * FFT_WIDTH - 1 : 0];
   assign BMULT_timag = BMULT_tdata[4*FFT_WIDTH - 1 : 2 * FFT_WIDTH];

   always @(posedge s_axis_video_aclk)
     begin
	if(AMULT_tvalid && AMULT_tready)
	  begin
	     A_yPos <= A_yPos + 1;
	     if(AMULT_tlast)
	       begin
		  A_xPos <= A_xPos + 1;
	       end
	  end // if (A_tvalid && A_tready)
     end // always @ (posedge s_axis_video_aclk)

   assign A_addr = {A_xPos, A_yPos};

   always @(posedge s_axis_video_aclk)
     begin
	if(BMULT_tvalid && BMULT_tready)
	  begin
	     B_yPos <= B_yPos + 1;
	     if(BMULT_tlast)
	       begin
		  B_xPos <= B_xPos + 1;
	       end
	  end // if (B_tvalid && B_tready)
     end // always @ (posedge s_axis_video_aclk)

   assign B_addr = {B_xPos, B_yPos};

   A_BRAM A_coef
     (
      .addra(AWrite_addr),
      .clka(s_axis_video_aclk),
      .dina(ASUM_tdata),
      .wea(ASUM_tvalid && update),
      .addrb(A_addr),
      .clkb(s_axis_video_aclk),
      .doutb(A_tdata),
      .regceb(A_tready)
      );

   assign A_tready = 1'b1;

   assign A_treal = A_tdata[2 * FFT_WIDTH - 1 : 0];
   assign A_timag = A_tdata[4*FFT_WIDTH - 1 : 2 * FFT_WIDTH];

   assign Ats_treal = A_treal >>> 3;
   assign Ats_timag = A_timag >>> 3;

   assign As_treal = A_treal - Ats_treal;
   assign As_timag = A_timag - Ats_timag;

   DelayEnable_AB Delay_Acoef
     (
      .Input({AMULT_tdata, AMULT_tvalid, AMULT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(AMULT_tready),
      .Output({dAMULT_tdata, dAMULT_tvalid, dAMULT_tlast})
      );

   DelayAddr_12_2 Dealy_AddrA //Read latency
     (
      .Input(A_addr),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(AMULT_tready),
      .Output(dA_addr)
      );

   assign dAMULT_treal = dAMULT_tdata[2 * FFT_WIDTH - 1 : 0];
   assign dAMULT_timag = dAMULT_tdata[4 * FFT_WIDTH - 1 : 2 * FFT_WIDTH];

   assign dAMULTs_treal = dAMULT_treal >>> 3;
   assign dAMULTs_timag = dAMULT_timag >>> 3;

   B_BRAM B_coef
     (
      .addra(BWrite_addr),
      .clka(s_axis_video_aclk),
      .dina(BSUM_tdata),
      .wea(BSUM_tvalid && update),
      .addrb(B_addr),
      .clkb(s_axis_video_aclk),
      .doutb(B_tdata),
      .regceb(B_tready)
      );

   assign B_tready = 1'b1;

   assign B_treal = B_tdata[2 * FFT_WIDTH - 1 : 0];
   assign B_timag = B_tdata[4 * FFT_WIDTH - 1 : 2 * FFT_WIDTH];

   assign Bts_treal = B_treal >>> 3;
   assign Bts_timag = B_timag >>> 3;

   assign Bs_treal = B_treal - Bts_treal;
   assign Bs_timag = B_timag - Bts_timag;

   DelayEnable_AB Delay_Bcoef
     (
      .Input({BMULT_tdata, BMULT_tvalid, BMULT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BMULT_tready),
      .Output({dBMULT_tdata, dBMULT_tvalid, dBMULT_tlast})
      );

   DelayAddr_12_2 Dealy_AddrB //Read latency
     (
      .Input(B_addr),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BMULT_tready),
      .Output(dB_addr)
      );

   assign dBMULT_treal = dBMULT_tdata[2 * FFT_WIDTH - 1 : 0];
   assign dBMULT_timag = dBMULT_tdata[4 * FFT_WIDTH - 1 : 2 * FFT_WIDTH];
   
   assign dBMULTs_treal = dBMULT_treal >>> 3;
   assign dBMULTs_timag = dBMULT_timag >>> 3;

   AB_sum AsumReal
     (
      .A(As_treal),
      .B(dAMULTs_treal),
      .CLK(s_axis_video_aclk),
      .S(ASUM_treal)
      );

   AB_sum AsumImag
     (
      .A(As_timag),
      .B(dAMULTs_timag),
      .CLK(s_axis_video_aclk),
      .S(ASUM_timag)
      );

   AB_sum BsumReal
     (
      .A(Bs_treal),
      .B(dBMULTs_treal),
      .CLK(s_axis_video_aclk),
      .S(BSUM_treal)
      );

   AB_sum BsumImag
     (
      .A(Bs_timag),
      .B(dBMULTs_timag),
      .CLK(s_axis_video_aclk),
      .S(BSUM_timag)
      );

   assign ASUM_tdata = {ASUM_timag, ASUM_treal};
   assign BSUM_tdata = {BSUM_timag, BSUM_treal};

   DelayAddr_14_2 DelaySumAAddr6
     (
      .Input({dA_addr, dAMULT_tvalid, dAMULT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(1'b1),
      .Output({AWrite_addr, ASUM_tvalid, ASUM_tlast})
      );

   DelayAddr_14_2 DelaySumBAddr6
     (
      .Input({dB_addr, dBMULT_tvalid, dAMULT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(1'b1),
      .Output({BWrite_addr, BSUM_tvalid, BSUM_tlast})
      );

   divide_32_32 divide_AB_REAL64
     (
      .s_axis_dividend_tdata(ASUM_treal),
      .s_axis_dividend_tvalid(ASUM_tvalid),
      .s_axis_divisor_tdata(BSUM_treal),
      .s_axis_divisor_tvalid(BSUM_tvalid),
      .aclk(s_axis_video_aclk),
      .m_axis_dout_tdata(ABDIV_REAL_tout),
      .m_axis_dout_tvalid(ABDIV_REAL_tvalid)
      );

   assign ABDIV_REAL_tquot = ABDIV_REAL_tout[3 * FFT_WIDTH - 1 : FFT_WIDTH];
   assign ABDIV_REAL_tfrac = ABDIV_REAL_tout[FFT_WIDTH - 1 : 0];
   assign ABDIV_REAL_tdata = {ABDIV_REAL_tquot - ABDIV_REAL_tfrac[FFT_WIDTH - 1], ABDIV_REAL_tfrac[FFT_WIDTH - 2 : 0]} >>> 12;
   assign ABDIV_treal = ABDIV_REAL_tdata[FFT_WIDTH - 1 : 0];

   divide_32_32 divide_AB_IMAG64
     (
      .s_axis_dividend_tdata(ASUM_timag),
      .s_axis_dividend_tvalid(ASUM_tvalid),
      .s_axis_divisor_tdata(BSUM_treal),
      .s_axis_divisor_tvalid(BSUM_tvalid),
      .aclk(s_axis_video_aclk),
      .m_axis_dout_tdata(ABDIV_IMAG_tout),
      .m_axis_dout_tvalid(ABDIV_IMAG_tvalid)
      );

   assign ABDIV_IMAG_tquot = ABDIV_IMAG_tout[3 * FFT_WIDTH - 1 : FFT_WIDTH];
   assign ABDIV_IMAG_tfrac = ABDIV_IMAG_tout[FFT_WIDTH - 1 : 0];
   assign ABDIV_IMAG_tdata = {ABDIV_IMAG_tquot - ABDIV_IMAG_tfrac[FFT_WIDTH - 1], ABDIV_IMAG_tfrac[FFT_WIDTH - 2 : 0]} >>> 12;
   assign ABDIV_timag = ABDIV_IMAG_tdata[FFT_WIDTH - 1 : 0];

   assign ABDIV_tdata = {ABDIV_timag, ABDIV_treal};

   DelayAddr_13_68 DelayDivHAddr100
     (
      .Input({AWrite_addr, ASUM_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(1'b1),
      .Output({HWrite_addr, ABDIV_tlast})
      );
   
   //------------------Update filter coefficients-------------------------

   assign xRange = (xPos >= xStart/NPPC) && (xPos < xStart/NPPC + FFT_LENGTH/NPPC);
   assign xLast = xPos == xStart/NPPC + FFT_LENGTH/NPPC - 1;

   assign yRange = (yPos >= yStart) && (yPos < yStart + FFT_LENGTH);

   assign ROI_tvalid = VIDEO_IN_tvalid && xRange && yRange;
   assign ROI_tlast = VIDEO_IN_tvalid && xLast;

   FIFO2 FIFO
     (
      .s_axis_tvalid(ROI_tvalid),
      .s_axis_tready(VIDEO_IN_tready),
      .s_axis_tdata(VIDEO_IN_tdata),
      .s_axis_tlast(ROI_tlast),
      .s_aresetn(s_axis_video_aresetn),
      .s_aclk(s_axis_video_aclk),
      .m_axis_tvalid(FIFO_tvalid),
      .m_axis_tready(FIFO_tready),
      .m_axis_tdata(FIFO_tdata),
      .m_axis_tlast(FIFO_tlast)
      );

   WidthConverter ConversionNPPC
     (
      .s_axis_tdata(FIFO_tdata),
      .s_axis_tlast(FIFO_tlast),
      .s_axis_tready(FIFO_tready),
      .s_axis_tvalid(FIFO_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_tdata(CONVERTER_tdata),
      .m_axis_tlast(CONVERTER_tlast),
      .m_axis_tready(CONVERTER_tready),
      .m_axis_tvalid(CONVERTER_tvalid)
      );

   assign CONVERTER_tready = LUT_tready;

   //Log function LUT
   LogLUT Log
     (
      .addra(CONVERTER_tdata),
      .clka(s_axis_video_aclk),
      .douta(LUT_tdata),
      .regcea(LUT_tready)
      );

   DelayEnable_BRAM_tvalid Delay_LUT_tvalid
     (
      .Input(CONVERTER_tvalid),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(LUT_tready),
      .Output(LUT_tvalid)
      );

   DelayEnable_BRAM_tvalid Delay_LUT_tlast
     (
      .Input(CONVERTER_tlast),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(LUT_tready),
      .Output(LUT_tlast)
      );

   //Hanning window BRAM

   always @(posedge s_axis_video_aclk)
     begin
	if(LUT_tvalid && LUT_tready)
	  begin
	     HANN_yPos <= HANN_yPos + 1;
	     if(LUT_tlast)
	       begin
		  HANN_xPos <= HANN_xPos + 1;
		  //if(&BRAM_FFT_yPos) read_BRAM <= 1'b1;
	       end
	  end // if (FFT_tvalid)
	/* -----\/----- EXCLUDED -----\/-----
	 if (read_BRAM && BRAM_FFT_tready)
	 begin
	 BRAM_FFT_yPos <= BRAM_FFT_yPos + 1;
	 if (BRAM_FFT_yPos == FFT_LENGTH - 2) BRAM_FFT_tlast <= 1'b1;
	 else BRAM_FFT_tlast <= 1'b0;
	 if (&BRAM_FFT_yPos)
	 begin
	 BRAM_FFT_xPos <= BRAM_FFT_xPos + 1;
	 if(&BRAM_FFT_xPos) read_BRAM <= 1'b0;
	       end
	  end // if (read_BRAM && BRAM_FFT_tready)
	 -----/\----- EXCLUDED -----/\----- */
     end // always @ (posedge s_axis_video_aclk)

   assign HANN_addr = {HANN_xPos, HANN_yPos};

   HANN_BRAM Hann_coef
     (
      .addra(HANN_addr),
      .clka(s_axis_video_aclk),
      .douta(HANN_tdata),
      .regcea(HANN_tready)
      );

   assign HANN_tready = MULT_HANN_tready;

   DelayEnable_LUT Delay_LUT
     (
      .Input({LUT_tdata, LUT_tvalid, LUT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(LUT_tready),
      .Output({dLUT_tdata, dLUT_tvalid, dLUT_tlast})
      );

   assign LUT_tready = MULT_HANN_tready;

   //Hanning multiplier

   Mult_LUT_HANN Mult_Hann
     (
      .CLK(s_axis_video_aclk),
      .A(dLUT_tdata),
      .B(HANN_tdata),
      .CE(MULT_HANN_tready),
      .P(MULT_HANN_tdata)
      );

   DelayEnable_MULT_HANN DEL_Mult_Hann
     (
      .Input({dLUT_tvalid, dLUT_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(MULT_HANN_tready),
      .Output({MULT_HANN_tvalid, MULT_HANN_tlast})
      );
   
   xFFT FFT
     (
      .s_axis_data_tdata({32'b0, MULT_HANN_tdata}),
      .s_axis_data_tlast(MULT_HANN_tlast),
      .s_axis_data_tready(MULT_HANN_tready),
      .s_axis_data_tvalid(MULT_HANN_tvalid),
      .s_axis_config_tdata(CONFIG_IN_tdata),
      .s_axis_config_tready(CONFIG_IN_tready),
      .s_axis_config_tvalid(CONFIG_IN_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_data_tdata(FFT_tdata),
      .m_axis_data_tlast(FFT_tlast),
      .m_axis_data_tvalid(FFT_tvalid),
      .m_axis_data_tready(FFT_tready),
      .event_frame_started(event_frame_started),
      .event_tlast_unexpected(event_tlast_unexpected),
      .event_tlast_missing(event_tlast_missing),
      .event_data_in_channel_halt(event_data_in_channel_halt)
      );

   assign FFT_tready = 1'b1;

   always @(posedge s_axis_video_aclk)
     begin
	if(FFT_tvalid)
	  begin
	     BRAM_FFT_xPos <= BRAM_FFT_xPos + 1;
	     if(FFT_tlast)
	       begin
		  BRAM_FFT_yPos <= BRAM_FFT_yPos + 1;
		  if(&BRAM_FFT_yPos) read_BRAM_FFT <= 1'b1;
	       end
	  end // if (FFT_tvalid)
	if (read_BRAM_FFT && BRAM_FFT_tready)
	  begin
	     BRAM_FFT_yPos <= BRAM_FFT_yPos + 1;
	     if (BRAM_FFT_yPos == FFT_LENGTH - 2) BRAM_FFT_tlast <= 1'b1;
	     else BRAM_FFT_tlast <= 1'b0;
	     if (&BRAM_FFT_yPos)
	       begin
		  BRAM_FFT_xPos <= BRAM_FFT_xPos + 1;
		  if(&BRAM_FFT_xPos) read_BRAM_FFT <= 1'b0;
	       end
	  end // if (read_BRAM_FFT && BRAM_FFT_tready)
     end // always @ (posedge s_axis_video_aclk)

   assign BRAM_FFT_addr = {BRAM_FFT_xPos, BRAM_FFT_yPos};

   FFT_BRAM BRAM_FFT
     (
      .addra(BRAM_FFT_addr),
      .clka(s_axis_video_aclk),
      .dina(FFT_tdata),
      .douta(BRAM_FFT_out),
      .wea(FFT_tvalid),
      .regcea(BRAM_FFT_tready)
      );

   /* -----\/----- EXCLUDED -----\/-----
    DelayEnable_BRAM_Pos Delay_BRAM_Pos
    (
    .Input(BRAM_FFT_addr),
    .CLK_in(s_axis_video_aclk),
    .CLK_en(BRAM_FFT_tready),
    .Output({dBRAM_FFT_xPos, dBRAM_FFT_yPos})
    );
    -----/\----- EXCLUDED -----/\----- */

   DelayEnable_BRAM_tvalid Delay_BRAM_FFT_tvalid
     (
      .Input(read_BRAM_FFT),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BRAM_FFT_tready),
      .Output(dBRAM_FFT_tvalid)
      );

   DelayEnable_BRAM_tvalid Delay_BRAM_FFT_tlast
     (
      .Input(BRAM_FFT_tlast),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BRAM_FFT_tready),
      .Output(dBRAM_FFT_tlast)
      );
   
   xFFT FFT2
     (
      .s_axis_data_tdata(BRAM_FFT_out),
      .s_axis_data_tlast(dBRAM_FFT_tlast),
      .s_axis_data_tready(BRAM_FFT_tready),
      .s_axis_data_tvalid(dBRAM_FFT_tvalid),
      .s_axis_config_tdata(CONFIG_IN2_tdata),
      .s_axis_config_tready(CONFIG_IN2_tready),
      .s_axis_config_tvalid(CONFIG_IN2_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_data_tdata(FFT2_tdata),
      .m_axis_data_tlast(FFT2_tlast),
      .m_axis_data_tvalid(FFT2_tvalid),
      .m_axis_data_tready(FFT2_tready),
      .event_frame_started(event_frame_started2),
      .event_tlast_unexpected(event_tlast_unexpected2),
      .event_tlast_missing(event_tlast_missing2),
      .event_data_in_channel_halt(event_data_in_channel_halt2)
      );

   assign FFT_treal = FFT_tdata[FFT_WIDTH-1:0];
   assign FFT_timag = FFT_tdata[2*FFT_WIDTH-1:FFT_WIDTH];

   assign FFT2_treal = FFT2_tdata[FFT_WIDTH-1:0];
   assign FFT2_timag = FFT2_tdata[2*FFT_WIDTH-1:FFT_WIDTH];

   assign BRAM_FFT_treal = BRAM_FFT_out[FFT_WIDTH - 1 : 0];
   assign BRAM_FFT_timag = BRAM_FFT_out[2*FFT_WIDTH - 1 : FFT_WIDTH];

   always @(posedge s_axis_video_aclk)
     begin
	if(FFT2_tvalid && FFT2_tready)
	  begin
	     COEF_yPos <= COEF_yPos + 1;
	     if(FFT2_tlast)
	       begin
		  COEF_xPos <= COEF_xPos + 1;
		  //if(&BRAM_FFT_yPos) read_BRAM <= 1'b1;
	       end
	  end // if (FFT_tvalid)
	/* -----\/----- EXCLUDED -----\/-----
	 if (read_BRAM && BRAM_FFT_tready)
	 begin
	 BRAM_FFT_yPos <= BRAM_FFT_yPos + 1;
	 if (BRAM_FFT_yPos == FFT_LENGTH - 2) BRAM_FFT_tlast <= 1'b1;
	 else BRAM_FFT_tlast <= 1'b0;
	 if (&BRAM_FFT_yPos)
	 begin
	 BRAM_FFT_xPos <= BRAM_FFT_xPos + 1;
	 if(&BRAM_FFT_xPos) read_BRAM <= 1'b0;
	       end
	  end // if (read_BRAM && BRAM_FFT_tready)
	 -----/\----- EXCLUDED -----/\----- */
     end // always @ (posedge s_axis_video_aclk)

   assign COEF_addr = {COEF_xPos, COEF_yPos};

   COEF_BRAM H_coef
     (
      .addra(HWrite_addr),
      .clka(s_axis_video_aclk),
      .dina(ABDIV_tdata),
      .wea(ABDIV_REAL_tvalid && update),
      .addrb(COEF_addr),
      .clkb(s_axis_video_aclk),
      .doutb(COEF_out),
      .regceb(COEF_tready)
      );

   assign COEF_treal = COEF_out[FFT_WIDTH - 1 : 0];
   assign COEF_timag = COEF_out[2*FFT_WIDTH - 1 : FFT_WIDTH];

   DelayEnable_FFT2 Delay_FF2
     (
      .Input({FFT2_tdata, FFT2_tvalid, FFT2_tlast}),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(FFT2_tready),
      .Output({dFFT2_tdata, dFFT2_tvalid, dFFT2_tlast})
      );

   ComplexMult_FFT2_COEF FFT2_COEF
     (
      .s_axis_a_tdata(COEF_out),
      .s_axis_a_tvalid(dFFT2_tvalid),
      .s_axis_a_tready(COEF_tready),
      .s_axis_b_tdata(dFFT2_tdata),
      .s_axis_b_tvalid(dFFT2_tvalid),
      .s_axis_b_tlast(dFFT2_tlast),
      .s_axis_b_tready(FFT2_tready),
      .aclk(s_axis_video_aclk),
      .m_axis_dout_tdata(eMULT_tdata),
      .m_axis_dout_tvalid(MULT_tvalid),
      .m_axis_dout_tlast(MULT_tlast),
      .m_axis_dout_tready(MULT_tready)
      );

   assign eMULT_treal = eMULT_tdata[32 : 0];
   assign eMULT_timag = eMULT_tdata[72 : 40];
   assign mMULT_treal = eMULT_treal <<< 1;
   assign mMULT_timag = eMULT_timag <<< 1;
   assign MULT_tdata = {mMULT_timag[FFT_WIDTH : 1], mMULT_treal[FFT_WIDTH : 1]};
   
   assign MULT_treal = MULT_tdata[FFT_WIDTH - 1 : 0];
   assign MULT_timag = MULT_tdata[2*FFT_WIDTH - 1 : FFT_WIDTH];

   xFFT IFFT
     (
      .s_axis_data_tdata(MULT_tdata),
      .s_axis_data_tlast(MULT_tlast),
      .s_axis_data_tready(MULT_tready),
      .s_axis_data_tvalid(MULT_tvalid),
      .s_axis_config_tdata(CONFIG_IN3_tdata),
      .s_axis_config_tready(CONFIG_IN3_tready),
      .s_axis_config_tvalid(CONFIG_IN3_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_data_tdata(IFFT_tdata),
      .m_axis_data_tlast(IFFT_tlast),
      .m_axis_data_tvalid(IFFT_tvalid),
      .m_axis_data_tready(IFFT_tready),
      .event_frame_started(event_frame_started3),
      .event_tlast_unexpected(event_tlast_unexpected3),
      .event_tlast_missing(event_tlast_missing3),
      .event_data_in_channel_halt(event_data_in_channel_halt3)
      );

   assign IFFT_tready = 1'b1;

   always @(posedge s_axis_video_aclk)
     begin
	if(IFFT_tvalid)
	  begin
	     BRAM_IFFT_yPos <= BRAM_IFFT_yPos + 1;
	     if(IFFT_tlast)
	       begin
		  BRAM_IFFT_xPos <= BRAM_IFFT_xPos + 1;
		  if(&BRAM_IFFT_xPos) read_BRAM_IFFT <= 1'b1;
	       end
	  end // if (FFT_tvalid)
	if (read_BRAM_IFFT && BRAM_IFFT_tready)
	  begin
	     BRAM_IFFT_xPos <= BRAM_IFFT_xPos + 1;
	     if (BRAM_IFFT_xPos == FFT_LENGTH - 2) BRAM_IFFT_tlast <= 1'b1;
	     else BRAM_IFFT_tlast <= 1'b0;
	     if (&BRAM_IFFT_xPos)
	       begin
		  BRAM_IFFT_yPos <= BRAM_IFFT_yPos + 1;
		  if(&BRAM_IFFT_yPos) read_BRAM_IFFT <= 1'b0;
	       end
	  end // if (read_BRAM_IFFT && BRAM_FFT_tready)
     end // always @ (posedge s_axis_video_aclk)

   assign BRAM_IFFT_addr = {BRAM_IFFT_xPos, BRAM_IFFT_yPos};

   FFT_BRAM BRAM_IFFT
     (
      .addra(BRAM_IFFT_addr),
      .clka(s_axis_video_aclk),
      .dina(IFFT_tdata),
      .douta(BRAM_IFFT_out),
      .wea(IFFT_tvalid),
      .regcea(BRAM_IFFT_tready)
      );

   /* -----\/----- EXCLUDED -----\/-----
    DelayEnable_BRAM_Pos Delay_BRAM_Pos
    (
    .Input(BRAM_FFT_addr),
    .CLK_in(s_axis_video_aclk),
    .CLK_en(BRAM_FFT_tready),
    .Output({dBRAM_FFT_xPos, dBRAM_FFT_yPos})
    );
    -----/\----- EXCLUDED -----/\----- */

   DelayEnable_BRAM_tvalid Delay_BRAM_IFFT_tvalid
     (
      .Input(read_BRAM_IFFT),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BRAM_IFFT_tready),
      .Output(dBRAM_IFFT_tvalid)
      );

   DelayEnable_BRAM_tvalid Delay_BRAM_IFFT_tlast
     (
      .Input(BRAM_IFFT_tlast),
      .CLK_in(s_axis_video_aclk),
      .CLK_en(BRAM_IFFT_tready),
      .Output(dBRAM_IFFT_tlast)
      );
   
   xFFT IFFT2
     (
      .s_axis_data_tdata(BRAM_IFFT_out),
      .s_axis_data_tlast(dBRAM_IFFT_tlast),
      .s_axis_data_tready(BRAM_IFFT_tready),
      .s_axis_data_tvalid(dBRAM_IFFT_tvalid),
      .s_axis_config_tdata(CONFIG_IN4_tdata),
      .s_axis_config_tready(CONFIG_IN4_tready),
      .s_axis_config_tvalid(CONFIG_IN4_tvalid),
      .aclk(s_axis_video_aclk),
      .aresetn(s_axis_video_aresetn),
      .m_axis_data_tdata(IFFT2_tdata),
      .m_axis_data_tlast(IFFT2_tlast),
      .m_axis_data_tvalid(IFFT2_tvalid),
      .m_axis_data_tready(IFFT2_tready),
      .event_frame_started(event_frame_started4),
      .event_tlast_unexpected(event_tlast_unexpected4),
      .event_tlast_missing(event_tlast_missing4),
      .event_data_in_channel_halt(event_data_in_channel_halt4)
      );

   assign IFFT2_tready = 1'b1;

   assign IFFT_treal = IFFT_tdata[FFT_WIDTH-1:0];
   assign IFFT_timag = IFFT_tdata[2*FFT_WIDTH-1:FFT_WIDTH];

   assign IFFT2_treal = IFFT2_tdata[FFT_WIDTH-1:0];
   assign IFFT2_timag = IFFT2_tdata[2*FFT_WIDTH-1:FFT_WIDTH];

   assign BRAM_IFFT_treal = BRAM_IFFT_out[FFT_WIDTH - 1 : 0];
   assign BRAM_IFFT_timag = BRAM_IFFT_out[2*FFT_WIDTH - 1 : FFT_WIDTH];

   assign OUT_treal = ABDIV_treal;
   assign OUT_timag = ABDIV_timag;
   assign OUT_tvalid = ABDIV_REAL_tvalid;
   assign OUT_tlast = ABDIV_tlast;

   always @(posedge s_axis_video_aclk)
     begin
	if (IFFT2_xPos == 0 && IFFT2_yPos == 0) IFFT2_valMax <=0;
	if (IFFT2_tvalid && IFFT2_tready)
	  begin
	     IFFT2_xPos <= IFFT2_xPos + 1;
	     if (&IFFT2_xPos)
	       begin
		  IFFT2_yPos <= IFFT2_yPos + 1;
		  //if (&IFFT2_yPos) read_BIGBRAM <= 1'b1;
	       end
	     if (IFFT2_treal > IFFT2_valMax)
	       begin
		  IFFT2_xMax <= IFFT2_xPos;
		  IFFT2_yMax <= IFFT2_yPos;
		  IFFT2_valMax <= IFFT2_treal;
	       end
	  end
     end // always @ (posedge s_axis_video_aclk)

   assign OUT_xPos = xStart;
   assign OUT_yPos = yStart;

/* -----\/----- EXCLUDED -----\/-----
   ILA Test
     (
      .clk(s_axis_video_aclk),
      .probe0(VIDEO_IN_tdata),
      .probe1(VIDEO_IN_tlast),
      .probe2(VIDEO_IN_tready),
      .probe3(VIDEO_IN_tuser),
      .probe4(VIDEO_IN_tvalid),
      .probe5(CONFIG_IN_tvalid),
      .probe6(BMULT_treal),
      .probe7(BMULT_timag),
      .probe8(BMULT_tlast),
      .probe9(BMULT_tvalid),
      .probe10(xPos),
      .probe11(yPos),
      .probe12(BIGROI_tvalid),
      .probe13(BIGROI_tlast),
      .probe14(BRAM_BIGFFT_treal),
      .probe15(BRAM_BIGFFT_timag),
      .probe16(BIGFFT2_tvalid),
      .probe17(BIGFFT2_tlast),
      .probe18(IFFT2_xMax),
      .probe19(IFFT2_yMax),
      .probe20(IFFT2_valMax),
      .probe21(BIGBRAM_xPos),
      .probe22(BIGBRAM_yPos),
      .probe23(xStartNPPC),
      .probe24(centerLocation),
      .probe25(AMULT_treal),
      .probe26(AMULT_timag),
      .probe27(AMULT_tlast),
      .probe28(AMULT_tready),
      .probe29(AMULT_tvalid),
      .probe30(BIGFFT2_treal),
      .probe31(BIGFFT2_timag),
      .probe32(BIGFFT_tvalid),
      .probe33(BIGFFT_treal),
      .probe34(BIGFFT_timag),
      .probe35(BSUM_treal),
      .probe36(BSUM_timag),
      .probe37(BSUM_tvalid),
      .probe38(BIGFFT2_tready),
      .probe39(ASUM_treal),
      .probe40(ASUM_timag),
      .probe41(ASUM_tvalid),
      .probe42(ASUM_tlast),
      .probe43(BSUM_tlast),
      .probe44(ABDIV_treal),
      .probe45(BIGFFT_tlast),
      .probe46(ABDIV_REAL_tvalid),
      .probe47(ABDIV_timag),
      .probe48(ABDIV_tlast),
      .probe49(MULT_BIGHANN_tvalid),
      .probe50(MULT_BIGHANN_tlast),
      .probe51(MULT_BIGHANN_tready),
      .probe52(MULT_BIGHANN_tdata),
      .probe53(xStart),
      .probe54(yStart),
      .probe55(HWrite_addr),
      .probe56(AWrite_addr),
      .probe57(BIGBRAM_out),
      .probe58(BWrite_addr),
      .probe59(dBIGBRAM_tlast),
      .probe60(dBIGBRAM_tvalid),
      .probe61(saved_BIGBRAM),
      .probe62(read_BIGBRAM),
      .probe63(completed_IFFT2)
      );
 -----/\----- EXCLUDED -----/\----- */

endmodule
