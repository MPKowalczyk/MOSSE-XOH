// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:v_hdmi_rx_ss:3.1
// IP Revision: 0

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module exdes_v_hdmi_rx_ss_0 (
  s_axi_cpu_aclk,
  s_axi_cpu_aresetn,
  cable_detect,
  link_clk,
  s_axis_audio_aclk,
  s_axis_audio_aresetn,
  acr_cts,
  acr_n,
  acr_valid,
  hpd,
  irq,
  video_clk,
  fid,
  s_axis_video_aresetn,
  s_axis_video_aclk,
  LINK_DATA1_IN_tdata,
  LINK_DATA1_IN_tvalid,
  LINK_DATA0_IN_tdata,
  LINK_DATA0_IN_tvalid,
  SB_STATUS_IN_tdata,
  SB_STATUS_IN_tvalid,
  LINK_DATA2_IN_tdata,
  LINK_DATA2_IN_tvalid,
  S_AXI_CPU_IN_araddr,
  S_AXI_CPU_IN_arprot,
  S_AXI_CPU_IN_arready,
  S_AXI_CPU_IN_arvalid,
  S_AXI_CPU_IN_awaddr,
  S_AXI_CPU_IN_awprot,
  S_AXI_CPU_IN_awready,
  S_AXI_CPU_IN_awvalid,
  S_AXI_CPU_IN_bready,
  S_AXI_CPU_IN_bresp,
  S_AXI_CPU_IN_bvalid,
  S_AXI_CPU_IN_rdata,
  S_AXI_CPU_IN_rready,
  S_AXI_CPU_IN_rresp,
  S_AXI_CPU_IN_rvalid,
  S_AXI_CPU_IN_wdata,
  S_AXI_CPU_IN_wready,
  S_AXI_CPU_IN_wstrb,
  S_AXI_CPU_IN_wvalid,
  AUDIO_OUT_tdata,
  AUDIO_OUT_tid,
  AUDIO_OUT_tready,
  AUDIO_OUT_tvalid,
  DDC_OUT_scl_i,
  DDC_OUT_scl_o,
  DDC_OUT_scl_t,
  DDC_OUT_sda_i,
  DDC_OUT_sda_o,
  DDC_OUT_sda_t,
  VIDEO_OUT_tdata,
  VIDEO_OUT_tlast,
  VIDEO_OUT_tready,
  VIDEO_OUT_tuser,
  VIDEO_OUT_tvalid
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.s_axi_cpu_aclk, FREQ_HZ 99999000, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, ASSOCIATED_BUSIF SB_STATUS_IN:S_AXI_CPU_IN, ASSOCIATED_RESET s_axi_cpu_aresetn" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.s_axi_cpu_aclk CLK" *)
input wire s_axi_cpu_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.s_axi_cpu_aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.s_axi_cpu_aresetn RST" *)
input wire s_axi_cpu_aresetn;
input wire cable_detect;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.link_clk, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, ASSOCIATED_BUSIF LINK_DATA0_IN:LINK_DATA1_IN:LINK_DATA2_IN" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.link_clk CLK" *)
input wire link_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.s_axis_audio_aclk, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, ASSOCIATED_BUSIF AUDIO_OUT, ASSOCIATED_RESET s_axis_audio_aresetn" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.s_axis_audio_aclk CLK" *)
input wire s_axis_audio_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.s_axis_audio_aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.s_axis_audio_aresetn RST" *)
input wire s_axis_audio_aresetn;
output wire [19 : 0] acr_cts;
output wire [19 : 0] acr_n;
output wire acr_valid;
output wire hpd;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.irq, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.irq INTERRUPT" *)
output wire irq;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.video_clk, FREQ_HZ 297000000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rx_video_clk" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.video_clk CLK" *)
input wire video_clk;
output wire fid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.s_axis_video_aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.s_axis_video_aresetn RST" *)
input wire s_axis_video_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.s_axis_video_aclk, FREQ_HZ 149998500, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk1, ASSOCIATED_BUSIF VIDEO_OUT, ASSOCIATED_RESET s_axis_video_aresetn" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.s_axis_video_aclk CLK" *)
input wire s_axis_video_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_IN TDATA" *)
input wire [39 : 0] LINK_DATA1_IN_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA1_IN, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_IN TVALID" *)
input wire LINK_DATA1_IN_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_IN TDATA" *)
input wire [39 : 0] LINK_DATA0_IN_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA0_IN, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_IN TVALID" *)
input wire LINK_DATA0_IN_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA" *)
input wire [1 : 0] SB_STATUS_IN_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SB_STATUS_IN, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999000, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID" *)
input wire SB_STATUS_IN_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_IN TDATA" *)
input wire [39 : 0] LINK_DATA2_IN_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA2_IN, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_IN TVALID" *)
input wire LINK_DATA2_IN_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARADDR" *)
input wire [8 : 0] S_AXI_CPU_IN_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARPROT" *)
input wire [2 : 0] S_AXI_CPU_IN_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARREADY" *)
output wire S_AXI_CPU_IN_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARVALID" *)
input wire S_AXI_CPU_IN_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWADDR" *)
input wire [8 : 0] S_AXI_CPU_IN_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWPROT" *)
input wire [2 : 0] S_AXI_CPU_IN_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWREADY" *)
output wire S_AXI_CPU_IN_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWVALID" *)
input wire S_AXI_CPU_IN_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BREADY" *)
input wire S_AXI_CPU_IN_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BRESP" *)
output wire [1 : 0] S_AXI_CPU_IN_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BVALID" *)
output wire S_AXI_CPU_IN_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RDATA" *)
output wire [31 : 0] S_AXI_CPU_IN_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RREADY" *)
input wire S_AXI_CPU_IN_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RRESP" *)
output wire [1 : 0] S_AXI_CPU_IN_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RVALID" *)
output wire S_AXI_CPU_IN_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WDATA" *)
input wire [31 : 0] S_AXI_CPU_IN_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WREADY" *)
output wire S_AXI_CPU_IN_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WSTRB" *)
input wire [3 : 0] S_AXI_CPU_IN_wstrb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CPU_IN, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999000, ID_WIDTH 0, ADDR_WIDTH 16, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRI\
TE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WVALID" *)
input wire S_AXI_CPU_IN_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TDATA" *)
output wire [31 : 0] AUDIO_OUT_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TID" *)
output wire [2 : 0] AUDIO_OUT_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TREADY" *)
input wire AUDIO_OUT_tready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_OUT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TVALID" *)
output wire AUDIO_OUT_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I" *)
input wire DDC_OUT_scl_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O" *)
output wire DDC_OUT_scl_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T" *)
output wire DDC_OUT_scl_t;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I" *)
input wire DDC_OUT_sda_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O" *)
output wire DDC_OUT_sda_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T" *)
output wire DDC_OUT_sda_t;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TDATA" *)
output wire [95 : 0] VIDEO_OUT_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TLAST" *)
output wire VIDEO_OUT_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TREADY" *)
input wire VIDEO_OUT_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TUSER" *)
output wire VIDEO_OUT_tuser;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME VIDEO_OUT, TDATA_NUM_BYTES 12, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 149998500, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk1, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xilinx.com:video:G_B_R_444:1.0} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}}\
 value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value rows} size {attribs {resolve_type generated dependency active_rows format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency active_rows_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate depende\
ncy {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value cols} size {attribs {resolve_type generated dependency active_cols format long minimum {} maximum {}} value 1} stride {attribs {resolve_t\
ype generated dependency active_cols_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_G {name {attribs {resolve_type immediate dependency {} format string minimum {} maximu\
m {}} value G} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency\
 {} format bool minimum {} maximum {}} value true}}}} field_B {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value B} enabled {attribs {resolve_type generated dependency video_comp1_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value \
8} bitoffset {attribs {resolve_type generated dependency video_comp1_offset format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} field_R {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value R} enabled {attribs {resolve_type generated dependency video_comp2_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type imm\
ediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency video_comp2_offset format long minimum {} maximum {}} value 16} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}}} TDATA_WIDTH 24}" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TVALID" *)
output wire VIDEO_OUT_tvalid;

  bd_3ec1 inst (
    .s_axi_cpu_aclk(s_axi_cpu_aclk),
    .s_axi_cpu_aresetn(s_axi_cpu_aresetn),
    .cable_detect(cable_detect),
    .link_clk(link_clk),
    .s_axis_audio_aclk(s_axis_audio_aclk),
    .s_axis_audio_aresetn(s_axis_audio_aresetn),
    .acr_cts(acr_cts),
    .acr_n(acr_n),
    .acr_valid(acr_valid),
    .hpd(hpd),
    .irq(irq),
    .video_clk(video_clk),
    .fid(fid),
    .s_axis_video_aresetn(s_axis_video_aresetn),
    .s_axis_video_aclk(s_axis_video_aclk),
    .LINK_DATA1_IN_tdata(LINK_DATA1_IN_tdata),
    .LINK_DATA1_IN_tvalid(LINK_DATA1_IN_tvalid),
    .LINK_DATA0_IN_tdata(LINK_DATA0_IN_tdata),
    .LINK_DATA0_IN_tvalid(LINK_DATA0_IN_tvalid),
    .SB_STATUS_IN_tdata(SB_STATUS_IN_tdata),
    .SB_STATUS_IN_tvalid(SB_STATUS_IN_tvalid),
    .LINK_DATA2_IN_tdata(LINK_DATA2_IN_tdata),
    .LINK_DATA2_IN_tvalid(LINK_DATA2_IN_tvalid),
    .S_AXI_CPU_IN_araddr(S_AXI_CPU_IN_araddr),
    .S_AXI_CPU_IN_arprot(S_AXI_CPU_IN_arprot),
    .S_AXI_CPU_IN_arready(S_AXI_CPU_IN_arready),
    .S_AXI_CPU_IN_arvalid(S_AXI_CPU_IN_arvalid),
    .S_AXI_CPU_IN_awaddr(S_AXI_CPU_IN_awaddr),
    .S_AXI_CPU_IN_awprot(S_AXI_CPU_IN_awprot),
    .S_AXI_CPU_IN_awready(S_AXI_CPU_IN_awready),
    .S_AXI_CPU_IN_awvalid(S_AXI_CPU_IN_awvalid),
    .S_AXI_CPU_IN_bready(S_AXI_CPU_IN_bready),
    .S_AXI_CPU_IN_bresp(S_AXI_CPU_IN_bresp),
    .S_AXI_CPU_IN_bvalid(S_AXI_CPU_IN_bvalid),
    .S_AXI_CPU_IN_rdata(S_AXI_CPU_IN_rdata),
    .S_AXI_CPU_IN_rready(S_AXI_CPU_IN_rready),
    .S_AXI_CPU_IN_rresp(S_AXI_CPU_IN_rresp),
    .S_AXI_CPU_IN_rvalid(S_AXI_CPU_IN_rvalid),
    .S_AXI_CPU_IN_wdata(S_AXI_CPU_IN_wdata),
    .S_AXI_CPU_IN_wready(S_AXI_CPU_IN_wready),
    .S_AXI_CPU_IN_wstrb(S_AXI_CPU_IN_wstrb),
    .S_AXI_CPU_IN_wvalid(S_AXI_CPU_IN_wvalid),
    .AUDIO_OUT_tdata(AUDIO_OUT_tdata),
    .AUDIO_OUT_tid(AUDIO_OUT_tid),
    .AUDIO_OUT_tready(AUDIO_OUT_tready),
    .AUDIO_OUT_tvalid(AUDIO_OUT_tvalid),
    .DDC_OUT_scl_i(DDC_OUT_scl_i),
    .DDC_OUT_scl_o(DDC_OUT_scl_o),
    .DDC_OUT_scl_t(DDC_OUT_scl_t),
    .DDC_OUT_sda_i(DDC_OUT_sda_i),
    .DDC_OUT_sda_o(DDC_OUT_sda_o),
    .DDC_OUT_sda_t(DDC_OUT_sda_t),
    .VIDEO_OUT_tdata(VIDEO_OUT_tdata),
    .VIDEO_OUT_tlast(VIDEO_OUT_tlast),
    .VIDEO_OUT_tready(VIDEO_OUT_tready),
    .VIDEO_OUT_tuser(VIDEO_OUT_tuser),
    .VIDEO_OUT_tvalid(VIDEO_OUT_tvalid)
  );
endmodule
