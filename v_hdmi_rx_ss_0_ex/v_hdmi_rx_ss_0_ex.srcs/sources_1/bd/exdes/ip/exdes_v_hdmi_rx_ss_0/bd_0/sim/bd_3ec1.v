//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_3ec1.bd
//Design : bd_3ec1
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_3ec1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_3ec1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "exdes_v_hdmi_rx_ss_0.hwdef" *) 
module bd_3ec1
   (AUDIO_OUT_tdata,
    AUDIO_OUT_tid,
    AUDIO_OUT_tready,
    AUDIO_OUT_tvalid,
    DDC_OUT_scl_i,
    DDC_OUT_scl_o,
    DDC_OUT_scl_t,
    DDC_OUT_sda_i,
    DDC_OUT_sda_o,
    DDC_OUT_sda_t,
    LINK_DATA0_IN_tdata,
    LINK_DATA0_IN_tvalid,
    LINK_DATA1_IN_tdata,
    LINK_DATA1_IN_tvalid,
    LINK_DATA2_IN_tdata,
    LINK_DATA2_IN_tvalid,
    SB_STATUS_IN_tdata,
    SB_STATUS_IN_tvalid,
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
    VIDEO_OUT_tdata,
    VIDEO_OUT_tlast,
    VIDEO_OUT_tready,
    VIDEO_OUT_tuser,
    VIDEO_OUT_tvalid,
    acr_cts,
    acr_n,
    acr_valid,
    cable_detect,
    fid,
    hpd,
    irq,
    link_clk,
    s_axi_cpu_aclk,
    s_axi_cpu_aresetn,
    s_axis_audio_aclk,
    s_axis_audio_aresetn,
    s_axis_video_aclk,
    s_axis_video_aresetn,
    video_clk);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_OUT, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, FREQ_HZ 99999000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 0" *) output [31:0]AUDIO_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TID" *) output [2:0]AUDIO_OUT_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TREADY" *) input AUDIO_OUT_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_OUT TVALID" *) output AUDIO_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I" *) input DDC_OUT_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O" *) output DDC_OUT_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T" *) output DDC_OUT_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I" *) input DDC_OUT_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O" *) output DDC_OUT_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T" *) output DDC_OUT_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA0_IN, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, FREQ_HZ 148500000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [39:0]LINK_DATA0_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_IN TVALID" *) input LINK_DATA0_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA1_IN, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, FREQ_HZ 148500000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [39:0]LINK_DATA1_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_IN TVALID" *) input LINK_DATA1_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA2_IN, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, FREQ_HZ 148500000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [39:0]LINK_DATA2_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_IN TVALID" *) input LINK_DATA2_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SB_STATUS_IN, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, FREQ_HZ 99999000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [1:0]SB_STATUS_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID" *) input SB_STATUS_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CPU_IN, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, DATA_WIDTH 32, FREQ_HZ 99999000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [8:0]S_AXI_CPU_IN_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARPROT" *) input [2:0]S_AXI_CPU_IN_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARREADY" *) output S_AXI_CPU_IN_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARVALID" *) input S_AXI_CPU_IN_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWADDR" *) input [8:0]S_AXI_CPU_IN_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWPROT" *) input [2:0]S_AXI_CPU_IN_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWREADY" *) output S_AXI_CPU_IN_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWVALID" *) input S_AXI_CPU_IN_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BREADY" *) input S_AXI_CPU_IN_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BRESP" *) output [1:0]S_AXI_CPU_IN_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BVALID" *) output S_AXI_CPU_IN_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RDATA" *) output [31:0]S_AXI_CPU_IN_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RREADY" *) input S_AXI_CPU_IN_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RRESP" *) output [1:0]S_AXI_CPU_IN_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RVALID" *) output S_AXI_CPU_IN_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WDATA" *) input [31:0]S_AXI_CPU_IN_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WREADY" *) output S_AXI_CPU_IN_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WSTRB" *) input [3:0]S_AXI_CPU_IN_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WVALID" *) input S_AXI_CPU_IN_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME VIDEO_OUT, CLK_DOMAIN exdes_zynq_us_0_pl_clk1, FREQ_HZ 149998500, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xilinx.com:video:G_B_R_444:1.0} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value rows} size {attribs {resolve_type generated dependency active_rows format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency active_rows_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value cols} size {attribs {resolve_type generated dependency active_cols format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency active_cols_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_G {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value G} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} field_B {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value B} enabled {attribs {resolve_type generated dependency video_comp1_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency video_comp1_offset format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} field_R {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value R} enabled {attribs {resolve_type generated dependency video_comp2_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency video_comp2_offset format long minimum {} maximum {}} value 16} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}}} TDATA_WIDTH 24}, PHASE 0.000, TDATA_NUM_BYTES 12, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) output [95:0]VIDEO_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TLAST" *) output VIDEO_OUT_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TREADY" *) input VIDEO_OUT_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TUSER" *) output VIDEO_OUT_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_OUT TVALID" *) output VIDEO_OUT_tvalid;
  output [19:0]acr_cts;
  output [19:0]acr_n;
  output acr_valid;
  input cable_detect;
  output fid;
  output hpd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.LINK_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.LINK_CLK, ASSOCIATED_BUSIF LINK_DATA0_IN:LINK_DATA1_IN:LINK_DATA2_IN, CLK_DOMAIN exdes_vid_phy_controller_0_rxoutclk, FREQ_HZ 148500000, PHASE 0.000" *) input link_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXI_CPU_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXI_CPU_ACLK, ASSOCIATED_BUSIF SB_STATUS_IN:S_AXI_CPU_IN, ASSOCIATED_RESET s_axi_cpu_aresetn, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, FREQ_HZ 99999000, PHASE 0.000" *) input s_axi_cpu_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXI_CPU_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXI_CPU_ARESETN, POLARITY ACTIVE_LOW" *) input s_axi_cpu_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXIS_AUDIO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXIS_AUDIO_ACLK, ASSOCIATED_BUSIF AUDIO_OUT, ASSOCIATED_RESET s_axis_audio_aresetn, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, FREQ_HZ 99999000, PHASE 0.0" *) input s_axis_audio_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXIS_AUDIO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXIS_AUDIO_ARESETN, POLARITY ACTIVE_LOW" *) input s_axis_audio_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXIS_VIDEO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXIS_VIDEO_ACLK, ASSOCIATED_BUSIF VIDEO_OUT, ASSOCIATED_RESET s_axis_video_aresetn, CLK_DOMAIN exdes_zynq_us_0_pl_clk1, FREQ_HZ 149998500, PHASE 0.000" *) input s_axis_video_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXIS_VIDEO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXIS_VIDEO_ARESETN, POLARITY ACTIVE_LOW" *) input s_axis_video_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.VIDEO_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.VIDEO_CLK, CLK_DOMAIN exdes_vid_phy_controller_0_rx_video_clk, FREQ_HZ 297000000, PHASE 0.000" *) input video_clk;

  wire [39:0]intf_net_bdry_in_LINK_DATA0_IN_TDATA;
  wire intf_net_bdry_in_LINK_DATA0_IN_TVALID;
  wire [39:0]intf_net_bdry_in_LINK_DATA1_IN_TDATA;
  wire intf_net_bdry_in_LINK_DATA1_IN_TVALID;
  wire [39:0]intf_net_bdry_in_LINK_DATA2_IN_TDATA;
  wire intf_net_bdry_in_LINK_DATA2_IN_TVALID;
  wire [1:0]intf_net_bdry_in_SB_STATUS_IN_TDATA;
  wire intf_net_bdry_in_SB_STATUS_IN_TVALID;
  wire [8:0]intf_net_bdry_in_S_AXI_CPU_IN_ARADDR;
  wire [2:0]intf_net_bdry_in_S_AXI_CPU_IN_ARPROT;
  wire intf_net_bdry_in_S_AXI_CPU_IN_ARREADY;
  wire intf_net_bdry_in_S_AXI_CPU_IN_ARVALID;
  wire [8:0]intf_net_bdry_in_S_AXI_CPU_IN_AWADDR;
  wire [2:0]intf_net_bdry_in_S_AXI_CPU_IN_AWPROT;
  wire intf_net_bdry_in_S_AXI_CPU_IN_AWREADY;
  wire intf_net_bdry_in_S_AXI_CPU_IN_AWVALID;
  wire intf_net_bdry_in_S_AXI_CPU_IN_BREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_CPU_IN_BRESP;
  wire intf_net_bdry_in_S_AXI_CPU_IN_BVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_CPU_IN_RDATA;
  wire intf_net_bdry_in_S_AXI_CPU_IN_RREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_CPU_IN_RRESP;
  wire intf_net_bdry_in_S_AXI_CPU_IN_RVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_CPU_IN_WDATA;
  wire intf_net_bdry_in_S_AXI_CPU_IN_WREADY;
  wire [3:0]intf_net_bdry_in_S_AXI_CPU_IN_WSTRB;
  wire intf_net_bdry_in_S_AXI_CPU_IN_WVALID;
  wire [31:0]intf_net_v_hdmi_rx_AUDIO_OUT_TDATA;
  wire [2:0]intf_net_v_hdmi_rx_AUDIO_OUT_TID;
  wire intf_net_v_hdmi_rx_AUDIO_OUT_TREADY;
  wire intf_net_v_hdmi_rx_AUDIO_OUT_TVALID;
  wire intf_net_v_hdmi_rx_DDC_OUT_SCL_I;
  wire intf_net_v_hdmi_rx_DDC_OUT_SCL_O;
  wire intf_net_v_hdmi_rx_DDC_OUT_SCL_T;
  wire intf_net_v_hdmi_rx_DDC_OUT_SDA_I;
  wire intf_net_v_hdmi_rx_DDC_OUT_SDA_O;
  wire intf_net_v_hdmi_rx_DDC_OUT_SDA_T;
  wire intf_net_v_hdmi_rx_VIDEO_OUT_ACTIVE_VIDEO;
  wire [95:0]intf_net_v_hdmi_rx_VIDEO_OUT_DATA;
  wire intf_net_v_hdmi_rx_VIDEO_OUT_FIELD;
  wire intf_net_v_hdmi_rx_VIDEO_OUT_HSYNC;
  wire intf_net_v_hdmi_rx_VIDEO_OUT_VSYNC;
  wire [95:0]intf_net_v_hdmi_rx_hdcp_out_TDATA;
  wire intf_net_v_hdmi_rx_hdcp_out_TID;
  wire intf_net_v_hdmi_rx_hdcp_out_TLAST;
  wire intf_net_v_hdmi_rx_hdcp_out_TREADY;
  wire [3:0]intf_net_v_hdmi_rx_hdcp_out_TSTRB;
  wire [31:0]intf_net_v_hdmi_rx_hdcp_out_TUSER;
  wire intf_net_v_hdmi_rx_hdcp_out_TVALID;
  wire [95:0]intf_net_v_vid_in_axi4s_VIDEO_OUT_TDATA;
  wire intf_net_v_vid_in_axi4s_VIDEO_OUT_TLAST;
  wire intf_net_v_vid_in_axi4s_VIDEO_OUT_TREADY;
  wire intf_net_v_vid_in_axi4s_VIDEO_OUT_TUSER;
  wire intf_net_v_vid_in_axi4s_VIDEO_OUT_TVALID;
  wire net_bdry_in_cable_detect;
  wire net_bdry_in_link_clk;
  wire net_bdry_in_s_axi_cpu_aclk;
  wire net_bdry_in_s_axi_cpu_aresetn;
  wire net_bdry_in_s_axis_audio_aclk;
  wire net_bdry_in_s_axis_audio_aresetn;
  wire net_bdry_in_s_axis_video_aclk;
  wire net_bdry_in_s_axis_video_aresetn;
  wire net_bdry_in_video_clk;
  wire [0:0]net_inverter_1_Res;
  wire [19:0]net_v_hdmi_rx_acr_cts;
  wire [19:0]net_v_hdmi_rx_acr_n;
  wire net_v_hdmi_rx_acr_valid;
  wire net_v_hdmi_rx_axis_enable;
  wire net_v_hdmi_rx_hpd;
  wire net_v_hdmi_rx_irq;
  wire net_v_hdmi_rx_m_axis_video_aresetn_out;
  wire net_v_hdmi_rx_video_reset;
  wire net_v_vid_in_axi4s_fid;
  wire net_v_vid_in_axi4s_overflow;

  assign AUDIO_OUT_tdata[31:0] = intf_net_v_hdmi_rx_AUDIO_OUT_TDATA;
  assign AUDIO_OUT_tid[2:0] = intf_net_v_hdmi_rx_AUDIO_OUT_TID;
  assign AUDIO_OUT_tvalid = intf_net_v_hdmi_rx_AUDIO_OUT_TVALID;
  assign DDC_OUT_scl_o = intf_net_v_hdmi_rx_DDC_OUT_SCL_O;
  assign DDC_OUT_scl_t = intf_net_v_hdmi_rx_DDC_OUT_SCL_T;
  assign DDC_OUT_sda_o = intf_net_v_hdmi_rx_DDC_OUT_SDA_O;
  assign DDC_OUT_sda_t = intf_net_v_hdmi_rx_DDC_OUT_SDA_T;
  assign S_AXI_CPU_IN_arready = intf_net_bdry_in_S_AXI_CPU_IN_ARREADY;
  assign S_AXI_CPU_IN_awready = intf_net_bdry_in_S_AXI_CPU_IN_AWREADY;
  assign S_AXI_CPU_IN_bresp[1:0] = intf_net_bdry_in_S_AXI_CPU_IN_BRESP;
  assign S_AXI_CPU_IN_bvalid = intf_net_bdry_in_S_AXI_CPU_IN_BVALID;
  assign S_AXI_CPU_IN_rdata[31:0] = intf_net_bdry_in_S_AXI_CPU_IN_RDATA;
  assign S_AXI_CPU_IN_rresp[1:0] = intf_net_bdry_in_S_AXI_CPU_IN_RRESP;
  assign S_AXI_CPU_IN_rvalid = intf_net_bdry_in_S_AXI_CPU_IN_RVALID;
  assign S_AXI_CPU_IN_wready = intf_net_bdry_in_S_AXI_CPU_IN_WREADY;
  assign VIDEO_OUT_tdata[95:0] = intf_net_v_vid_in_axi4s_VIDEO_OUT_TDATA;
  assign VIDEO_OUT_tlast = intf_net_v_vid_in_axi4s_VIDEO_OUT_TLAST;
  assign VIDEO_OUT_tuser = intf_net_v_vid_in_axi4s_VIDEO_OUT_TUSER;
  assign VIDEO_OUT_tvalid = intf_net_v_vid_in_axi4s_VIDEO_OUT_TVALID;
  assign acr_cts[19:0] = net_v_hdmi_rx_acr_cts;
  assign acr_n[19:0] = net_v_hdmi_rx_acr_n;
  assign acr_valid = net_v_hdmi_rx_acr_valid;
  assign fid = net_v_vid_in_axi4s_fid;
  assign hpd = net_v_hdmi_rx_hpd;
  assign intf_net_bdry_in_LINK_DATA0_IN_TDATA = LINK_DATA0_IN_tdata[39:0];
  assign intf_net_bdry_in_LINK_DATA0_IN_TVALID = LINK_DATA0_IN_tvalid;
  assign intf_net_bdry_in_LINK_DATA1_IN_TDATA = LINK_DATA1_IN_tdata[39:0];
  assign intf_net_bdry_in_LINK_DATA1_IN_TVALID = LINK_DATA1_IN_tvalid;
  assign intf_net_bdry_in_LINK_DATA2_IN_TDATA = LINK_DATA2_IN_tdata[39:0];
  assign intf_net_bdry_in_LINK_DATA2_IN_TVALID = LINK_DATA2_IN_tvalid;
  assign intf_net_bdry_in_SB_STATUS_IN_TDATA = SB_STATUS_IN_tdata[1:0];
  assign intf_net_bdry_in_SB_STATUS_IN_TVALID = SB_STATUS_IN_tvalid;
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARADDR = S_AXI_CPU_IN_araddr[8:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARPROT = S_AXI_CPU_IN_arprot[2:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARVALID = S_AXI_CPU_IN_arvalid;
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWADDR = S_AXI_CPU_IN_awaddr[8:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWPROT = S_AXI_CPU_IN_awprot[2:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWVALID = S_AXI_CPU_IN_awvalid;
  assign intf_net_bdry_in_S_AXI_CPU_IN_BREADY = S_AXI_CPU_IN_bready;
  assign intf_net_bdry_in_S_AXI_CPU_IN_RREADY = S_AXI_CPU_IN_rready;
  assign intf_net_bdry_in_S_AXI_CPU_IN_WDATA = S_AXI_CPU_IN_wdata[31:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_WSTRB = S_AXI_CPU_IN_wstrb[3:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_WVALID = S_AXI_CPU_IN_wvalid;
  assign intf_net_v_hdmi_rx_AUDIO_OUT_TREADY = AUDIO_OUT_tready;
  assign intf_net_v_hdmi_rx_DDC_OUT_SCL_I = DDC_OUT_scl_i;
  assign intf_net_v_hdmi_rx_DDC_OUT_SDA_I = DDC_OUT_sda_i;
  assign intf_net_v_vid_in_axi4s_VIDEO_OUT_TREADY = VIDEO_OUT_tready;
  assign irq = net_v_hdmi_rx_irq;
  assign net_bdry_in_cable_detect = cable_detect;
  assign net_bdry_in_link_clk = link_clk;
  assign net_bdry_in_s_axi_cpu_aclk = s_axi_cpu_aclk;
  assign net_bdry_in_s_axi_cpu_aresetn = s_axi_cpu_aresetn;
  assign net_bdry_in_s_axis_audio_aclk = s_axis_audio_aclk;
  assign net_bdry_in_s_axis_audio_aresetn = s_axis_audio_aresetn;
  assign net_bdry_in_s_axis_video_aclk = s_axis_video_aclk;
  assign net_bdry_in_s_axis_video_aresetn = s_axis_video_aresetn;
  assign net_bdry_in_video_clk = video_clk;
  bd_3ec1_inverter_1_0 inverter_1
       (.Op1(net_bdry_in_cable_detect),
        .Res(net_inverter_1_Res));
  bd_3ec1_v_hdmi_rx_0 v_hdmi_rx
       (.acr_cts(net_v_hdmi_rx_acr_cts),
        .acr_n(net_v_hdmi_rx_acr_n),
        .acr_valid(net_v_hdmi_rx_acr_valid),
        .axis_enable(net_v_hdmi_rx_axis_enable),
        .bridge_overflow(net_v_vid_in_axi4s_overflow),
        .cable_detect(net_inverter_1_Res),
        .ddc_scl_i(intf_net_v_hdmi_rx_DDC_OUT_SCL_I),
        .ddc_scl_o(intf_net_v_hdmi_rx_DDC_OUT_SCL_O),
        .ddc_scl_t(intf_net_v_hdmi_rx_DDC_OUT_SCL_T),
        .ddc_sda_i(intf_net_v_hdmi_rx_DDC_OUT_SDA_I),
        .ddc_sda_o(intf_net_v_hdmi_rx_DDC_OUT_SDA_O),
        .ddc_sda_t(intf_net_v_hdmi_rx_DDC_OUT_SDA_T),
        .hpd(net_v_hdmi_rx_hpd),
        .irq(net_v_hdmi_rx_irq),
        .link_clk(net_bdry_in_link_clk),
        .link_data0(intf_net_bdry_in_LINK_DATA0_IN_TDATA),
        .link_data1(intf_net_bdry_in_LINK_DATA1_IN_TDATA),
        .link_data2(intf_net_bdry_in_LINK_DATA2_IN_TDATA),
        .link_valid0(intf_net_bdry_in_LINK_DATA0_IN_TVALID),
        .link_valid1(intf_net_bdry_in_LINK_DATA1_IN_TVALID),
        .link_valid2(intf_net_bdry_in_LINK_DATA2_IN_TVALID),
        .m_axis_audio_aclk(net_bdry_in_s_axis_audio_aclk),
        .m_axis_audio_aresetn(net_bdry_in_s_axis_audio_aresetn),
        .m_axis_audio_tdata(intf_net_v_hdmi_rx_AUDIO_OUT_TDATA),
        .m_axis_audio_tid(intf_net_v_hdmi_rx_AUDIO_OUT_TID),
        .m_axis_audio_tready(intf_net_v_hdmi_rx_AUDIO_OUT_TREADY),
        .m_axis_audio_tvalid(intf_net_v_hdmi_rx_AUDIO_OUT_TVALID),
        .m_axis_hdcp_tdata(intf_net_v_hdmi_rx_hdcp_out_TDATA),
        .m_axis_hdcp_tid(intf_net_v_hdmi_rx_hdcp_out_TID),
        .m_axis_hdcp_tlast(intf_net_v_hdmi_rx_hdcp_out_TLAST),
        .m_axis_hdcp_tready(intf_net_v_hdmi_rx_hdcp_out_TREADY),
        .m_axis_hdcp_tstrb(intf_net_v_hdmi_rx_hdcp_out_TSTRB),
        .m_axis_hdcp_tuser(intf_net_v_hdmi_rx_hdcp_out_TUSER),
        .m_axis_hdcp_tvalid(intf_net_v_hdmi_rx_hdcp_out_TVALID),
        .m_axis_video_aclk(net_bdry_in_s_axis_video_aclk),
        .m_axis_video_aresetn_in(net_bdry_in_s_axis_video_aresetn),
        .m_axis_video_aresetn_out(net_v_hdmi_rx_m_axis_video_aresetn_out),
        .s_axi_aclk(net_bdry_in_s_axi_cpu_aclk),
        .s_axi_araddr(intf_net_bdry_in_S_AXI_CPU_IN_ARADDR),
        .s_axi_aresetn(net_bdry_in_s_axi_cpu_aresetn),
        .s_axi_arprot(intf_net_bdry_in_S_AXI_CPU_IN_ARPROT),
        .s_axi_arready(intf_net_bdry_in_S_AXI_CPU_IN_ARREADY),
        .s_axi_arvalid(intf_net_bdry_in_S_AXI_CPU_IN_ARVALID),
        .s_axi_awaddr(intf_net_bdry_in_S_AXI_CPU_IN_AWADDR),
        .s_axi_awprot(intf_net_bdry_in_S_AXI_CPU_IN_AWPROT),
        .s_axi_awready(intf_net_bdry_in_S_AXI_CPU_IN_AWREADY),
        .s_axi_awvalid(intf_net_bdry_in_S_AXI_CPU_IN_AWVALID),
        .s_axi_bready(intf_net_bdry_in_S_AXI_CPU_IN_BREADY),
        .s_axi_bresp(intf_net_bdry_in_S_AXI_CPU_IN_BRESP),
        .s_axi_bvalid(intf_net_bdry_in_S_AXI_CPU_IN_BVALID),
        .s_axi_rdata(intf_net_bdry_in_S_AXI_CPU_IN_RDATA),
        .s_axi_rready(intf_net_bdry_in_S_AXI_CPU_IN_RREADY),
        .s_axi_rresp(intf_net_bdry_in_S_AXI_CPU_IN_RRESP),
        .s_axi_rvalid(intf_net_bdry_in_S_AXI_CPU_IN_RVALID),
        .s_axi_wdata(intf_net_bdry_in_S_AXI_CPU_IN_WDATA),
        .s_axi_wready(intf_net_bdry_in_S_AXI_CPU_IN_WREADY),
        .s_axi_wstrb(intf_net_bdry_in_S_AXI_CPU_IN_WSTRB),
        .s_axi_wvalid(intf_net_bdry_in_S_AXI_CPU_IN_WVALID),
        .s_axis_hdcp_tdata(intf_net_v_hdmi_rx_hdcp_out_TDATA),
        .s_axis_hdcp_tid(intf_net_v_hdmi_rx_hdcp_out_TID),
        .s_axis_hdcp_tlast(intf_net_v_hdmi_rx_hdcp_out_TLAST),
        .s_axis_hdcp_tready(intf_net_v_hdmi_rx_hdcp_out_TREADY),
        .s_axis_hdcp_tstrb(intf_net_v_hdmi_rx_hdcp_out_TSTRB),
        .s_axis_hdcp_tuser(intf_net_v_hdmi_rx_hdcp_out_TUSER),
        .s_axis_hdcp_tvalid(intf_net_v_hdmi_rx_hdcp_out_TVALID),
        .sb_status_data(intf_net_bdry_in_SB_STATUS_IN_TDATA),
        .sb_status_valid(intf_net_bdry_in_SB_STATUS_IN_TVALID),
        .video_clk(net_bdry_in_video_clk),
        .video_data(intf_net_v_hdmi_rx_VIDEO_OUT_DATA),
        .video_de(intf_net_v_hdmi_rx_VIDEO_OUT_ACTIVE_VIDEO),
        .video_field(intf_net_v_hdmi_rx_VIDEO_OUT_FIELD),
        .video_hs(intf_net_v_hdmi_rx_VIDEO_OUT_HSYNC),
        .video_reset(net_v_hdmi_rx_video_reset),
        .video_vs(intf_net_v_hdmi_rx_VIDEO_OUT_VSYNC));
  bd_3ec1_v_vid_in_axi4s_0 v_vid_in_axi4s
       (.aclk(net_bdry_in_s_axis_video_aclk),
        .aclken(1'b1),
        .aresetn(net_v_hdmi_rx_m_axis_video_aresetn_out),
        .axis_enable(net_v_hdmi_rx_axis_enable),
        .fid(net_v_vid_in_axi4s_fid),
        .m_axis_video_tdata(intf_net_v_vid_in_axi4s_VIDEO_OUT_TDATA),
        .m_axis_video_tlast(intf_net_v_vid_in_axi4s_VIDEO_OUT_TLAST),
        .m_axis_video_tready(intf_net_v_vid_in_axi4s_VIDEO_OUT_TREADY),
        .m_axis_video_tuser(intf_net_v_vid_in_axi4s_VIDEO_OUT_TUSER),
        .m_axis_video_tvalid(intf_net_v_vid_in_axi4s_VIDEO_OUT_TVALID),
        .overflow(net_v_vid_in_axi4s_overflow),
        .vid_active_video(intf_net_v_hdmi_rx_VIDEO_OUT_ACTIVE_VIDEO),
        .vid_data(intf_net_v_hdmi_rx_VIDEO_OUT_DATA),
        .vid_field_id(intf_net_v_hdmi_rx_VIDEO_OUT_FIELD),
        .vid_hblank(1'b0),
        .vid_hsync(intf_net_v_hdmi_rx_VIDEO_OUT_HSYNC),
        .vid_io_in_ce(1'b1),
        .vid_io_in_clk(net_bdry_in_video_clk),
        .vid_io_in_reset(net_v_hdmi_rx_video_reset),
        .vid_vblank(1'b0),
        .vid_vsync(intf_net_v_hdmi_rx_VIDEO_OUT_VSYNC));
endmodule
