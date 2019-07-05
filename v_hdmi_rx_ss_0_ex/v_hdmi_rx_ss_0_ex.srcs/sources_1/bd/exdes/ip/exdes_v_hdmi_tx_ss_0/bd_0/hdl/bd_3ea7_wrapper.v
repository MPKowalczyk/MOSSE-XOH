//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_3ea7_wrapper.bd
//Design : bd_3ea7_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_3ea7_wrapper
   (AUDIO_IN_tdata,
    AUDIO_IN_tid,
    AUDIO_IN_tready,
    AUDIO_IN_tvalid,
    DDC_OUT_scl_io,
    DDC_OUT_sda_io,
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
  input [31:0]AUDIO_IN_tdata;
  input [2:0]AUDIO_IN_tid;
  output AUDIO_IN_tready;
  input AUDIO_IN_tvalid;
  inout DDC_OUT_scl_io;
  inout DDC_OUT_sda_io;
  output [39:0]LINK_DATA0_OUT_tdata;
  output LINK_DATA0_OUT_tvalid;
  output [39:0]LINK_DATA1_OUT_tdata;
  output LINK_DATA1_OUT_tvalid;
  output [39:0]LINK_DATA2_OUT_tdata;
  output LINK_DATA2_OUT_tvalid;
  input [1:0]SB_STATUS_IN_tdata;
  input SB_STATUS_IN_tvalid;
  input [16:0]S_AXI_CPU_IN_araddr;
  input [2:0]S_AXI_CPU_IN_arprot;
  output [0:0]S_AXI_CPU_IN_arready;
  input [0:0]S_AXI_CPU_IN_arvalid;
  input [16:0]S_AXI_CPU_IN_awaddr;
  input [2:0]S_AXI_CPU_IN_awprot;
  output [0:0]S_AXI_CPU_IN_awready;
  input [0:0]S_AXI_CPU_IN_awvalid;
  input [0:0]S_AXI_CPU_IN_bready;
  output [1:0]S_AXI_CPU_IN_bresp;
  output [0:0]S_AXI_CPU_IN_bvalid;
  output [31:0]S_AXI_CPU_IN_rdata;
  input [0:0]S_AXI_CPU_IN_rready;
  output [1:0]S_AXI_CPU_IN_rresp;
  output [0:0]S_AXI_CPU_IN_rvalid;
  input [31:0]S_AXI_CPU_IN_wdata;
  output [0:0]S_AXI_CPU_IN_wready;
  input [3:0]S_AXI_CPU_IN_wstrb;
  input [0:0]S_AXI_CPU_IN_wvalid;
  input [95:0]VIDEO_IN_tdata;
  input VIDEO_IN_tlast;
  output VIDEO_IN_tready;
  input VIDEO_IN_tuser;
  input VIDEO_IN_tvalid;
  input [19:0]acr_cts;
  input [19:0]acr_n;
  input acr_valid;
  input fid;
  input hpd;
  output irq;
  input link_clk;
  output locked;
  input s_axi_cpu_aclk;
  input s_axi_cpu_aresetn;
  input s_axis_audio_aclk;
  input s_axis_audio_aresetn;
  input s_axis_video_aclk;
  input s_axis_video_aresetn;
  input video_clk;

  wire [31:0]AUDIO_IN_tdata;
  wire [2:0]AUDIO_IN_tid;
  wire AUDIO_IN_tready;
  wire AUDIO_IN_tvalid;
  wire DDC_OUT_scl_i;
  wire DDC_OUT_scl_io;
  wire DDC_OUT_scl_o;
  wire DDC_OUT_scl_t;
  wire DDC_OUT_sda_i;
  wire DDC_OUT_sda_io;
  wire DDC_OUT_sda_o;
  wire DDC_OUT_sda_t;
  wire [39:0]LINK_DATA0_OUT_tdata;
  wire LINK_DATA0_OUT_tvalid;
  wire [39:0]LINK_DATA1_OUT_tdata;
  wire LINK_DATA1_OUT_tvalid;
  wire [39:0]LINK_DATA2_OUT_tdata;
  wire LINK_DATA2_OUT_tvalid;
  wire [1:0]SB_STATUS_IN_tdata;
  wire SB_STATUS_IN_tvalid;
  wire [16:0]S_AXI_CPU_IN_araddr;
  wire [2:0]S_AXI_CPU_IN_arprot;
  wire [0:0]S_AXI_CPU_IN_arready;
  wire [0:0]S_AXI_CPU_IN_arvalid;
  wire [16:0]S_AXI_CPU_IN_awaddr;
  wire [2:0]S_AXI_CPU_IN_awprot;
  wire [0:0]S_AXI_CPU_IN_awready;
  wire [0:0]S_AXI_CPU_IN_awvalid;
  wire [0:0]S_AXI_CPU_IN_bready;
  wire [1:0]S_AXI_CPU_IN_bresp;
  wire [0:0]S_AXI_CPU_IN_bvalid;
  wire [31:0]S_AXI_CPU_IN_rdata;
  wire [0:0]S_AXI_CPU_IN_rready;
  wire [1:0]S_AXI_CPU_IN_rresp;
  wire [0:0]S_AXI_CPU_IN_rvalid;
  wire [31:0]S_AXI_CPU_IN_wdata;
  wire [0:0]S_AXI_CPU_IN_wready;
  wire [3:0]S_AXI_CPU_IN_wstrb;
  wire [0:0]S_AXI_CPU_IN_wvalid;
  wire [95:0]VIDEO_IN_tdata;
  wire VIDEO_IN_tlast;
  wire VIDEO_IN_tready;
  wire VIDEO_IN_tuser;
  wire VIDEO_IN_tvalid;
  wire [19:0]acr_cts;
  wire [19:0]acr_n;
  wire acr_valid;
  wire fid;
  wire hpd;
  wire irq;
  wire link_clk;
  wire locked;
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
  bd_3ea7 bd_3ea7_i
       (.AUDIO_IN_tdata(AUDIO_IN_tdata),
        .AUDIO_IN_tid(AUDIO_IN_tid),
        .AUDIO_IN_tready(AUDIO_IN_tready),
        .AUDIO_IN_tvalid(AUDIO_IN_tvalid),
        .DDC_OUT_scl_i(DDC_OUT_scl_i),
        .DDC_OUT_scl_o(DDC_OUT_scl_o),
        .DDC_OUT_scl_t(DDC_OUT_scl_t),
        .DDC_OUT_sda_i(DDC_OUT_sda_i),
        .DDC_OUT_sda_o(DDC_OUT_sda_o),
        .DDC_OUT_sda_t(DDC_OUT_sda_t),
        .LINK_DATA0_OUT_tdata(LINK_DATA0_OUT_tdata),
        .LINK_DATA0_OUT_tvalid(LINK_DATA0_OUT_tvalid),
        .LINK_DATA1_OUT_tdata(LINK_DATA1_OUT_tdata),
        .LINK_DATA1_OUT_tvalid(LINK_DATA1_OUT_tvalid),
        .LINK_DATA2_OUT_tdata(LINK_DATA2_OUT_tdata),
        .LINK_DATA2_OUT_tvalid(LINK_DATA2_OUT_tvalid),
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
        .VIDEO_IN_tdata(VIDEO_IN_tdata),
        .VIDEO_IN_tlast(VIDEO_IN_tlast),
        .VIDEO_IN_tready(VIDEO_IN_tready),
        .VIDEO_IN_tuser(VIDEO_IN_tuser),
        .VIDEO_IN_tvalid(VIDEO_IN_tvalid),
        .acr_cts(acr_cts),
        .acr_n(acr_n),
        .acr_valid(acr_valid),
        .fid(fid),
        .hpd(hpd),
        .irq(irq),
        .link_clk(link_clk),
        .locked(locked),
        .s_axi_cpu_aclk(s_axi_cpu_aclk),
        .s_axi_cpu_aresetn(s_axi_cpu_aresetn),
        .s_axis_audio_aclk(s_axis_audio_aclk),
        .s_axis_audio_aresetn(s_axis_audio_aresetn),
        .s_axis_video_aclk(s_axis_video_aclk),
        .s_axis_video_aresetn(s_axis_video_aresetn),
        .video_clk(video_clk));
endmodule
