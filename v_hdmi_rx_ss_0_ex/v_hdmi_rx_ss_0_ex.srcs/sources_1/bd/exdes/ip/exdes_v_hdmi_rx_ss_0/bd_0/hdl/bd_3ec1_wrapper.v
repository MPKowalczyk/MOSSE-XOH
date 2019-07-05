//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_3ec1_wrapper.bd
//Design : bd_3ec1_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_3ec1_wrapper
   (AUDIO_OUT_tdata,
    AUDIO_OUT_tid,
    AUDIO_OUT_tready,
    AUDIO_OUT_tvalid,
    DDC_OUT_scl_io,
    DDC_OUT_sda_io,
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
  output [31:0]AUDIO_OUT_tdata;
  output [2:0]AUDIO_OUT_tid;
  input AUDIO_OUT_tready;
  output AUDIO_OUT_tvalid;
  inout DDC_OUT_scl_io;
  inout DDC_OUT_sda_io;
  input [39:0]LINK_DATA0_IN_tdata;
  input LINK_DATA0_IN_tvalid;
  input [39:0]LINK_DATA1_IN_tdata;
  input LINK_DATA1_IN_tvalid;
  input [39:0]LINK_DATA2_IN_tdata;
  input LINK_DATA2_IN_tvalid;
  input [1:0]SB_STATUS_IN_tdata;
  input SB_STATUS_IN_tvalid;
  input [8:0]S_AXI_CPU_IN_araddr;
  input [2:0]S_AXI_CPU_IN_arprot;
  output S_AXI_CPU_IN_arready;
  input S_AXI_CPU_IN_arvalid;
  input [8:0]S_AXI_CPU_IN_awaddr;
  input [2:0]S_AXI_CPU_IN_awprot;
  output S_AXI_CPU_IN_awready;
  input S_AXI_CPU_IN_awvalid;
  input S_AXI_CPU_IN_bready;
  output [1:0]S_AXI_CPU_IN_bresp;
  output S_AXI_CPU_IN_bvalid;
  output [31:0]S_AXI_CPU_IN_rdata;
  input S_AXI_CPU_IN_rready;
  output [1:0]S_AXI_CPU_IN_rresp;
  output S_AXI_CPU_IN_rvalid;
  input [31:0]S_AXI_CPU_IN_wdata;
  output S_AXI_CPU_IN_wready;
  input [3:0]S_AXI_CPU_IN_wstrb;
  input S_AXI_CPU_IN_wvalid;
  output [95:0]VIDEO_OUT_tdata;
  output VIDEO_OUT_tlast;
  input VIDEO_OUT_tready;
  output VIDEO_OUT_tuser;
  output VIDEO_OUT_tvalid;
  output [19:0]acr_cts;
  output [19:0]acr_n;
  output acr_valid;
  input cable_detect;
  output fid;
  output hpd;
  output irq;
  input link_clk;
  input s_axi_cpu_aclk;
  input s_axi_cpu_aresetn;
  input s_axis_audio_aclk;
  input s_axis_audio_aresetn;
  input s_axis_video_aclk;
  input s_axis_video_aresetn;
  input video_clk;

  wire [31:0]AUDIO_OUT_tdata;
  wire [2:0]AUDIO_OUT_tid;
  wire AUDIO_OUT_tready;
  wire AUDIO_OUT_tvalid;
  wire DDC_OUT_scl_i;
  wire DDC_OUT_scl_io;
  wire DDC_OUT_scl_o;
  wire DDC_OUT_scl_t;
  wire DDC_OUT_sda_i;
  wire DDC_OUT_sda_io;
  wire DDC_OUT_sda_o;
  wire DDC_OUT_sda_t;
  wire [39:0]LINK_DATA0_IN_tdata;
  wire LINK_DATA0_IN_tvalid;
  wire [39:0]LINK_DATA1_IN_tdata;
  wire LINK_DATA1_IN_tvalid;
  wire [39:0]LINK_DATA2_IN_tdata;
  wire LINK_DATA2_IN_tvalid;
  wire [1:0]SB_STATUS_IN_tdata;
  wire SB_STATUS_IN_tvalid;
  wire [8:0]S_AXI_CPU_IN_araddr;
  wire [2:0]S_AXI_CPU_IN_arprot;
  wire S_AXI_CPU_IN_arready;
  wire S_AXI_CPU_IN_arvalid;
  wire [8:0]S_AXI_CPU_IN_awaddr;
  wire [2:0]S_AXI_CPU_IN_awprot;
  wire S_AXI_CPU_IN_awready;
  wire S_AXI_CPU_IN_awvalid;
  wire S_AXI_CPU_IN_bready;
  wire [1:0]S_AXI_CPU_IN_bresp;
  wire S_AXI_CPU_IN_bvalid;
  wire [31:0]S_AXI_CPU_IN_rdata;
  wire S_AXI_CPU_IN_rready;
  wire [1:0]S_AXI_CPU_IN_rresp;
  wire S_AXI_CPU_IN_rvalid;
  wire [31:0]S_AXI_CPU_IN_wdata;
  wire S_AXI_CPU_IN_wready;
  wire [3:0]S_AXI_CPU_IN_wstrb;
  wire S_AXI_CPU_IN_wvalid;
  wire [95:0]VIDEO_OUT_tdata;
  wire VIDEO_OUT_tlast;
  wire VIDEO_OUT_tready;
  wire VIDEO_OUT_tuser;
  wire VIDEO_OUT_tvalid;
  wire [19:0]acr_cts;
  wire [19:0]acr_n;
  wire acr_valid;
  wire cable_detect;
  wire fid;
  wire hpd;
  wire irq;
  wire link_clk;
  wire s_axi_cpu_aclk;
  wire s_axi_cpu_aresetn;
  wire s_axis_audio_aclk;
  wire s_axis_audio_aresetn;
  wire s_axis_video_aclk;
  wire s_axis_video_aresetn;
  wire video_clk;

  IOBUF DDC_OUT_scl_iobuf
       (.I(DDC_OUT_scl_o),
        .IO(DDC_OUT_scl_io),
        .O(DDC_OUT_scl_i),
        .T(DDC_OUT_scl_t));
  IOBUF DDC_OUT_sda_iobuf
       (.I(DDC_OUT_sda_o),
        .IO(DDC_OUT_sda_io),
        .O(DDC_OUT_sda_i),
        .T(DDC_OUT_sda_t));
  bd_3ec1 bd_3ec1_i
       (.AUDIO_OUT_tdata(AUDIO_OUT_tdata),
        .AUDIO_OUT_tid(AUDIO_OUT_tid),
        .AUDIO_OUT_tready(AUDIO_OUT_tready),
        .AUDIO_OUT_tvalid(AUDIO_OUT_tvalid),
        .DDC_OUT_scl_i(DDC_OUT_scl_i),
        .DDC_OUT_scl_o(DDC_OUT_scl_o),
        .DDC_OUT_scl_t(DDC_OUT_scl_t),
        .DDC_OUT_sda_i(DDC_OUT_sda_i),
        .DDC_OUT_sda_o(DDC_OUT_sda_o),
        .DDC_OUT_sda_t(DDC_OUT_sda_t),
        .LINK_DATA0_IN_tdata(LINK_DATA0_IN_tdata),
        .LINK_DATA0_IN_tvalid(LINK_DATA0_IN_tvalid),
        .LINK_DATA1_IN_tdata(LINK_DATA1_IN_tdata),
        .LINK_DATA1_IN_tvalid(LINK_DATA1_IN_tvalid),
        .LINK_DATA2_IN_tdata(LINK_DATA2_IN_tdata),
        .LINK_DATA2_IN_tvalid(LINK_DATA2_IN_tvalid),
        .SB_STATUS_IN_tdata(SB_STATUS_IN_tdata),
        .SB_STATUS_IN_tvalid(SB_STATUS_IN_tvalid),
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
        .VIDEO_OUT_tdata(VIDEO_OUT_tdata),
        .VIDEO_OUT_tlast(VIDEO_OUT_tlast),
        .VIDEO_OUT_tready(VIDEO_OUT_tready),
        .VIDEO_OUT_tuser(VIDEO_OUT_tuser),
        .VIDEO_OUT_tvalid(VIDEO_OUT_tvalid),
        .acr_cts(acr_cts),
        .acr_n(acr_n),
        .acr_valid(acr_valid),
        .cable_detect(cable_detect),
        .fid(fid),
        .hpd(hpd),
        .irq(irq),
        .link_clk(link_clk),
        .s_axi_cpu_aclk(s_axi_cpu_aclk),
        .s_axi_cpu_aresetn(s_axi_cpu_aresetn),
        .s_axis_audio_aclk(s_axis_audio_aclk),
        .s_axis_audio_aresetn(s_axis_audio_aresetn),
        .s_axis_video_aclk(s_axis_video_aclk),
        .s_axis_video_aresetn(s_axis_video_aresetn),
        .video_clk(video_clk));
endmodule
