//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_3ea7.bd
//Design : bd_3ea7
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_3ea7,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_3ea7,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "exdes_v_hdmi_tx_ss_0.hwdef" *) 
module bd_3ea7
   (AUDIO_IN_tdata,
    AUDIO_IN_tid,
    AUDIO_IN_tready,
    AUDIO_IN_tvalid,
    DDC_OUT_scl_i,
    DDC_OUT_scl_o,
    DDC_OUT_scl_t,
    DDC_OUT_sda_i,
    DDC_OUT_sda_o,
    DDC_OUT_sda_t,
    LINK_DATA0_OUT_tdata,
    LINK_DATA0_OUT_tvalid,
    LINK_DATA1_OUT_tdata,
    LINK_DATA1_OUT_tvalid,
    LINK_DATA2_OUT_tdata,
    LINK_DATA2_OUT_tvalid,
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
    VIDEO_IN_tdata,
    VIDEO_IN_tlast,
    VIDEO_IN_tready,
    VIDEO_IN_tuser,
    VIDEO_IN_tvalid,
    acr_cts,
    acr_n,
    acr_valid,
    fid,
    hpd,
    irq,
    link_clk,
    locked,
    s_axi_cpu_aclk,
    s_axi_cpu_aresetn,
    s_axis_audio_aclk,
    s_axis_audio_aresetn,
    s_axis_video_aclk,
    s_axis_video_aresetn,
    video_clk);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AUDIO_IN, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, FREQ_HZ 99999000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 0" *) input [31:0]AUDIO_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TID" *) input [2:0]AUDIO_IN_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TREADY" *) output AUDIO_IN_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 AUDIO_IN TVALID" *) input AUDIO_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_I" *) input DDC_OUT_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_O" *) output DDC_OUT_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SCL_T" *) output DDC_OUT_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_I" *) input DDC_OUT_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_O" *) output DDC_OUT_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 DDC_OUT SDA_T" *) output DDC_OUT_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA0_OUT, CLK_DOMAIN exdes_vid_phy_controller_0_txoutclk, FREQ_HZ 148500000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [39:0]LINK_DATA0_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA0_OUT TVALID" *) output LINK_DATA0_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA1_OUT, CLK_DOMAIN exdes_vid_phy_controller_0_txoutclk, FREQ_HZ 148500000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [39:0]LINK_DATA1_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA1_OUT TVALID" *) output LINK_DATA1_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LINK_DATA2_OUT, CLK_DOMAIN exdes_vid_phy_controller_0_txoutclk, FREQ_HZ 148500000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [39:0]LINK_DATA2_OUT_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 LINK_DATA2_OUT TVALID" *) output LINK_DATA2_OUT_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SB_STATUS_IN, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, FREQ_HZ 99999000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 0, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 0, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [1:0]SB_STATUS_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SB_STATUS_IN TVALID" *) input SB_STATUS_IN_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CPU_IN, ADDR_WIDTH 17, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, DATA_WIDTH 32, FREQ_HZ 99999000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 8, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 8, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [16:0]S_AXI_CPU_IN_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARPROT" *) input [2:0]S_AXI_CPU_IN_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARREADY" *) output [0:0]S_AXI_CPU_IN_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN ARVALID" *) input [0:0]S_AXI_CPU_IN_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWADDR" *) input [16:0]S_AXI_CPU_IN_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWPROT" *) input [2:0]S_AXI_CPU_IN_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWREADY" *) output [0:0]S_AXI_CPU_IN_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN AWVALID" *) input [0:0]S_AXI_CPU_IN_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BREADY" *) input [0:0]S_AXI_CPU_IN_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BRESP" *) output [1:0]S_AXI_CPU_IN_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN BVALID" *) output [0:0]S_AXI_CPU_IN_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RDATA" *) output [31:0]S_AXI_CPU_IN_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RREADY" *) input [0:0]S_AXI_CPU_IN_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RRESP" *) output [1:0]S_AXI_CPU_IN_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN RVALID" *) output [0:0]S_AXI_CPU_IN_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WDATA" *) input [31:0]S_AXI_CPU_IN_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WREADY" *) output [0:0]S_AXI_CPU_IN_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WSTRB" *) input [3:0]S_AXI_CPU_IN_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CPU_IN WVALID" *) input [0:0]S_AXI_CPU_IN_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_IN TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME VIDEO_IN, CLK_DOMAIN exdes_zynq_us_0_pl_clk1, FREQ_HZ 149998500, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 12, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) input [95:0]VIDEO_IN_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_IN TLAST" *) input VIDEO_IN_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_IN TREADY" *) output VIDEO_IN_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_IN TUSER" *) input VIDEO_IN_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 VIDEO_IN TVALID" *) input VIDEO_IN_tvalid;
  input [19:0]acr_cts;
  input [19:0]acr_n;
  input acr_valid;
  input fid;
  input hpd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.IRQ INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output irq;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.LINK_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.LINK_CLK, ASSOCIATED_BUSIF LINK_DATA0_OUT:LINK_DATA1_OUT:LINK_DATA2_OUT, CLK_DOMAIN exdes_vid_phy_controller_0_txoutclk, FREQ_HZ 148500000, PHASE 0.000" *) input link_clk;
  output locked;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXI_CPU_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXI_CPU_ACLK, ASSOCIATED_BUSIF SB_STATUS_IN:S_AXI_CPU_IN, ASSOCIATED_CLKEN s_axi_aclken, ASSOCIATED_RESET s_axi_cpu_aresetn, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, FREQ_HZ 99999000, PHASE 0.000" *) input s_axi_cpu_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXI_CPU_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXI_CPU_ARESETN, POLARITY ACTIVE_LOW, TYPE INTERCONNECT" *) input s_axi_cpu_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXIS_AUDIO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXIS_AUDIO_ACLK, ASSOCIATED_BUSIF AUDIO_IN, ASSOCIATED_RESET s_axis_audio_aresetn, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, FREQ_HZ 99999000, PHASE 0.0" *) input s_axis_audio_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXIS_AUDIO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXIS_AUDIO_ARESETN, POLARITY ACTIVE_LOW" *) input s_axis_audio_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXIS_VIDEO_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXIS_VIDEO_ACLK, ASSOCIATED_BUSIF VIDEO_IN, ASSOCIATED_RESET s_axis_video_aresetn, CLK_DOMAIN exdes_zynq_us_0_pl_clk1, FREQ_HZ 149998500, PHASE 0.000" *) input s_axis_video_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXIS_VIDEO_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXIS_VIDEO_ARESETN, POLARITY ACTIVE_LOW" *) input s_axis_video_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.VIDEO_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.VIDEO_CLK, ASSOCIATED_CLKEN clken, CLK_DOMAIN exdes_vid_phy_controller_0_tx_video_clk, FREQ_HZ 297000000, PHASE 0.000" *) input video_clk;

  wire [16:0]intf_net_axi_crossbar_M00_AXI_ARADDR;
  wire [2:0]intf_net_axi_crossbar_M00_AXI_ARPROT;
  wire intf_net_axi_crossbar_M00_AXI_ARREADY;
  wire [0:0]intf_net_axi_crossbar_M00_AXI_ARVALID;
  wire [16:0]intf_net_axi_crossbar_M00_AXI_AWADDR;
  wire [2:0]intf_net_axi_crossbar_M00_AXI_AWPROT;
  wire intf_net_axi_crossbar_M00_AXI_AWREADY;
  wire [0:0]intf_net_axi_crossbar_M00_AXI_AWVALID;
  wire [0:0]intf_net_axi_crossbar_M00_AXI_BREADY;
  wire [1:0]intf_net_axi_crossbar_M00_AXI_BRESP;
  wire intf_net_axi_crossbar_M00_AXI_BVALID;
  wire [31:0]intf_net_axi_crossbar_M00_AXI_RDATA;
  wire [0:0]intf_net_axi_crossbar_M00_AXI_RREADY;
  wire [1:0]intf_net_axi_crossbar_M00_AXI_RRESP;
  wire intf_net_axi_crossbar_M00_AXI_RVALID;
  wire [31:0]intf_net_axi_crossbar_M00_AXI_WDATA;
  wire intf_net_axi_crossbar_M00_AXI_WREADY;
  wire [3:0]intf_net_axi_crossbar_M00_AXI_WSTRB;
  wire [0:0]intf_net_axi_crossbar_M00_AXI_WVALID;
  wire [33:17]intf_net_axi_crossbar_M01_AXI_ARADDR;
  wire intf_net_axi_crossbar_M01_AXI_ARREADY;
  wire [1:1]intf_net_axi_crossbar_M01_AXI_ARVALID;
  wire [33:17]intf_net_axi_crossbar_M01_AXI_AWADDR;
  wire intf_net_axi_crossbar_M01_AXI_AWREADY;
  wire [1:1]intf_net_axi_crossbar_M01_AXI_AWVALID;
  wire [1:1]intf_net_axi_crossbar_M01_AXI_BREADY;
  wire [1:0]intf_net_axi_crossbar_M01_AXI_BRESP;
  wire intf_net_axi_crossbar_M01_AXI_BVALID;
  wire [31:0]intf_net_axi_crossbar_M01_AXI_RDATA;
  wire [1:1]intf_net_axi_crossbar_M01_AXI_RREADY;
  wire [1:0]intf_net_axi_crossbar_M01_AXI_RRESP;
  wire intf_net_axi_crossbar_M01_AXI_RVALID;
  wire [63:32]intf_net_axi_crossbar_M01_AXI_WDATA;
  wire intf_net_axi_crossbar_M01_AXI_WREADY;
  wire [7:4]intf_net_axi_crossbar_M01_AXI_WSTRB;
  wire [1:1]intf_net_axi_crossbar_M01_AXI_WVALID;
  wire [31:0]intf_net_bdry_in_AUDIO_IN_TDATA;
  wire [2:0]intf_net_bdry_in_AUDIO_IN_TID;
  wire intf_net_bdry_in_AUDIO_IN_TREADY;
  wire intf_net_bdry_in_AUDIO_IN_TVALID;
  wire [1:0]intf_net_bdry_in_SB_STATUS_IN_TDATA;
  wire intf_net_bdry_in_SB_STATUS_IN_TVALID;
  wire [16:0]intf_net_bdry_in_S_AXI_CPU_IN_ARADDR;
  wire [2:0]intf_net_bdry_in_S_AXI_CPU_IN_ARPROT;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_ARREADY;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_ARVALID;
  wire [16:0]intf_net_bdry_in_S_AXI_CPU_IN_AWADDR;
  wire [2:0]intf_net_bdry_in_S_AXI_CPU_IN_AWPROT;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_AWREADY;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_AWVALID;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_BREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_CPU_IN_BRESP;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_BVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_CPU_IN_RDATA;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_RREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_CPU_IN_RRESP;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_RVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_CPU_IN_WDATA;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_WREADY;
  wire [3:0]intf_net_bdry_in_S_AXI_CPU_IN_WSTRB;
  wire [0:0]intf_net_bdry_in_S_AXI_CPU_IN_WVALID;
  wire [95:0]intf_net_bdry_in_VIDEO_IN_TDATA;
  wire intf_net_bdry_in_VIDEO_IN_TLAST;
  wire intf_net_bdry_in_VIDEO_IN_TREADY;
  wire intf_net_bdry_in_VIDEO_IN_TUSER;
  wire intf_net_bdry_in_VIDEO_IN_TVALID;
  wire intf_net_v_axi4s_vid_out_vid_io_out_ACTIVE_VIDEO;
  wire [95:0]intf_net_v_axi4s_vid_out_vid_io_out_DATA;
  wire intf_net_v_axi4s_vid_out_vid_io_out_HSYNC;
  wire intf_net_v_axi4s_vid_out_vid_io_out_VSYNC;
  wire intf_net_v_hdmi_tx_DDC_OUT_SCL_I;
  wire intf_net_v_hdmi_tx_DDC_OUT_SCL_O;
  wire intf_net_v_hdmi_tx_DDC_OUT_SCL_T;
  wire intf_net_v_hdmi_tx_DDC_OUT_SDA_I;
  wire intf_net_v_hdmi_tx_DDC_OUT_SDA_O;
  wire intf_net_v_hdmi_tx_DDC_OUT_SDA_T;
  wire [39:0]intf_net_v_hdmi_tx_LINK_DATA0_OUT_TDATA;
  wire intf_net_v_hdmi_tx_LINK_DATA0_OUT_TVALID;
  wire [39:0]intf_net_v_hdmi_tx_LINK_DATA1_OUT_TDATA;
  wire intf_net_v_hdmi_tx_LINK_DATA1_OUT_TVALID;
  wire [39:0]intf_net_v_hdmi_tx_LINK_DATA2_OUT_TDATA;
  wire intf_net_v_hdmi_tx_LINK_DATA2_OUT_TVALID;
  wire [95:0]intf_net_v_hdmi_tx_hdcp_out_TDATA;
  wire intf_net_v_hdmi_tx_hdcp_out_TID;
  wire intf_net_v_hdmi_tx_hdcp_out_TLAST;
  wire intf_net_v_hdmi_tx_hdcp_out_TREADY;
  wire [3:0]intf_net_v_hdmi_tx_hdcp_out_TSTRB;
  wire [31:0]intf_net_v_hdmi_tx_hdcp_out_TUSER;
  wire intf_net_v_hdmi_tx_hdcp_out_TVALID;
  wire intf_net_v_tc_vtiming_out_ACTIVE_VIDEO;
  wire intf_net_v_tc_vtiming_out_FIELD;
  wire intf_net_v_tc_vtiming_out_HBLANK;
  wire intf_net_v_tc_vtiming_out_HSYNC;
  wire intf_net_v_tc_vtiming_out_VBLANK;
  wire intf_net_v_tc_vtiming_out_VSYNC;
  wire [19:0]net_bdry_in_acr_cts;
  wire [19:0]net_bdry_in_acr_n;
  wire net_bdry_in_acr_valid;
  wire net_bdry_in_fid;
  wire net_bdry_in_hpd;
  wire net_bdry_in_link_clk;
  wire net_bdry_in_s_axi_cpu_aclk;
  wire net_bdry_in_s_axi_cpu_aresetn;
  wire net_bdry_in_s_axis_audio_aclk;
  wire net_bdry_in_s_axis_audio_aresetn;
  wire net_bdry_in_s_axis_video_aclk;
  wire net_bdry_in_s_axis_video_aresetn;
  wire net_bdry_in_video_clk;
  wire [0:0]net_util_vector_logic_0_Res;
  wire net_v_axi4s_vid_out_locked;
  wire net_v_axi4s_vid_out_vtg_ce;
  wire net_v_hdmi_tx_irq;
  wire net_v_hdmi_tx_s_axis_video_aresetn_out;
  wire net_v_hdmi_tx_video_reset;

  assign AUDIO_IN_tready = intf_net_bdry_in_AUDIO_IN_TREADY;
  assign DDC_OUT_scl_o = intf_net_v_hdmi_tx_DDC_OUT_SCL_O;
  assign DDC_OUT_scl_t = intf_net_v_hdmi_tx_DDC_OUT_SCL_T;
  assign DDC_OUT_sda_o = intf_net_v_hdmi_tx_DDC_OUT_SDA_O;
  assign DDC_OUT_sda_t = intf_net_v_hdmi_tx_DDC_OUT_SDA_T;
  assign LINK_DATA0_OUT_tdata[39:0] = intf_net_v_hdmi_tx_LINK_DATA0_OUT_TDATA;
  assign LINK_DATA0_OUT_tvalid = intf_net_v_hdmi_tx_LINK_DATA0_OUT_TVALID;
  assign LINK_DATA1_OUT_tdata[39:0] = intf_net_v_hdmi_tx_LINK_DATA1_OUT_TDATA;
  assign LINK_DATA1_OUT_tvalid = intf_net_v_hdmi_tx_LINK_DATA1_OUT_TVALID;
  assign LINK_DATA2_OUT_tdata[39:0] = intf_net_v_hdmi_tx_LINK_DATA2_OUT_TDATA;
  assign LINK_DATA2_OUT_tvalid = intf_net_v_hdmi_tx_LINK_DATA2_OUT_TVALID;
  assign S_AXI_CPU_IN_arready[0] = intf_net_bdry_in_S_AXI_CPU_IN_ARREADY;
  assign S_AXI_CPU_IN_awready[0] = intf_net_bdry_in_S_AXI_CPU_IN_AWREADY;
  assign S_AXI_CPU_IN_bresp[1:0] = intf_net_bdry_in_S_AXI_CPU_IN_BRESP;
  assign S_AXI_CPU_IN_bvalid[0] = intf_net_bdry_in_S_AXI_CPU_IN_BVALID;
  assign S_AXI_CPU_IN_rdata[31:0] = intf_net_bdry_in_S_AXI_CPU_IN_RDATA;
  assign S_AXI_CPU_IN_rresp[1:0] = intf_net_bdry_in_S_AXI_CPU_IN_RRESP;
  assign S_AXI_CPU_IN_rvalid[0] = intf_net_bdry_in_S_AXI_CPU_IN_RVALID;
  assign S_AXI_CPU_IN_wready[0] = intf_net_bdry_in_S_AXI_CPU_IN_WREADY;
  assign VIDEO_IN_tready = intf_net_bdry_in_VIDEO_IN_TREADY;
  assign intf_net_bdry_in_AUDIO_IN_TDATA = AUDIO_IN_tdata[31:0];
  assign intf_net_bdry_in_AUDIO_IN_TID = AUDIO_IN_tid[2:0];
  assign intf_net_bdry_in_AUDIO_IN_TVALID = AUDIO_IN_tvalid;
  assign intf_net_bdry_in_SB_STATUS_IN_TDATA = SB_STATUS_IN_tdata[1:0];
  assign intf_net_bdry_in_SB_STATUS_IN_TVALID = SB_STATUS_IN_tvalid;
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARADDR = S_AXI_CPU_IN_araddr[16:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARPROT = S_AXI_CPU_IN_arprot[2:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_ARVALID = S_AXI_CPU_IN_arvalid[0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWADDR = S_AXI_CPU_IN_awaddr[16:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWPROT = S_AXI_CPU_IN_awprot[2:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_AWVALID = S_AXI_CPU_IN_awvalid[0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_BREADY = S_AXI_CPU_IN_bready[0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_RREADY = S_AXI_CPU_IN_rready[0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_WDATA = S_AXI_CPU_IN_wdata[31:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_WSTRB = S_AXI_CPU_IN_wstrb[3:0];
  assign intf_net_bdry_in_S_AXI_CPU_IN_WVALID = S_AXI_CPU_IN_wvalid[0];
  assign intf_net_bdry_in_VIDEO_IN_TDATA = VIDEO_IN_tdata[95:0];
  assign intf_net_bdry_in_VIDEO_IN_TLAST = VIDEO_IN_tlast;
  assign intf_net_bdry_in_VIDEO_IN_TUSER = VIDEO_IN_tuser;
  assign intf_net_bdry_in_VIDEO_IN_TVALID = VIDEO_IN_tvalid;
  assign intf_net_v_hdmi_tx_DDC_OUT_SCL_I = DDC_OUT_scl_i;
  assign intf_net_v_hdmi_tx_DDC_OUT_SDA_I = DDC_OUT_sda_i;
  assign irq = net_v_hdmi_tx_irq;
  assign locked = net_v_axi4s_vid_out_locked;
  assign net_bdry_in_acr_cts = acr_cts[19:0];
  assign net_bdry_in_acr_n = acr_n[19:0];
  assign net_bdry_in_acr_valid = acr_valid;
  assign net_bdry_in_fid = fid;
  assign net_bdry_in_hpd = hpd;
  assign net_bdry_in_link_clk = link_clk;
  assign net_bdry_in_s_axi_cpu_aclk = s_axi_cpu_aclk;
  assign net_bdry_in_s_axi_cpu_aresetn = s_axi_cpu_aresetn;
  assign net_bdry_in_s_axis_audio_aclk = s_axis_audio_aclk;
  assign net_bdry_in_s_axis_audio_aresetn = s_axis_audio_aresetn;
  assign net_bdry_in_s_axis_video_aclk = s_axis_video_aclk;
  assign net_bdry_in_s_axis_video_aresetn = s_axis_video_aresetn;
  assign net_bdry_in_video_clk = video_clk;
  bd_3ea7_axi_crossbar_0 axi_crossbar
       (.aclk(net_bdry_in_s_axi_cpu_aclk),
        .aresetn(net_bdry_in_s_axi_cpu_aresetn),
        .m_axi_araddr({intf_net_axi_crossbar_M01_AXI_ARADDR,intf_net_axi_crossbar_M00_AXI_ARADDR}),
        .m_axi_arprot(intf_net_axi_crossbar_M00_AXI_ARPROT),
        .m_axi_arready({intf_net_axi_crossbar_M01_AXI_ARREADY,intf_net_axi_crossbar_M00_AXI_ARREADY}),
        .m_axi_arvalid({intf_net_axi_crossbar_M01_AXI_ARVALID,intf_net_axi_crossbar_M00_AXI_ARVALID}),
        .m_axi_awaddr({intf_net_axi_crossbar_M01_AXI_AWADDR,intf_net_axi_crossbar_M00_AXI_AWADDR}),
        .m_axi_awprot(intf_net_axi_crossbar_M00_AXI_AWPROT),
        .m_axi_awready({intf_net_axi_crossbar_M01_AXI_AWREADY,intf_net_axi_crossbar_M00_AXI_AWREADY}),
        .m_axi_awvalid({intf_net_axi_crossbar_M01_AXI_AWVALID,intf_net_axi_crossbar_M00_AXI_AWVALID}),
        .m_axi_bready({intf_net_axi_crossbar_M01_AXI_BREADY,intf_net_axi_crossbar_M00_AXI_BREADY}),
        .m_axi_bresp({intf_net_axi_crossbar_M01_AXI_BRESP,intf_net_axi_crossbar_M00_AXI_BRESP}),
        .m_axi_bvalid({intf_net_axi_crossbar_M01_AXI_BVALID,intf_net_axi_crossbar_M00_AXI_BVALID}),
        .m_axi_rdata({intf_net_axi_crossbar_M01_AXI_RDATA,intf_net_axi_crossbar_M00_AXI_RDATA}),
        .m_axi_rready({intf_net_axi_crossbar_M01_AXI_RREADY,intf_net_axi_crossbar_M00_AXI_RREADY}),
        .m_axi_rresp({intf_net_axi_crossbar_M01_AXI_RRESP,intf_net_axi_crossbar_M00_AXI_RRESP}),
        .m_axi_rvalid({intf_net_axi_crossbar_M01_AXI_RVALID,intf_net_axi_crossbar_M00_AXI_RVALID}),
        .m_axi_wdata({intf_net_axi_crossbar_M01_AXI_WDATA,intf_net_axi_crossbar_M00_AXI_WDATA}),
        .m_axi_wready({intf_net_axi_crossbar_M01_AXI_WREADY,intf_net_axi_crossbar_M00_AXI_WREADY}),
        .m_axi_wstrb({intf_net_axi_crossbar_M01_AXI_WSTRB,intf_net_axi_crossbar_M00_AXI_WSTRB}),
        .m_axi_wvalid({intf_net_axi_crossbar_M01_AXI_WVALID,intf_net_axi_crossbar_M00_AXI_WVALID}),
        .s_axi_araddr(intf_net_bdry_in_S_AXI_CPU_IN_ARADDR),
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
        .s_axi_wvalid(intf_net_bdry_in_S_AXI_CPU_IN_WVALID));
  bd_3ea7_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(net_v_hdmi_tx_video_reset),
        .Res(net_util_vector_logic_0_Res));
  bd_3ea7_v_axi4s_vid_out_0 v_axi4s_vid_out
       (.aclk(net_bdry_in_s_axis_video_aclk),
        .aclken(1'b1),
        .aresetn(net_v_hdmi_tx_s_axis_video_aresetn_out),
        .fid(net_bdry_in_fid),
        .locked(net_v_axi4s_vid_out_locked),
        .s_axis_video_tdata(intf_net_bdry_in_VIDEO_IN_TDATA),
        .s_axis_video_tlast(intf_net_bdry_in_VIDEO_IN_TLAST),
        .s_axis_video_tready(intf_net_bdry_in_VIDEO_IN_TREADY),
        .s_axis_video_tuser(intf_net_bdry_in_VIDEO_IN_TUSER),
        .s_axis_video_tvalid(intf_net_bdry_in_VIDEO_IN_TVALID),
        .vid_active_video(intf_net_v_axi4s_vid_out_vid_io_out_ACTIVE_VIDEO),
        .vid_data(intf_net_v_axi4s_vid_out_vid_io_out_DATA),
        .vid_hsync(intf_net_v_axi4s_vid_out_vid_io_out_HSYNC),
        .vid_io_out_ce(1'b1),
        .vid_io_out_clk(net_bdry_in_video_clk),
        .vid_io_out_reset(net_v_hdmi_tx_video_reset),
        .vid_vsync(intf_net_v_axi4s_vid_out_vid_io_out_VSYNC),
        .vtg_active_video(intf_net_v_tc_vtiming_out_ACTIVE_VIDEO),
        .vtg_ce(net_v_axi4s_vid_out_vtg_ce),
        .vtg_field_id(intf_net_v_tc_vtiming_out_FIELD),
        .vtg_hblank(intf_net_v_tc_vtiming_out_HBLANK),
        .vtg_hsync(intf_net_v_tc_vtiming_out_HSYNC),
        .vtg_vblank(intf_net_v_tc_vtiming_out_VBLANK),
        .vtg_vsync(intf_net_v_tc_vtiming_out_VSYNC));
  bd_3ea7_v_hdmi_tx_0 v_hdmi_tx
       (.acr_cts(net_bdry_in_acr_cts),
        .acr_n(net_bdry_in_acr_n),
        .acr_valid(net_bdry_in_acr_valid),
        .bridge_locked(net_v_axi4s_vid_out_locked),
        .ddc_scl_i(intf_net_v_hdmi_tx_DDC_OUT_SCL_I),
        .ddc_scl_o(intf_net_v_hdmi_tx_DDC_OUT_SCL_O),
        .ddc_scl_t(intf_net_v_hdmi_tx_DDC_OUT_SCL_T),
        .ddc_sda_i(intf_net_v_hdmi_tx_DDC_OUT_SDA_I),
        .ddc_sda_o(intf_net_v_hdmi_tx_DDC_OUT_SDA_O),
        .ddc_sda_t(intf_net_v_hdmi_tx_DDC_OUT_SDA_T),
        .hpd(net_bdry_in_hpd),
        .irq(net_v_hdmi_tx_irq),
        .link_clk(net_bdry_in_link_clk),
        .link_data0(intf_net_v_hdmi_tx_LINK_DATA0_OUT_TDATA),
        .link_data1(intf_net_v_hdmi_tx_LINK_DATA1_OUT_TDATA),
        .link_data2(intf_net_v_hdmi_tx_LINK_DATA2_OUT_TDATA),
        .link_valid0(intf_net_v_hdmi_tx_LINK_DATA0_OUT_TVALID),
        .link_valid1(intf_net_v_hdmi_tx_LINK_DATA1_OUT_TVALID),
        .link_valid2(intf_net_v_hdmi_tx_LINK_DATA2_OUT_TVALID),
        .m_axis_hdcp_tdata(intf_net_v_hdmi_tx_hdcp_out_TDATA),
        .m_axis_hdcp_tid(intf_net_v_hdmi_tx_hdcp_out_TID),
        .m_axis_hdcp_tlast(intf_net_v_hdmi_tx_hdcp_out_TLAST),
        .m_axis_hdcp_tready(intf_net_v_hdmi_tx_hdcp_out_TREADY),
        .m_axis_hdcp_tstrb(intf_net_v_hdmi_tx_hdcp_out_TSTRB),
        .m_axis_hdcp_tuser(intf_net_v_hdmi_tx_hdcp_out_TUSER),
        .m_axis_hdcp_tvalid(intf_net_v_hdmi_tx_hdcp_out_TVALID),
        .s_axi_aclk(net_bdry_in_s_axi_cpu_aclk),
        .s_axi_araddr(intf_net_axi_crossbar_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(net_bdry_in_s_axi_cpu_aresetn),
        .s_axi_arprot(intf_net_axi_crossbar_M00_AXI_ARPROT),
        .s_axi_arready(intf_net_axi_crossbar_M00_AXI_ARREADY),
        .s_axi_arvalid(intf_net_axi_crossbar_M00_AXI_ARVALID),
        .s_axi_awaddr(intf_net_axi_crossbar_M00_AXI_AWADDR[8:0]),
        .s_axi_awprot(intf_net_axi_crossbar_M00_AXI_AWPROT),
        .s_axi_awready(intf_net_axi_crossbar_M00_AXI_AWREADY),
        .s_axi_awvalid(intf_net_axi_crossbar_M00_AXI_AWVALID),
        .s_axi_bready(intf_net_axi_crossbar_M00_AXI_BREADY),
        .s_axi_bresp(intf_net_axi_crossbar_M00_AXI_BRESP),
        .s_axi_bvalid(intf_net_axi_crossbar_M00_AXI_BVALID),
        .s_axi_rdata(intf_net_axi_crossbar_M00_AXI_RDATA),
        .s_axi_rready(intf_net_axi_crossbar_M00_AXI_RREADY),
        .s_axi_rresp(intf_net_axi_crossbar_M00_AXI_RRESP),
        .s_axi_rvalid(intf_net_axi_crossbar_M00_AXI_RVALID),
        .s_axi_wdata(intf_net_axi_crossbar_M00_AXI_WDATA),
        .s_axi_wready(intf_net_axi_crossbar_M00_AXI_WREADY),
        .s_axi_wstrb(intf_net_axi_crossbar_M00_AXI_WSTRB),
        .s_axi_wvalid(intf_net_axi_crossbar_M00_AXI_WVALID),
        .s_axis_audio_aclk(net_bdry_in_s_axis_audio_aclk),
        .s_axis_audio_aresetn(net_bdry_in_s_axis_audio_aresetn),
        .s_axis_audio_tdata(intf_net_bdry_in_AUDIO_IN_TDATA),
        .s_axis_audio_tid(intf_net_bdry_in_AUDIO_IN_TID),
        .s_axis_audio_tready(intf_net_bdry_in_AUDIO_IN_TREADY),
        .s_axis_audio_tvalid(intf_net_bdry_in_AUDIO_IN_TVALID),
        .s_axis_hdcp_tdata(intf_net_v_hdmi_tx_hdcp_out_TDATA),
        .s_axis_hdcp_tid(intf_net_v_hdmi_tx_hdcp_out_TID),
        .s_axis_hdcp_tlast(intf_net_v_hdmi_tx_hdcp_out_TLAST),
        .s_axis_hdcp_tready(intf_net_v_hdmi_tx_hdcp_out_TREADY),
        .s_axis_hdcp_tstrb(intf_net_v_hdmi_tx_hdcp_out_TSTRB),
        .s_axis_hdcp_tuser(intf_net_v_hdmi_tx_hdcp_out_TUSER),
        .s_axis_hdcp_tvalid(intf_net_v_hdmi_tx_hdcp_out_TVALID),
        .s_axis_video_aclk(net_bdry_in_s_axis_video_aclk),
        .s_axis_video_aresetn_in(net_bdry_in_s_axis_video_aresetn),
        .s_axis_video_aresetn_out(net_v_hdmi_tx_s_axis_video_aresetn_out),
        .sb_status_data(intf_net_bdry_in_SB_STATUS_IN_TDATA),
        .sb_status_valid(intf_net_bdry_in_SB_STATUS_IN_TVALID),
        .video_clk(net_bdry_in_video_clk),
        .video_data(intf_net_v_axi4s_vid_out_vid_io_out_DATA),
        .video_de(intf_net_v_axi4s_vid_out_vid_io_out_ACTIVE_VIDEO),
        .video_hs(intf_net_v_axi4s_vid_out_vid_io_out_HSYNC),
        .video_reset(net_v_hdmi_tx_video_reset),
        .video_vs(intf_net_v_axi4s_vid_out_vid_io_out_VSYNC));
  bd_3ea7_v_tc_0 v_tc
       (.active_video_out(intf_net_v_tc_vtiming_out_ACTIVE_VIDEO),
        .clk(net_bdry_in_video_clk),
        .clken(1'b1),
        .field_id_out(intf_net_v_tc_vtiming_out_FIELD),
        .fsync_in(1'b0),
        .gen_clken(net_v_axi4s_vid_out_vtg_ce),
        .hblank_out(intf_net_v_tc_vtiming_out_HBLANK),
        .hsync_out(intf_net_v_tc_vtiming_out_HSYNC),
        .resetn(net_util_vector_logic_0_Res),
        .s_axi_aclk(net_bdry_in_s_axi_cpu_aclk),
        .s_axi_aclken(1'b1),
        .s_axi_araddr(intf_net_axi_crossbar_M01_AXI_ARADDR[25:17]),
        .s_axi_aresetn(net_bdry_in_s_axi_cpu_aresetn),
        .s_axi_arready(intf_net_axi_crossbar_M01_AXI_ARREADY),
        .s_axi_arvalid(intf_net_axi_crossbar_M01_AXI_ARVALID),
        .s_axi_awaddr(intf_net_axi_crossbar_M01_AXI_AWADDR[25:17]),
        .s_axi_awready(intf_net_axi_crossbar_M01_AXI_AWREADY),
        .s_axi_awvalid(intf_net_axi_crossbar_M01_AXI_AWVALID),
        .s_axi_bready(intf_net_axi_crossbar_M01_AXI_BREADY),
        .s_axi_bresp(intf_net_axi_crossbar_M01_AXI_BRESP),
        .s_axi_bvalid(intf_net_axi_crossbar_M01_AXI_BVALID),
        .s_axi_rdata(intf_net_axi_crossbar_M01_AXI_RDATA),
        .s_axi_rready(intf_net_axi_crossbar_M01_AXI_RREADY),
        .s_axi_rresp(intf_net_axi_crossbar_M01_AXI_RRESP),
        .s_axi_rvalid(intf_net_axi_crossbar_M01_AXI_RVALID),
        .s_axi_wdata(intf_net_axi_crossbar_M01_AXI_WDATA),
        .s_axi_wready(intf_net_axi_crossbar_M01_AXI_WREADY),
        .s_axi_wstrb(intf_net_axi_crossbar_M01_AXI_WSTRB),
        .s_axi_wvalid(intf_net_axi_crossbar_M01_AXI_WVALID),
        .vblank_out(intf_net_v_tc_vtiming_out_VBLANK),
        .vsync_out(intf_net_v_tc_vtiming_out_VSYNC));
endmodule
