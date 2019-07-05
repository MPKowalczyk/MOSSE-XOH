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


// IP VLNV: xilinx.com:ip:v_hdmi_rx:3.0
// IP Revision: 0

(* X_CORE_INFO = "v_hdmi_rx_v3_0_0,Vivado 2018.2" *)
(* CHECK_LICENSE_TYPE = "bd_3ec1_v_hdmi_rx_0,v_hdmi_rx_v3_0_0,{}" *)
(* CORE_GENERATION_INFO = "bd_3ec1_v_hdmi_rx_0,v_hdmi_rx_v3_0_0,{x_ipProduct=Vivado 2018.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=v_hdmi_rx,x_ipVersion=3.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,x_ipLicense=v_hdmi@2017.10(bought),C_S_AXI_DATA_WIDTH=32,C_S_AXI_ADDR_WIDTH=9,C_BITS_PER_COMPONENT=8,C_PIXELS_PER_CLOCK=4,C_GT_LANES=4,C_DDC_EDID_SIZE=256,C_SIM_SPEEDUP=FALSE,C_HDCP_IF_ENABLE=0}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_3ec1_v_hdmi_rx_0 (
  s_axi_aclk,
  s_axi_aresetn,
  m_axis_video_aresetn_in,
  s_axi_awaddr,
  s_axi_awprot,
  s_axi_awvalid,
  s_axi_awready,
  s_axi_wdata,
  s_axi_wstrb,
  s_axi_wvalid,
  s_axi_wready,
  s_axi_bresp,
  s_axi_bvalid,
  s_axi_bready,
  s_axi_araddr,
  s_axi_arprot,
  s_axi_arvalid,
  s_axi_arready,
  s_axi_rdata,
  s_axi_rresp,
  s_axi_rvalid,
  s_axi_rready,
  link_clk,
  link_data0,
  link_data1,
  link_data2,
  link_valid0,
  link_valid1,
  link_valid2,
  hpd,
  cable_detect,
  video_reset,
  m_axis_video_aresetn_out,
  axis_enable,
  sb_status_data,
  sb_status_valid,
  avmute,
  video_clk,
  m_axis_video_aclk,
  video_vs,
  video_hs,
  video_data,
  video_de,
  video_field,
  m_axis_audio_aresetn,
  m_axis_audio_aclk,
  m_axis_audio_tready,
  m_axis_audio_tid,
  m_axis_audio_tdata,
  m_axis_audio_tvalid,
  acr_cts,
  acr_n,
  acr_valid,
  m_axis_hdcp_aresetn,
  m_axis_hdcp_aclk,
  m_axis_hdcp_aclken,
  m_axis_hdcp_tid,
  m_axis_hdcp_tuser,
  m_axis_hdcp_tdata,
  m_axis_hdcp_tstrb,
  m_axis_hdcp_tvalid,
  m_axis_hdcp_tlast,
  m_axis_hdcp_tready,
  s_axis_hdcp_tid,
  s_axis_hdcp_tuser,
  s_axis_hdcp_tdata,
  s_axis_hdcp_tstrb,
  s_axis_hdcp_tvalid,
  s_axis_hdcp_tlast,
  s_axis_hdcp_tready,
  ddc_scl_i,
  ddc_scl_o,
  ddc_scl_t,
  ddc_sda_i,
  ddc_sda_o,
  ddc_sda_t,
  irq,
  bridge_yuv420,
  bridge_pixel_drop,
  bridge_overflow
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPU_AXI_CLK, ASSOCIATED_BUSIF CPU_IN:SB_STATUS_IN, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 99999000, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CPU_AXI_CLK CLK" *)
input wire s_axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPU_AXI_RST, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 CPU_AXI_RST RST" *)
input wire s_axi_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXIS_VIDEO_ARSTN, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AXIS_VIDEO_ARSTN RST" *)
input wire m_axis_video_aresetn_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN AWADDR" *)
input wire [8 : 0] s_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN AWPROT" *)
input wire [2 : 0] s_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN AWVALID" *)
input wire s_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN AWREADY" *)
output wire s_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN WDATA" *)
input wire [31 : 0] s_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN WSTRB" *)
input wire [3 : 0] s_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN WVALID" *)
input wire s_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN WREADY" *)
output wire s_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN BRESP" *)
output wire [1 : 0] s_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN BVALID" *)
output wire s_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN BREADY" *)
input wire s_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN ARADDR" *)
input wire [8 : 0] s_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN ARPROT" *)
input wire [2 : 0] s_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN ARVALID" *)
input wire s_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN ARREADY" *)
output wire s_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN RDATA" *)
output wire [31 : 0] s_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN RRESP" *)
output wire [1 : 0] s_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN RVALID" *)
output wire s_axi_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CPU_IN, WIZ.DATA_WIDTH 32, WIZ.NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999000, ID_WIDTH 0, ADDR_WIDTH 9, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, \
NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 CPU_IN RREADY" *)
input wire s_axi_rready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_CLK, ASSOCIATED_BUSIF LINK_DATA0_IN:LINK_DATA1_IN:LINK_DATA2_IN, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 LINK_CLK CLK" *)
input wire link_clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_IN TDATA" *)
input wire [39 : 0] link_data0;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_IN TDATA" *)
input wire [39 : 0] link_data1;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_IN TDATA" *)
input wire [39 : 0] link_data2;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA0_IN, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_IN TVALID" *)
input wire link_valid0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA1_IN, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_IN TVALID" *)
input wire link_valid1;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA2_IN, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 148500000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_IN TVALID" *)
input wire link_valid2;
output wire hpd;
input wire cable_detect;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME VIDEO_RESET, POLARITY ACTIVE_HIGH" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 VIDEO_RESET RST" *)
output wire video_reset;
output wire m_axis_video_aresetn_out;
output wire axis_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA" *)
input wire [1 : 0] sb_status_data;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SB_STATUS_IN, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999000, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID" *)
input wire sb_status_valid;
output wire avmute;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME VIDEO_CLK, ASSOCIATED_BUSIF VIDEO_OUT, FREQ_HZ 297000000, PHASE 0.000, CLK_DOMAIN exdes_vid_phy_controller_0_rx_video_clk" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 VIDEO_CLK CLK" *)
input wire video_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXIS_VIDEO_ACLK, FREQ_HZ 149998500, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AXIS_VIDEO_ACLK CLK" *)
input wire m_axis_video_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 VIDEO_OUT VSYNC" *)
output wire video_vs;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 VIDEO_OUT HSYNC" *)
output wire video_hs;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 VIDEO_OUT DATA" *)
output wire [95 : 0] video_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 VIDEO_OUT ACTIVE_VIDEO" *)
output wire video_de;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 VIDEO_OUT FIELD" *)
output wire video_field;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_AXIS_RST, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AUDIO_AXIS_RST RST" *)
input wire m_axis_audio_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_AXIS_CLK, ASSOCIATED_BUSIF AUDIO_OUT, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AUDIO_AXIS_CLK CLK" *)
input wire m_axis_audio_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TREADY" *)
input wire m_axis_audio_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TID" *)
output wire [2 : 0] m_axis_audio_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TDATA" *)
output wire [31 : 0] m_axis_audio_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_OUT, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TVALID" *)
output wire m_axis_audio_tvalid;
output wire [19 : 0] acr_cts;
output wire [19 : 0] acr_n;
output wire acr_valid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME HDCP_AXIS_RST, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 HDCP_AXIS_RST RST" *)
output wire m_axis_hdcp_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME HDCP_AXIS_CLK, ASSOCIATED_BUSIF HDCP_IN:HDCP_OUT, ASSOCIATED_RESET m_axis_hdcp_aresetn, ASSOCIATED_CLKEN m_axis_hdcp_aclken, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_3ec1_v_hdmi_rx_0_m_axis_hdcp_aclk" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 HDCP_AXIS_CLK CLK" *)
output wire m_axis_hdcp_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME HDCP_AXIS_CLKEN, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clockenable:1.0 HDCP_AXIS_CLKEN CE" *)
output wire m_axis_hdcp_aclken;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_OUT TID" *)
output wire m_axis_hdcp_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_OUT TUSER" *)
output wire [31 : 0] m_axis_hdcp_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_OUT TDATA" *)
output wire [95 : 0] m_axis_hdcp_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_OUT TSTRB" *)
output wire [3 : 0] m_axis_hdcp_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_OUT TVALID" *)
output wire m_axis_hdcp_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_OUT TLAST" *)
output wire m_axis_hdcp_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME HDCP_OUT, TDATA_NUM_BYTES 12, TDEST_WIDTH 0, TID_WIDTH 1, TUSER_WIDTH 32, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_3ec1_v_hdmi_rx_0_m_axis_hdcp_aclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_OUT TREADY" *)
input wire m_axis_hdcp_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_IN TID" *)
input wire s_axis_hdcp_tid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_IN TUSER" *)
input wire [31 : 0] s_axis_hdcp_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_IN TDATA" *)
input wire [95 : 0] s_axis_hdcp_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_IN TSTRB" *)
input wire [3 : 0] s_axis_hdcp_tstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_IN TVALID" *)
input wire s_axis_hdcp_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_IN TLAST" *)
input wire s_axis_hdcp_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME HDCP_IN, TDATA_NUM_BYTES 12, TDEST_WIDTH 0, TID_WIDTH 1, TUSER_WIDTH 32, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN bd_3ec1_v_hdmi_rx_0_m_axis_hdcp_aclk, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 HDCP_IN TREADY" *)
output wire s_axis_hdcp_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I" *)
input wire ddc_scl_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O" *)
output wire ddc_scl_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T" *)
output wire ddc_scl_t;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I" *)
input wire ddc_sda_i;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O" *)
output wire ddc_sda_o;
(* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T" *)
output wire ddc_sda_t;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME IRQ_SIGNAL_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 IRQ_SIGNAL_INTERRUPT INTERRUPT" *)
output wire irq;
output wire bridge_yuv420;
output wire bridge_pixel_drop;
input wire bridge_overflow;

  v_hdmi_rx_v3_0_0 #(
    .C_S_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_S_AXI_ADDR_WIDTH(9),  // Width of S_AXI address bus
    .C_BITS_PER_COMPONENT(8),
    .C_PIXELS_PER_CLOCK(4),
    .C_GT_LANES(4),
    .C_DDC_EDID_SIZE(256),
    .C_SIM_SPEEDUP("FALSE"),
    .C_HDCP_IF_ENABLE(0)
  ) inst (
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aresetn(s_axi_aresetn),
    .m_axis_video_aresetn_in(m_axis_video_aresetn_in),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .link_clk(link_clk),
    .link_data0(link_data0),
    .link_data1(link_data1),
    .link_data2(link_data2),
    .link_valid0(link_valid0),
    .link_valid1(link_valid1),
    .link_valid2(link_valid2),
    .hpd(hpd),
    .cable_detect(cable_detect),
    .video_reset(video_reset),
    .m_axis_video_aresetn_out(m_axis_video_aresetn_out),
    .axis_enable(axis_enable),
    .sb_status_data(sb_status_data),
    .sb_status_valid(sb_status_valid),
    .avmute(avmute),
    .video_clk(video_clk),
    .m_axis_video_aclk(m_axis_video_aclk),
    .video_vs(video_vs),
    .video_hs(video_hs),
    .video_data(video_data),
    .video_de(video_de),
    .video_field(video_field),
    .m_axis_audio_aresetn(m_axis_audio_aresetn),
    .m_axis_audio_aclk(m_axis_audio_aclk),
    .m_axis_audio_tready(m_axis_audio_tready),
    .m_axis_audio_tid(m_axis_audio_tid),
    .m_axis_audio_tdata(m_axis_audio_tdata),
    .m_axis_audio_tvalid(m_axis_audio_tvalid),
    .acr_cts(acr_cts),
    .acr_n(acr_n),
    .acr_valid(acr_valid),
    .m_axis_hdcp_aresetn(m_axis_hdcp_aresetn),
    .m_axis_hdcp_aclk(m_axis_hdcp_aclk),
    .m_axis_hdcp_aclken(m_axis_hdcp_aclken),
    .m_axis_hdcp_tid(m_axis_hdcp_tid),
    .m_axis_hdcp_tuser(m_axis_hdcp_tuser),
    .m_axis_hdcp_tdata(m_axis_hdcp_tdata),
    .m_axis_hdcp_tstrb(m_axis_hdcp_tstrb),
    .m_axis_hdcp_tvalid(m_axis_hdcp_tvalid),
    .m_axis_hdcp_tlast(m_axis_hdcp_tlast),
    .m_axis_hdcp_tready(m_axis_hdcp_tready),
    .s_axis_hdcp_tid(s_axis_hdcp_tid),
    .s_axis_hdcp_tuser(s_axis_hdcp_tuser),
    .s_axis_hdcp_tdata(s_axis_hdcp_tdata),
    .s_axis_hdcp_tstrb(s_axis_hdcp_tstrb),
    .s_axis_hdcp_tvalid(s_axis_hdcp_tvalid),
    .s_axis_hdcp_tlast(s_axis_hdcp_tlast),
    .s_axis_hdcp_tready(s_axis_hdcp_tready),
    .ddc_scl_i(ddc_scl_i),
    .ddc_scl_o(ddc_scl_o),
    .ddc_scl_t(ddc_scl_t),
    .ddc_sda_i(ddc_sda_i),
    .ddc_sda_o(ddc_sda_o),
    .ddc_sda_t(ddc_sda_t),
    .irq(irq),
    .bridge_yuv420(bridge_yuv420),
    .bridge_pixel_drop(bridge_pixel_drop),
    .bridge_overflow(bridge_overflow)
  );
endmodule
