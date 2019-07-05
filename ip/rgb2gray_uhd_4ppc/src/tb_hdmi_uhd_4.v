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

wire tx_tlast;
wire tx_tready;
wire tx_tuser;
wire tx_tvalid;
wire [95:0] tx_tdata;

wire [31:0] Gray;

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

rgb2gray_uhd_4ppc RGB2Gray
(
    .VIDEO_IN_tdata(rx_tdata),
    .VIDEO_IN_tlast(rx_tlast),
    .VIDEO_IN_tready(rx_tready),
    .VIDEO_IN_tuser(rx_tuser),
    .VIDEO_IN_tvalid(rx_tvalid),
    .s_axis_video_aclk(s_axis_video_aclk),
    .VIDEO_OUT_tdata(Gray),
    .VIDEO_OUT_tlast(tx_tlast),
    .VIDEO_OUT_tready(tx_tready),
    .VIDEO_OUT_tuser(tx_tuser),
    .VIDEO_OUT_tvalid(tx_tvalid)
);

assign tx_tdata[0*24+:24] = {Gray[0*8+:8], Gray[0*8+:8], Gray[0*8+:8]};
assign tx_tdata[1*24+:24] = {Gray[1*8+:8], Gray[1*8+:8], Gray[1*8+:8]};
assign tx_tdata[2*24+:24] = {Gray[2*8+:8], Gray[2*8+:8], Gray[2*8+:8]};
assign tx_tdata[3*24+:24] = {Gray[3*8+:8], Gray[3*8+:8], Gray[3*8+:8]};

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
