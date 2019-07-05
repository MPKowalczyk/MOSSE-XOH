//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Tue Mar 12 11:37:08 2019
//Host        : vision-desktop running 64-bit Ubuntu 18.04.2 LTS
//Command     : generate_target exdes.bd
//Design      : exdes
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module audio_ss_0_imp_L2LLI5
   (ACLK,
    ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    aud_acr_cts_in,
    aud_acr_cts_out,
    aud_acr_n_in,
    aud_acr_n_out,
    aud_acr_valid_in,
    aud_acr_valid_out,
    aud_rstn,
    audio_clk,
    axis_audio_in_tdata,
    axis_audio_in_tid,
    axis_audio_in_tready,
    axis_audio_in_tvalid,
    axis_audio_out_tdata,
    axis_audio_out_tid,
    axis_audio_out_tready,
    axis_audio_out_tvalid,
    hdmi_clk);
  input ACLK;
  input ARESETN;
  input [39:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [15:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output [0:0]S00_AXI_arready;
  input [3:0]S00_AXI_arregion;
  input [2:0]S00_AXI_arsize;
  input [0:0]S00_AXI_arvalid;
  input [39:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [15:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output [0:0]S00_AXI_awready;
  input [3:0]S00_AXI_awregion;
  input [2:0]S00_AXI_awsize;
  input [0:0]S00_AXI_awvalid;
  output [15:0]S00_AXI_bid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [15:0]S00_AXI_rid;
  output [0:0]S00_AXI_rlast;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [0:0]S00_AXI_wlast;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;
  input [19:0]aud_acr_cts_in;
  output [19:0]aud_acr_cts_out;
  input [19:0]aud_acr_n_in;
  output [19:0]aud_acr_n_out;
  input aud_acr_valid_in;
  output aud_acr_valid_out;
  output aud_rstn;
  output audio_clk;
  input [31:0]axis_audio_in_tdata;
  input [2:0]axis_audio_in_tid;
  output axis_audio_in_tready;
  input axis_audio_in_tvalid;
  output [31:0]axis_audio_out_tdata;
  output [2:0]axis_audio_out_tid;
  input axis_audio_out_tready;
  output axis_audio_out_tvalid;
  input hdmi_clk;

  wire [31:0]intf_net_aud_pat_gen_axis_audio_out_TDATA;
  wire [2:0]intf_net_aud_pat_gen_axis_audio_out_TID;
  wire intf_net_aud_pat_gen_axis_audio_out_TREADY;
  wire intf_net_aud_pat_gen_axis_audio_out_TVALID;
  wire [39:0]intf_net_axi_interconnect_M00_AXI_ARADDR;
  wire [2:0]intf_net_axi_interconnect_M00_AXI_ARPROT;
  wire intf_net_axi_interconnect_M00_AXI_ARREADY;
  wire intf_net_axi_interconnect_M00_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M00_AXI_AWADDR;
  wire [2:0]intf_net_axi_interconnect_M00_AXI_AWPROT;
  wire intf_net_axi_interconnect_M00_AXI_AWREADY;
  wire intf_net_axi_interconnect_M00_AXI_AWVALID;
  wire intf_net_axi_interconnect_M00_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M00_AXI_BRESP;
  wire intf_net_axi_interconnect_M00_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M00_AXI_RDATA;
  wire intf_net_axi_interconnect_M00_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M00_AXI_RRESP;
  wire intf_net_axi_interconnect_M00_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M00_AXI_WDATA;
  wire intf_net_axi_interconnect_M00_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M00_AXI_WSTRB;
  wire intf_net_axi_interconnect_M00_AXI_WVALID;
  wire [39:0]intf_net_axi_interconnect_M01_AXI_ARADDR;
  wire intf_net_axi_interconnect_M01_AXI_ARREADY;
  wire intf_net_axi_interconnect_M01_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M01_AXI_AWADDR;
  wire intf_net_axi_interconnect_M01_AXI_AWREADY;
  wire intf_net_axi_interconnect_M01_AXI_AWVALID;
  wire intf_net_axi_interconnect_M01_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M01_AXI_BRESP;
  wire intf_net_axi_interconnect_M01_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M01_AXI_RDATA;
  wire intf_net_axi_interconnect_M01_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M01_AXI_RRESP;
  wire intf_net_axi_interconnect_M01_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M01_AXI_WDATA;
  wire intf_net_axi_interconnect_M01_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M01_AXI_WSTRB;
  wire intf_net_axi_interconnect_M01_AXI_WVALID;
  wire [39:0]intf_net_axi_interconnect_M02_AXI_ARADDR;
  wire intf_net_axi_interconnect_M02_AXI_ARREADY;
  wire intf_net_axi_interconnect_M02_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M02_AXI_AWADDR;
  wire intf_net_axi_interconnect_M02_AXI_AWREADY;
  wire intf_net_axi_interconnect_M02_AXI_AWVALID;
  wire intf_net_axi_interconnect_M02_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M02_AXI_BRESP;
  wire intf_net_axi_interconnect_M02_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M02_AXI_RDATA;
  wire intf_net_axi_interconnect_M02_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M02_AXI_RRESP;
  wire intf_net_axi_interconnect_M02_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M02_AXI_WDATA;
  wire intf_net_axi_interconnect_M02_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M02_AXI_WSTRB;
  wire intf_net_axi_interconnect_M02_AXI_WVALID;
  wire [39:0]intf_net_bdry_in_S00_AXI_ARADDR;
  wire [1:0]intf_net_bdry_in_S00_AXI_ARBURST;
  wire [3:0]intf_net_bdry_in_S00_AXI_ARCACHE;
  wire [15:0]intf_net_bdry_in_S00_AXI_ARID;
  wire [7:0]intf_net_bdry_in_S00_AXI_ARLEN;
  wire [0:0]intf_net_bdry_in_S00_AXI_ARLOCK;
  wire [2:0]intf_net_bdry_in_S00_AXI_ARPROT;
  wire [3:0]intf_net_bdry_in_S00_AXI_ARQOS;
  wire [0:0]intf_net_bdry_in_S00_AXI_ARREADY;
  wire [3:0]intf_net_bdry_in_S00_AXI_ARREGION;
  wire [2:0]intf_net_bdry_in_S00_AXI_ARSIZE;
  wire [0:0]intf_net_bdry_in_S00_AXI_ARVALID;
  wire [39:0]intf_net_bdry_in_S00_AXI_AWADDR;
  wire [1:0]intf_net_bdry_in_S00_AXI_AWBURST;
  wire [3:0]intf_net_bdry_in_S00_AXI_AWCACHE;
  wire [15:0]intf_net_bdry_in_S00_AXI_AWID;
  wire [7:0]intf_net_bdry_in_S00_AXI_AWLEN;
  wire [0:0]intf_net_bdry_in_S00_AXI_AWLOCK;
  wire [2:0]intf_net_bdry_in_S00_AXI_AWPROT;
  wire [3:0]intf_net_bdry_in_S00_AXI_AWQOS;
  wire [0:0]intf_net_bdry_in_S00_AXI_AWREADY;
  wire [3:0]intf_net_bdry_in_S00_AXI_AWREGION;
  wire [2:0]intf_net_bdry_in_S00_AXI_AWSIZE;
  wire [0:0]intf_net_bdry_in_S00_AXI_AWVALID;
  wire [15:0]intf_net_bdry_in_S00_AXI_BID;
  wire [0:0]intf_net_bdry_in_S00_AXI_BREADY;
  wire [1:0]intf_net_bdry_in_S00_AXI_BRESP;
  wire [0:0]intf_net_bdry_in_S00_AXI_BVALID;
  wire [31:0]intf_net_bdry_in_S00_AXI_RDATA;
  wire [15:0]intf_net_bdry_in_S00_AXI_RID;
  wire [0:0]intf_net_bdry_in_S00_AXI_RLAST;
  wire [0:0]intf_net_bdry_in_S00_AXI_RREADY;
  wire [1:0]intf_net_bdry_in_S00_AXI_RRESP;
  wire [0:0]intf_net_bdry_in_S00_AXI_RVALID;
  wire [31:0]intf_net_bdry_in_S00_AXI_WDATA;
  wire [0:0]intf_net_bdry_in_S00_AXI_WLAST;
  wire [0:0]intf_net_bdry_in_S00_AXI_WREADY;
  wire [3:0]intf_net_bdry_in_S00_AXI_WSTRB;
  wire [0:0]intf_net_bdry_in_S00_AXI_WVALID;
  wire [31:0]intf_net_bdry_in_axis_audio_in_TDATA;
  wire [2:0]intf_net_bdry_in_axis_audio_in_TID;
  wire intf_net_bdry_in_axis_audio_in_TREADY;
  wire intf_net_bdry_in_axis_audio_in_TVALID;
  wire net_bdry_in_ACLK;
  wire net_bdry_in_ARESETN;
  wire [19:0]net_bdry_in_aud_acr_cts_in;
  wire [19:0]net_bdry_in_aud_acr_n_in;
  wire net_bdry_in_aud_acr_valid_in;
  wire net_bdry_in_hdmi_clk;
  wire net_clk_wiz_clk_out1;
  wire net_clk_wiz_locked;
  wire [19:0]net_hdmi_acr_ctrl_aud_acr_cts_out;
  wire [19:0]net_hdmi_acr_ctrl_aud_acr_n_out;
  wire net_hdmi_acr_ctrl_aud_acr_valid_out;
  wire net_hdmi_acr_ctrl_aud_resetn_out;

  assign S00_AXI_arready[0] = intf_net_bdry_in_S00_AXI_ARREADY;
  assign S00_AXI_awready[0] = intf_net_bdry_in_S00_AXI_AWREADY;
  assign S00_AXI_bid[15:0] = intf_net_bdry_in_S00_AXI_BID;
  assign S00_AXI_bresp[1:0] = intf_net_bdry_in_S00_AXI_BRESP;
  assign S00_AXI_bvalid[0] = intf_net_bdry_in_S00_AXI_BVALID;
  assign S00_AXI_rdata[31:0] = intf_net_bdry_in_S00_AXI_RDATA;
  assign S00_AXI_rid[15:0] = intf_net_bdry_in_S00_AXI_RID;
  assign S00_AXI_rlast[0] = intf_net_bdry_in_S00_AXI_RLAST;
  assign S00_AXI_rresp[1:0] = intf_net_bdry_in_S00_AXI_RRESP;
  assign S00_AXI_rvalid[0] = intf_net_bdry_in_S00_AXI_RVALID;
  assign S00_AXI_wready[0] = intf_net_bdry_in_S00_AXI_WREADY;
  assign aud_acr_cts_out[19:0] = net_hdmi_acr_ctrl_aud_acr_cts_out;
  assign aud_acr_n_out[19:0] = net_hdmi_acr_ctrl_aud_acr_n_out;
  assign aud_acr_valid_out = net_hdmi_acr_ctrl_aud_acr_valid_out;
  assign aud_rstn = net_hdmi_acr_ctrl_aud_resetn_out;
  assign audio_clk = net_clk_wiz_clk_out1;
  assign axis_audio_in_tready = intf_net_bdry_in_axis_audio_in_TREADY;
  assign axis_audio_out_tdata[31:0] = intf_net_aud_pat_gen_axis_audio_out_TDATA;
  assign axis_audio_out_tid[2:0] = intf_net_aud_pat_gen_axis_audio_out_TID;
  assign axis_audio_out_tvalid = intf_net_aud_pat_gen_axis_audio_out_TVALID;
  assign intf_net_aud_pat_gen_axis_audio_out_TREADY = axis_audio_out_tready;
  assign intf_net_bdry_in_S00_AXI_ARADDR = S00_AXI_araddr[39:0];
  assign intf_net_bdry_in_S00_AXI_ARBURST = S00_AXI_arburst[1:0];
  assign intf_net_bdry_in_S00_AXI_ARCACHE = S00_AXI_arcache[3:0];
  assign intf_net_bdry_in_S00_AXI_ARID = S00_AXI_arid[15:0];
  assign intf_net_bdry_in_S00_AXI_ARLEN = S00_AXI_arlen[7:0];
  assign intf_net_bdry_in_S00_AXI_ARLOCK = S00_AXI_arlock[0];
  assign intf_net_bdry_in_S00_AXI_ARPROT = S00_AXI_arprot[2:0];
  assign intf_net_bdry_in_S00_AXI_ARQOS = S00_AXI_arqos[3:0];
  assign intf_net_bdry_in_S00_AXI_ARREGION = S00_AXI_arregion[3:0];
  assign intf_net_bdry_in_S00_AXI_ARSIZE = S00_AXI_arsize[2:0];
  assign intf_net_bdry_in_S00_AXI_ARVALID = S00_AXI_arvalid[0];
  assign intf_net_bdry_in_S00_AXI_AWADDR = S00_AXI_awaddr[39:0];
  assign intf_net_bdry_in_S00_AXI_AWBURST = S00_AXI_awburst[1:0];
  assign intf_net_bdry_in_S00_AXI_AWCACHE = S00_AXI_awcache[3:0];
  assign intf_net_bdry_in_S00_AXI_AWID = S00_AXI_awid[15:0];
  assign intf_net_bdry_in_S00_AXI_AWLEN = S00_AXI_awlen[7:0];
  assign intf_net_bdry_in_S00_AXI_AWLOCK = S00_AXI_awlock[0];
  assign intf_net_bdry_in_S00_AXI_AWPROT = S00_AXI_awprot[2:0];
  assign intf_net_bdry_in_S00_AXI_AWQOS = S00_AXI_awqos[3:0];
  assign intf_net_bdry_in_S00_AXI_AWREGION = S00_AXI_awregion[3:0];
  assign intf_net_bdry_in_S00_AXI_AWSIZE = S00_AXI_awsize[2:0];
  assign intf_net_bdry_in_S00_AXI_AWVALID = S00_AXI_awvalid[0];
  assign intf_net_bdry_in_S00_AXI_BREADY = S00_AXI_bready[0];
  assign intf_net_bdry_in_S00_AXI_RREADY = S00_AXI_rready[0];
  assign intf_net_bdry_in_S00_AXI_WDATA = S00_AXI_wdata[31:0];
  assign intf_net_bdry_in_S00_AXI_WLAST = S00_AXI_wlast[0];
  assign intf_net_bdry_in_S00_AXI_WSTRB = S00_AXI_wstrb[3:0];
  assign intf_net_bdry_in_S00_AXI_WVALID = S00_AXI_wvalid[0];
  assign intf_net_bdry_in_axis_audio_in_TDATA = axis_audio_in_tdata[31:0];
  assign intf_net_bdry_in_axis_audio_in_TID = axis_audio_in_tid[2:0];
  assign intf_net_bdry_in_axis_audio_in_TVALID = axis_audio_in_tvalid;
  assign net_bdry_in_ACLK = ACLK;
  assign net_bdry_in_ARESETN = ARESETN;
  assign net_bdry_in_aud_acr_cts_in = aud_acr_cts_in[19:0];
  assign net_bdry_in_aud_acr_n_in = aud_acr_n_in[19:0];
  assign net_bdry_in_aud_acr_valid_in = aud_acr_valid_in;
  assign net_bdry_in_hdmi_clk = hdmi_clk;
  exdes_aud_pat_gen_0 aud_pat_gen
       (.aud_clk(net_clk_wiz_clk_out1),
        .axi_aclk(net_bdry_in_ACLK),
        .axi_araddr(intf_net_axi_interconnect_M00_AXI_ARADDR[31:0]),
        .axi_aresetn(net_bdry_in_ARESETN),
        .axi_arprot(intf_net_axi_interconnect_M00_AXI_ARPROT),
        .axi_arready(intf_net_axi_interconnect_M00_AXI_ARREADY),
        .axi_arvalid(intf_net_axi_interconnect_M00_AXI_ARVALID),
        .axi_awaddr(intf_net_axi_interconnect_M00_AXI_AWADDR[31:0]),
        .axi_awprot(intf_net_axi_interconnect_M00_AXI_AWPROT),
        .axi_awready(intf_net_axi_interconnect_M00_AXI_AWREADY),
        .axi_awvalid(intf_net_axi_interconnect_M00_AXI_AWVALID),
        .axi_bready(intf_net_axi_interconnect_M00_AXI_BREADY),
        .axi_bresp(intf_net_axi_interconnect_M00_AXI_BRESP),
        .axi_bvalid(intf_net_axi_interconnect_M00_AXI_BVALID),
        .axi_rdata(intf_net_axi_interconnect_M00_AXI_RDATA),
        .axi_rready(intf_net_axi_interconnect_M00_AXI_RREADY),
        .axi_rresp(intf_net_axi_interconnect_M00_AXI_RRESP),
        .axi_rvalid(intf_net_axi_interconnect_M00_AXI_RVALID),
        .axi_wdata(intf_net_axi_interconnect_M00_AXI_WDATA),
        .axi_wready(intf_net_axi_interconnect_M00_AXI_WREADY),
        .axi_wstrb(intf_net_axi_interconnect_M00_AXI_WSTRB),
        .axi_wvalid(intf_net_axi_interconnect_M00_AXI_WVALID),
        .axis_aud_pattern_tdata_in(intf_net_bdry_in_axis_audio_in_TDATA),
        .axis_aud_pattern_tdata_out(intf_net_aud_pat_gen_axis_audio_out_TDATA),
        .axis_aud_pattern_tid_in(intf_net_bdry_in_axis_audio_in_TID),
        .axis_aud_pattern_tid_out(intf_net_aud_pat_gen_axis_audio_out_TID),
        .axis_aud_pattern_tready_in(intf_net_aud_pat_gen_axis_audio_out_TREADY),
        .axis_aud_pattern_tready_out(intf_net_bdry_in_axis_audio_in_TREADY),
        .axis_aud_pattern_tvalid_in(intf_net_bdry_in_axis_audio_in_TVALID),
        .axis_aud_pattern_tvalid_out(intf_net_aud_pat_gen_axis_audio_out_TVALID),
        .axis_clk(net_clk_wiz_clk_out1),
        .axis_resetn(net_hdmi_acr_ctrl_aud_resetn_out));
  exdes_axi_interconnect_0 axi_interconnect
       (.ACLK(net_bdry_in_ACLK),
        .ARESETN(net_bdry_in_ARESETN),
        .M00_ACLK(net_bdry_in_ACLK),
        .M00_ARESETN(net_bdry_in_ARESETN),
        .M00_AXI_araddr(intf_net_axi_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arprot(intf_net_axi_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(intf_net_axi_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(intf_net_axi_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(intf_net_axi_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awprot(intf_net_axi_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(intf_net_axi_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(intf_net_axi_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(intf_net_axi_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(intf_net_axi_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(intf_net_axi_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(intf_net_axi_interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(intf_net_axi_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(intf_net_axi_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(intf_net_axi_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(intf_net_axi_interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(intf_net_axi_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(intf_net_axi_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(intf_net_axi_interconnect_M00_AXI_WVALID),
        .M01_ACLK(net_bdry_in_ACLK),
        .M01_ARESETN(net_bdry_in_ARESETN),
        .M01_AXI_araddr(intf_net_axi_interconnect_M01_AXI_ARADDR),
        .M01_AXI_arready(intf_net_axi_interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(intf_net_axi_interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(intf_net_axi_interconnect_M01_AXI_AWADDR),
        .M01_AXI_awready(intf_net_axi_interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(intf_net_axi_interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(intf_net_axi_interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(intf_net_axi_interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(intf_net_axi_interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(intf_net_axi_interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(intf_net_axi_interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(intf_net_axi_interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(intf_net_axi_interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(intf_net_axi_interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(intf_net_axi_interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(intf_net_axi_interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(intf_net_axi_interconnect_M01_AXI_WVALID),
        .M02_ACLK(net_bdry_in_ACLK),
        .M02_ARESETN(net_bdry_in_ARESETN),
        .M02_AXI_araddr(intf_net_axi_interconnect_M02_AXI_ARADDR),
        .M02_AXI_arready(intf_net_axi_interconnect_M02_AXI_ARREADY),
        .M02_AXI_arvalid(intf_net_axi_interconnect_M02_AXI_ARVALID),
        .M02_AXI_awaddr(intf_net_axi_interconnect_M02_AXI_AWADDR),
        .M02_AXI_awready(intf_net_axi_interconnect_M02_AXI_AWREADY),
        .M02_AXI_awvalid(intf_net_axi_interconnect_M02_AXI_AWVALID),
        .M02_AXI_bready(intf_net_axi_interconnect_M02_AXI_BREADY),
        .M02_AXI_bresp(intf_net_axi_interconnect_M02_AXI_BRESP),
        .M02_AXI_bvalid(intf_net_axi_interconnect_M02_AXI_BVALID),
        .M02_AXI_rdata(intf_net_axi_interconnect_M02_AXI_RDATA),
        .M02_AXI_rready(intf_net_axi_interconnect_M02_AXI_RREADY),
        .M02_AXI_rresp(intf_net_axi_interconnect_M02_AXI_RRESP),
        .M02_AXI_rvalid(intf_net_axi_interconnect_M02_AXI_RVALID),
        .M02_AXI_wdata(intf_net_axi_interconnect_M02_AXI_WDATA),
        .M02_AXI_wready(intf_net_axi_interconnect_M02_AXI_WREADY),
        .M02_AXI_wstrb(intf_net_axi_interconnect_M02_AXI_WSTRB),
        .M02_AXI_wvalid(intf_net_axi_interconnect_M02_AXI_WVALID),
        .S00_ACLK(net_bdry_in_ACLK),
        .S00_ARESETN(net_bdry_in_ARESETN),
        .S00_AXI_araddr(intf_net_bdry_in_S00_AXI_ARADDR),
        .S00_AXI_arburst(intf_net_bdry_in_S00_AXI_ARBURST),
        .S00_AXI_arcache(intf_net_bdry_in_S00_AXI_ARCACHE),
        .S00_AXI_arid(intf_net_bdry_in_S00_AXI_ARID),
        .S00_AXI_arlen(intf_net_bdry_in_S00_AXI_ARLEN),
        .S00_AXI_arlock(intf_net_bdry_in_S00_AXI_ARLOCK),
        .S00_AXI_arprot(intf_net_bdry_in_S00_AXI_ARPROT),
        .S00_AXI_arqos(intf_net_bdry_in_S00_AXI_ARQOS),
        .S00_AXI_arready(intf_net_bdry_in_S00_AXI_ARREADY),
        .S00_AXI_arregion(intf_net_bdry_in_S00_AXI_ARREGION),
        .S00_AXI_arsize(intf_net_bdry_in_S00_AXI_ARSIZE),
        .S00_AXI_arvalid(intf_net_bdry_in_S00_AXI_ARVALID),
        .S00_AXI_awaddr(intf_net_bdry_in_S00_AXI_AWADDR),
        .S00_AXI_awburst(intf_net_bdry_in_S00_AXI_AWBURST),
        .S00_AXI_awcache(intf_net_bdry_in_S00_AXI_AWCACHE),
        .S00_AXI_awid(intf_net_bdry_in_S00_AXI_AWID),
        .S00_AXI_awlen(intf_net_bdry_in_S00_AXI_AWLEN),
        .S00_AXI_awlock(intf_net_bdry_in_S00_AXI_AWLOCK),
        .S00_AXI_awprot(intf_net_bdry_in_S00_AXI_AWPROT),
        .S00_AXI_awqos(intf_net_bdry_in_S00_AXI_AWQOS),
        .S00_AXI_awready(intf_net_bdry_in_S00_AXI_AWREADY),
        .S00_AXI_awregion(intf_net_bdry_in_S00_AXI_AWREGION),
        .S00_AXI_awsize(intf_net_bdry_in_S00_AXI_AWSIZE),
        .S00_AXI_awvalid(intf_net_bdry_in_S00_AXI_AWVALID),
        .S00_AXI_bid(intf_net_bdry_in_S00_AXI_BID),
        .S00_AXI_bready(intf_net_bdry_in_S00_AXI_BREADY),
        .S00_AXI_bresp(intf_net_bdry_in_S00_AXI_BRESP),
        .S00_AXI_bvalid(intf_net_bdry_in_S00_AXI_BVALID),
        .S00_AXI_rdata(intf_net_bdry_in_S00_AXI_RDATA),
        .S00_AXI_rid(intf_net_bdry_in_S00_AXI_RID),
        .S00_AXI_rlast(intf_net_bdry_in_S00_AXI_RLAST),
        .S00_AXI_rready(intf_net_bdry_in_S00_AXI_RREADY),
        .S00_AXI_rresp(intf_net_bdry_in_S00_AXI_RRESP),
        .S00_AXI_rvalid(intf_net_bdry_in_S00_AXI_RVALID),
        .S00_AXI_wdata(intf_net_bdry_in_S00_AXI_WDATA),
        .S00_AXI_wlast(intf_net_bdry_in_S00_AXI_WLAST),
        .S00_AXI_wready(intf_net_bdry_in_S00_AXI_WREADY),
        .S00_AXI_wstrb(intf_net_bdry_in_S00_AXI_WSTRB),
        .S00_AXI_wvalid(intf_net_bdry_in_S00_AXI_WVALID));
  exdes_clk_wiz_0 clk_wiz
       (.clk_in1(net_bdry_in_ACLK),
        .clk_out1(net_clk_wiz_clk_out1),
        .locked(net_clk_wiz_locked),
        .s_axi_aclk(net_bdry_in_ACLK),
        .s_axi_araddr(intf_net_axi_interconnect_M02_AXI_ARADDR[10:0]),
        .s_axi_aresetn(net_bdry_in_ARESETN),
        .s_axi_arready(intf_net_axi_interconnect_M02_AXI_ARREADY),
        .s_axi_arvalid(intf_net_axi_interconnect_M02_AXI_ARVALID),
        .s_axi_awaddr(intf_net_axi_interconnect_M02_AXI_AWADDR[10:0]),
        .s_axi_awready(intf_net_axi_interconnect_M02_AXI_AWREADY),
        .s_axi_awvalid(intf_net_axi_interconnect_M02_AXI_AWVALID),
        .s_axi_bready(intf_net_axi_interconnect_M02_AXI_BREADY),
        .s_axi_bresp(intf_net_axi_interconnect_M02_AXI_BRESP),
        .s_axi_bvalid(intf_net_axi_interconnect_M02_AXI_BVALID),
        .s_axi_rdata(intf_net_axi_interconnect_M02_AXI_RDATA),
        .s_axi_rready(intf_net_axi_interconnect_M02_AXI_RREADY),
        .s_axi_rresp(intf_net_axi_interconnect_M02_AXI_RRESP),
        .s_axi_rvalid(intf_net_axi_interconnect_M02_AXI_RVALID),
        .s_axi_wdata(intf_net_axi_interconnect_M02_AXI_WDATA),
        .s_axi_wready(intf_net_axi_interconnect_M02_AXI_WREADY),
        .s_axi_wstrb(intf_net_axi_interconnect_M02_AXI_WSTRB),
        .s_axi_wvalid(intf_net_axi_interconnect_M02_AXI_WVALID));
  exdes_hdmi_acr_ctrl_0 hdmi_acr_ctrl
       (.aud_acr_cts_in(net_bdry_in_aud_acr_cts_in),
        .aud_acr_cts_out(net_hdmi_acr_ctrl_aud_acr_cts_out),
        .aud_acr_n_in(net_bdry_in_aud_acr_n_in),
        .aud_acr_n_out(net_hdmi_acr_ctrl_aud_acr_n_out),
        .aud_acr_valid_in(net_bdry_in_aud_acr_valid_in),
        .aud_acr_valid_out(net_hdmi_acr_ctrl_aud_acr_valid_out),
        .aud_clk(net_clk_wiz_clk_out1),
        .aud_resetn_out(net_hdmi_acr_ctrl_aud_resetn_out),
        .axi_aclk(net_bdry_in_ACLK),
        .axi_araddr(intf_net_axi_interconnect_M01_AXI_ARADDR[31:0]),
        .axi_aresetn(net_bdry_in_ARESETN),
        .axi_arready(intf_net_axi_interconnect_M01_AXI_ARREADY),
        .axi_arvalid(intf_net_axi_interconnect_M01_AXI_ARVALID),
        .axi_awaddr(intf_net_axi_interconnect_M01_AXI_AWADDR[31:0]),
        .axi_awready(intf_net_axi_interconnect_M01_AXI_AWREADY),
        .axi_awvalid(intf_net_axi_interconnect_M01_AXI_AWVALID),
        .axi_bready(intf_net_axi_interconnect_M01_AXI_BREADY),
        .axi_bresp(intf_net_axi_interconnect_M01_AXI_BRESP),
        .axi_bvalid(intf_net_axi_interconnect_M01_AXI_BVALID),
        .axi_rdata(intf_net_axi_interconnect_M01_AXI_RDATA),
        .axi_rready(intf_net_axi_interconnect_M01_AXI_RREADY),
        .axi_rresp(intf_net_axi_interconnect_M01_AXI_RRESP),
        .axi_rvalid(intf_net_axi_interconnect_M01_AXI_RVALID),
        .axi_wdata(intf_net_axi_interconnect_M01_AXI_WDATA),
        .axi_wready(intf_net_axi_interconnect_M01_AXI_WREADY),
        .axi_wstrb(intf_net_axi_interconnect_M01_AXI_WSTRB),
        .axi_wvalid(intf_net_axi_interconnect_M01_AXI_WVALID),
        .hdmi_clk(net_bdry_in_hdmi_clk),
        .pll_lock_in(net_clk_wiz_locked));
endmodule

(* CORE_GENERATION_INFO = "exdes,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=exdes,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=49,numReposBlks=30,numNonXlnxBlks=0,numHierBlks=19,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_zynq_ultra_ps_e_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "exdes.hwdef" *) 
module exdes
   (DRU_CLK_IN_clk_n,
    DRU_CLK_IN_clk_p,
    HDMI_RX_CLK_N_IN,
    HDMI_RX_CLK_P_IN,
    HDMI_RX_DAT_N_IN,
    HDMI_RX_DAT_P_IN,
    HDMI_TX_CLK_N_OUT,
    HDMI_TX_CLK_P_OUT,
    HDMI_TX_DAT_N_OUT,
    HDMI_TX_DAT_P_OUT,
    IDT_8T49N241_LOL_IN,
    IDT_8T49N241_RST_OUT,
    LED0,
    RX_DDC_OUT_scl_i,
    RX_DDC_OUT_scl_o,
    RX_DDC_OUT_scl_t,
    RX_DDC_OUT_sda_i,
    RX_DDC_OUT_sda_o,
    RX_DDC_OUT_sda_t,
    RX_DET_IN,
    RX_HPD_OUT,
    RX_REFCLK_N_OUT,
    RX_REFCLK_P_OUT,
    TX_DDC_OUT_scl_i,
    TX_DDC_OUT_scl_o,
    TX_DDC_OUT_scl_t,
    TX_DDC_OUT_sda_i,
    TX_DDC_OUT_sda_o,
    TX_DDC_OUT_sda_t,
    TX_EN_OUT,
    TX_HPD_IN,
    TX_REFCLK_N_IN,
    TX_REFCLK_P_IN,
    fmch_iic_scl_i,
    fmch_iic_scl_o,
    fmch_iic_scl_t,
    fmch_iic_sda_i,
    fmch_iic_sda_o,
    fmch_iic_sda_t,
    reset);
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 DRU_CLK_IN CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DRU_CLK_IN, CAN_DEBUG false, FREQ_HZ 156250000" *) input [0:0]DRU_CLK_IN_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 DRU_CLK_IN CLK_P" *) input [0:0]DRU_CLK_IN_clk_p;
  input HDMI_RX_CLK_N_IN;
  input HDMI_RX_CLK_P_IN;
  input [2:0]HDMI_RX_DAT_N_IN;
  input [2:0]HDMI_RX_DAT_P_IN;
  output HDMI_TX_CLK_N_OUT;
  output HDMI_TX_CLK_P_OUT;
  output [2:0]HDMI_TX_DAT_N_OUT;
  output [2:0]HDMI_TX_DAT_P_OUT;
  input IDT_8T49N241_LOL_IN;
  output IDT_8T49N241_RST_OUT;
  output LED0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 RX_DDC_OUT SCL_I" *) input RX_DDC_OUT_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 RX_DDC_OUT SCL_O" *) output RX_DDC_OUT_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 RX_DDC_OUT SCL_T" *) output RX_DDC_OUT_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 RX_DDC_OUT SDA_I" *) input RX_DDC_OUT_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 RX_DDC_OUT SDA_O" *) output RX_DDC_OUT_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 RX_DDC_OUT SDA_T" *) output RX_DDC_OUT_sda_t;
  input RX_DET_IN;
  output RX_HPD_OUT;
  output RX_REFCLK_N_OUT;
  output RX_REFCLK_P_OUT;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 TX_DDC_OUT SCL_I" *) input TX_DDC_OUT_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 TX_DDC_OUT SCL_O" *) output TX_DDC_OUT_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 TX_DDC_OUT SCL_T" *) output TX_DDC_OUT_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 TX_DDC_OUT SDA_I" *) input TX_DDC_OUT_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 TX_DDC_OUT SDA_O" *) output TX_DDC_OUT_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 TX_DDC_OUT SDA_T" *) output TX_DDC_OUT_sda_t;
  output [0:0]TX_EN_OUT;
  input TX_HPD_IN;
  input TX_REFCLK_N_IN;
  input TX_REFCLK_P_IN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 fmch_iic SCL_I" *) input fmch_iic_scl_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 fmch_iic SCL_O" *) output fmch_iic_scl_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 fmch_iic SCL_T" *) output fmch_iic_scl_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 fmch_iic SDA_I" *) input fmch_iic_sda_i;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 fmch_iic SDA_O" *) output fmch_iic_sda_o;
  (* X_INTERFACE_INFO = "xilinx.com:interface:iic:1.0 fmch_iic SDA_T" *) output fmch_iic_sda_t;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, POLARITY ACTIVE_HIGH" *) input reset;

  wire [31:0]intf_net_audio_ss_0_axis_audio_out_TDATA;
  wire [2:0]intf_net_audio_ss_0_axis_audio_out_TID;
  wire intf_net_audio_ss_0_axis_audio_out_TREADY;
  wire intf_net_audio_ss_0_axis_audio_out_TVALID;
  wire [0:0]intf_net_bdry_in_DRU_CLK_IN_CLK_N;
  wire [0:0]intf_net_bdry_in_DRU_CLK_IN_CLK_P;
  wire [95:0]intf_net_rx_video_axis_reg_slice_M_AXIS_TDATA;
  wire intf_net_rx_video_axis_reg_slice_M_AXIS_TLAST;
  wire intf_net_rx_video_axis_reg_slice_M_AXIS_TREADY;
  wire [0:0]intf_net_rx_video_axis_reg_slice_M_AXIS_TUSER;
  wire intf_net_rx_video_axis_reg_slice_M_AXIS_TVALID;
  wire [95:0]intf_net_tx_video_axis_reg_slice_M_AXIS_TDATA;
  wire intf_net_tx_video_axis_reg_slice_M_AXIS_TLAST;
  wire intf_net_tx_video_axis_reg_slice_M_AXIS_TREADY;
  wire [0:0]intf_net_tx_video_axis_reg_slice_M_AXIS_TUSER;
  wire intf_net_tx_video_axis_reg_slice_M_AXIS_TVALID;
  wire [31:0]intf_net_v_hdmi_rx_ss_AUDIO_OUT_TDATA;
  wire [2:0]intf_net_v_hdmi_rx_ss_AUDIO_OUT_TID;
  wire intf_net_v_hdmi_rx_ss_AUDIO_OUT_TREADY;
  wire intf_net_v_hdmi_rx_ss_AUDIO_OUT_TVALID;
  wire intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_I;
  wire intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_O;
  wire intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_T;
  wire intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_I;
  wire intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_O;
  wire intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_T;
  wire [95:0]intf_net_v_hdmi_rx_ss_VIDEO_OUT_TDATA;
  wire intf_net_v_hdmi_rx_ss_VIDEO_OUT_TLAST;
  wire intf_net_v_hdmi_rx_ss_VIDEO_OUT_TREADY;
  wire intf_net_v_hdmi_rx_ss_VIDEO_OUT_TUSER;
  wire intf_net_v_hdmi_rx_ss_VIDEO_OUT_TVALID;
  wire intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_I;
  wire intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_O;
  wire intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_T;
  wire intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_I;
  wire intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_O;
  wire intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_T;
  wire [39:0]intf_net_v_hdmi_tx_ss_LINK_DATA0_OUT_TDATA;
  wire intf_net_v_hdmi_tx_ss_LINK_DATA0_OUT_TVALID;
  wire [39:0]intf_net_v_hdmi_tx_ss_LINK_DATA1_OUT_TDATA;
  wire intf_net_v_hdmi_tx_ss_LINK_DATA1_OUT_TVALID;
  wire [39:0]intf_net_v_hdmi_tx_ss_LINK_DATA2_OUT_TDATA;
  wire intf_net_v_hdmi_tx_ss_LINK_DATA2_OUT_TVALID;
  wire [95:0]intf_net_v_tpg_ss_0_m_axis_video_TDATA;
  wire [0:0]intf_net_v_tpg_ss_0_m_axis_video_TDEST;
  wire [0:0]intf_net_v_tpg_ss_0_m_axis_video_TID;
  wire [11:0]intf_net_v_tpg_ss_0_m_axis_video_TKEEP;
  wire [0:0]intf_net_v_tpg_ss_0_m_axis_video_TLAST;
  wire intf_net_v_tpg_ss_0_m_axis_video_TREADY;
  wire [11:0]intf_net_v_tpg_ss_0_m_axis_video_TSTRB;
  wire [0:0]intf_net_v_tpg_ss_0_m_axis_video_TUSER;
  wire intf_net_v_tpg_ss_0_m_axis_video_TVALID;
  wire [39:0]intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch0_TDATA;
  wire intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch0_TVALID;
  wire [39:0]intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch1_TDATA;
  wire intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch1_TVALID;
  wire [39:0]intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch2_TDATA;
  wire intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch2_TVALID;
  wire [1:0]intf_net_vid_phy_controller_vid_phy_status_sb_rx_TDATA;
  wire intf_net_vid_phy_controller_vid_phy_status_sb_rx_TVALID;
  wire [1:0]intf_net_vid_phy_controller_vid_phy_status_sb_tx_TDATA;
  wire intf_net_vid_phy_controller_vid_phy_status_sb_tx_TVALID;
  wire intf_net_zynq_us_ss_0_IIC_SCL_I;
  wire intf_net_zynq_us_ss_0_IIC_SCL_O;
  wire intf_net_zynq_us_ss_0_IIC_SCL_T;
  wire intf_net_zynq_us_ss_0_IIC_SDA_I;
  wire intf_net_zynq_us_ss_0_IIC_SDA_O;
  wire intf_net_zynq_us_ss_0_IIC_SDA_T;
  wire [39:0]intf_net_zynq_us_ss_0_M00_AXI_ARADDR;
  wire [2:0]intf_net_zynq_us_ss_0_M00_AXI_ARPROT;
  wire intf_net_zynq_us_ss_0_M00_AXI_ARREADY;
  wire intf_net_zynq_us_ss_0_M00_AXI_ARVALID;
  wire [39:0]intf_net_zynq_us_ss_0_M00_AXI_AWADDR;
  wire [2:0]intf_net_zynq_us_ss_0_M00_AXI_AWPROT;
  wire intf_net_zynq_us_ss_0_M00_AXI_AWREADY;
  wire intf_net_zynq_us_ss_0_M00_AXI_AWVALID;
  wire intf_net_zynq_us_ss_0_M00_AXI_BREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M00_AXI_BRESP;
  wire intf_net_zynq_us_ss_0_M00_AXI_BVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M00_AXI_RDATA;
  wire intf_net_zynq_us_ss_0_M00_AXI_RREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M00_AXI_RRESP;
  wire intf_net_zynq_us_ss_0_M00_AXI_RVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M00_AXI_WDATA;
  wire intf_net_zynq_us_ss_0_M00_AXI_WREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M00_AXI_WSTRB;
  wire intf_net_zynq_us_ss_0_M00_AXI_WVALID;
  wire [15:0]intf_net_zynq_us_ss_0_M01_AXI_ARADDR;
  wire [2:0]intf_net_zynq_us_ss_0_M01_AXI_ARPROT;
  wire intf_net_zynq_us_ss_0_M01_AXI_ARREADY;
  wire intf_net_zynq_us_ss_0_M01_AXI_ARVALID;
  wire [15:0]intf_net_zynq_us_ss_0_M01_AXI_AWADDR;
  wire [2:0]intf_net_zynq_us_ss_0_M01_AXI_AWPROT;
  wire intf_net_zynq_us_ss_0_M01_AXI_AWREADY;
  wire intf_net_zynq_us_ss_0_M01_AXI_AWVALID;
  wire intf_net_zynq_us_ss_0_M01_AXI_BREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M01_AXI_BRESP;
  wire intf_net_zynq_us_ss_0_M01_AXI_BVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M01_AXI_RDATA;
  wire intf_net_zynq_us_ss_0_M01_AXI_RREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M01_AXI_RRESP;
  wire intf_net_zynq_us_ss_0_M01_AXI_RVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M01_AXI_WDATA;
  wire intf_net_zynq_us_ss_0_M01_AXI_WREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M01_AXI_WSTRB;
  wire intf_net_zynq_us_ss_0_M01_AXI_WVALID;
  wire [16:0]intf_net_zynq_us_ss_0_M02_AXI_ARADDR;
  wire [2:0]intf_net_zynq_us_ss_0_M02_AXI_ARPROT;
  wire [0:0]intf_net_zynq_us_ss_0_M02_AXI_ARREADY;
  wire intf_net_zynq_us_ss_0_M02_AXI_ARVALID;
  wire [16:0]intf_net_zynq_us_ss_0_M02_AXI_AWADDR;
  wire [2:0]intf_net_zynq_us_ss_0_M02_AXI_AWPROT;
  wire [0:0]intf_net_zynq_us_ss_0_M02_AXI_AWREADY;
  wire intf_net_zynq_us_ss_0_M02_AXI_AWVALID;
  wire intf_net_zynq_us_ss_0_M02_AXI_BREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M02_AXI_BRESP;
  wire [0:0]intf_net_zynq_us_ss_0_M02_AXI_BVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M02_AXI_RDATA;
  wire intf_net_zynq_us_ss_0_M02_AXI_RREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M02_AXI_RRESP;
  wire [0:0]intf_net_zynq_us_ss_0_M02_AXI_RVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M02_AXI_WDATA;
  wire [0:0]intf_net_zynq_us_ss_0_M02_AXI_WREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M02_AXI_WSTRB;
  wire intf_net_zynq_us_ss_0_M02_AXI_WVALID;
  wire [39:0]intf_net_zynq_us_ss_0_M05_AXI_ARADDR;
  wire intf_net_zynq_us_ss_0_M05_AXI_ARREADY;
  wire intf_net_zynq_us_ss_0_M05_AXI_ARVALID;
  wire [39:0]intf_net_zynq_us_ss_0_M05_AXI_AWADDR;
  wire intf_net_zynq_us_ss_0_M05_AXI_AWREADY;
  wire intf_net_zynq_us_ss_0_M05_AXI_AWVALID;
  wire intf_net_zynq_us_ss_0_M05_AXI_BREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M05_AXI_BRESP;
  wire intf_net_zynq_us_ss_0_M05_AXI_BVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M05_AXI_RDATA;
  wire intf_net_zynq_us_ss_0_M05_AXI_RREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M05_AXI_RRESP;
  wire intf_net_zynq_us_ss_0_M05_AXI_RVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M05_AXI_WDATA;
  wire intf_net_zynq_us_ss_0_M05_AXI_WREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M05_AXI_WSTRB;
  wire intf_net_zynq_us_ss_0_M05_AXI_WVALID;
  wire [39:0]intf_net_zynq_us_ss_0_M06_AXI_ARADDR;
  wire [1:0]intf_net_zynq_us_ss_0_M06_AXI_ARBURST;
  wire [3:0]intf_net_zynq_us_ss_0_M06_AXI_ARCACHE;
  wire [15:0]intf_net_zynq_us_ss_0_M06_AXI_ARID;
  wire [7:0]intf_net_zynq_us_ss_0_M06_AXI_ARLEN;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_ARLOCK;
  wire [2:0]intf_net_zynq_us_ss_0_M06_AXI_ARPROT;
  wire [3:0]intf_net_zynq_us_ss_0_M06_AXI_ARQOS;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_ARREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M06_AXI_ARREGION;
  wire [2:0]intf_net_zynq_us_ss_0_M06_AXI_ARSIZE;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_ARVALID;
  wire [39:0]intf_net_zynq_us_ss_0_M06_AXI_AWADDR;
  wire [1:0]intf_net_zynq_us_ss_0_M06_AXI_AWBURST;
  wire [3:0]intf_net_zynq_us_ss_0_M06_AXI_AWCACHE;
  wire [15:0]intf_net_zynq_us_ss_0_M06_AXI_AWID;
  wire [7:0]intf_net_zynq_us_ss_0_M06_AXI_AWLEN;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_AWLOCK;
  wire [2:0]intf_net_zynq_us_ss_0_M06_AXI_AWPROT;
  wire [3:0]intf_net_zynq_us_ss_0_M06_AXI_AWQOS;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_AWREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M06_AXI_AWREGION;
  wire [2:0]intf_net_zynq_us_ss_0_M06_AXI_AWSIZE;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_AWVALID;
  wire [15:0]intf_net_zynq_us_ss_0_M06_AXI_BID;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_BREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M06_AXI_BRESP;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_BVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M06_AXI_RDATA;
  wire [15:0]intf_net_zynq_us_ss_0_M06_AXI_RID;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_RLAST;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_RREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M06_AXI_RRESP;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_RVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M06_AXI_WDATA;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_WLAST;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_WREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M06_AXI_WSTRB;
  wire [0:0]intf_net_zynq_us_ss_0_M06_AXI_WVALID;
  wire [39:0]intf_net_zynq_us_ss_0_M08_AXI_ARADDR;
  wire intf_net_zynq_us_ss_0_M08_AXI_ARREADY;
  wire intf_net_zynq_us_ss_0_M08_AXI_ARVALID;
  wire [39:0]intf_net_zynq_us_ss_0_M08_AXI_AWADDR;
  wire intf_net_zynq_us_ss_0_M08_AXI_AWREADY;
  wire intf_net_zynq_us_ss_0_M08_AXI_AWVALID;
  wire intf_net_zynq_us_ss_0_M08_AXI_BREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M08_AXI_BRESP;
  wire intf_net_zynq_us_ss_0_M08_AXI_BVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M08_AXI_RDATA;
  wire intf_net_zynq_us_ss_0_M08_AXI_RREADY;
  wire [1:0]intf_net_zynq_us_ss_0_M08_AXI_RRESP;
  wire intf_net_zynq_us_ss_0_M08_AXI_RVALID;
  wire [31:0]intf_net_zynq_us_ss_0_M08_AXI_WDATA;
  wire intf_net_zynq_us_ss_0_M08_AXI_WREADY;
  wire [3:0]intf_net_zynq_us_ss_0_M08_AXI_WSTRB;
  wire intf_net_zynq_us_ss_0_M08_AXI_WVALID;
  wire [19:0]net_audio_ss_0_aud_acr_cts_out;
  wire [19:0]net_audio_ss_0_aud_acr_n_out;
  wire net_audio_ss_0_aud_acr_valid_out;
  wire net_audio_ss_0_aud_rstn;
  wire net_audio_ss_0_audio_clk;
  wire net_bdry_in_HDMI_RX_CLK_N_IN;
  wire net_bdry_in_HDMI_RX_CLK_P_IN;
  wire [2:0]net_bdry_in_HDMI_RX_DAT_N_IN;
  wire [2:0]net_bdry_in_HDMI_RX_DAT_P_IN;
  wire net_bdry_in_IDT_8T49N241_LOL_IN;
  wire net_bdry_in_RX_DET_IN;
  wire net_bdry_in_TX_HPD_IN;
  wire net_bdry_in_TX_REFCLK_N_IN;
  wire net_bdry_in_TX_REFCLK_P_IN;
  wire net_bdry_in_reset;
  wire [0:0]net_dru_ibufds_gt_odiv2_BUFG_GT_O;
  wire [0:0]net_gt_refclk_buf_IBUF_DS_ODIV2;
  wire [0:0]net_gt_refclk_buf_IBUF_OUT;
  wire [19:0]net_v_hdmi_rx_ss_acr_cts;
  wire [19:0]net_v_hdmi_rx_ss_acr_n;
  wire net_v_hdmi_rx_ss_acr_valid;
  wire net_v_hdmi_rx_ss_fid;
  wire net_v_hdmi_rx_ss_hpd;
  wire net_v_hdmi_rx_ss_irq;
  wire net_v_hdmi_tx_ss_irq;
  wire net_v_hdmi_tx_ss_locked;
  wire [0:0]net_vcc_const0_dout;
  wire [0:0]net_vcc_const_dout;
  wire net_vid_phy_controller_irq;
  wire [2:0]net_vid_phy_controller_phy_txn_out;
  wire [2:0]net_vid_phy_controller_phy_txp_out;
  wire net_vid_phy_controller_rx_tmds_clk_n;
  wire net_vid_phy_controller_rx_tmds_clk_p;
  wire net_vid_phy_controller_rx_video_clk;
  wire net_vid_phy_controller_rxoutclk;
  wire net_vid_phy_controller_tx_tmds_clk;
  wire net_vid_phy_controller_tx_tmds_clk_n;
  wire net_vid_phy_controller_tx_tmds_clk_p;
  wire net_vid_phy_controller_tx_video_clk;
  wire net_vid_phy_controller_txoutclk;
  wire net_zynq_us_ss_0_clk_out2;
  wire [0:0]net_zynq_us_ss_0_dcm_locked;
  wire [0:0]net_zynq_us_ss_0_peripheral_aresetn;
  wire net_zynq_us_ss_0_s_axi_aclk;

  assign HDMI_TX_CLK_N_OUT = net_vid_phy_controller_tx_tmds_clk_n;
  assign HDMI_TX_CLK_P_OUT = net_vid_phy_controller_tx_tmds_clk_p;
  assign HDMI_TX_DAT_N_OUT[2:0] = net_vid_phy_controller_phy_txn_out;
  assign HDMI_TX_DAT_P_OUT[2:0] = net_vid_phy_controller_phy_txp_out;
  assign LED0 = net_v_hdmi_tx_ss_locked;
  assign RX_DDC_OUT_scl_o = intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_O;
  assign RX_DDC_OUT_scl_t = intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_T;
  assign RX_DDC_OUT_sda_o = intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_O;
  assign RX_DDC_OUT_sda_t = intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_T;
  assign RX_HPD_OUT = net_v_hdmi_rx_ss_hpd;
  assign RX_REFCLK_N_OUT = net_vid_phy_controller_rx_tmds_clk_n;
  assign RX_REFCLK_P_OUT = net_vid_phy_controller_rx_tmds_clk_p;
  assign TX_DDC_OUT_scl_o = intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_O;
  assign TX_DDC_OUT_scl_t = intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_T;
  assign TX_DDC_OUT_sda_o = intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_O;
  assign TX_DDC_OUT_sda_t = intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_T;
  assign TX_EN_OUT[0] = net_vcc_const_dout;
  assign fmch_iic_scl_o = intf_net_zynq_us_ss_0_IIC_SCL_O;
  assign fmch_iic_scl_t = intf_net_zynq_us_ss_0_IIC_SCL_T;
  assign fmch_iic_sda_o = intf_net_zynq_us_ss_0_IIC_SDA_O;
  assign fmch_iic_sda_t = intf_net_zynq_us_ss_0_IIC_SDA_T;
  assign intf_net_bdry_in_DRU_CLK_IN_CLK_N = DRU_CLK_IN_clk_n[0];
  assign intf_net_bdry_in_DRU_CLK_IN_CLK_P = DRU_CLK_IN_clk_p[0];
  assign intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_I = RX_DDC_OUT_scl_i;
  assign intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_I = RX_DDC_OUT_sda_i;
  assign intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_I = TX_DDC_OUT_scl_i;
  assign intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_I = TX_DDC_OUT_sda_i;
  assign intf_net_zynq_us_ss_0_IIC_SCL_I = fmch_iic_scl_i;
  assign intf_net_zynq_us_ss_0_IIC_SDA_I = fmch_iic_sda_i;
  assign net_bdry_in_HDMI_RX_CLK_N_IN = HDMI_RX_CLK_N_IN;
  assign net_bdry_in_HDMI_RX_CLK_P_IN = HDMI_RX_CLK_P_IN;
  assign net_bdry_in_HDMI_RX_DAT_N_IN = HDMI_RX_DAT_N_IN[2:0];
  assign net_bdry_in_HDMI_RX_DAT_P_IN = HDMI_RX_DAT_P_IN[2:0];
  assign net_bdry_in_IDT_8T49N241_LOL_IN = IDT_8T49N241_LOL_IN;
  assign net_bdry_in_RX_DET_IN = RX_DET_IN;
  assign net_bdry_in_TX_HPD_IN = TX_HPD_IN;
  assign net_bdry_in_TX_REFCLK_N_IN = TX_REFCLK_N_IN;
  assign net_bdry_in_TX_REFCLK_P_IN = TX_REFCLK_P_IN;
  assign net_bdry_in_reset = reset;
  audio_ss_0_imp_L2LLI5 audio_ss_0
       (.ACLK(net_zynq_us_ss_0_s_axi_aclk),
        .ARESETN(net_zynq_us_ss_0_peripheral_aresetn),
        .S00_AXI_araddr(intf_net_zynq_us_ss_0_M06_AXI_ARADDR),
        .S00_AXI_arburst(intf_net_zynq_us_ss_0_M06_AXI_ARBURST),
        .S00_AXI_arcache(intf_net_zynq_us_ss_0_M06_AXI_ARCACHE),
        .S00_AXI_arid(intf_net_zynq_us_ss_0_M06_AXI_ARID),
        .S00_AXI_arlen(intf_net_zynq_us_ss_0_M06_AXI_ARLEN),
        .S00_AXI_arlock(intf_net_zynq_us_ss_0_M06_AXI_ARLOCK),
        .S00_AXI_arprot(intf_net_zynq_us_ss_0_M06_AXI_ARPROT),
        .S00_AXI_arqos(intf_net_zynq_us_ss_0_M06_AXI_ARQOS),
        .S00_AXI_arready(intf_net_zynq_us_ss_0_M06_AXI_ARREADY),
        .S00_AXI_arregion(intf_net_zynq_us_ss_0_M06_AXI_ARREGION),
        .S00_AXI_arsize(intf_net_zynq_us_ss_0_M06_AXI_ARSIZE),
        .S00_AXI_arvalid(intf_net_zynq_us_ss_0_M06_AXI_ARVALID),
        .S00_AXI_awaddr(intf_net_zynq_us_ss_0_M06_AXI_AWADDR),
        .S00_AXI_awburst(intf_net_zynq_us_ss_0_M06_AXI_AWBURST),
        .S00_AXI_awcache(intf_net_zynq_us_ss_0_M06_AXI_AWCACHE),
        .S00_AXI_awid(intf_net_zynq_us_ss_0_M06_AXI_AWID),
        .S00_AXI_awlen(intf_net_zynq_us_ss_0_M06_AXI_AWLEN),
        .S00_AXI_awlock(intf_net_zynq_us_ss_0_M06_AXI_AWLOCK),
        .S00_AXI_awprot(intf_net_zynq_us_ss_0_M06_AXI_AWPROT),
        .S00_AXI_awqos(intf_net_zynq_us_ss_0_M06_AXI_AWQOS),
        .S00_AXI_awready(intf_net_zynq_us_ss_0_M06_AXI_AWREADY),
        .S00_AXI_awregion(intf_net_zynq_us_ss_0_M06_AXI_AWREGION),
        .S00_AXI_awsize(intf_net_zynq_us_ss_0_M06_AXI_AWSIZE),
        .S00_AXI_awvalid(intf_net_zynq_us_ss_0_M06_AXI_AWVALID),
        .S00_AXI_bid(intf_net_zynq_us_ss_0_M06_AXI_BID),
        .S00_AXI_bready(intf_net_zynq_us_ss_0_M06_AXI_BREADY),
        .S00_AXI_bresp(intf_net_zynq_us_ss_0_M06_AXI_BRESP),
        .S00_AXI_bvalid(intf_net_zynq_us_ss_0_M06_AXI_BVALID),
        .S00_AXI_rdata(intf_net_zynq_us_ss_0_M06_AXI_RDATA),
        .S00_AXI_rid(intf_net_zynq_us_ss_0_M06_AXI_RID),
        .S00_AXI_rlast(intf_net_zynq_us_ss_0_M06_AXI_RLAST),
        .S00_AXI_rready(intf_net_zynq_us_ss_0_M06_AXI_RREADY),
        .S00_AXI_rresp(intf_net_zynq_us_ss_0_M06_AXI_RRESP),
        .S00_AXI_rvalid(intf_net_zynq_us_ss_0_M06_AXI_RVALID),
        .S00_AXI_wdata(intf_net_zynq_us_ss_0_M06_AXI_WDATA),
        .S00_AXI_wlast(intf_net_zynq_us_ss_0_M06_AXI_WLAST),
        .S00_AXI_wready(intf_net_zynq_us_ss_0_M06_AXI_WREADY),
        .S00_AXI_wstrb(intf_net_zynq_us_ss_0_M06_AXI_WSTRB),
        .S00_AXI_wvalid(intf_net_zynq_us_ss_0_M06_AXI_WVALID),
        .aud_acr_cts_in(net_v_hdmi_rx_ss_acr_cts),
        .aud_acr_cts_out(net_audio_ss_0_aud_acr_cts_out),
        .aud_acr_n_in(net_v_hdmi_rx_ss_acr_n),
        .aud_acr_n_out(net_audio_ss_0_aud_acr_n_out),
        .aud_acr_valid_in(net_v_hdmi_rx_ss_acr_valid),
        .aud_acr_valid_out(net_audio_ss_0_aud_acr_valid_out),
        .aud_rstn(net_audio_ss_0_aud_rstn),
        .audio_clk(net_audio_ss_0_audio_clk),
        .axis_audio_in_tdata(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TDATA),
        .axis_audio_in_tid(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TID),
        .axis_audio_in_tready(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TREADY),
        .axis_audio_in_tvalid(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TVALID),
        .axis_audio_out_tdata(intf_net_audio_ss_0_axis_audio_out_TDATA),
        .axis_audio_out_tid(intf_net_audio_ss_0_axis_audio_out_TID),
        .axis_audio_out_tready(intf_net_audio_ss_0_axis_audio_out_TREADY),
        .axis_audio_out_tvalid(intf_net_audio_ss_0_axis_audio_out_TVALID),
        .hdmi_clk(net_vid_phy_controller_tx_tmds_clk));
  exdes_dru_ibufds_gt_odiv2_0 dru_ibufds_gt_odiv2
       (.BUFG_GT_CE(net_vcc_const0_dout),
        .BUFG_GT_CEMASK(1'b0),
        .BUFG_GT_CLR(1'b0),
        .BUFG_GT_CLRMASK(1'b0),
        .BUFG_GT_DIV({1'b0,1'b0,1'b0}),
        .BUFG_GT_I(net_gt_refclk_buf_IBUF_DS_ODIV2),
        .BUFG_GT_O(net_dru_ibufds_gt_odiv2_BUFG_GT_O));
  exdes_gt_refclk_buf_0 gt_refclk_buf
       (.IBUF_DS_N(intf_net_bdry_in_DRU_CLK_IN_CLK_N),
        .IBUF_DS_ODIV2(net_gt_refclk_buf_IBUF_DS_ODIV2),
        .IBUF_DS_P(intf_net_bdry_in_DRU_CLK_IN_CLK_P),
        .IBUF_OUT(net_gt_refclk_buf_IBUF_OUT));
  exdes_rx_video_axis_reg_slice_0 rx_video_axis_reg_slice
       (.aclk(net_zynq_us_ss_0_clk_out2),
        .aresetn(net_zynq_us_ss_0_dcm_locked),
        .m_axis_tdata(intf_net_rx_video_axis_reg_slice_M_AXIS_TDATA),
        .m_axis_tlast(intf_net_rx_video_axis_reg_slice_M_AXIS_TLAST),
        .m_axis_tready(intf_net_rx_video_axis_reg_slice_M_AXIS_TREADY),
        .m_axis_tuser(intf_net_rx_video_axis_reg_slice_M_AXIS_TUSER),
        .m_axis_tvalid(intf_net_rx_video_axis_reg_slice_M_AXIS_TVALID),
        .s_axis_tdata(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TDATA),
        .s_axis_tlast(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TLAST),
        .s_axis_tready(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TREADY),
        .s_axis_tuser(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TUSER),
        .s_axis_tvalid(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TVALID));
  exdes_tx_video_axis_reg_slice_0 tx_video_axis_reg_slice
       (.aclk(net_zynq_us_ss_0_clk_out2),
        .aresetn(net_zynq_us_ss_0_dcm_locked),
        .m_axis_tdata(intf_net_tx_video_axis_reg_slice_M_AXIS_TDATA),
        .m_axis_tlast(intf_net_tx_video_axis_reg_slice_M_AXIS_TLAST),
        .m_axis_tready(intf_net_tx_video_axis_reg_slice_M_AXIS_TREADY),
        .m_axis_tuser(intf_net_tx_video_axis_reg_slice_M_AXIS_TUSER),
        .m_axis_tvalid(intf_net_tx_video_axis_reg_slice_M_AXIS_TVALID),
        .s_axis_tdata(intf_net_v_tpg_ss_0_m_axis_video_TDATA),
        .s_axis_tdest(intf_net_v_tpg_ss_0_m_axis_video_TDEST),
        .s_axis_tid(intf_net_v_tpg_ss_0_m_axis_video_TID),
        .s_axis_tkeep(intf_net_v_tpg_ss_0_m_axis_video_TKEEP),
        .s_axis_tlast(intf_net_v_tpg_ss_0_m_axis_video_TLAST),
        .s_axis_tready(intf_net_v_tpg_ss_0_m_axis_video_TREADY),
        .s_axis_tstrb(intf_net_v_tpg_ss_0_m_axis_video_TSTRB),
        .s_axis_tuser(intf_net_v_tpg_ss_0_m_axis_video_TUSER),
        .s_axis_tvalid(intf_net_v_tpg_ss_0_m_axis_video_TVALID));
  exdes_v_hdmi_rx_ss_0 v_hdmi_rx_ss
       (.AUDIO_OUT_tdata(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TDATA),
        .AUDIO_OUT_tid(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TID),
        .AUDIO_OUT_tready(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TREADY),
        .AUDIO_OUT_tvalid(intf_net_v_hdmi_rx_ss_AUDIO_OUT_TVALID),
        .DDC_OUT_scl_i(intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_I),
        .DDC_OUT_scl_o(intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_O),
        .DDC_OUT_scl_t(intf_net_v_hdmi_rx_ss_DDC_OUT_SCL_T),
        .DDC_OUT_sda_i(intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_I),
        .DDC_OUT_sda_o(intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_O),
        .DDC_OUT_sda_t(intf_net_v_hdmi_rx_ss_DDC_OUT_SDA_T),
        .LINK_DATA0_IN_tdata(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch0_TDATA),
        .LINK_DATA0_IN_tvalid(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch0_TVALID),
        .LINK_DATA1_IN_tdata(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch1_TDATA),
        .LINK_DATA1_IN_tvalid(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch1_TVALID),
        .LINK_DATA2_IN_tdata(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch2_TDATA),
        .LINK_DATA2_IN_tvalid(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch2_TVALID),
        .SB_STATUS_IN_tdata(intf_net_vid_phy_controller_vid_phy_status_sb_rx_TDATA),
        .SB_STATUS_IN_tvalid(intf_net_vid_phy_controller_vid_phy_status_sb_rx_TVALID),
        .S_AXI_CPU_IN_araddr(intf_net_zynq_us_ss_0_M01_AXI_ARADDR[8:0]),
        .S_AXI_CPU_IN_arprot(intf_net_zynq_us_ss_0_M01_AXI_ARPROT),
        .S_AXI_CPU_IN_arready(intf_net_zynq_us_ss_0_M01_AXI_ARREADY),
        .S_AXI_CPU_IN_arvalid(intf_net_zynq_us_ss_0_M01_AXI_ARVALID),
        .S_AXI_CPU_IN_awaddr(intf_net_zynq_us_ss_0_M01_AXI_AWADDR[8:0]),
        .S_AXI_CPU_IN_awprot(intf_net_zynq_us_ss_0_M01_AXI_AWPROT),
        .S_AXI_CPU_IN_awready(intf_net_zynq_us_ss_0_M01_AXI_AWREADY),
        .S_AXI_CPU_IN_awvalid(intf_net_zynq_us_ss_0_M01_AXI_AWVALID),
        .S_AXI_CPU_IN_bready(intf_net_zynq_us_ss_0_M01_AXI_BREADY),
        .S_AXI_CPU_IN_bresp(intf_net_zynq_us_ss_0_M01_AXI_BRESP),
        .S_AXI_CPU_IN_bvalid(intf_net_zynq_us_ss_0_M01_AXI_BVALID),
        .S_AXI_CPU_IN_rdata(intf_net_zynq_us_ss_0_M01_AXI_RDATA),
        .S_AXI_CPU_IN_rready(intf_net_zynq_us_ss_0_M01_AXI_RREADY),
        .S_AXI_CPU_IN_rresp(intf_net_zynq_us_ss_0_M01_AXI_RRESP),
        .S_AXI_CPU_IN_rvalid(intf_net_zynq_us_ss_0_M01_AXI_RVALID),
        .S_AXI_CPU_IN_wdata(intf_net_zynq_us_ss_0_M01_AXI_WDATA),
        .S_AXI_CPU_IN_wready(intf_net_zynq_us_ss_0_M01_AXI_WREADY),
        .S_AXI_CPU_IN_wstrb(intf_net_zynq_us_ss_0_M01_AXI_WSTRB),
        .S_AXI_CPU_IN_wvalid(intf_net_zynq_us_ss_0_M01_AXI_WVALID),
        .VIDEO_OUT_tdata(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TDATA),
        .VIDEO_OUT_tlast(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TLAST),
        .VIDEO_OUT_tready(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TREADY),
        .VIDEO_OUT_tuser(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TUSER),
        .VIDEO_OUT_tvalid(intf_net_v_hdmi_rx_ss_VIDEO_OUT_TVALID),
        .acr_cts(net_v_hdmi_rx_ss_acr_cts),
        .acr_n(net_v_hdmi_rx_ss_acr_n),
        .acr_valid(net_v_hdmi_rx_ss_acr_valid),
        .cable_detect(net_bdry_in_RX_DET_IN),
        .fid(net_v_hdmi_rx_ss_fid),
        .hpd(net_v_hdmi_rx_ss_hpd),
        .irq(net_v_hdmi_rx_ss_irq),
        .link_clk(net_vid_phy_controller_rxoutclk),
        .s_axi_cpu_aclk(net_zynq_us_ss_0_s_axi_aclk),
        .s_axi_cpu_aresetn(net_zynq_us_ss_0_peripheral_aresetn),
        .s_axis_audio_aclk(net_audio_ss_0_audio_clk),
        .s_axis_audio_aresetn(net_audio_ss_0_aud_rstn),
        .s_axis_video_aclk(net_zynq_us_ss_0_clk_out2),
        .s_axis_video_aresetn(net_zynq_us_ss_0_dcm_locked),
        .video_clk(net_vid_phy_controller_rx_video_clk));
  exdes_v_hdmi_tx_ss_0 v_hdmi_tx_ss
       (.AUDIO_IN_tdata(intf_net_audio_ss_0_axis_audio_out_TDATA),
        .AUDIO_IN_tid(intf_net_audio_ss_0_axis_audio_out_TID),
        .AUDIO_IN_tready(intf_net_audio_ss_0_axis_audio_out_TREADY),
        .AUDIO_IN_tvalid(intf_net_audio_ss_0_axis_audio_out_TVALID),
        .DDC_OUT_scl_i(intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_I),
        .DDC_OUT_scl_o(intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_O),
        .DDC_OUT_scl_t(intf_net_v_hdmi_tx_ss_DDC_OUT_SCL_T),
        .DDC_OUT_sda_i(intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_I),
        .DDC_OUT_sda_o(intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_O),
        .DDC_OUT_sda_t(intf_net_v_hdmi_tx_ss_DDC_OUT_SDA_T),
        .LINK_DATA0_OUT_tdata(intf_net_v_hdmi_tx_ss_LINK_DATA0_OUT_TDATA),
        .LINK_DATA0_OUT_tvalid(intf_net_v_hdmi_tx_ss_LINK_DATA0_OUT_TVALID),
        .LINK_DATA1_OUT_tdata(intf_net_v_hdmi_tx_ss_LINK_DATA1_OUT_TDATA),
        .LINK_DATA1_OUT_tvalid(intf_net_v_hdmi_tx_ss_LINK_DATA1_OUT_TVALID),
        .LINK_DATA2_OUT_tdata(intf_net_v_hdmi_tx_ss_LINK_DATA2_OUT_TDATA),
        .LINK_DATA2_OUT_tvalid(intf_net_v_hdmi_tx_ss_LINK_DATA2_OUT_TVALID),
        .SB_STATUS_IN_tdata(intf_net_vid_phy_controller_vid_phy_status_sb_tx_TDATA),
        .SB_STATUS_IN_tvalid(intf_net_vid_phy_controller_vid_phy_status_sb_tx_TVALID),
        .S_AXI_CPU_IN_araddr(intf_net_zynq_us_ss_0_M02_AXI_ARADDR),
        .S_AXI_CPU_IN_arprot(intf_net_zynq_us_ss_0_M02_AXI_ARPROT),
        .S_AXI_CPU_IN_arready(intf_net_zynq_us_ss_0_M02_AXI_ARREADY),
        .S_AXI_CPU_IN_arvalid(intf_net_zynq_us_ss_0_M02_AXI_ARVALID),
        .S_AXI_CPU_IN_awaddr(intf_net_zynq_us_ss_0_M02_AXI_AWADDR),
        .S_AXI_CPU_IN_awprot(intf_net_zynq_us_ss_0_M02_AXI_AWPROT),
        .S_AXI_CPU_IN_awready(intf_net_zynq_us_ss_0_M02_AXI_AWREADY),
        .S_AXI_CPU_IN_awvalid(intf_net_zynq_us_ss_0_M02_AXI_AWVALID),
        .S_AXI_CPU_IN_bready(intf_net_zynq_us_ss_0_M02_AXI_BREADY),
        .S_AXI_CPU_IN_bresp(intf_net_zynq_us_ss_0_M02_AXI_BRESP),
        .S_AXI_CPU_IN_bvalid(intf_net_zynq_us_ss_0_M02_AXI_BVALID),
        .S_AXI_CPU_IN_rdata(intf_net_zynq_us_ss_0_M02_AXI_RDATA),
        .S_AXI_CPU_IN_rready(intf_net_zynq_us_ss_0_M02_AXI_RREADY),
        .S_AXI_CPU_IN_rresp(intf_net_zynq_us_ss_0_M02_AXI_RRESP),
        .S_AXI_CPU_IN_rvalid(intf_net_zynq_us_ss_0_M02_AXI_RVALID),
        .S_AXI_CPU_IN_wdata(intf_net_zynq_us_ss_0_M02_AXI_WDATA),
        .S_AXI_CPU_IN_wready(intf_net_zynq_us_ss_0_M02_AXI_WREADY),
        .S_AXI_CPU_IN_wstrb(intf_net_zynq_us_ss_0_M02_AXI_WSTRB),
        .S_AXI_CPU_IN_wvalid(intf_net_zynq_us_ss_0_M02_AXI_WVALID),
        .VIDEO_IN_tdata(intf_net_tx_video_axis_reg_slice_M_AXIS_TDATA),
        .VIDEO_IN_tlast(intf_net_tx_video_axis_reg_slice_M_AXIS_TLAST),
        .VIDEO_IN_tready(intf_net_tx_video_axis_reg_slice_M_AXIS_TREADY),
        .VIDEO_IN_tuser(intf_net_tx_video_axis_reg_slice_M_AXIS_TUSER),
        .VIDEO_IN_tvalid(intf_net_tx_video_axis_reg_slice_M_AXIS_TVALID),
        .acr_cts(net_audio_ss_0_aud_acr_cts_out),
        .acr_n(net_audio_ss_0_aud_acr_n_out),
        .acr_valid(net_audio_ss_0_aud_acr_valid_out),
        .fid(net_v_hdmi_rx_ss_fid),
        .hpd(net_bdry_in_TX_HPD_IN),
        .irq(net_v_hdmi_tx_ss_irq),
        .link_clk(net_vid_phy_controller_txoutclk),
        .locked(net_v_hdmi_tx_ss_locked),
        .s_axi_cpu_aclk(net_zynq_us_ss_0_s_axi_aclk),
        .s_axi_cpu_aresetn(net_zynq_us_ss_0_peripheral_aresetn),
        .s_axis_audio_aclk(net_audio_ss_0_audio_clk),
        .s_axis_audio_aresetn(net_audio_ss_0_aud_rstn),
        .s_axis_video_aclk(net_zynq_us_ss_0_clk_out2),
        .s_axis_video_aresetn(net_zynq_us_ss_0_dcm_locked),
        .video_clk(net_vid_phy_controller_tx_video_clk));
  v_tpg_ss_0_imp_5QXXBT v_tpg_ss_0
       (.S_AXI_GPIO_araddr(intf_net_zynq_us_ss_0_M08_AXI_ARADDR),
        .S_AXI_GPIO_arready(intf_net_zynq_us_ss_0_M08_AXI_ARREADY),
        .S_AXI_GPIO_arvalid(intf_net_zynq_us_ss_0_M08_AXI_ARVALID),
        .S_AXI_GPIO_awaddr(intf_net_zynq_us_ss_0_M08_AXI_AWADDR),
        .S_AXI_GPIO_awready(intf_net_zynq_us_ss_0_M08_AXI_AWREADY),
        .S_AXI_GPIO_awvalid(intf_net_zynq_us_ss_0_M08_AXI_AWVALID),
        .S_AXI_GPIO_bready(intf_net_zynq_us_ss_0_M08_AXI_BREADY),
        .S_AXI_GPIO_bresp(intf_net_zynq_us_ss_0_M08_AXI_BRESP),
        .S_AXI_GPIO_bvalid(intf_net_zynq_us_ss_0_M08_AXI_BVALID),
        .S_AXI_GPIO_rdata(intf_net_zynq_us_ss_0_M08_AXI_RDATA),
        .S_AXI_GPIO_rready(intf_net_zynq_us_ss_0_M08_AXI_RREADY),
        .S_AXI_GPIO_rresp(intf_net_zynq_us_ss_0_M08_AXI_RRESP),
        .S_AXI_GPIO_rvalid(intf_net_zynq_us_ss_0_M08_AXI_RVALID),
        .S_AXI_GPIO_wdata(intf_net_zynq_us_ss_0_M08_AXI_WDATA),
        .S_AXI_GPIO_wready(intf_net_zynq_us_ss_0_M08_AXI_WREADY),
        .S_AXI_GPIO_wstrb(intf_net_zynq_us_ss_0_M08_AXI_WSTRB),
        .S_AXI_GPIO_wvalid(intf_net_zynq_us_ss_0_M08_AXI_WVALID),
        .S_AXI_TPG_araddr(intf_net_zynq_us_ss_0_M05_AXI_ARADDR),
        .S_AXI_TPG_arready(intf_net_zynq_us_ss_0_M05_AXI_ARREADY),
        .S_AXI_TPG_arvalid(intf_net_zynq_us_ss_0_M05_AXI_ARVALID),
        .S_AXI_TPG_awaddr(intf_net_zynq_us_ss_0_M05_AXI_AWADDR),
        .S_AXI_TPG_awready(intf_net_zynq_us_ss_0_M05_AXI_AWREADY),
        .S_AXI_TPG_awvalid(intf_net_zynq_us_ss_0_M05_AXI_AWVALID),
        .S_AXI_TPG_bready(intf_net_zynq_us_ss_0_M05_AXI_BREADY),
        .S_AXI_TPG_bresp(intf_net_zynq_us_ss_0_M05_AXI_BRESP),
        .S_AXI_TPG_bvalid(intf_net_zynq_us_ss_0_M05_AXI_BVALID),
        .S_AXI_TPG_rdata(intf_net_zynq_us_ss_0_M05_AXI_RDATA),
        .S_AXI_TPG_rready(intf_net_zynq_us_ss_0_M05_AXI_RREADY),
        .S_AXI_TPG_rresp(intf_net_zynq_us_ss_0_M05_AXI_RRESP),
        .S_AXI_TPG_rvalid(intf_net_zynq_us_ss_0_M05_AXI_RVALID),
        .S_AXI_TPG_wdata(intf_net_zynq_us_ss_0_M05_AXI_WDATA),
        .S_AXI_TPG_wready(intf_net_zynq_us_ss_0_M05_AXI_WREADY),
        .S_AXI_TPG_wstrb(intf_net_zynq_us_ss_0_M05_AXI_WSTRB),
        .S_AXI_TPG_wvalid(intf_net_zynq_us_ss_0_M05_AXI_WVALID),
        .ap_clk(net_zynq_us_ss_0_clk_out2),
        .m_axi_aresetn(net_zynq_us_ss_0_dcm_locked),
        .m_axis_video_tdata(intf_net_v_tpg_ss_0_m_axis_video_TDATA),
        .m_axis_video_tdest(intf_net_v_tpg_ss_0_m_axis_video_TDEST),
        .m_axis_video_tid(intf_net_v_tpg_ss_0_m_axis_video_TID),
        .m_axis_video_tkeep(intf_net_v_tpg_ss_0_m_axis_video_TKEEP),
        .m_axis_video_tlast(intf_net_v_tpg_ss_0_m_axis_video_TLAST),
        .m_axis_video_tready(intf_net_v_tpg_ss_0_m_axis_video_TREADY),
        .m_axis_video_tstrb(intf_net_v_tpg_ss_0_m_axis_video_TSTRB),
        .m_axis_video_tuser(intf_net_v_tpg_ss_0_m_axis_video_TUSER),
        .m_axis_video_tvalid(intf_net_v_tpg_ss_0_m_axis_video_TVALID),
        .s_axis_video_tdata(intf_net_rx_video_axis_reg_slice_M_AXIS_TDATA),
        .s_axis_video_tlast(intf_net_rx_video_axis_reg_slice_M_AXIS_TLAST),
        .s_axis_video_tready(intf_net_rx_video_axis_reg_slice_M_AXIS_TREADY),
        .s_axis_video_tuser(intf_net_rx_video_axis_reg_slice_M_AXIS_TUSER),
        .s_axis_video_tvalid(intf_net_rx_video_axis_reg_slice_M_AXIS_TVALID));
  exdes_vcc_const_0 vcc_const
       (.dout(net_vcc_const_dout));
  exdes_vcc_const0_0 vcc_const0
       (.dout(net_vcc_const0_dout));
  exdes_vid_phy_controller_0 vid_phy_controller
       (.drpclk(net_zynq_us_ss_0_s_axi_aclk),
        .gtnorthrefclk1_in(net_gt_refclk_buf_IBUF_OUT),
        .gtnorthrefclk1_odiv2_in(net_dru_ibufds_gt_odiv2_BUFG_GT_O),
        .irq(net_vid_phy_controller_irq),
        .mgtrefclk0_pad_n_in(net_bdry_in_TX_REFCLK_N_IN),
        .mgtrefclk0_pad_p_in(net_bdry_in_TX_REFCLK_P_IN),
        .mgtrefclk1_pad_n_in(net_bdry_in_HDMI_RX_CLK_N_IN),
        .mgtrefclk1_pad_p_in(net_bdry_in_HDMI_RX_CLK_P_IN),
        .phy_rxn_in(net_bdry_in_HDMI_RX_DAT_N_IN),
        .phy_rxp_in(net_bdry_in_HDMI_RX_DAT_P_IN),
        .phy_txn_out(net_vid_phy_controller_phy_txn_out),
        .phy_txp_out(net_vid_phy_controller_phy_txp_out),
        .rx_tmds_clk_n(net_vid_phy_controller_rx_tmds_clk_n),
        .rx_tmds_clk_p(net_vid_phy_controller_rx_tmds_clk_p),
        .rx_video_clk(net_vid_phy_controller_rx_video_clk),
        .rxoutclk(net_vid_phy_controller_rxoutclk),
        .tx_refclk_rdy(net_bdry_in_IDT_8T49N241_LOL_IN),
        .tx_tmds_clk(net_vid_phy_controller_tx_tmds_clk),
        .tx_tmds_clk_n(net_vid_phy_controller_tx_tmds_clk_n),
        .tx_tmds_clk_p(net_vid_phy_controller_tx_tmds_clk_p),
        .tx_video_clk(net_vid_phy_controller_tx_video_clk),
        .txoutclk(net_vid_phy_controller_txoutclk),
        .vid_phy_axi4lite_aclk(net_zynq_us_ss_0_s_axi_aclk),
        .vid_phy_axi4lite_araddr(intf_net_zynq_us_ss_0_M00_AXI_ARADDR[9:0]),
        .vid_phy_axi4lite_aresetn(net_zynq_us_ss_0_peripheral_aresetn),
        .vid_phy_axi4lite_arprot(intf_net_zynq_us_ss_0_M00_AXI_ARPROT),
        .vid_phy_axi4lite_arready(intf_net_zynq_us_ss_0_M00_AXI_ARREADY),
        .vid_phy_axi4lite_arvalid(intf_net_zynq_us_ss_0_M00_AXI_ARVALID),
        .vid_phy_axi4lite_awaddr(intf_net_zynq_us_ss_0_M00_AXI_AWADDR[9:0]),
        .vid_phy_axi4lite_awprot(intf_net_zynq_us_ss_0_M00_AXI_AWPROT),
        .vid_phy_axi4lite_awready(intf_net_zynq_us_ss_0_M00_AXI_AWREADY),
        .vid_phy_axi4lite_awvalid(intf_net_zynq_us_ss_0_M00_AXI_AWVALID),
        .vid_phy_axi4lite_bready(intf_net_zynq_us_ss_0_M00_AXI_BREADY),
        .vid_phy_axi4lite_bresp(intf_net_zynq_us_ss_0_M00_AXI_BRESP),
        .vid_phy_axi4lite_bvalid(intf_net_zynq_us_ss_0_M00_AXI_BVALID),
        .vid_phy_axi4lite_rdata(intf_net_zynq_us_ss_0_M00_AXI_RDATA),
        .vid_phy_axi4lite_rready(intf_net_zynq_us_ss_0_M00_AXI_RREADY),
        .vid_phy_axi4lite_rresp(intf_net_zynq_us_ss_0_M00_AXI_RRESP),
        .vid_phy_axi4lite_rvalid(intf_net_zynq_us_ss_0_M00_AXI_RVALID),
        .vid_phy_axi4lite_wdata(intf_net_zynq_us_ss_0_M00_AXI_WDATA),
        .vid_phy_axi4lite_wready(intf_net_zynq_us_ss_0_M00_AXI_WREADY),
        .vid_phy_axi4lite_wstrb(intf_net_zynq_us_ss_0_M00_AXI_WSTRB),
        .vid_phy_axi4lite_wvalid(intf_net_zynq_us_ss_0_M00_AXI_WVALID),
        .vid_phy_rx_axi4s_aclk(net_vid_phy_controller_rxoutclk),
        .vid_phy_rx_axi4s_aresetn(net_vcc_const_dout),
        .vid_phy_rx_axi4s_ch0_tdata(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch0_TDATA),
        .vid_phy_rx_axi4s_ch0_tready(1'b1),
        .vid_phy_rx_axi4s_ch0_tvalid(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch0_TVALID),
        .vid_phy_rx_axi4s_ch1_tdata(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch1_TDATA),
        .vid_phy_rx_axi4s_ch1_tready(1'b1),
        .vid_phy_rx_axi4s_ch1_tvalid(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch1_TVALID),
        .vid_phy_rx_axi4s_ch2_tdata(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch2_TDATA),
        .vid_phy_rx_axi4s_ch2_tready(1'b1),
        .vid_phy_rx_axi4s_ch2_tvalid(intf_net_vid_phy_controller_vid_phy_rx_axi4s_ch2_TVALID),
        .vid_phy_sb_aclk(net_zynq_us_ss_0_s_axi_aclk),
        .vid_phy_sb_aresetn(net_zynq_us_ss_0_peripheral_aresetn),
        .vid_phy_status_sb_rx_tdata(intf_net_vid_phy_controller_vid_phy_status_sb_rx_TDATA),
        .vid_phy_status_sb_rx_tready(1'b1),
        .vid_phy_status_sb_rx_tvalid(intf_net_vid_phy_controller_vid_phy_status_sb_rx_TVALID),
        .vid_phy_status_sb_tx_tdata(intf_net_vid_phy_controller_vid_phy_status_sb_tx_TDATA),
        .vid_phy_status_sb_tx_tready(1'b1),
        .vid_phy_status_sb_tx_tvalid(intf_net_vid_phy_controller_vid_phy_status_sb_tx_TVALID),
        .vid_phy_tx_axi4s_aclk(net_vid_phy_controller_txoutclk),
        .vid_phy_tx_axi4s_aresetn(net_vcc_const_dout),
        .vid_phy_tx_axi4s_ch0_tdata(intf_net_v_hdmi_tx_ss_LINK_DATA0_OUT_TDATA),
        .vid_phy_tx_axi4s_ch0_tuser(1'b0),
        .vid_phy_tx_axi4s_ch0_tvalid(intf_net_v_hdmi_tx_ss_LINK_DATA0_OUT_TVALID),
        .vid_phy_tx_axi4s_ch1_tdata(intf_net_v_hdmi_tx_ss_LINK_DATA1_OUT_TDATA),
        .vid_phy_tx_axi4s_ch1_tuser(1'b0),
        .vid_phy_tx_axi4s_ch1_tvalid(intf_net_v_hdmi_tx_ss_LINK_DATA1_OUT_TVALID),
        .vid_phy_tx_axi4s_ch2_tdata(intf_net_v_hdmi_tx_ss_LINK_DATA2_OUT_TDATA),
        .vid_phy_tx_axi4s_ch2_tuser(1'b0),
        .vid_phy_tx_axi4s_ch2_tvalid(intf_net_v_hdmi_tx_ss_LINK_DATA2_OUT_TVALID));
  zynq_us_ss_0_imp_1A5BJWS zynq_us_ss_0
       (.IIC_scl_i(intf_net_zynq_us_ss_0_IIC_SCL_I),
        .IIC_scl_o(intf_net_zynq_us_ss_0_IIC_SCL_O),
        .IIC_scl_t(intf_net_zynq_us_ss_0_IIC_SCL_T),
        .IIC_sda_i(intf_net_zynq_us_ss_0_IIC_SDA_I),
        .IIC_sda_o(intf_net_zynq_us_ss_0_IIC_SDA_O),
        .IIC_sda_t(intf_net_zynq_us_ss_0_IIC_SDA_T),
        .M00_AXI_araddr(intf_net_zynq_us_ss_0_M00_AXI_ARADDR),
        .M00_AXI_arprot(intf_net_zynq_us_ss_0_M00_AXI_ARPROT),
        .M00_AXI_arready(intf_net_zynq_us_ss_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(intf_net_zynq_us_ss_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(intf_net_zynq_us_ss_0_M00_AXI_AWADDR),
        .M00_AXI_awprot(intf_net_zynq_us_ss_0_M00_AXI_AWPROT),
        .M00_AXI_awready(intf_net_zynq_us_ss_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(intf_net_zynq_us_ss_0_M00_AXI_AWVALID),
        .M00_AXI_bready(intf_net_zynq_us_ss_0_M00_AXI_BREADY),
        .M00_AXI_bresp(intf_net_zynq_us_ss_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(intf_net_zynq_us_ss_0_M00_AXI_BVALID),
        .M00_AXI_rdata(intf_net_zynq_us_ss_0_M00_AXI_RDATA),
        .M00_AXI_rready(intf_net_zynq_us_ss_0_M00_AXI_RREADY),
        .M00_AXI_rresp(intf_net_zynq_us_ss_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(intf_net_zynq_us_ss_0_M00_AXI_RVALID),
        .M00_AXI_wdata(intf_net_zynq_us_ss_0_M00_AXI_WDATA),
        .M00_AXI_wready(intf_net_zynq_us_ss_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(intf_net_zynq_us_ss_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(intf_net_zynq_us_ss_0_M00_AXI_WVALID),
        .M01_AXI_araddr(intf_net_zynq_us_ss_0_M01_AXI_ARADDR),
        .M01_AXI_arprot(intf_net_zynq_us_ss_0_M01_AXI_ARPROT),
        .M01_AXI_arready(intf_net_zynq_us_ss_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(intf_net_zynq_us_ss_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(intf_net_zynq_us_ss_0_M01_AXI_AWADDR),
        .M01_AXI_awprot(intf_net_zynq_us_ss_0_M01_AXI_AWPROT),
        .M01_AXI_awready(intf_net_zynq_us_ss_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(intf_net_zynq_us_ss_0_M01_AXI_AWVALID),
        .M01_AXI_bready(intf_net_zynq_us_ss_0_M01_AXI_BREADY),
        .M01_AXI_bresp(intf_net_zynq_us_ss_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(intf_net_zynq_us_ss_0_M01_AXI_BVALID),
        .M01_AXI_rdata(intf_net_zynq_us_ss_0_M01_AXI_RDATA),
        .M01_AXI_rready(intf_net_zynq_us_ss_0_M01_AXI_RREADY),
        .M01_AXI_rresp(intf_net_zynq_us_ss_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(intf_net_zynq_us_ss_0_M01_AXI_RVALID),
        .M01_AXI_wdata(intf_net_zynq_us_ss_0_M01_AXI_WDATA),
        .M01_AXI_wready(intf_net_zynq_us_ss_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(intf_net_zynq_us_ss_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(intf_net_zynq_us_ss_0_M01_AXI_WVALID),
        .M02_AXI_araddr(intf_net_zynq_us_ss_0_M02_AXI_ARADDR),
        .M02_AXI_arprot(intf_net_zynq_us_ss_0_M02_AXI_ARPROT),
        .M02_AXI_arready(intf_net_zynq_us_ss_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(intf_net_zynq_us_ss_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(intf_net_zynq_us_ss_0_M02_AXI_AWADDR),
        .M02_AXI_awprot(intf_net_zynq_us_ss_0_M02_AXI_AWPROT),
        .M02_AXI_awready(intf_net_zynq_us_ss_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(intf_net_zynq_us_ss_0_M02_AXI_AWVALID),
        .M02_AXI_bready(intf_net_zynq_us_ss_0_M02_AXI_BREADY),
        .M02_AXI_bresp(intf_net_zynq_us_ss_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(intf_net_zynq_us_ss_0_M02_AXI_BVALID),
        .M02_AXI_rdata(intf_net_zynq_us_ss_0_M02_AXI_RDATA),
        .M02_AXI_rready(intf_net_zynq_us_ss_0_M02_AXI_RREADY),
        .M02_AXI_rresp(intf_net_zynq_us_ss_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(intf_net_zynq_us_ss_0_M02_AXI_RVALID),
        .M02_AXI_wdata(intf_net_zynq_us_ss_0_M02_AXI_WDATA),
        .M02_AXI_wready(intf_net_zynq_us_ss_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(intf_net_zynq_us_ss_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(intf_net_zynq_us_ss_0_M02_AXI_WVALID),
        .M05_AXI_araddr(intf_net_zynq_us_ss_0_M05_AXI_ARADDR),
        .M05_AXI_arready(intf_net_zynq_us_ss_0_M05_AXI_ARREADY),
        .M05_AXI_arvalid(intf_net_zynq_us_ss_0_M05_AXI_ARVALID),
        .M05_AXI_awaddr(intf_net_zynq_us_ss_0_M05_AXI_AWADDR),
        .M05_AXI_awready(intf_net_zynq_us_ss_0_M05_AXI_AWREADY),
        .M05_AXI_awvalid(intf_net_zynq_us_ss_0_M05_AXI_AWVALID),
        .M05_AXI_bready(intf_net_zynq_us_ss_0_M05_AXI_BREADY),
        .M05_AXI_bresp(intf_net_zynq_us_ss_0_M05_AXI_BRESP),
        .M05_AXI_bvalid(intf_net_zynq_us_ss_0_M05_AXI_BVALID),
        .M05_AXI_rdata(intf_net_zynq_us_ss_0_M05_AXI_RDATA),
        .M05_AXI_rready(intf_net_zynq_us_ss_0_M05_AXI_RREADY),
        .M05_AXI_rresp(intf_net_zynq_us_ss_0_M05_AXI_RRESP),
        .M05_AXI_rvalid(intf_net_zynq_us_ss_0_M05_AXI_RVALID),
        .M05_AXI_wdata(intf_net_zynq_us_ss_0_M05_AXI_WDATA),
        .M05_AXI_wready(intf_net_zynq_us_ss_0_M05_AXI_WREADY),
        .M05_AXI_wstrb(intf_net_zynq_us_ss_0_M05_AXI_WSTRB),
        .M05_AXI_wvalid(intf_net_zynq_us_ss_0_M05_AXI_WVALID),
        .M06_AXI_araddr(intf_net_zynq_us_ss_0_M06_AXI_ARADDR),
        .M06_AXI_arburst(intf_net_zynq_us_ss_0_M06_AXI_ARBURST),
        .M06_AXI_arcache(intf_net_zynq_us_ss_0_M06_AXI_ARCACHE),
        .M06_AXI_arid(intf_net_zynq_us_ss_0_M06_AXI_ARID),
        .M06_AXI_arlen(intf_net_zynq_us_ss_0_M06_AXI_ARLEN),
        .M06_AXI_arlock(intf_net_zynq_us_ss_0_M06_AXI_ARLOCK),
        .M06_AXI_arprot(intf_net_zynq_us_ss_0_M06_AXI_ARPROT),
        .M06_AXI_arqos(intf_net_zynq_us_ss_0_M06_AXI_ARQOS),
        .M06_AXI_arready(intf_net_zynq_us_ss_0_M06_AXI_ARREADY),
        .M06_AXI_arregion(intf_net_zynq_us_ss_0_M06_AXI_ARREGION),
        .M06_AXI_arsize(intf_net_zynq_us_ss_0_M06_AXI_ARSIZE),
        .M06_AXI_arvalid(intf_net_zynq_us_ss_0_M06_AXI_ARVALID),
        .M06_AXI_awaddr(intf_net_zynq_us_ss_0_M06_AXI_AWADDR),
        .M06_AXI_awburst(intf_net_zynq_us_ss_0_M06_AXI_AWBURST),
        .M06_AXI_awcache(intf_net_zynq_us_ss_0_M06_AXI_AWCACHE),
        .M06_AXI_awid(intf_net_zynq_us_ss_0_M06_AXI_AWID),
        .M06_AXI_awlen(intf_net_zynq_us_ss_0_M06_AXI_AWLEN),
        .M06_AXI_awlock(intf_net_zynq_us_ss_0_M06_AXI_AWLOCK),
        .M06_AXI_awprot(intf_net_zynq_us_ss_0_M06_AXI_AWPROT),
        .M06_AXI_awqos(intf_net_zynq_us_ss_0_M06_AXI_AWQOS),
        .M06_AXI_awready(intf_net_zynq_us_ss_0_M06_AXI_AWREADY),
        .M06_AXI_awregion(intf_net_zynq_us_ss_0_M06_AXI_AWREGION),
        .M06_AXI_awsize(intf_net_zynq_us_ss_0_M06_AXI_AWSIZE),
        .M06_AXI_awvalid(intf_net_zynq_us_ss_0_M06_AXI_AWVALID),
        .M06_AXI_bid(intf_net_zynq_us_ss_0_M06_AXI_BID),
        .M06_AXI_bready(intf_net_zynq_us_ss_0_M06_AXI_BREADY),
        .M06_AXI_bresp(intf_net_zynq_us_ss_0_M06_AXI_BRESP),
        .M06_AXI_bvalid(intf_net_zynq_us_ss_0_M06_AXI_BVALID),
        .M06_AXI_rdata(intf_net_zynq_us_ss_0_M06_AXI_RDATA),
        .M06_AXI_rid(intf_net_zynq_us_ss_0_M06_AXI_RID),
        .M06_AXI_rlast(intf_net_zynq_us_ss_0_M06_AXI_RLAST),
        .M06_AXI_rready(intf_net_zynq_us_ss_0_M06_AXI_RREADY),
        .M06_AXI_rresp(intf_net_zynq_us_ss_0_M06_AXI_RRESP),
        .M06_AXI_rvalid(intf_net_zynq_us_ss_0_M06_AXI_RVALID),
        .M06_AXI_wdata(intf_net_zynq_us_ss_0_M06_AXI_WDATA),
        .M06_AXI_wlast(intf_net_zynq_us_ss_0_M06_AXI_WLAST),
        .M06_AXI_wready(intf_net_zynq_us_ss_0_M06_AXI_WREADY),
        .M06_AXI_wstrb(intf_net_zynq_us_ss_0_M06_AXI_WSTRB),
        .M06_AXI_wvalid(intf_net_zynq_us_ss_0_M06_AXI_WVALID),
        .M08_AXI_araddr(intf_net_zynq_us_ss_0_M08_AXI_ARADDR),
        .M08_AXI_arready(intf_net_zynq_us_ss_0_M08_AXI_ARREADY),
        .M08_AXI_arvalid(intf_net_zynq_us_ss_0_M08_AXI_ARVALID),
        .M08_AXI_awaddr(intf_net_zynq_us_ss_0_M08_AXI_AWADDR),
        .M08_AXI_awready(intf_net_zynq_us_ss_0_M08_AXI_AWREADY),
        .M08_AXI_awvalid(intf_net_zynq_us_ss_0_M08_AXI_AWVALID),
        .M08_AXI_bready(intf_net_zynq_us_ss_0_M08_AXI_BREADY),
        .M08_AXI_bresp(intf_net_zynq_us_ss_0_M08_AXI_BRESP),
        .M08_AXI_bvalid(intf_net_zynq_us_ss_0_M08_AXI_BVALID),
        .M08_AXI_rdata(intf_net_zynq_us_ss_0_M08_AXI_RDATA),
        .M08_AXI_rready(intf_net_zynq_us_ss_0_M08_AXI_RREADY),
        .M08_AXI_rresp(intf_net_zynq_us_ss_0_M08_AXI_RRESP),
        .M08_AXI_rvalid(intf_net_zynq_us_ss_0_M08_AXI_RVALID),
        .M08_AXI_wdata(intf_net_zynq_us_ss_0_M08_AXI_WDATA),
        .M08_AXI_wready(intf_net_zynq_us_ss_0_M08_AXI_WREADY),
        .M08_AXI_wstrb(intf_net_zynq_us_ss_0_M08_AXI_WSTRB),
        .M08_AXI_wvalid(intf_net_zynq_us_ss_0_M08_AXI_WVALID),
        .clk_out2(net_zynq_us_ss_0_clk_out2),
        .dcm_locked(net_zynq_us_ss_0_dcm_locked),
        .ext_reset_in(net_bdry_in_reset),
        .hdmi_rx_irq(net_v_hdmi_rx_ss_irq),
        .hdmi_tx_irq(net_v_hdmi_tx_ss_irq),
        .peripheral_aresetn(net_zynq_us_ss_0_peripheral_aresetn),
        .s_axi_aclk(net_zynq_us_ss_0_s_axi_aclk),
        .vphy_irq(net_vid_phy_controller_irq));
endmodule

module exdes_axi_interconnect_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [39:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [39:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [39:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [39:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [39:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [39:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [39:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [15:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output [0:0]S00_AXI_arready;
  input [3:0]S00_AXI_arregion;
  input [2:0]S00_AXI_arsize;
  input [0:0]S00_AXI_arvalid;
  input [39:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [15:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output [0:0]S00_AXI_awready;
  input [3:0]S00_AXI_awregion;
  input [2:0]S00_AXI_awsize;
  input [0:0]S00_AXI_awvalid;
  output [15:0]S00_AXI_bid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [15:0]S00_AXI_rid;
  output [0:0]S00_AXI_rlast;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [0:0]S00_AXI_wlast;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire axi_interconnect_ACLK_net;
  wire axi_interconnect_ARESETN_net;
  wire [39:0]axi_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_to_s00_couplers_ARCACHE;
  wire [15:0]axi_interconnect_to_s00_couplers_ARID;
  wire [7:0]axi_interconnect_to_s00_couplers_ARLEN;
  wire [0:0]axi_interconnect_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_to_s00_couplers_ARQOS;
  wire [0:0]axi_interconnect_to_s00_couplers_ARREADY;
  wire [3:0]axi_interconnect_to_s00_couplers_ARREGION;
  wire [2:0]axi_interconnect_to_s00_couplers_ARSIZE;
  wire [0:0]axi_interconnect_to_s00_couplers_ARVALID;
  wire [39:0]axi_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_to_s00_couplers_AWCACHE;
  wire [15:0]axi_interconnect_to_s00_couplers_AWID;
  wire [7:0]axi_interconnect_to_s00_couplers_AWLEN;
  wire [0:0]axi_interconnect_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_to_s00_couplers_AWQOS;
  wire [0:0]axi_interconnect_to_s00_couplers_AWREADY;
  wire [3:0]axi_interconnect_to_s00_couplers_AWREGION;
  wire [2:0]axi_interconnect_to_s00_couplers_AWSIZE;
  wire [0:0]axi_interconnect_to_s00_couplers_AWVALID;
  wire [15:0]axi_interconnect_to_s00_couplers_BID;
  wire [0:0]axi_interconnect_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_BRESP;
  wire [0:0]axi_interconnect_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_RDATA;
  wire [15:0]axi_interconnect_to_s00_couplers_RID;
  wire [0:0]axi_interconnect_to_s00_couplers_RLAST;
  wire [0:0]axi_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_RRESP;
  wire [0:0]axi_interconnect_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_WDATA;
  wire [0:0]axi_interconnect_to_s00_couplers_WLAST;
  wire [0:0]axi_interconnect_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_to_s00_couplers_WSTRB;
  wire [0:0]axi_interconnect_to_s00_couplers_WVALID;
  wire [39:0]m00_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_ARPROT;
  wire m00_couplers_to_axi_interconnect_ARREADY;
  wire m00_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m00_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_AWPROT;
  wire m00_couplers_to_axi_interconnect_AWREADY;
  wire m00_couplers_to_axi_interconnect_AWVALID;
  wire m00_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_BRESP;
  wire m00_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_RDATA;
  wire m00_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_RRESP;
  wire m00_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_WDATA;
  wire m00_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m00_couplers_to_axi_interconnect_WSTRB;
  wire m00_couplers_to_axi_interconnect_WVALID;
  wire [39:0]m01_couplers_to_axi_interconnect_ARADDR;
  wire m01_couplers_to_axi_interconnect_ARREADY;
  wire m01_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m01_couplers_to_axi_interconnect_AWADDR;
  wire m01_couplers_to_axi_interconnect_AWREADY;
  wire m01_couplers_to_axi_interconnect_AWVALID;
  wire m01_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_BRESP;
  wire m01_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_RDATA;
  wire m01_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_RRESP;
  wire m01_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_WDATA;
  wire m01_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m01_couplers_to_axi_interconnect_WSTRB;
  wire m01_couplers_to_axi_interconnect_WVALID;
  wire [39:0]m02_couplers_to_axi_interconnect_ARADDR;
  wire m02_couplers_to_axi_interconnect_ARREADY;
  wire m02_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m02_couplers_to_axi_interconnect_AWADDR;
  wire m02_couplers_to_axi_interconnect_AWREADY;
  wire m02_couplers_to_axi_interconnect_AWVALID;
  wire m02_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_BRESP;
  wire m02_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_RDATA;
  wire m02_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_RRESP;
  wire m02_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_WDATA;
  wire m02_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m02_couplers_to_axi_interconnect_WSTRB;
  wire m02_couplers_to_axi_interconnect_WVALID;
  wire [39:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [39:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [39:0]xbar_to_m00_couplers_ARADDR;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [39:0]xbar_to_m00_couplers_AWADDR;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [79:40]xbar_to_m01_couplers_ARADDR;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [79:40]xbar_to_m01_couplers_AWADDR;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [119:80]xbar_to_m02_couplers_ARADDR;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [119:80]xbar_to_m02_couplers_AWADDR;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;

  assign M00_AXI_araddr[39:0] = m00_couplers_to_axi_interconnect_ARADDR;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_interconnect_ARPROT;
  assign M00_AXI_arvalid = m00_couplers_to_axi_interconnect_ARVALID;
  assign M00_AXI_awaddr[39:0] = m00_couplers_to_axi_interconnect_AWADDR;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_interconnect_AWPROT;
  assign M00_AXI_awvalid = m00_couplers_to_axi_interconnect_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_interconnect_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_interconnect_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_interconnect_WVALID;
  assign M01_AXI_araddr[39:0] = m01_couplers_to_axi_interconnect_ARADDR;
  assign M01_AXI_arvalid = m01_couplers_to_axi_interconnect_ARVALID;
  assign M01_AXI_awaddr[39:0] = m01_couplers_to_axi_interconnect_AWADDR;
  assign M01_AXI_awvalid = m01_couplers_to_axi_interconnect_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_axi_interconnect_BREADY;
  assign M01_AXI_rready = m01_couplers_to_axi_interconnect_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_interconnect_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_interconnect_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_axi_interconnect_WVALID;
  assign M02_AXI_araddr[39:0] = m02_couplers_to_axi_interconnect_ARADDR;
  assign M02_AXI_arvalid = m02_couplers_to_axi_interconnect_ARVALID;
  assign M02_AXI_awaddr[39:0] = m02_couplers_to_axi_interconnect_AWADDR;
  assign M02_AXI_awvalid = m02_couplers_to_axi_interconnect_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_axi_interconnect_BREADY;
  assign M02_AXI_rready = m02_couplers_to_axi_interconnect_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_axi_interconnect_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_axi_interconnect_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_axi_interconnect_WVALID;
  assign S00_AXI_arready[0] = axi_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = axi_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[15:0] = axi_interconnect_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = axi_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rid[15:0] = axi_interconnect_to_s00_couplers_RID;
  assign S00_AXI_rlast[0] = axi_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = axi_interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = axi_interconnect_to_s00_couplers_WREADY;
  assign axi_interconnect_ACLK_net = ACLK;
  assign axi_interconnect_ARESETN_net = ARESETN;
  assign axi_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[39:0];
  assign axi_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_to_s00_couplers_ARID = S00_AXI_arid[15:0];
  assign axi_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_interconnect_to_s00_couplers_ARLOCK = S00_AXI_arlock[0];
  assign axi_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_to_s00_couplers_ARREGION = S00_AXI_arregion[3:0];
  assign axi_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign axi_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[39:0];
  assign axi_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_to_s00_couplers_AWID = S00_AXI_awid[15:0];
  assign axi_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign axi_interconnect_to_s00_couplers_AWLOCK = S00_AXI_awlock[0];
  assign axi_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_to_s00_couplers_AWREGION = S00_AXI_awregion[3:0];
  assign axi_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign axi_interconnect_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign axi_interconnect_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign axi_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast[0];
  assign axi_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  assign m00_couplers_to_axi_interconnect_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_interconnect_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_interconnect_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_interconnect_WREADY = M00_AXI_wready;
  assign m01_couplers_to_axi_interconnect_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_axi_interconnect_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_axi_interconnect_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_interconnect_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_axi_interconnect_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_interconnect_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_interconnect_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_axi_interconnect_WREADY = M01_AXI_wready;
  assign m02_couplers_to_axi_interconnect_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_axi_interconnect_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_axi_interconnect_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_axi_interconnect_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_axi_interconnect_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_axi_interconnect_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_axi_interconnect_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_axi_interconnect_WREADY = M02_AXI_wready;
  m00_couplers_imp_5QVHE m00_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m00_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m00_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1FFZTVU m01_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arready(m01_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awready(m01_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1AMYN3N m02_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arready(m02_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awready(m02_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m02_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m02_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m02_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m02_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m02_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m02_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m02_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m02_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m02_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m02_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  s00_couplers_imp_O40D8P s00_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(axi_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arregion(axi_interconnect_to_s00_couplers_ARREGION),
        .S_AXI_arsize(axi_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awregion(axi_interconnect_to_s00_couplers_AWREGION),
        .S_AXI_awsize(axi_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_to_s00_couplers_WVALID));
  exdes_xbar_0 xbar
       (.aclk(axi_interconnect_ACLK_net),
        .aresetn(axi_interconnect_ARESETN_net),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awready({xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module exdes_axi_interconnect_1
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arburst,
    M03_AXI_arcache,
    M03_AXI_arlen,
    M03_AXI_arlock,
    M03_AXI_arprot,
    M03_AXI_arqos,
    M03_AXI_arready,
    M03_AXI_arregion,
    M03_AXI_arsize,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awburst,
    M03_AXI_awcache,
    M03_AXI_awlen,
    M03_AXI_awlock,
    M03_AXI_awprot,
    M03_AXI_awqos,
    M03_AXI_awready,
    M03_AXI_awregion,
    M03_AXI_awsize,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rlast,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wlast,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arburst,
    M06_AXI_arcache,
    M06_AXI_arid,
    M06_AXI_arlen,
    M06_AXI_arlock,
    M06_AXI_arprot,
    M06_AXI_arqos,
    M06_AXI_arready,
    M06_AXI_arregion,
    M06_AXI_arsize,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awburst,
    M06_AXI_awcache,
    M06_AXI_awid,
    M06_AXI_awlen,
    M06_AXI_awlock,
    M06_AXI_awprot,
    M06_AXI_awqos,
    M06_AXI_awready,
    M06_AXI_awregion,
    M06_AXI_awsize,
    M06_AXI_awvalid,
    M06_AXI_bid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rid,
    M06_AXI_rlast,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wlast,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M07_ACLK,
    M07_ARESETN,
    M07_AXI_araddr,
    M07_AXI_arburst,
    M07_AXI_arcache,
    M07_AXI_arlen,
    M07_AXI_arlock,
    M07_AXI_arprot,
    M07_AXI_arqos,
    M07_AXI_arready,
    M07_AXI_arregion,
    M07_AXI_arsize,
    M07_AXI_arvalid,
    M07_AXI_awaddr,
    M07_AXI_awburst,
    M07_AXI_awcache,
    M07_AXI_awlen,
    M07_AXI_awlock,
    M07_AXI_awprot,
    M07_AXI_awqos,
    M07_AXI_awready,
    M07_AXI_awregion,
    M07_AXI_awsize,
    M07_AXI_awvalid,
    M07_AXI_bready,
    M07_AXI_bresp,
    M07_AXI_bvalid,
    M07_AXI_rdata,
    M07_AXI_rlast,
    M07_AXI_rready,
    M07_AXI_rresp,
    M07_AXI_rvalid,
    M07_AXI_wdata,
    M07_AXI_wlast,
    M07_AXI_wready,
    M07_AXI_wstrb,
    M07_AXI_wvalid,
    M08_ACLK,
    M08_ARESETN,
    M08_AXI_araddr,
    M08_AXI_arready,
    M08_AXI_arvalid,
    M08_AXI_awaddr,
    M08_AXI_awready,
    M08_AXI_awvalid,
    M08_AXI_bready,
    M08_AXI_bresp,
    M08_AXI_bvalid,
    M08_AXI_rdata,
    M08_AXI_rready,
    M08_AXI_rresp,
    M08_AXI_rvalid,
    M08_AXI_wdata,
    M08_AXI_wready,
    M08_AXI_wstrb,
    M08_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_aruser,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awuser,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [39:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [39:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [15:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [15:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [16:0]M02_AXI_araddr;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [16:0]M02_AXI_awaddr;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output M03_AXI_araddr;
  output M03_AXI_arburst;
  output M03_AXI_arcache;
  output M03_AXI_arlen;
  output M03_AXI_arlock;
  output M03_AXI_arprot;
  output M03_AXI_arqos;
  input M03_AXI_arready;
  output M03_AXI_arregion;
  output M03_AXI_arsize;
  output M03_AXI_arvalid;
  output M03_AXI_awaddr;
  output M03_AXI_awburst;
  output M03_AXI_awcache;
  output M03_AXI_awlen;
  output M03_AXI_awlock;
  output M03_AXI_awprot;
  output M03_AXI_awqos;
  input M03_AXI_awready;
  output M03_AXI_awregion;
  output M03_AXI_awsize;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input M03_AXI_bresp;
  input M03_AXI_bvalid;
  input M03_AXI_rdata;
  input M03_AXI_rlast;
  output M03_AXI_rready;
  input M03_AXI_rresp;
  input M03_AXI_rvalid;
  output M03_AXI_wdata;
  output M03_AXI_wlast;
  input M03_AXI_wready;
  output M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [39:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [39:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [39:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [39:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [39:0]M06_AXI_araddr;
  output [1:0]M06_AXI_arburst;
  output [3:0]M06_AXI_arcache;
  output [15:0]M06_AXI_arid;
  output [7:0]M06_AXI_arlen;
  output [0:0]M06_AXI_arlock;
  output [2:0]M06_AXI_arprot;
  output [3:0]M06_AXI_arqos;
  input [0:0]M06_AXI_arready;
  output [3:0]M06_AXI_arregion;
  output [2:0]M06_AXI_arsize;
  output [0:0]M06_AXI_arvalid;
  output [39:0]M06_AXI_awaddr;
  output [1:0]M06_AXI_awburst;
  output [3:0]M06_AXI_awcache;
  output [15:0]M06_AXI_awid;
  output [7:0]M06_AXI_awlen;
  output [0:0]M06_AXI_awlock;
  output [2:0]M06_AXI_awprot;
  output [3:0]M06_AXI_awqos;
  input [0:0]M06_AXI_awready;
  output [3:0]M06_AXI_awregion;
  output [2:0]M06_AXI_awsize;
  output [0:0]M06_AXI_awvalid;
  input [15:0]M06_AXI_bid;
  output [0:0]M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input [0:0]M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  input [15:0]M06_AXI_rid;
  input [0:0]M06_AXI_rlast;
  output [0:0]M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input [0:0]M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  output [0:0]M06_AXI_wlast;
  input [0:0]M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output [0:0]M06_AXI_wvalid;
  input M07_ACLK;
  input M07_ARESETN;
  output M07_AXI_araddr;
  output M07_AXI_arburst;
  output M07_AXI_arcache;
  output M07_AXI_arlen;
  output M07_AXI_arlock;
  output M07_AXI_arprot;
  output M07_AXI_arqos;
  input M07_AXI_arready;
  output M07_AXI_arregion;
  output M07_AXI_arsize;
  output M07_AXI_arvalid;
  output M07_AXI_awaddr;
  output M07_AXI_awburst;
  output M07_AXI_awcache;
  output M07_AXI_awlen;
  output M07_AXI_awlock;
  output M07_AXI_awprot;
  output M07_AXI_awqos;
  input M07_AXI_awready;
  output M07_AXI_awregion;
  output M07_AXI_awsize;
  output M07_AXI_awvalid;
  output M07_AXI_bready;
  input M07_AXI_bresp;
  input M07_AXI_bvalid;
  input M07_AXI_rdata;
  input M07_AXI_rlast;
  output M07_AXI_rready;
  input M07_AXI_rresp;
  input M07_AXI_rvalid;
  output M07_AXI_wdata;
  output M07_AXI_wlast;
  input M07_AXI_wready;
  output M07_AXI_wstrb;
  output M07_AXI_wvalid;
  input M08_ACLK;
  input M08_ARESETN;
  output [39:0]M08_AXI_araddr;
  input M08_AXI_arready;
  output M08_AXI_arvalid;
  output [39:0]M08_AXI_awaddr;
  input M08_AXI_awready;
  output M08_AXI_awvalid;
  output M08_AXI_bready;
  input [1:0]M08_AXI_bresp;
  input M08_AXI_bvalid;
  input [31:0]M08_AXI_rdata;
  output M08_AXI_rready;
  input [1:0]M08_AXI_rresp;
  input M08_AXI_rvalid;
  output [31:0]M08_AXI_wdata;
  input M08_AXI_wready;
  output [3:0]M08_AXI_wstrb;
  output M08_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [39:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [15:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input [15:0]S00_AXI_aruser;
  input S00_AXI_arvalid;
  input [39:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [15:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input [15:0]S00_AXI_awuser;
  input S00_AXI_awvalid;
  output [15:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [15:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire M03_ACLK_1;
  wire M03_ARESETN_1;
  wire M04_ACLK_1;
  wire M04_ARESETN_1;
  wire M05_ACLK_1;
  wire M05_ARESETN_1;
  wire M06_ACLK_1;
  wire M06_ARESETN_1;
  wire M07_ACLK_1;
  wire M07_ARESETN_1;
  wire M08_ACLK_1;
  wire M08_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_interconnect_ACLK_net;
  wire axi_interconnect_ARESETN_net;
  wire [39:0]axi_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_to_s00_couplers_ARCACHE;
  wire [15:0]axi_interconnect_to_s00_couplers_ARID;
  wire [7:0]axi_interconnect_to_s00_couplers_ARLEN;
  wire axi_interconnect_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_to_s00_couplers_ARQOS;
  wire axi_interconnect_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_to_s00_couplers_ARSIZE;
  wire [15:0]axi_interconnect_to_s00_couplers_ARUSER;
  wire axi_interconnect_to_s00_couplers_ARVALID;
  wire [39:0]axi_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_to_s00_couplers_AWCACHE;
  wire [15:0]axi_interconnect_to_s00_couplers_AWID;
  wire [7:0]axi_interconnect_to_s00_couplers_AWLEN;
  wire axi_interconnect_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_to_s00_couplers_AWQOS;
  wire axi_interconnect_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_to_s00_couplers_AWSIZE;
  wire [15:0]axi_interconnect_to_s00_couplers_AWUSER;
  wire axi_interconnect_to_s00_couplers_AWVALID;
  wire [15:0]axi_interconnect_to_s00_couplers_BID;
  wire axi_interconnect_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_BRESP;
  wire axi_interconnect_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_RDATA;
  wire [15:0]axi_interconnect_to_s00_couplers_RID;
  wire axi_interconnect_to_s00_couplers_RLAST;
  wire axi_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_RRESP;
  wire axi_interconnect_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_WDATA;
  wire axi_interconnect_to_s00_couplers_WLAST;
  wire axi_interconnect_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_to_s00_couplers_WSTRB;
  wire axi_interconnect_to_s00_couplers_WVALID;
  wire [39:0]m00_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_ARPROT;
  wire m00_couplers_to_axi_interconnect_ARREADY;
  wire m00_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m00_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_AWPROT;
  wire m00_couplers_to_axi_interconnect_AWREADY;
  wire m00_couplers_to_axi_interconnect_AWVALID;
  wire m00_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_BRESP;
  wire m00_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_RDATA;
  wire m00_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_RRESP;
  wire m00_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_WDATA;
  wire m00_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m00_couplers_to_axi_interconnect_WSTRB;
  wire m00_couplers_to_axi_interconnect_WVALID;
  wire [15:0]m01_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m01_couplers_to_axi_interconnect_ARPROT;
  wire m01_couplers_to_axi_interconnect_ARREADY;
  wire m01_couplers_to_axi_interconnect_ARVALID;
  wire [15:0]m01_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m01_couplers_to_axi_interconnect_AWPROT;
  wire m01_couplers_to_axi_interconnect_AWREADY;
  wire m01_couplers_to_axi_interconnect_AWVALID;
  wire m01_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_BRESP;
  wire m01_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_RDATA;
  wire m01_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_RRESP;
  wire m01_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_WDATA;
  wire m01_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m01_couplers_to_axi_interconnect_WSTRB;
  wire m01_couplers_to_axi_interconnect_WVALID;
  wire [16:0]m02_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m02_couplers_to_axi_interconnect_ARPROT;
  wire m02_couplers_to_axi_interconnect_ARREADY;
  wire m02_couplers_to_axi_interconnect_ARVALID;
  wire [16:0]m02_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m02_couplers_to_axi_interconnect_AWPROT;
  wire m02_couplers_to_axi_interconnect_AWREADY;
  wire m02_couplers_to_axi_interconnect_AWVALID;
  wire m02_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_BRESP;
  wire m02_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_RDATA;
  wire m02_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_RRESP;
  wire m02_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_WDATA;
  wire m02_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m02_couplers_to_axi_interconnect_WSTRB;
  wire m02_couplers_to_axi_interconnect_WVALID;
  wire m03_couplers_to_axi_interconnect_ARADDR;
  wire m03_couplers_to_axi_interconnect_ARBURST;
  wire m03_couplers_to_axi_interconnect_ARCACHE;
  wire m03_couplers_to_axi_interconnect_ARLEN;
  wire m03_couplers_to_axi_interconnect_ARLOCK;
  wire m03_couplers_to_axi_interconnect_ARPROT;
  wire m03_couplers_to_axi_interconnect_ARQOS;
  wire m03_couplers_to_axi_interconnect_ARREADY;
  wire m03_couplers_to_axi_interconnect_ARREGION;
  wire m03_couplers_to_axi_interconnect_ARSIZE;
  wire m03_couplers_to_axi_interconnect_ARVALID;
  wire m03_couplers_to_axi_interconnect_AWADDR;
  wire m03_couplers_to_axi_interconnect_AWBURST;
  wire m03_couplers_to_axi_interconnect_AWCACHE;
  wire m03_couplers_to_axi_interconnect_AWLEN;
  wire m03_couplers_to_axi_interconnect_AWLOCK;
  wire m03_couplers_to_axi_interconnect_AWPROT;
  wire m03_couplers_to_axi_interconnect_AWQOS;
  wire m03_couplers_to_axi_interconnect_AWREADY;
  wire m03_couplers_to_axi_interconnect_AWREGION;
  wire m03_couplers_to_axi_interconnect_AWSIZE;
  wire m03_couplers_to_axi_interconnect_AWVALID;
  wire m03_couplers_to_axi_interconnect_BREADY;
  wire m03_couplers_to_axi_interconnect_BRESP;
  wire m03_couplers_to_axi_interconnect_BVALID;
  wire m03_couplers_to_axi_interconnect_RDATA;
  wire m03_couplers_to_axi_interconnect_RLAST;
  wire m03_couplers_to_axi_interconnect_RREADY;
  wire m03_couplers_to_axi_interconnect_RRESP;
  wire m03_couplers_to_axi_interconnect_RVALID;
  wire m03_couplers_to_axi_interconnect_WDATA;
  wire m03_couplers_to_axi_interconnect_WLAST;
  wire m03_couplers_to_axi_interconnect_WREADY;
  wire m03_couplers_to_axi_interconnect_WSTRB;
  wire m03_couplers_to_axi_interconnect_WVALID;
  wire [39:0]m04_couplers_to_axi_interconnect_ARADDR;
  wire m04_couplers_to_axi_interconnect_ARREADY;
  wire m04_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m04_couplers_to_axi_interconnect_AWADDR;
  wire m04_couplers_to_axi_interconnect_AWREADY;
  wire m04_couplers_to_axi_interconnect_AWVALID;
  wire m04_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_BRESP;
  wire m04_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_RDATA;
  wire m04_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_RRESP;
  wire m04_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_WDATA;
  wire m04_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m04_couplers_to_axi_interconnect_WSTRB;
  wire m04_couplers_to_axi_interconnect_WVALID;
  wire [39:0]m05_couplers_to_axi_interconnect_ARADDR;
  wire m05_couplers_to_axi_interconnect_ARREADY;
  wire m05_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m05_couplers_to_axi_interconnect_AWADDR;
  wire m05_couplers_to_axi_interconnect_AWREADY;
  wire m05_couplers_to_axi_interconnect_AWVALID;
  wire m05_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m05_couplers_to_axi_interconnect_BRESP;
  wire m05_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_RDATA;
  wire m05_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m05_couplers_to_axi_interconnect_RRESP;
  wire m05_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_WDATA;
  wire m05_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m05_couplers_to_axi_interconnect_WSTRB;
  wire m05_couplers_to_axi_interconnect_WVALID;
  wire [39:0]m06_couplers_to_axi_interconnect_ARADDR;
  wire [1:0]m06_couplers_to_axi_interconnect_ARBURST;
  wire [3:0]m06_couplers_to_axi_interconnect_ARCACHE;
  wire [15:0]m06_couplers_to_axi_interconnect_ARID;
  wire [7:0]m06_couplers_to_axi_interconnect_ARLEN;
  wire [0:0]m06_couplers_to_axi_interconnect_ARLOCK;
  wire [2:0]m06_couplers_to_axi_interconnect_ARPROT;
  wire [3:0]m06_couplers_to_axi_interconnect_ARQOS;
  wire [0:0]m06_couplers_to_axi_interconnect_ARREADY;
  wire [3:0]m06_couplers_to_axi_interconnect_ARREGION;
  wire [2:0]m06_couplers_to_axi_interconnect_ARSIZE;
  wire [0:0]m06_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m06_couplers_to_axi_interconnect_AWADDR;
  wire [1:0]m06_couplers_to_axi_interconnect_AWBURST;
  wire [3:0]m06_couplers_to_axi_interconnect_AWCACHE;
  wire [15:0]m06_couplers_to_axi_interconnect_AWID;
  wire [7:0]m06_couplers_to_axi_interconnect_AWLEN;
  wire [0:0]m06_couplers_to_axi_interconnect_AWLOCK;
  wire [2:0]m06_couplers_to_axi_interconnect_AWPROT;
  wire [3:0]m06_couplers_to_axi_interconnect_AWQOS;
  wire [0:0]m06_couplers_to_axi_interconnect_AWREADY;
  wire [3:0]m06_couplers_to_axi_interconnect_AWREGION;
  wire [2:0]m06_couplers_to_axi_interconnect_AWSIZE;
  wire [0:0]m06_couplers_to_axi_interconnect_AWVALID;
  wire [15:0]m06_couplers_to_axi_interconnect_BID;
  wire [0:0]m06_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m06_couplers_to_axi_interconnect_BRESP;
  wire [0:0]m06_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_RDATA;
  wire [15:0]m06_couplers_to_axi_interconnect_RID;
  wire [0:0]m06_couplers_to_axi_interconnect_RLAST;
  wire [0:0]m06_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m06_couplers_to_axi_interconnect_RRESP;
  wire [0:0]m06_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_WDATA;
  wire [0:0]m06_couplers_to_axi_interconnect_WLAST;
  wire [0:0]m06_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m06_couplers_to_axi_interconnect_WSTRB;
  wire [0:0]m06_couplers_to_axi_interconnect_WVALID;
  wire m07_couplers_to_axi_interconnect_ARADDR;
  wire m07_couplers_to_axi_interconnect_ARBURST;
  wire m07_couplers_to_axi_interconnect_ARCACHE;
  wire m07_couplers_to_axi_interconnect_ARLEN;
  wire m07_couplers_to_axi_interconnect_ARLOCK;
  wire m07_couplers_to_axi_interconnect_ARPROT;
  wire m07_couplers_to_axi_interconnect_ARQOS;
  wire m07_couplers_to_axi_interconnect_ARREADY;
  wire m07_couplers_to_axi_interconnect_ARREGION;
  wire m07_couplers_to_axi_interconnect_ARSIZE;
  wire m07_couplers_to_axi_interconnect_ARVALID;
  wire m07_couplers_to_axi_interconnect_AWADDR;
  wire m07_couplers_to_axi_interconnect_AWBURST;
  wire m07_couplers_to_axi_interconnect_AWCACHE;
  wire m07_couplers_to_axi_interconnect_AWLEN;
  wire m07_couplers_to_axi_interconnect_AWLOCK;
  wire m07_couplers_to_axi_interconnect_AWPROT;
  wire m07_couplers_to_axi_interconnect_AWQOS;
  wire m07_couplers_to_axi_interconnect_AWREADY;
  wire m07_couplers_to_axi_interconnect_AWREGION;
  wire m07_couplers_to_axi_interconnect_AWSIZE;
  wire m07_couplers_to_axi_interconnect_AWVALID;
  wire m07_couplers_to_axi_interconnect_BREADY;
  wire m07_couplers_to_axi_interconnect_BRESP;
  wire m07_couplers_to_axi_interconnect_BVALID;
  wire m07_couplers_to_axi_interconnect_RDATA;
  wire m07_couplers_to_axi_interconnect_RLAST;
  wire m07_couplers_to_axi_interconnect_RREADY;
  wire m07_couplers_to_axi_interconnect_RRESP;
  wire m07_couplers_to_axi_interconnect_RVALID;
  wire m07_couplers_to_axi_interconnect_WDATA;
  wire m07_couplers_to_axi_interconnect_WLAST;
  wire m07_couplers_to_axi_interconnect_WREADY;
  wire m07_couplers_to_axi_interconnect_WSTRB;
  wire m07_couplers_to_axi_interconnect_WVALID;
  wire [39:0]m08_couplers_to_axi_interconnect_ARADDR;
  wire m08_couplers_to_axi_interconnect_ARREADY;
  wire m08_couplers_to_axi_interconnect_ARVALID;
  wire [39:0]m08_couplers_to_axi_interconnect_AWADDR;
  wire m08_couplers_to_axi_interconnect_AWREADY;
  wire m08_couplers_to_axi_interconnect_AWVALID;
  wire m08_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m08_couplers_to_axi_interconnect_BRESP;
  wire m08_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_RDATA;
  wire m08_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m08_couplers_to_axi_interconnect_RRESP;
  wire m08_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_WDATA;
  wire m08_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m08_couplers_to_axi_interconnect_WSTRB;
  wire m08_couplers_to_axi_interconnect_WVALID;
  wire [39:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [15:0]s00_couplers_to_xbar_ARID;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire [15:0]s00_couplers_to_xbar_ARUSER;
  wire s00_couplers_to_xbar_ARVALID;
  wire [39:0]s00_couplers_to_xbar_AWADDR;
  wire [1:0]s00_couplers_to_xbar_AWBURST;
  wire [3:0]s00_couplers_to_xbar_AWCACHE;
  wire [15:0]s00_couplers_to_xbar_AWID;
  wire [7:0]s00_couplers_to_xbar_AWLEN;
  wire s00_couplers_to_xbar_AWLOCK;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [3:0]s00_couplers_to_xbar_AWQOS;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [2:0]s00_couplers_to_xbar_AWSIZE;
  wire [15:0]s00_couplers_to_xbar_AWUSER;
  wire s00_couplers_to_xbar_AWVALID;
  wire [15:0]s00_couplers_to_xbar_BID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [15:0]s00_couplers_to_xbar_RID;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire s00_couplers_to_xbar_WLAST;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [39:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [15:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [39:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [15:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [15:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [15:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [79:40]xbar_to_m01_couplers_ARADDR;
  wire [3:2]xbar_to_m01_couplers_ARBURST;
  wire [7:4]xbar_to_m01_couplers_ARCACHE;
  wire [31:16]xbar_to_m01_couplers_ARID;
  wire [15:8]xbar_to_m01_couplers_ARLEN;
  wire [1:1]xbar_to_m01_couplers_ARLOCK;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire [7:4]xbar_to_m01_couplers_ARQOS;
  wire xbar_to_m01_couplers_ARREADY;
  wire [7:4]xbar_to_m01_couplers_ARREGION;
  wire [5:3]xbar_to_m01_couplers_ARSIZE;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [79:40]xbar_to_m01_couplers_AWADDR;
  wire [3:2]xbar_to_m01_couplers_AWBURST;
  wire [7:4]xbar_to_m01_couplers_AWCACHE;
  wire [31:16]xbar_to_m01_couplers_AWID;
  wire [15:8]xbar_to_m01_couplers_AWLEN;
  wire [1:1]xbar_to_m01_couplers_AWLOCK;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire [7:4]xbar_to_m01_couplers_AWQOS;
  wire xbar_to_m01_couplers_AWREADY;
  wire [7:4]xbar_to_m01_couplers_AWREGION;
  wire [5:3]xbar_to_m01_couplers_AWSIZE;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [15:0]xbar_to_m01_couplers_BID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [15:0]xbar_to_m01_couplers_RID;
  wire xbar_to_m01_couplers_RLAST;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [1:1]xbar_to_m01_couplers_WLAST;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [119:80]xbar_to_m02_couplers_ARADDR;
  wire [5:4]xbar_to_m02_couplers_ARBURST;
  wire [11:8]xbar_to_m02_couplers_ARCACHE;
  wire [47:32]xbar_to_m02_couplers_ARID;
  wire [23:16]xbar_to_m02_couplers_ARLEN;
  wire [2:2]xbar_to_m02_couplers_ARLOCK;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire [11:8]xbar_to_m02_couplers_ARQOS;
  wire xbar_to_m02_couplers_ARREADY;
  wire [11:8]xbar_to_m02_couplers_ARREGION;
  wire [8:6]xbar_to_m02_couplers_ARSIZE;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [119:80]xbar_to_m02_couplers_AWADDR;
  wire [5:4]xbar_to_m02_couplers_AWBURST;
  wire [11:8]xbar_to_m02_couplers_AWCACHE;
  wire [47:32]xbar_to_m02_couplers_AWID;
  wire [23:16]xbar_to_m02_couplers_AWLEN;
  wire [2:2]xbar_to_m02_couplers_AWLOCK;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire [11:8]xbar_to_m02_couplers_AWQOS;
  wire xbar_to_m02_couplers_AWREADY;
  wire [11:8]xbar_to_m02_couplers_AWREGION;
  wire [8:6]xbar_to_m02_couplers_AWSIZE;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [15:0]xbar_to_m02_couplers_BID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [15:0]xbar_to_m02_couplers_RID;
  wire xbar_to_m02_couplers_RLAST;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [2:2]xbar_to_m02_couplers_WLAST;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [159:120]xbar_to_m03_couplers_ARADDR;
  wire [7:6]xbar_to_m03_couplers_ARBURST;
  wire [15:12]xbar_to_m03_couplers_ARCACHE;
  wire [31:24]xbar_to_m03_couplers_ARLEN;
  wire [3:3]xbar_to_m03_couplers_ARLOCK;
  wire [11:9]xbar_to_m03_couplers_ARPROT;
  wire [15:12]xbar_to_m03_couplers_ARQOS;
  wire xbar_to_m03_couplers_ARREADY;
  wire [15:12]xbar_to_m03_couplers_ARREGION;
  wire [11:9]xbar_to_m03_couplers_ARSIZE;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [159:120]xbar_to_m03_couplers_AWADDR;
  wire [7:6]xbar_to_m03_couplers_AWBURST;
  wire [15:12]xbar_to_m03_couplers_AWCACHE;
  wire [31:24]xbar_to_m03_couplers_AWLEN;
  wire [3:3]xbar_to_m03_couplers_AWLOCK;
  wire [11:9]xbar_to_m03_couplers_AWPROT;
  wire [15:12]xbar_to_m03_couplers_AWQOS;
  wire xbar_to_m03_couplers_AWREADY;
  wire [15:12]xbar_to_m03_couplers_AWREGION;
  wire [11:9]xbar_to_m03_couplers_AWSIZE;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire xbar_to_m03_couplers_RDATA;
  wire xbar_to_m03_couplers_RLAST;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire [3:3]xbar_to_m03_couplers_WLAST;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [199:160]xbar_to_m04_couplers_ARADDR;
  wire [9:8]xbar_to_m04_couplers_ARBURST;
  wire [19:16]xbar_to_m04_couplers_ARCACHE;
  wire [79:64]xbar_to_m04_couplers_ARID;
  wire [39:32]xbar_to_m04_couplers_ARLEN;
  wire [4:4]xbar_to_m04_couplers_ARLOCK;
  wire [14:12]xbar_to_m04_couplers_ARPROT;
  wire [19:16]xbar_to_m04_couplers_ARQOS;
  wire xbar_to_m04_couplers_ARREADY;
  wire [19:16]xbar_to_m04_couplers_ARREGION;
  wire [14:12]xbar_to_m04_couplers_ARSIZE;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [199:160]xbar_to_m04_couplers_AWADDR;
  wire [9:8]xbar_to_m04_couplers_AWBURST;
  wire [19:16]xbar_to_m04_couplers_AWCACHE;
  wire [79:64]xbar_to_m04_couplers_AWID;
  wire [39:32]xbar_to_m04_couplers_AWLEN;
  wire [4:4]xbar_to_m04_couplers_AWLOCK;
  wire [14:12]xbar_to_m04_couplers_AWPROT;
  wire [19:16]xbar_to_m04_couplers_AWQOS;
  wire xbar_to_m04_couplers_AWREADY;
  wire [19:16]xbar_to_m04_couplers_AWREGION;
  wire [14:12]xbar_to_m04_couplers_AWSIZE;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [15:0]xbar_to_m04_couplers_BID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [15:0]xbar_to_m04_couplers_RID;
  wire xbar_to_m04_couplers_RLAST;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire [4:4]xbar_to_m04_couplers_WLAST;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [239:200]xbar_to_m05_couplers_ARADDR;
  wire [11:10]xbar_to_m05_couplers_ARBURST;
  wire [23:20]xbar_to_m05_couplers_ARCACHE;
  wire [95:80]xbar_to_m05_couplers_ARID;
  wire [47:40]xbar_to_m05_couplers_ARLEN;
  wire [5:5]xbar_to_m05_couplers_ARLOCK;
  wire [17:15]xbar_to_m05_couplers_ARPROT;
  wire [23:20]xbar_to_m05_couplers_ARQOS;
  wire xbar_to_m05_couplers_ARREADY;
  wire [23:20]xbar_to_m05_couplers_ARREGION;
  wire [17:15]xbar_to_m05_couplers_ARSIZE;
  wire [95:80]xbar_to_m05_couplers_ARUSER;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [239:200]xbar_to_m05_couplers_AWADDR;
  wire [11:10]xbar_to_m05_couplers_AWBURST;
  wire [23:20]xbar_to_m05_couplers_AWCACHE;
  wire [95:80]xbar_to_m05_couplers_AWID;
  wire [47:40]xbar_to_m05_couplers_AWLEN;
  wire [5:5]xbar_to_m05_couplers_AWLOCK;
  wire [17:15]xbar_to_m05_couplers_AWPROT;
  wire [23:20]xbar_to_m05_couplers_AWQOS;
  wire xbar_to_m05_couplers_AWREADY;
  wire [23:20]xbar_to_m05_couplers_AWREGION;
  wire [17:15]xbar_to_m05_couplers_AWSIZE;
  wire [95:80]xbar_to_m05_couplers_AWUSER;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [15:0]xbar_to_m05_couplers_BID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [15:0]xbar_to_m05_couplers_RID;
  wire xbar_to_m05_couplers_RLAST;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire [5:5]xbar_to_m05_couplers_WLAST;
  wire xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [279:240]xbar_to_m06_couplers_ARADDR;
  wire [13:12]xbar_to_m06_couplers_ARBURST;
  wire [27:24]xbar_to_m06_couplers_ARCACHE;
  wire [111:96]xbar_to_m06_couplers_ARID;
  wire [55:48]xbar_to_m06_couplers_ARLEN;
  wire [6:6]xbar_to_m06_couplers_ARLOCK;
  wire [20:18]xbar_to_m06_couplers_ARPROT;
  wire [27:24]xbar_to_m06_couplers_ARQOS;
  wire [0:0]xbar_to_m06_couplers_ARREADY;
  wire [27:24]xbar_to_m06_couplers_ARREGION;
  wire [20:18]xbar_to_m06_couplers_ARSIZE;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [279:240]xbar_to_m06_couplers_AWADDR;
  wire [13:12]xbar_to_m06_couplers_AWBURST;
  wire [27:24]xbar_to_m06_couplers_AWCACHE;
  wire [111:96]xbar_to_m06_couplers_AWID;
  wire [55:48]xbar_to_m06_couplers_AWLEN;
  wire [6:6]xbar_to_m06_couplers_AWLOCK;
  wire [20:18]xbar_to_m06_couplers_AWPROT;
  wire [27:24]xbar_to_m06_couplers_AWQOS;
  wire [0:0]xbar_to_m06_couplers_AWREADY;
  wire [27:24]xbar_to_m06_couplers_AWREGION;
  wire [20:18]xbar_to_m06_couplers_AWSIZE;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [15:0]xbar_to_m06_couplers_BID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire [0:0]xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [15:0]xbar_to_m06_couplers_RID;
  wire [0:0]xbar_to_m06_couplers_RLAST;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire [0:0]xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire [6:6]xbar_to_m06_couplers_WLAST;
  wire [0:0]xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [319:280]xbar_to_m07_couplers_ARADDR;
  wire [15:14]xbar_to_m07_couplers_ARBURST;
  wire [31:28]xbar_to_m07_couplers_ARCACHE;
  wire [63:56]xbar_to_m07_couplers_ARLEN;
  wire [7:7]xbar_to_m07_couplers_ARLOCK;
  wire [23:21]xbar_to_m07_couplers_ARPROT;
  wire [31:28]xbar_to_m07_couplers_ARQOS;
  wire xbar_to_m07_couplers_ARREADY;
  wire [31:28]xbar_to_m07_couplers_ARREGION;
  wire [23:21]xbar_to_m07_couplers_ARSIZE;
  wire [7:7]xbar_to_m07_couplers_ARVALID;
  wire [319:280]xbar_to_m07_couplers_AWADDR;
  wire [15:14]xbar_to_m07_couplers_AWBURST;
  wire [31:28]xbar_to_m07_couplers_AWCACHE;
  wire [63:56]xbar_to_m07_couplers_AWLEN;
  wire [7:7]xbar_to_m07_couplers_AWLOCK;
  wire [23:21]xbar_to_m07_couplers_AWPROT;
  wire [31:28]xbar_to_m07_couplers_AWQOS;
  wire xbar_to_m07_couplers_AWREADY;
  wire [31:28]xbar_to_m07_couplers_AWREGION;
  wire [23:21]xbar_to_m07_couplers_AWSIZE;
  wire [7:7]xbar_to_m07_couplers_AWVALID;
  wire [7:7]xbar_to_m07_couplers_BREADY;
  wire xbar_to_m07_couplers_BRESP;
  wire xbar_to_m07_couplers_BVALID;
  wire xbar_to_m07_couplers_RDATA;
  wire xbar_to_m07_couplers_RLAST;
  wire [7:7]xbar_to_m07_couplers_RREADY;
  wire xbar_to_m07_couplers_RRESP;
  wire xbar_to_m07_couplers_RVALID;
  wire [255:224]xbar_to_m07_couplers_WDATA;
  wire [7:7]xbar_to_m07_couplers_WLAST;
  wire xbar_to_m07_couplers_WREADY;
  wire [31:28]xbar_to_m07_couplers_WSTRB;
  wire [7:7]xbar_to_m07_couplers_WVALID;
  wire [359:320]xbar_to_m08_couplers_ARADDR;
  wire [17:16]xbar_to_m08_couplers_ARBURST;
  wire [35:32]xbar_to_m08_couplers_ARCACHE;
  wire [143:128]xbar_to_m08_couplers_ARID;
  wire [71:64]xbar_to_m08_couplers_ARLEN;
  wire [8:8]xbar_to_m08_couplers_ARLOCK;
  wire [26:24]xbar_to_m08_couplers_ARPROT;
  wire [35:32]xbar_to_m08_couplers_ARQOS;
  wire xbar_to_m08_couplers_ARREADY;
  wire [35:32]xbar_to_m08_couplers_ARREGION;
  wire [26:24]xbar_to_m08_couplers_ARSIZE;
  wire [143:128]xbar_to_m08_couplers_ARUSER;
  wire [8:8]xbar_to_m08_couplers_ARVALID;
  wire [359:320]xbar_to_m08_couplers_AWADDR;
  wire [17:16]xbar_to_m08_couplers_AWBURST;
  wire [35:32]xbar_to_m08_couplers_AWCACHE;
  wire [143:128]xbar_to_m08_couplers_AWID;
  wire [71:64]xbar_to_m08_couplers_AWLEN;
  wire [8:8]xbar_to_m08_couplers_AWLOCK;
  wire [26:24]xbar_to_m08_couplers_AWPROT;
  wire [35:32]xbar_to_m08_couplers_AWQOS;
  wire xbar_to_m08_couplers_AWREADY;
  wire [35:32]xbar_to_m08_couplers_AWREGION;
  wire [26:24]xbar_to_m08_couplers_AWSIZE;
  wire [143:128]xbar_to_m08_couplers_AWUSER;
  wire [8:8]xbar_to_m08_couplers_AWVALID;
  wire [15:0]xbar_to_m08_couplers_BID;
  wire [8:8]xbar_to_m08_couplers_BREADY;
  wire [1:0]xbar_to_m08_couplers_BRESP;
  wire xbar_to_m08_couplers_BVALID;
  wire [31:0]xbar_to_m08_couplers_RDATA;
  wire [15:0]xbar_to_m08_couplers_RID;
  wire xbar_to_m08_couplers_RLAST;
  wire [8:8]xbar_to_m08_couplers_RREADY;
  wire [1:0]xbar_to_m08_couplers_RRESP;
  wire xbar_to_m08_couplers_RVALID;
  wire [287:256]xbar_to_m08_couplers_WDATA;
  wire [8:8]xbar_to_m08_couplers_WLAST;
  wire xbar_to_m08_couplers_WREADY;
  wire [35:32]xbar_to_m08_couplers_WSTRB;
  wire [8:8]xbar_to_m08_couplers_WVALID;
  wire [143:0]NLW_xbar_m_axi_arid_UNCONNECTED;
  wire [143:0]NLW_xbar_m_axi_aruser_UNCONNECTED;
  wire [143:0]NLW_xbar_m_axi_awid_UNCONNECTED;
  wire [143:0]NLW_xbar_m_axi_awuser_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[39:0] = m00_couplers_to_axi_interconnect_ARADDR;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_interconnect_ARPROT;
  assign M00_AXI_arvalid = m00_couplers_to_axi_interconnect_ARVALID;
  assign M00_AXI_awaddr[39:0] = m00_couplers_to_axi_interconnect_AWADDR;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_interconnect_AWPROT;
  assign M00_AXI_awvalid = m00_couplers_to_axi_interconnect_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_interconnect_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_interconnect_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_interconnect_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[15:0] = m01_couplers_to_axi_interconnect_ARADDR;
  assign M01_AXI_arprot[2:0] = m01_couplers_to_axi_interconnect_ARPROT;
  assign M01_AXI_arvalid = m01_couplers_to_axi_interconnect_ARVALID;
  assign M01_AXI_awaddr[15:0] = m01_couplers_to_axi_interconnect_AWADDR;
  assign M01_AXI_awprot[2:0] = m01_couplers_to_axi_interconnect_AWPROT;
  assign M01_AXI_awvalid = m01_couplers_to_axi_interconnect_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_axi_interconnect_BREADY;
  assign M01_AXI_rready = m01_couplers_to_axi_interconnect_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_interconnect_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_interconnect_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_axi_interconnect_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[16:0] = m02_couplers_to_axi_interconnect_ARADDR;
  assign M02_AXI_arprot[2:0] = m02_couplers_to_axi_interconnect_ARPROT;
  assign M02_AXI_arvalid = m02_couplers_to_axi_interconnect_ARVALID;
  assign M02_AXI_awaddr[16:0] = m02_couplers_to_axi_interconnect_AWADDR;
  assign M02_AXI_awprot[2:0] = m02_couplers_to_axi_interconnect_AWPROT;
  assign M02_AXI_awvalid = m02_couplers_to_axi_interconnect_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_axi_interconnect_BREADY;
  assign M02_AXI_rready = m02_couplers_to_axi_interconnect_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_axi_interconnect_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_axi_interconnect_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_axi_interconnect_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN;
  assign M03_AXI_araddr = m03_couplers_to_axi_interconnect_ARADDR;
  assign M03_AXI_arburst = m03_couplers_to_axi_interconnect_ARBURST;
  assign M03_AXI_arcache = m03_couplers_to_axi_interconnect_ARCACHE;
  assign M03_AXI_arlen = m03_couplers_to_axi_interconnect_ARLEN;
  assign M03_AXI_arlock = m03_couplers_to_axi_interconnect_ARLOCK;
  assign M03_AXI_arprot = m03_couplers_to_axi_interconnect_ARPROT;
  assign M03_AXI_arqos = m03_couplers_to_axi_interconnect_ARQOS;
  assign M03_AXI_arregion = m03_couplers_to_axi_interconnect_ARREGION;
  assign M03_AXI_arsize = m03_couplers_to_axi_interconnect_ARSIZE;
  assign M03_AXI_arvalid = m03_couplers_to_axi_interconnect_ARVALID;
  assign M03_AXI_awaddr = m03_couplers_to_axi_interconnect_AWADDR;
  assign M03_AXI_awburst = m03_couplers_to_axi_interconnect_AWBURST;
  assign M03_AXI_awcache = m03_couplers_to_axi_interconnect_AWCACHE;
  assign M03_AXI_awlen = m03_couplers_to_axi_interconnect_AWLEN;
  assign M03_AXI_awlock = m03_couplers_to_axi_interconnect_AWLOCK;
  assign M03_AXI_awprot = m03_couplers_to_axi_interconnect_AWPROT;
  assign M03_AXI_awqos = m03_couplers_to_axi_interconnect_AWQOS;
  assign M03_AXI_awregion = m03_couplers_to_axi_interconnect_AWREGION;
  assign M03_AXI_awsize = m03_couplers_to_axi_interconnect_AWSIZE;
  assign M03_AXI_awvalid = m03_couplers_to_axi_interconnect_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_axi_interconnect_BREADY;
  assign M03_AXI_rready = m03_couplers_to_axi_interconnect_RREADY;
  assign M03_AXI_wdata = m03_couplers_to_axi_interconnect_WDATA;
  assign M03_AXI_wlast = m03_couplers_to_axi_interconnect_WLAST;
  assign M03_AXI_wstrb = m03_couplers_to_axi_interconnect_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_axi_interconnect_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN;
  assign M04_AXI_araddr[39:0] = m04_couplers_to_axi_interconnect_ARADDR;
  assign M04_AXI_arvalid = m04_couplers_to_axi_interconnect_ARVALID;
  assign M04_AXI_awaddr[39:0] = m04_couplers_to_axi_interconnect_AWADDR;
  assign M04_AXI_awvalid = m04_couplers_to_axi_interconnect_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_axi_interconnect_BREADY;
  assign M04_AXI_rready = m04_couplers_to_axi_interconnect_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_axi_interconnect_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_axi_interconnect_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_axi_interconnect_WVALID;
  assign M05_ACLK_1 = M05_ACLK;
  assign M05_ARESETN_1 = M05_ARESETN;
  assign M05_AXI_araddr[39:0] = m05_couplers_to_axi_interconnect_ARADDR;
  assign M05_AXI_arvalid = m05_couplers_to_axi_interconnect_ARVALID;
  assign M05_AXI_awaddr[39:0] = m05_couplers_to_axi_interconnect_AWADDR;
  assign M05_AXI_awvalid = m05_couplers_to_axi_interconnect_AWVALID;
  assign M05_AXI_bready = m05_couplers_to_axi_interconnect_BREADY;
  assign M05_AXI_rready = m05_couplers_to_axi_interconnect_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_axi_interconnect_WDATA;
  assign M05_AXI_wstrb[3:0] = m05_couplers_to_axi_interconnect_WSTRB;
  assign M05_AXI_wvalid = m05_couplers_to_axi_interconnect_WVALID;
  assign M06_ACLK_1 = M06_ACLK;
  assign M06_ARESETN_1 = M06_ARESETN;
  assign M06_AXI_araddr[39:0] = m06_couplers_to_axi_interconnect_ARADDR;
  assign M06_AXI_arburst[1:0] = m06_couplers_to_axi_interconnect_ARBURST;
  assign M06_AXI_arcache[3:0] = m06_couplers_to_axi_interconnect_ARCACHE;
  assign M06_AXI_arid[15:0] = m06_couplers_to_axi_interconnect_ARID;
  assign M06_AXI_arlen[7:0] = m06_couplers_to_axi_interconnect_ARLEN;
  assign M06_AXI_arlock[0] = m06_couplers_to_axi_interconnect_ARLOCK;
  assign M06_AXI_arprot[2:0] = m06_couplers_to_axi_interconnect_ARPROT;
  assign M06_AXI_arqos[3:0] = m06_couplers_to_axi_interconnect_ARQOS;
  assign M06_AXI_arregion[3:0] = m06_couplers_to_axi_interconnect_ARREGION;
  assign M06_AXI_arsize[2:0] = m06_couplers_to_axi_interconnect_ARSIZE;
  assign M06_AXI_arvalid[0] = m06_couplers_to_axi_interconnect_ARVALID;
  assign M06_AXI_awaddr[39:0] = m06_couplers_to_axi_interconnect_AWADDR;
  assign M06_AXI_awburst[1:0] = m06_couplers_to_axi_interconnect_AWBURST;
  assign M06_AXI_awcache[3:0] = m06_couplers_to_axi_interconnect_AWCACHE;
  assign M06_AXI_awid[15:0] = m06_couplers_to_axi_interconnect_AWID;
  assign M06_AXI_awlen[7:0] = m06_couplers_to_axi_interconnect_AWLEN;
  assign M06_AXI_awlock[0] = m06_couplers_to_axi_interconnect_AWLOCK;
  assign M06_AXI_awprot[2:0] = m06_couplers_to_axi_interconnect_AWPROT;
  assign M06_AXI_awqos[3:0] = m06_couplers_to_axi_interconnect_AWQOS;
  assign M06_AXI_awregion[3:0] = m06_couplers_to_axi_interconnect_AWREGION;
  assign M06_AXI_awsize[2:0] = m06_couplers_to_axi_interconnect_AWSIZE;
  assign M06_AXI_awvalid[0] = m06_couplers_to_axi_interconnect_AWVALID;
  assign M06_AXI_bready[0] = m06_couplers_to_axi_interconnect_BREADY;
  assign M06_AXI_rready[0] = m06_couplers_to_axi_interconnect_RREADY;
  assign M06_AXI_wdata[31:0] = m06_couplers_to_axi_interconnect_WDATA;
  assign M06_AXI_wlast[0] = m06_couplers_to_axi_interconnect_WLAST;
  assign M06_AXI_wstrb[3:0] = m06_couplers_to_axi_interconnect_WSTRB;
  assign M06_AXI_wvalid[0] = m06_couplers_to_axi_interconnect_WVALID;
  assign M07_ACLK_1 = M07_ACLK;
  assign M07_ARESETN_1 = M07_ARESETN;
  assign M07_AXI_araddr = m07_couplers_to_axi_interconnect_ARADDR;
  assign M07_AXI_arburst = m07_couplers_to_axi_interconnect_ARBURST;
  assign M07_AXI_arcache = m07_couplers_to_axi_interconnect_ARCACHE;
  assign M07_AXI_arlen = m07_couplers_to_axi_interconnect_ARLEN;
  assign M07_AXI_arlock = m07_couplers_to_axi_interconnect_ARLOCK;
  assign M07_AXI_arprot = m07_couplers_to_axi_interconnect_ARPROT;
  assign M07_AXI_arqos = m07_couplers_to_axi_interconnect_ARQOS;
  assign M07_AXI_arregion = m07_couplers_to_axi_interconnect_ARREGION;
  assign M07_AXI_arsize = m07_couplers_to_axi_interconnect_ARSIZE;
  assign M07_AXI_arvalid = m07_couplers_to_axi_interconnect_ARVALID;
  assign M07_AXI_awaddr = m07_couplers_to_axi_interconnect_AWADDR;
  assign M07_AXI_awburst = m07_couplers_to_axi_interconnect_AWBURST;
  assign M07_AXI_awcache = m07_couplers_to_axi_interconnect_AWCACHE;
  assign M07_AXI_awlen = m07_couplers_to_axi_interconnect_AWLEN;
  assign M07_AXI_awlock = m07_couplers_to_axi_interconnect_AWLOCK;
  assign M07_AXI_awprot = m07_couplers_to_axi_interconnect_AWPROT;
  assign M07_AXI_awqos = m07_couplers_to_axi_interconnect_AWQOS;
  assign M07_AXI_awregion = m07_couplers_to_axi_interconnect_AWREGION;
  assign M07_AXI_awsize = m07_couplers_to_axi_interconnect_AWSIZE;
  assign M07_AXI_awvalid = m07_couplers_to_axi_interconnect_AWVALID;
  assign M07_AXI_bready = m07_couplers_to_axi_interconnect_BREADY;
  assign M07_AXI_rready = m07_couplers_to_axi_interconnect_RREADY;
  assign M07_AXI_wdata = m07_couplers_to_axi_interconnect_WDATA;
  assign M07_AXI_wlast = m07_couplers_to_axi_interconnect_WLAST;
  assign M07_AXI_wstrb = m07_couplers_to_axi_interconnect_WSTRB;
  assign M07_AXI_wvalid = m07_couplers_to_axi_interconnect_WVALID;
  assign M08_ACLK_1 = M08_ACLK;
  assign M08_ARESETN_1 = M08_ARESETN;
  assign M08_AXI_araddr[39:0] = m08_couplers_to_axi_interconnect_ARADDR;
  assign M08_AXI_arvalid = m08_couplers_to_axi_interconnect_ARVALID;
  assign M08_AXI_awaddr[39:0] = m08_couplers_to_axi_interconnect_AWADDR;
  assign M08_AXI_awvalid = m08_couplers_to_axi_interconnect_AWVALID;
  assign M08_AXI_bready = m08_couplers_to_axi_interconnect_BREADY;
  assign M08_AXI_rready = m08_couplers_to_axi_interconnect_RREADY;
  assign M08_AXI_wdata[31:0] = m08_couplers_to_axi_interconnect_WDATA;
  assign M08_AXI_wstrb[3:0] = m08_couplers_to_axi_interconnect_WSTRB;
  assign M08_AXI_wvalid = m08_couplers_to_axi_interconnect_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[15:0] = axi_interconnect_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rid[15:0] = axi_interconnect_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_to_s00_couplers_WREADY;
  assign axi_interconnect_ACLK_net = ACLK;
  assign axi_interconnect_ARESETN_net = ARESETN;
  assign axi_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[39:0];
  assign axi_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_to_s00_couplers_ARID = S00_AXI_arid[15:0];
  assign axi_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_interconnect_to_s00_couplers_ARLOCK = S00_AXI_arlock;
  assign axi_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_to_s00_couplers_ARUSER = S00_AXI_aruser[15:0];
  assign axi_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[39:0];
  assign axi_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_to_s00_couplers_AWID = S00_AXI_awid[15:0];
  assign axi_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign axi_interconnect_to_s00_couplers_AWLOCK = S00_AXI_awlock;
  assign axi_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_to_s00_couplers_AWUSER = S00_AXI_awuser[15:0];
  assign axi_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign m00_couplers_to_axi_interconnect_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_interconnect_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_interconnect_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_interconnect_WREADY = M00_AXI_wready;
  assign m01_couplers_to_axi_interconnect_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_axi_interconnect_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_axi_interconnect_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_interconnect_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_axi_interconnect_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_interconnect_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_interconnect_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_axi_interconnect_WREADY = M01_AXI_wready;
  assign m02_couplers_to_axi_interconnect_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_axi_interconnect_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_axi_interconnect_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_axi_interconnect_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_axi_interconnect_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_axi_interconnect_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_axi_interconnect_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_axi_interconnect_WREADY = M02_AXI_wready;
  assign m03_couplers_to_axi_interconnect_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_axi_interconnect_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_axi_interconnect_BRESP = M03_AXI_bresp;
  assign m03_couplers_to_axi_interconnect_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_axi_interconnect_RDATA = M03_AXI_rdata;
  assign m03_couplers_to_axi_interconnect_RLAST = M03_AXI_rlast;
  assign m03_couplers_to_axi_interconnect_RRESP = M03_AXI_rresp;
  assign m03_couplers_to_axi_interconnect_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_axi_interconnect_WREADY = M03_AXI_wready;
  assign m04_couplers_to_axi_interconnect_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_axi_interconnect_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_axi_interconnect_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_axi_interconnect_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_axi_interconnect_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_axi_interconnect_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_axi_interconnect_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_axi_interconnect_WREADY = M04_AXI_wready;
  assign m05_couplers_to_axi_interconnect_ARREADY = M05_AXI_arready;
  assign m05_couplers_to_axi_interconnect_AWREADY = M05_AXI_awready;
  assign m05_couplers_to_axi_interconnect_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_axi_interconnect_BVALID = M05_AXI_bvalid;
  assign m05_couplers_to_axi_interconnect_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_axi_interconnect_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_axi_interconnect_RVALID = M05_AXI_rvalid;
  assign m05_couplers_to_axi_interconnect_WREADY = M05_AXI_wready;
  assign m06_couplers_to_axi_interconnect_ARREADY = M06_AXI_arready[0];
  assign m06_couplers_to_axi_interconnect_AWREADY = M06_AXI_awready[0];
  assign m06_couplers_to_axi_interconnect_BID = M06_AXI_bid[15:0];
  assign m06_couplers_to_axi_interconnect_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_axi_interconnect_BVALID = M06_AXI_bvalid[0];
  assign m06_couplers_to_axi_interconnect_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_axi_interconnect_RID = M06_AXI_rid[15:0];
  assign m06_couplers_to_axi_interconnect_RLAST = M06_AXI_rlast[0];
  assign m06_couplers_to_axi_interconnect_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_axi_interconnect_RVALID = M06_AXI_rvalid[0];
  assign m06_couplers_to_axi_interconnect_WREADY = M06_AXI_wready[0];
  assign m07_couplers_to_axi_interconnect_ARREADY = M07_AXI_arready;
  assign m07_couplers_to_axi_interconnect_AWREADY = M07_AXI_awready;
  assign m07_couplers_to_axi_interconnect_BRESP = M07_AXI_bresp;
  assign m07_couplers_to_axi_interconnect_BVALID = M07_AXI_bvalid;
  assign m07_couplers_to_axi_interconnect_RDATA = M07_AXI_rdata;
  assign m07_couplers_to_axi_interconnect_RLAST = M07_AXI_rlast;
  assign m07_couplers_to_axi_interconnect_RRESP = M07_AXI_rresp;
  assign m07_couplers_to_axi_interconnect_RVALID = M07_AXI_rvalid;
  assign m07_couplers_to_axi_interconnect_WREADY = M07_AXI_wready;
  assign m08_couplers_to_axi_interconnect_ARREADY = M08_AXI_arready;
  assign m08_couplers_to_axi_interconnect_AWREADY = M08_AXI_awready;
  assign m08_couplers_to_axi_interconnect_BRESP = M08_AXI_bresp[1:0];
  assign m08_couplers_to_axi_interconnect_BVALID = M08_AXI_bvalid;
  assign m08_couplers_to_axi_interconnect_RDATA = M08_AXI_rdata[31:0];
  assign m08_couplers_to_axi_interconnect_RRESP = M08_AXI_rresp[1:0];
  assign m08_couplers_to_axi_interconnect_RVALID = M08_AXI_rvalid;
  assign m08_couplers_to_axi_interconnect_WREADY = M08_AXI_wready;
  m00_couplers_imp_JE2YXQ m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m00_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m00_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1XY4IIE m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m01_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m01_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m01_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m01_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m01_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m01_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m01_couplers_ARID),
        .S_AXI_arlen(xbar_to_m01_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m01_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m01_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m01_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m01_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m01_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m01_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m01_couplers_AWID),
        .S_AXI_awlen(xbar_to_m01_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m01_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m01_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m01_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m01_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m01_couplers_BID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rid(xbar_to_m01_couplers_RID),
        .S_AXI_rlast(xbar_to_m01_couplers_RLAST),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m01_couplers_WLAST),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1TVAK0F m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m02_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m02_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m02_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m02_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m02_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m02_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m02_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m02_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m02_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m02_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m02_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m02_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m02_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m02_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m02_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m02_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m02_couplers_ARID),
        .S_AXI_arlen(xbar_to_m02_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m02_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m02_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m02_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m02_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m02_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m02_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m02_couplers_AWID),
        .S_AXI_awlen(xbar_to_m02_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m02_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m02_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m02_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m02_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m02_couplers_BID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rid(xbar_to_m02_couplers_RID),
        .S_AXI_rlast(xbar_to_m02_couplers_RLAST),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m02_couplers_WLAST),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_NH8ILJ m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arburst(m03_couplers_to_axi_interconnect_ARBURST),
        .M_AXI_arcache(m03_couplers_to_axi_interconnect_ARCACHE),
        .M_AXI_arlen(m03_couplers_to_axi_interconnect_ARLEN),
        .M_AXI_arlock(m03_couplers_to_axi_interconnect_ARLOCK),
        .M_AXI_arprot(m03_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arqos(m03_couplers_to_axi_interconnect_ARQOS),
        .M_AXI_arready(m03_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arregion(m03_couplers_to_axi_interconnect_ARREGION),
        .M_AXI_arsize(m03_couplers_to_axi_interconnect_ARSIZE),
        .M_AXI_arvalid(m03_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awburst(m03_couplers_to_axi_interconnect_AWBURST),
        .M_AXI_awcache(m03_couplers_to_axi_interconnect_AWCACHE),
        .M_AXI_awlen(m03_couplers_to_axi_interconnect_AWLEN),
        .M_AXI_awlock(m03_couplers_to_axi_interconnect_AWLOCK),
        .M_AXI_awprot(m03_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awqos(m03_couplers_to_axi_interconnect_AWQOS),
        .M_AXI_awready(m03_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awregion(m03_couplers_to_axi_interconnect_AWREGION),
        .M_AXI_awsize(m03_couplers_to_axi_interconnect_AWSIZE),
        .M_AXI_awvalid(m03_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m03_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m03_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m03_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m03_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rlast(m03_couplers_to_axi_interconnect_RLAST),
        .M_AXI_rready(m03_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m03_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m03_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m03_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wlast(m03_couplers_to_axi_interconnect_WLAST),
        .M_AXI_wready(m03_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m03_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR[120]),
        .S_AXI_arburst(xbar_to_m03_couplers_ARBURST[6]),
        .S_AXI_arcache(xbar_to_m03_couplers_ARCACHE[12]),
        .S_AXI_arlen(xbar_to_m03_couplers_ARLEN[24]),
        .S_AXI_arlock(xbar_to_m03_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m03_couplers_ARPROT[9]),
        .S_AXI_arqos(xbar_to_m03_couplers_ARQOS[12]),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m03_couplers_ARREGION[12]),
        .S_AXI_arsize(xbar_to_m03_couplers_ARSIZE[9]),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR[120]),
        .S_AXI_awburst(xbar_to_m03_couplers_AWBURST[6]),
        .S_AXI_awcache(xbar_to_m03_couplers_AWCACHE[12]),
        .S_AXI_awlen(xbar_to_m03_couplers_AWLEN[24]),
        .S_AXI_awlock(xbar_to_m03_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m03_couplers_AWPROT[9]),
        .S_AXI_awqos(xbar_to_m03_couplers_AWQOS[12]),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m03_couplers_AWREGION[12]),
        .S_AXI_awsize(xbar_to_m03_couplers_AWSIZE[9]),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rlast(xbar_to_m03_couplers_RLAST),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA[96]),
        .S_AXI_wlast(xbar_to_m03_couplers_WLAST),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB[12]),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_1LLVX31 m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arready(m04_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awready(m04_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m04_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m04_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m04_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m04_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m04_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m04_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m04_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m04_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m04_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m04_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m04_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m04_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m04_couplers_ARID),
        .S_AXI_arlen(xbar_to_m04_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m04_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m04_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m04_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m04_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m04_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m04_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m04_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m04_couplers_AWID),
        .S_AXI_awlen(xbar_to_m04_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m04_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m04_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m04_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m04_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m04_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m04_couplers_BID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rid(xbar_to_m04_couplers_RID),
        .S_AXI_rlast(xbar_to_m04_couplers_RLAST),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m04_couplers_WLAST),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_WULHHX m05_couplers
       (.M_ACLK(M05_ACLK_1),
        .M_ARESETN(M05_ARESETN_1),
        .M_AXI_araddr(m05_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arready(m05_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awready(m05_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m05_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m05_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m05_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m05_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m05_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m05_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m05_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m05_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m05_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m05_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m05_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m05_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m05_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m05_couplers_ARID),
        .S_AXI_arlen(xbar_to_m05_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m05_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m05_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m05_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m05_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m05_couplers_ARSIZE),
        .S_AXI_aruser(xbar_to_m05_couplers_ARUSER),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m05_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m05_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m05_couplers_AWID),
        .S_AXI_awlen(xbar_to_m05_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m05_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m05_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m05_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m05_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m05_couplers_AWSIZE),
        .S_AXI_awuser(xbar_to_m05_couplers_AWUSER),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m05_couplers_BID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rid(xbar_to_m05_couplers_RID),
        .S_AXI_rlast(xbar_to_m05_couplers_RLAST),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m05_couplers_WLAST),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_SLUD9O m06_couplers
       (.M_ACLK(M06_ACLK_1),
        .M_ARESETN(M06_ARESETN_1),
        .M_AXI_araddr(m06_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arburst(m06_couplers_to_axi_interconnect_ARBURST),
        .M_AXI_arcache(m06_couplers_to_axi_interconnect_ARCACHE),
        .M_AXI_arid(m06_couplers_to_axi_interconnect_ARID),
        .M_AXI_arlen(m06_couplers_to_axi_interconnect_ARLEN),
        .M_AXI_arlock(m06_couplers_to_axi_interconnect_ARLOCK),
        .M_AXI_arprot(m06_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arqos(m06_couplers_to_axi_interconnect_ARQOS),
        .M_AXI_arready(m06_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arregion(m06_couplers_to_axi_interconnect_ARREGION),
        .M_AXI_arsize(m06_couplers_to_axi_interconnect_ARSIZE),
        .M_AXI_arvalid(m06_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awburst(m06_couplers_to_axi_interconnect_AWBURST),
        .M_AXI_awcache(m06_couplers_to_axi_interconnect_AWCACHE),
        .M_AXI_awid(m06_couplers_to_axi_interconnect_AWID),
        .M_AXI_awlen(m06_couplers_to_axi_interconnect_AWLEN),
        .M_AXI_awlock(m06_couplers_to_axi_interconnect_AWLOCK),
        .M_AXI_awprot(m06_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awqos(m06_couplers_to_axi_interconnect_AWQOS),
        .M_AXI_awready(m06_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awregion(m06_couplers_to_axi_interconnect_AWREGION),
        .M_AXI_awsize(m06_couplers_to_axi_interconnect_AWSIZE),
        .M_AXI_awvalid(m06_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bid(m06_couplers_to_axi_interconnect_BID),
        .M_AXI_bready(m06_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m06_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m06_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m06_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rid(m06_couplers_to_axi_interconnect_RID),
        .M_AXI_rlast(m06_couplers_to_axi_interconnect_RLAST),
        .M_AXI_rready(m06_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m06_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m06_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m06_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wlast(m06_couplers_to_axi_interconnect_WLAST),
        .M_AXI_wready(m06_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m06_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m06_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m06_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m06_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m06_couplers_ARID),
        .S_AXI_arlen(xbar_to_m06_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m06_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m06_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m06_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m06_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m06_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m06_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m06_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m06_couplers_AWID),
        .S_AXI_awlen(xbar_to_m06_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m06_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m06_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m06_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m06_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m06_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m06_couplers_BID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rid(xbar_to_m06_couplers_RID),
        .S_AXI_rlast(xbar_to_m06_couplers_RLAST),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m06_couplers_WLAST),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  m07_couplers_imp_1PUBG3O m07_couplers
       (.M_ACLK(M07_ACLK_1),
        .M_ARESETN(M07_ARESETN_1),
        .M_AXI_araddr(m07_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arburst(m07_couplers_to_axi_interconnect_ARBURST),
        .M_AXI_arcache(m07_couplers_to_axi_interconnect_ARCACHE),
        .M_AXI_arlen(m07_couplers_to_axi_interconnect_ARLEN),
        .M_AXI_arlock(m07_couplers_to_axi_interconnect_ARLOCK),
        .M_AXI_arprot(m07_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arqos(m07_couplers_to_axi_interconnect_ARQOS),
        .M_AXI_arready(m07_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arregion(m07_couplers_to_axi_interconnect_ARREGION),
        .M_AXI_arsize(m07_couplers_to_axi_interconnect_ARSIZE),
        .M_AXI_arvalid(m07_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m07_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awburst(m07_couplers_to_axi_interconnect_AWBURST),
        .M_AXI_awcache(m07_couplers_to_axi_interconnect_AWCACHE),
        .M_AXI_awlen(m07_couplers_to_axi_interconnect_AWLEN),
        .M_AXI_awlock(m07_couplers_to_axi_interconnect_AWLOCK),
        .M_AXI_awprot(m07_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awqos(m07_couplers_to_axi_interconnect_AWQOS),
        .M_AXI_awready(m07_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awregion(m07_couplers_to_axi_interconnect_AWREGION),
        .M_AXI_awsize(m07_couplers_to_axi_interconnect_AWSIZE),
        .M_AXI_awvalid(m07_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m07_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m07_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m07_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m07_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rlast(m07_couplers_to_axi_interconnect_RLAST),
        .M_AXI_rready(m07_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m07_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m07_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m07_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wlast(m07_couplers_to_axi_interconnect_WLAST),
        .M_AXI_wready(m07_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m07_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m07_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m07_couplers_ARADDR[280]),
        .S_AXI_arburst(xbar_to_m07_couplers_ARBURST[14]),
        .S_AXI_arcache(xbar_to_m07_couplers_ARCACHE[28]),
        .S_AXI_arlen(xbar_to_m07_couplers_ARLEN[56]),
        .S_AXI_arlock(xbar_to_m07_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m07_couplers_ARPROT[21]),
        .S_AXI_arqos(xbar_to_m07_couplers_ARQOS[28]),
        .S_AXI_arready(xbar_to_m07_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m07_couplers_ARREGION[28]),
        .S_AXI_arsize(xbar_to_m07_couplers_ARSIZE[21]),
        .S_AXI_arvalid(xbar_to_m07_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m07_couplers_AWADDR[280]),
        .S_AXI_awburst(xbar_to_m07_couplers_AWBURST[14]),
        .S_AXI_awcache(xbar_to_m07_couplers_AWCACHE[28]),
        .S_AXI_awlen(xbar_to_m07_couplers_AWLEN[56]),
        .S_AXI_awlock(xbar_to_m07_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m07_couplers_AWPROT[21]),
        .S_AXI_awqos(xbar_to_m07_couplers_AWQOS[28]),
        .S_AXI_awready(xbar_to_m07_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m07_couplers_AWREGION[28]),
        .S_AXI_awsize(xbar_to_m07_couplers_AWSIZE[21]),
        .S_AXI_awvalid(xbar_to_m07_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m07_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m07_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m07_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m07_couplers_RDATA),
        .S_AXI_rlast(xbar_to_m07_couplers_RLAST),
        .S_AXI_rready(xbar_to_m07_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m07_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m07_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m07_couplers_WDATA[224]),
        .S_AXI_wlast(xbar_to_m07_couplers_WLAST),
        .S_AXI_wready(xbar_to_m07_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m07_couplers_WSTRB[28]),
        .S_AXI_wvalid(xbar_to_m07_couplers_WVALID));
  m08_couplers_imp_12EM2FT m08_couplers
       (.M_ACLK(M08_ACLK_1),
        .M_ARESETN(M08_ARESETN_1),
        .M_AXI_araddr(m08_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arready(m08_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m08_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m08_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awready(m08_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m08_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m08_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m08_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m08_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m08_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m08_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m08_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m08_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m08_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m08_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m08_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m08_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m08_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m08_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m08_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m08_couplers_ARID),
        .S_AXI_arlen(xbar_to_m08_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m08_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m08_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m08_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m08_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m08_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m08_couplers_ARSIZE),
        .S_AXI_aruser(xbar_to_m08_couplers_ARUSER),
        .S_AXI_arvalid(xbar_to_m08_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m08_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m08_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m08_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m08_couplers_AWID),
        .S_AXI_awlen(xbar_to_m08_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m08_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m08_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m08_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m08_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m08_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m08_couplers_AWSIZE),
        .S_AXI_awuser(xbar_to_m08_couplers_AWUSER),
        .S_AXI_awvalid(xbar_to_m08_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m08_couplers_BID),
        .S_AXI_bready(xbar_to_m08_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m08_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m08_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m08_couplers_RDATA),
        .S_AXI_rid(xbar_to_m08_couplers_RID),
        .S_AXI_rlast(xbar_to_m08_couplers_RLAST),
        .S_AXI_rready(xbar_to_m08_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m08_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m08_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m08_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m08_couplers_WLAST),
        .S_AXI_wready(xbar_to_m08_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m08_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m08_couplers_WVALID));
  s00_couplers_imp_5FNMWL s00_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arid(s00_couplers_to_xbar_ARID),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_aruser(s00_couplers_to_xbar_ARUSER),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s00_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s00_couplers_to_xbar_AWCACHE),
        .M_AXI_awid(s00_couplers_to_xbar_AWID),
        .M_AXI_awlen(s00_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s00_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s00_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s00_couplers_to_xbar_AWSIZE),
        .M_AXI_awuser(s00_couplers_to_xbar_AWUSER),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bid(s00_couplers_to_xbar_BID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rid(s00_couplers_to_xbar_RID),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s00_couplers_to_xbar_WLAST),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_aruser(axi_interconnect_to_s00_couplers_ARUSER),
        .S_AXI_arvalid(axi_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awuser(axi_interconnect_to_s00_couplers_AWUSER),
        .S_AXI_awvalid(axi_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wlast(axi_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_to_s00_couplers_WVALID));
  exdes_xbar_1 xbar
       (.aclk(axi_interconnect_ACLK_net),
        .aresetn(axi_interconnect_ARESETN_net),
        .m_axi_araddr({xbar_to_m08_couplers_ARADDR,xbar_to_m07_couplers_ARADDR,xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arburst({xbar_to_m08_couplers_ARBURST,xbar_to_m07_couplers_ARBURST,xbar_to_m06_couplers_ARBURST,xbar_to_m05_couplers_ARBURST,xbar_to_m04_couplers_ARBURST,xbar_to_m03_couplers_ARBURST,xbar_to_m02_couplers_ARBURST,xbar_to_m01_couplers_ARBURST,xbar_to_m00_couplers_ARBURST}),
        .m_axi_arcache({xbar_to_m08_couplers_ARCACHE,xbar_to_m07_couplers_ARCACHE,xbar_to_m06_couplers_ARCACHE,xbar_to_m05_couplers_ARCACHE,xbar_to_m04_couplers_ARCACHE,xbar_to_m03_couplers_ARCACHE,xbar_to_m02_couplers_ARCACHE,xbar_to_m01_couplers_ARCACHE,xbar_to_m00_couplers_ARCACHE}),
        .m_axi_arid({xbar_to_m08_couplers_ARID,NLW_xbar_m_axi_arid_UNCONNECTED[127:112],xbar_to_m06_couplers_ARID,xbar_to_m05_couplers_ARID,xbar_to_m04_couplers_ARID,NLW_xbar_m_axi_arid_UNCONNECTED[63:48],xbar_to_m02_couplers_ARID,xbar_to_m01_couplers_ARID,xbar_to_m00_couplers_ARID}),
        .m_axi_arlen({xbar_to_m08_couplers_ARLEN,xbar_to_m07_couplers_ARLEN,xbar_to_m06_couplers_ARLEN,xbar_to_m05_couplers_ARLEN,xbar_to_m04_couplers_ARLEN,xbar_to_m03_couplers_ARLEN,xbar_to_m02_couplers_ARLEN,xbar_to_m01_couplers_ARLEN,xbar_to_m00_couplers_ARLEN}),
        .m_axi_arlock({xbar_to_m08_couplers_ARLOCK,xbar_to_m07_couplers_ARLOCK,xbar_to_m06_couplers_ARLOCK,xbar_to_m05_couplers_ARLOCK,xbar_to_m04_couplers_ARLOCK,xbar_to_m03_couplers_ARLOCK,xbar_to_m02_couplers_ARLOCK,xbar_to_m01_couplers_ARLOCK,xbar_to_m00_couplers_ARLOCK}),
        .m_axi_arprot({xbar_to_m08_couplers_ARPROT,xbar_to_m07_couplers_ARPROT,xbar_to_m06_couplers_ARPROT,xbar_to_m05_couplers_ARPROT,xbar_to_m04_couplers_ARPROT,xbar_to_m03_couplers_ARPROT,xbar_to_m02_couplers_ARPROT,xbar_to_m01_couplers_ARPROT,xbar_to_m00_couplers_ARPROT}),
        .m_axi_arqos({xbar_to_m08_couplers_ARQOS,xbar_to_m07_couplers_ARQOS,xbar_to_m06_couplers_ARQOS,xbar_to_m05_couplers_ARQOS,xbar_to_m04_couplers_ARQOS,xbar_to_m03_couplers_ARQOS,xbar_to_m02_couplers_ARQOS,xbar_to_m01_couplers_ARQOS,xbar_to_m00_couplers_ARQOS}),
        .m_axi_arready({xbar_to_m08_couplers_ARREADY,xbar_to_m07_couplers_ARREADY,xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arregion({xbar_to_m08_couplers_ARREGION,xbar_to_m07_couplers_ARREGION,xbar_to_m06_couplers_ARREGION,xbar_to_m05_couplers_ARREGION,xbar_to_m04_couplers_ARREGION,xbar_to_m03_couplers_ARREGION,xbar_to_m02_couplers_ARREGION,xbar_to_m01_couplers_ARREGION,xbar_to_m00_couplers_ARREGION}),
        .m_axi_arsize({xbar_to_m08_couplers_ARSIZE,xbar_to_m07_couplers_ARSIZE,xbar_to_m06_couplers_ARSIZE,xbar_to_m05_couplers_ARSIZE,xbar_to_m04_couplers_ARSIZE,xbar_to_m03_couplers_ARSIZE,xbar_to_m02_couplers_ARSIZE,xbar_to_m01_couplers_ARSIZE,xbar_to_m00_couplers_ARSIZE}),
        .m_axi_aruser({xbar_to_m08_couplers_ARUSER,NLW_xbar_m_axi_aruser_UNCONNECTED[127:96],xbar_to_m05_couplers_ARUSER,NLW_xbar_m_axi_aruser_UNCONNECTED[79:0]}),
        .m_axi_arvalid({xbar_to_m08_couplers_ARVALID,xbar_to_m07_couplers_ARVALID,xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m08_couplers_AWADDR,xbar_to_m07_couplers_AWADDR,xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awburst({xbar_to_m08_couplers_AWBURST,xbar_to_m07_couplers_AWBURST,xbar_to_m06_couplers_AWBURST,xbar_to_m05_couplers_AWBURST,xbar_to_m04_couplers_AWBURST,xbar_to_m03_couplers_AWBURST,xbar_to_m02_couplers_AWBURST,xbar_to_m01_couplers_AWBURST,xbar_to_m00_couplers_AWBURST}),
        .m_axi_awcache({xbar_to_m08_couplers_AWCACHE,xbar_to_m07_couplers_AWCACHE,xbar_to_m06_couplers_AWCACHE,xbar_to_m05_couplers_AWCACHE,xbar_to_m04_couplers_AWCACHE,xbar_to_m03_couplers_AWCACHE,xbar_to_m02_couplers_AWCACHE,xbar_to_m01_couplers_AWCACHE,xbar_to_m00_couplers_AWCACHE}),
        .m_axi_awid({xbar_to_m08_couplers_AWID,NLW_xbar_m_axi_awid_UNCONNECTED[127:112],xbar_to_m06_couplers_AWID,xbar_to_m05_couplers_AWID,xbar_to_m04_couplers_AWID,NLW_xbar_m_axi_awid_UNCONNECTED[63:48],xbar_to_m02_couplers_AWID,xbar_to_m01_couplers_AWID,xbar_to_m00_couplers_AWID}),
        .m_axi_awlen({xbar_to_m08_couplers_AWLEN,xbar_to_m07_couplers_AWLEN,xbar_to_m06_couplers_AWLEN,xbar_to_m05_couplers_AWLEN,xbar_to_m04_couplers_AWLEN,xbar_to_m03_couplers_AWLEN,xbar_to_m02_couplers_AWLEN,xbar_to_m01_couplers_AWLEN,xbar_to_m00_couplers_AWLEN}),
        .m_axi_awlock({xbar_to_m08_couplers_AWLOCK,xbar_to_m07_couplers_AWLOCK,xbar_to_m06_couplers_AWLOCK,xbar_to_m05_couplers_AWLOCK,xbar_to_m04_couplers_AWLOCK,xbar_to_m03_couplers_AWLOCK,xbar_to_m02_couplers_AWLOCK,xbar_to_m01_couplers_AWLOCK,xbar_to_m00_couplers_AWLOCK}),
        .m_axi_awprot({xbar_to_m08_couplers_AWPROT,xbar_to_m07_couplers_AWPROT,xbar_to_m06_couplers_AWPROT,xbar_to_m05_couplers_AWPROT,xbar_to_m04_couplers_AWPROT,xbar_to_m03_couplers_AWPROT,xbar_to_m02_couplers_AWPROT,xbar_to_m01_couplers_AWPROT,xbar_to_m00_couplers_AWPROT}),
        .m_axi_awqos({xbar_to_m08_couplers_AWQOS,xbar_to_m07_couplers_AWQOS,xbar_to_m06_couplers_AWQOS,xbar_to_m05_couplers_AWQOS,xbar_to_m04_couplers_AWQOS,xbar_to_m03_couplers_AWQOS,xbar_to_m02_couplers_AWQOS,xbar_to_m01_couplers_AWQOS,xbar_to_m00_couplers_AWQOS}),
        .m_axi_awready({xbar_to_m08_couplers_AWREADY,xbar_to_m07_couplers_AWREADY,xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awregion({xbar_to_m08_couplers_AWREGION,xbar_to_m07_couplers_AWREGION,xbar_to_m06_couplers_AWREGION,xbar_to_m05_couplers_AWREGION,xbar_to_m04_couplers_AWREGION,xbar_to_m03_couplers_AWREGION,xbar_to_m02_couplers_AWREGION,xbar_to_m01_couplers_AWREGION,xbar_to_m00_couplers_AWREGION}),
        .m_axi_awsize({xbar_to_m08_couplers_AWSIZE,xbar_to_m07_couplers_AWSIZE,xbar_to_m06_couplers_AWSIZE,xbar_to_m05_couplers_AWSIZE,xbar_to_m04_couplers_AWSIZE,xbar_to_m03_couplers_AWSIZE,xbar_to_m02_couplers_AWSIZE,xbar_to_m01_couplers_AWSIZE,xbar_to_m00_couplers_AWSIZE}),
        .m_axi_awuser({xbar_to_m08_couplers_AWUSER,NLW_xbar_m_axi_awuser_UNCONNECTED[127:96],xbar_to_m05_couplers_AWUSER,NLW_xbar_m_axi_awuser_UNCONNECTED[79:0]}),
        .m_axi_awvalid({xbar_to_m08_couplers_AWVALID,xbar_to_m07_couplers_AWVALID,xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bid({xbar_to_m08_couplers_BID,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,xbar_to_m06_couplers_BID,xbar_to_m05_couplers_BID,xbar_to_m04_couplers_BID,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,xbar_to_m02_couplers_BID,xbar_to_m01_couplers_BID,xbar_to_m00_couplers_BID}),
        .m_axi_bready({xbar_to_m08_couplers_BREADY,xbar_to_m07_couplers_BREADY,xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m08_couplers_BRESP,xbar_to_m07_couplers_BRESP,xbar_to_m07_couplers_BRESP,xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m08_couplers_BVALID,xbar_to_m07_couplers_BVALID,xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m08_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rid({xbar_to_m08_couplers_RID,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,xbar_to_m06_couplers_RID,xbar_to_m05_couplers_RID,xbar_to_m04_couplers_RID,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,xbar_to_m02_couplers_RID,xbar_to_m01_couplers_RID,xbar_to_m00_couplers_RID}),
        .m_axi_rlast({xbar_to_m08_couplers_RLAST,xbar_to_m07_couplers_RLAST,xbar_to_m06_couplers_RLAST,xbar_to_m05_couplers_RLAST,xbar_to_m04_couplers_RLAST,xbar_to_m03_couplers_RLAST,xbar_to_m02_couplers_RLAST,xbar_to_m01_couplers_RLAST,xbar_to_m00_couplers_RLAST}),
        .m_axi_rready({xbar_to_m08_couplers_RREADY,xbar_to_m07_couplers_RREADY,xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m08_couplers_RRESP,xbar_to_m07_couplers_RRESP,xbar_to_m07_couplers_RRESP,xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m08_couplers_RVALID,xbar_to_m07_couplers_RVALID,xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m08_couplers_WDATA,xbar_to_m07_couplers_WDATA,xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wlast({xbar_to_m08_couplers_WLAST,xbar_to_m07_couplers_WLAST,xbar_to_m06_couplers_WLAST,xbar_to_m05_couplers_WLAST,xbar_to_m04_couplers_WLAST,xbar_to_m03_couplers_WLAST,xbar_to_m02_couplers_WLAST,xbar_to_m01_couplers_WLAST,xbar_to_m00_couplers_WLAST}),
        .m_axi_wready({xbar_to_m08_couplers_WREADY,xbar_to_m07_couplers_WREADY,xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m08_couplers_WSTRB,xbar_to_m07_couplers_WSTRB,xbar_to_m06_couplers_WSTRB,xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m08_couplers_WVALID,xbar_to_m07_couplers_WVALID,xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arburst(s00_couplers_to_xbar_ARBURST),
        .s_axi_arcache(s00_couplers_to_xbar_ARCACHE),
        .s_axi_arid(s00_couplers_to_xbar_ARID),
        .s_axi_arlen(s00_couplers_to_xbar_ARLEN),
        .s_axi_arlock(s00_couplers_to_xbar_ARLOCK),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arqos(s00_couplers_to_xbar_ARQOS),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize(s00_couplers_to_xbar_ARSIZE),
        .s_axi_aruser(s00_couplers_to_xbar_ARUSER),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awburst(s00_couplers_to_xbar_AWBURST),
        .s_axi_awcache(s00_couplers_to_xbar_AWCACHE),
        .s_axi_awid(s00_couplers_to_xbar_AWID),
        .s_axi_awlen(s00_couplers_to_xbar_AWLEN),
        .s_axi_awlock(s00_couplers_to_xbar_AWLOCK),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awqos(s00_couplers_to_xbar_AWQOS),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awsize(s00_couplers_to_xbar_AWSIZE),
        .s_axi_awuser(s00_couplers_to_xbar_AWUSER),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bid(s00_couplers_to_xbar_BID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rid(s00_couplers_to_xbar_RID),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wlast(s00_couplers_to_xbar_WLAST),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module m00_couplers_imp_5QVHE
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [2:0]m00_couplers_to_m00_couplers_ARPROT;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire [39:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [2:0]m00_couplers_to_m00_couplers_AWPROT;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m00_couplers_to_m00_couplers_ARPROT;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m00_couplers_to_m00_couplers_AWPROT;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m00_couplers_to_m00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m00_couplers_to_m00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m00_couplers_imp_JE2YXQ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [39:0]auto_pc_to_m00_couplers_ARADDR;
  wire [2:0]auto_pc_to_m00_couplers_ARPROT;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [39:0]auto_pc_to_m00_couplers_AWADDR;
  wire [2:0]auto_pc_to_m00_couplers_AWPROT;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [31:0]auto_pc_to_m00_couplers_RDATA;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [31:0]auto_pc_to_m00_couplers_WDATA;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [3:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [39:0]m00_couplers_to_auto_pc_ARADDR;
  wire [1:0]m00_couplers_to_auto_pc_ARBURST;
  wire [3:0]m00_couplers_to_auto_pc_ARCACHE;
  wire [15:0]m00_couplers_to_auto_pc_ARID;
  wire [7:0]m00_couplers_to_auto_pc_ARLEN;
  wire [0:0]m00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_pc_ARPROT;
  wire [3:0]m00_couplers_to_auto_pc_ARQOS;
  wire m00_couplers_to_auto_pc_ARREADY;
  wire [3:0]m00_couplers_to_auto_pc_ARREGION;
  wire [2:0]m00_couplers_to_auto_pc_ARSIZE;
  wire m00_couplers_to_auto_pc_ARVALID;
  wire [39:0]m00_couplers_to_auto_pc_AWADDR;
  wire [1:0]m00_couplers_to_auto_pc_AWBURST;
  wire [3:0]m00_couplers_to_auto_pc_AWCACHE;
  wire [15:0]m00_couplers_to_auto_pc_AWID;
  wire [7:0]m00_couplers_to_auto_pc_AWLEN;
  wire [0:0]m00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_pc_AWPROT;
  wire [3:0]m00_couplers_to_auto_pc_AWQOS;
  wire m00_couplers_to_auto_pc_AWREADY;
  wire [3:0]m00_couplers_to_auto_pc_AWREGION;
  wire [2:0]m00_couplers_to_auto_pc_AWSIZE;
  wire m00_couplers_to_auto_pc_AWVALID;
  wire [15:0]m00_couplers_to_auto_pc_BID;
  wire m00_couplers_to_auto_pc_BREADY;
  wire [1:0]m00_couplers_to_auto_pc_BRESP;
  wire m00_couplers_to_auto_pc_BVALID;
  wire [31:0]m00_couplers_to_auto_pc_RDATA;
  wire [15:0]m00_couplers_to_auto_pc_RID;
  wire m00_couplers_to_auto_pc_RLAST;
  wire m00_couplers_to_auto_pc_RREADY;
  wire [1:0]m00_couplers_to_auto_pc_RRESP;
  wire m00_couplers_to_auto_pc_RVALID;
  wire [31:0]m00_couplers_to_auto_pc_WDATA;
  wire m00_couplers_to_auto_pc_WLAST;
  wire m00_couplers_to_auto_pc_WREADY;
  wire [3:0]m00_couplers_to_auto_pc_WSTRB;
  wire m00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[39:0] = auto_pc_to_m00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_m00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = auto_pc_to_m00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_m00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[15:0] = m00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[15:0] = m00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[39:0];
  assign m00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_pc_ARID = S_AXI_arid[15:0];
  assign m00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[39:0];
  assign m00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_pc_AWID = S_AXI_awid[15:0];
  assign m00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  exdes_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_m00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_m00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_pc_BID),
        .s_axi_bready(m00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_pc_RID),
        .s_axi_rlast(m00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_pc_WVALID));
endmodule

module m01_couplers_imp_1FFZTVU
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]m01_couplers_to_m01_couplers_ARADDR;
  wire m01_couplers_to_m01_couplers_ARREADY;
  wire m01_couplers_to_m01_couplers_ARVALID;
  wire [39:0]m01_couplers_to_m01_couplers_AWADDR;
  wire m01_couplers_to_m01_couplers_AWREADY;
  wire m01_couplers_to_m01_couplers_AWVALID;
  wire m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid;
endmodule

module m01_couplers_imp_1XY4IIE
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [15:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [15:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [15:0]auto_pc_to_m01_couplers_ARADDR;
  wire [2:0]auto_pc_to_m01_couplers_ARPROT;
  wire auto_pc_to_m01_couplers_ARREADY;
  wire auto_pc_to_m01_couplers_ARVALID;
  wire [15:0]auto_pc_to_m01_couplers_AWADDR;
  wire [2:0]auto_pc_to_m01_couplers_AWPROT;
  wire auto_pc_to_m01_couplers_AWREADY;
  wire auto_pc_to_m01_couplers_AWVALID;
  wire auto_pc_to_m01_couplers_BREADY;
  wire [1:0]auto_pc_to_m01_couplers_BRESP;
  wire auto_pc_to_m01_couplers_BVALID;
  wire [31:0]auto_pc_to_m01_couplers_RDATA;
  wire auto_pc_to_m01_couplers_RREADY;
  wire [1:0]auto_pc_to_m01_couplers_RRESP;
  wire auto_pc_to_m01_couplers_RVALID;
  wire [31:0]auto_pc_to_m01_couplers_WDATA;
  wire auto_pc_to_m01_couplers_WREADY;
  wire [3:0]auto_pc_to_m01_couplers_WSTRB;
  wire auto_pc_to_m01_couplers_WVALID;
  wire [39:0]m01_couplers_to_auto_pc_ARADDR;
  wire [1:0]m01_couplers_to_auto_pc_ARBURST;
  wire [3:0]m01_couplers_to_auto_pc_ARCACHE;
  wire [15:0]m01_couplers_to_auto_pc_ARID;
  wire [7:0]m01_couplers_to_auto_pc_ARLEN;
  wire [0:0]m01_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m01_couplers_to_auto_pc_ARPROT;
  wire [3:0]m01_couplers_to_auto_pc_ARQOS;
  wire m01_couplers_to_auto_pc_ARREADY;
  wire [3:0]m01_couplers_to_auto_pc_ARREGION;
  wire [2:0]m01_couplers_to_auto_pc_ARSIZE;
  wire m01_couplers_to_auto_pc_ARVALID;
  wire [39:0]m01_couplers_to_auto_pc_AWADDR;
  wire [1:0]m01_couplers_to_auto_pc_AWBURST;
  wire [3:0]m01_couplers_to_auto_pc_AWCACHE;
  wire [15:0]m01_couplers_to_auto_pc_AWID;
  wire [7:0]m01_couplers_to_auto_pc_AWLEN;
  wire [0:0]m01_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m01_couplers_to_auto_pc_AWPROT;
  wire [3:0]m01_couplers_to_auto_pc_AWQOS;
  wire m01_couplers_to_auto_pc_AWREADY;
  wire [3:0]m01_couplers_to_auto_pc_AWREGION;
  wire [2:0]m01_couplers_to_auto_pc_AWSIZE;
  wire m01_couplers_to_auto_pc_AWVALID;
  wire [15:0]m01_couplers_to_auto_pc_BID;
  wire m01_couplers_to_auto_pc_BREADY;
  wire [1:0]m01_couplers_to_auto_pc_BRESP;
  wire m01_couplers_to_auto_pc_BVALID;
  wire [31:0]m01_couplers_to_auto_pc_RDATA;
  wire [15:0]m01_couplers_to_auto_pc_RID;
  wire m01_couplers_to_auto_pc_RLAST;
  wire m01_couplers_to_auto_pc_RREADY;
  wire [1:0]m01_couplers_to_auto_pc_RRESP;
  wire m01_couplers_to_auto_pc_RVALID;
  wire [31:0]m01_couplers_to_auto_pc_WDATA;
  wire m01_couplers_to_auto_pc_WLAST;
  wire m01_couplers_to_auto_pc_WREADY;
  wire [3:0]m01_couplers_to_auto_pc_WSTRB;
  wire m01_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[15:0] = auto_pc_to_m01_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_m01_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[15:0] = auto_pc_to_m01_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_m01_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_m01_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m01_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m01_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m01_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m01_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[15:0] = m01_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m01_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[15:0] = m01_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m01_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m01_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m01_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m01_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m01_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_auto_pc_ARADDR = S_AXI_araddr[39:0];
  assign m01_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m01_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m01_couplers_to_auto_pc_ARID = S_AXI_arid[15:0];
  assign m01_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m01_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m01_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m01_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m01_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m01_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[39:0];
  assign m01_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m01_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m01_couplers_to_auto_pc_AWID = S_AXI_awid[15:0];
  assign m01_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m01_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m01_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m01_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m01_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m01_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m01_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m01_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m01_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  exdes_auto_pc_2 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m01_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_m01_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_m01_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m01_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m01_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_m01_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_m01_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m01_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m01_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m01_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m01_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m01_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m01_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m01_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m01_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m01_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m01_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m01_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m01_couplers_WVALID),
        .s_axi_araddr(m01_couplers_to_auto_pc_ARADDR[15:0]),
        .s_axi_arburst(m01_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m01_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m01_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m01_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m01_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m01_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m01_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m01_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m01_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m01_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m01_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m01_couplers_to_auto_pc_AWADDR[15:0]),
        .s_axi_awburst(m01_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m01_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m01_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m01_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m01_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m01_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m01_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m01_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m01_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m01_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m01_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m01_couplers_to_auto_pc_BID),
        .s_axi_bready(m01_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m01_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m01_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m01_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m01_couplers_to_auto_pc_RID),
        .s_axi_rlast(m01_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m01_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m01_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m01_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m01_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m01_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m01_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m01_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m01_couplers_to_auto_pc_WVALID));
endmodule

module m02_couplers_imp_1AMYN3N
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]m02_couplers_to_m02_couplers_ARADDR;
  wire m02_couplers_to_m02_couplers_ARREADY;
  wire m02_couplers_to_m02_couplers_ARVALID;
  wire [39:0]m02_couplers_to_m02_couplers_AWADDR;
  wire m02_couplers_to_m02_couplers_AWREADY;
  wire m02_couplers_to_m02_couplers_AWVALID;
  wire m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid;
endmodule

module m02_couplers_imp_1TVAK0F
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [16:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [16:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [16:0]auto_pc_to_m02_couplers_ARADDR;
  wire [2:0]auto_pc_to_m02_couplers_ARPROT;
  wire auto_pc_to_m02_couplers_ARREADY;
  wire auto_pc_to_m02_couplers_ARVALID;
  wire [16:0]auto_pc_to_m02_couplers_AWADDR;
  wire [2:0]auto_pc_to_m02_couplers_AWPROT;
  wire auto_pc_to_m02_couplers_AWREADY;
  wire auto_pc_to_m02_couplers_AWVALID;
  wire auto_pc_to_m02_couplers_BREADY;
  wire [1:0]auto_pc_to_m02_couplers_BRESP;
  wire auto_pc_to_m02_couplers_BVALID;
  wire [31:0]auto_pc_to_m02_couplers_RDATA;
  wire auto_pc_to_m02_couplers_RREADY;
  wire [1:0]auto_pc_to_m02_couplers_RRESP;
  wire auto_pc_to_m02_couplers_RVALID;
  wire [31:0]auto_pc_to_m02_couplers_WDATA;
  wire auto_pc_to_m02_couplers_WREADY;
  wire [3:0]auto_pc_to_m02_couplers_WSTRB;
  wire auto_pc_to_m02_couplers_WVALID;
  wire [39:0]m02_couplers_to_auto_pc_ARADDR;
  wire [1:0]m02_couplers_to_auto_pc_ARBURST;
  wire [3:0]m02_couplers_to_auto_pc_ARCACHE;
  wire [15:0]m02_couplers_to_auto_pc_ARID;
  wire [7:0]m02_couplers_to_auto_pc_ARLEN;
  wire [0:0]m02_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m02_couplers_to_auto_pc_ARPROT;
  wire [3:0]m02_couplers_to_auto_pc_ARQOS;
  wire m02_couplers_to_auto_pc_ARREADY;
  wire [3:0]m02_couplers_to_auto_pc_ARREGION;
  wire [2:0]m02_couplers_to_auto_pc_ARSIZE;
  wire m02_couplers_to_auto_pc_ARVALID;
  wire [39:0]m02_couplers_to_auto_pc_AWADDR;
  wire [1:0]m02_couplers_to_auto_pc_AWBURST;
  wire [3:0]m02_couplers_to_auto_pc_AWCACHE;
  wire [15:0]m02_couplers_to_auto_pc_AWID;
  wire [7:0]m02_couplers_to_auto_pc_AWLEN;
  wire [0:0]m02_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m02_couplers_to_auto_pc_AWPROT;
  wire [3:0]m02_couplers_to_auto_pc_AWQOS;
  wire m02_couplers_to_auto_pc_AWREADY;
  wire [3:0]m02_couplers_to_auto_pc_AWREGION;
  wire [2:0]m02_couplers_to_auto_pc_AWSIZE;
  wire m02_couplers_to_auto_pc_AWVALID;
  wire [15:0]m02_couplers_to_auto_pc_BID;
  wire m02_couplers_to_auto_pc_BREADY;
  wire [1:0]m02_couplers_to_auto_pc_BRESP;
  wire m02_couplers_to_auto_pc_BVALID;
  wire [31:0]m02_couplers_to_auto_pc_RDATA;
  wire [15:0]m02_couplers_to_auto_pc_RID;
  wire m02_couplers_to_auto_pc_RLAST;
  wire m02_couplers_to_auto_pc_RREADY;
  wire [1:0]m02_couplers_to_auto_pc_RRESP;
  wire m02_couplers_to_auto_pc_RVALID;
  wire [31:0]m02_couplers_to_auto_pc_WDATA;
  wire m02_couplers_to_auto_pc_WLAST;
  wire m02_couplers_to_auto_pc_WREADY;
  wire [3:0]m02_couplers_to_auto_pc_WSTRB;
  wire m02_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[16:0] = auto_pc_to_m02_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_m02_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[16:0] = auto_pc_to_m02_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_m02_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_m02_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m02_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m02_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m02_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m02_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[15:0] = m02_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m02_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[15:0] = m02_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m02_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m02_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m02_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m02_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m02_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_auto_pc_ARADDR = S_AXI_araddr[39:0];
  assign m02_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m02_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m02_couplers_to_auto_pc_ARID = S_AXI_arid[15:0];
  assign m02_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m02_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m02_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m02_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m02_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m02_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[39:0];
  assign m02_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m02_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m02_couplers_to_auto_pc_AWID = S_AXI_awid[15:0];
  assign m02_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m02_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m02_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m02_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m02_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m02_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m02_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m02_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m02_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  exdes_auto_pc_3 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m02_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_m02_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_m02_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m02_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m02_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_m02_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_m02_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m02_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m02_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m02_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m02_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m02_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m02_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m02_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m02_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m02_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m02_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m02_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m02_couplers_WVALID),
        .s_axi_araddr(m02_couplers_to_auto_pc_ARADDR[16:0]),
        .s_axi_arburst(m02_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m02_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m02_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m02_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m02_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m02_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m02_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m02_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m02_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m02_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m02_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m02_couplers_to_auto_pc_AWADDR[16:0]),
        .s_axi_awburst(m02_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m02_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m02_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m02_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m02_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m02_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m02_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m02_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m02_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m02_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m02_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m02_couplers_to_auto_pc_BID),
        .s_axi_bready(m02_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m02_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m02_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m02_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m02_couplers_to_auto_pc_RID),
        .s_axi_rlast(m02_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m02_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m02_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m02_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m02_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m02_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m02_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m02_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m02_couplers_to_auto_pc_WVALID));
endmodule

module m03_couplers_imp_NH8ILJ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arregion,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awregion,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output M_AXI_araddr;
  output M_AXI_arburst;
  output M_AXI_arcache;
  output M_AXI_arlen;
  output M_AXI_arlock;
  output M_AXI_arprot;
  output M_AXI_arqos;
  input M_AXI_arready;
  output M_AXI_arregion;
  output M_AXI_arsize;
  output M_AXI_arvalid;
  output M_AXI_awaddr;
  output M_AXI_awburst;
  output M_AXI_awcache;
  output M_AXI_awlen;
  output M_AXI_awlock;
  output M_AXI_awprot;
  output M_AXI_awqos;
  input M_AXI_awready;
  output M_AXI_awregion;
  output M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input M_AXI_rresp;
  input M_AXI_rvalid;
  output M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input S_AXI_araddr;
  input S_AXI_arburst;
  input S_AXI_arcache;
  input S_AXI_arlen;
  input S_AXI_arlock;
  input S_AXI_arprot;
  input S_AXI_arqos;
  output S_AXI_arready;
  input S_AXI_arregion;
  input S_AXI_arsize;
  input S_AXI_arvalid;
  input S_AXI_awaddr;
  input S_AXI_awburst;
  input S_AXI_awcache;
  input S_AXI_awlen;
  input S_AXI_awlock;
  input S_AXI_awprot;
  input S_AXI_awqos;
  output S_AXI_awready;
  input S_AXI_awregion;
  input S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output S_AXI_bresp;
  output S_AXI_bvalid;
  output S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output S_AXI_rresp;
  output S_AXI_rvalid;
  input S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input S_AXI_wstrb;
  input S_AXI_wvalid;

  wire m03_couplers_to_m03_couplers_ARADDR;
  wire m03_couplers_to_m03_couplers_ARBURST;
  wire m03_couplers_to_m03_couplers_ARCACHE;
  wire m03_couplers_to_m03_couplers_ARLEN;
  wire m03_couplers_to_m03_couplers_ARLOCK;
  wire m03_couplers_to_m03_couplers_ARPROT;
  wire m03_couplers_to_m03_couplers_ARQOS;
  wire m03_couplers_to_m03_couplers_ARREADY;
  wire m03_couplers_to_m03_couplers_ARREGION;
  wire m03_couplers_to_m03_couplers_ARSIZE;
  wire m03_couplers_to_m03_couplers_ARVALID;
  wire m03_couplers_to_m03_couplers_AWADDR;
  wire m03_couplers_to_m03_couplers_AWBURST;
  wire m03_couplers_to_m03_couplers_AWCACHE;
  wire m03_couplers_to_m03_couplers_AWLEN;
  wire m03_couplers_to_m03_couplers_AWLOCK;
  wire m03_couplers_to_m03_couplers_AWPROT;
  wire m03_couplers_to_m03_couplers_AWQOS;
  wire m03_couplers_to_m03_couplers_AWREADY;
  wire m03_couplers_to_m03_couplers_AWREGION;
  wire m03_couplers_to_m03_couplers_AWSIZE;
  wire m03_couplers_to_m03_couplers_AWVALID;
  wire m03_couplers_to_m03_couplers_BREADY;
  wire m03_couplers_to_m03_couplers_BRESP;
  wire m03_couplers_to_m03_couplers_BVALID;
  wire m03_couplers_to_m03_couplers_RDATA;
  wire m03_couplers_to_m03_couplers_RLAST;
  wire m03_couplers_to_m03_couplers_RREADY;
  wire m03_couplers_to_m03_couplers_RRESP;
  wire m03_couplers_to_m03_couplers_RVALID;
  wire m03_couplers_to_m03_couplers_WDATA;
  wire m03_couplers_to_m03_couplers_WLAST;
  wire m03_couplers_to_m03_couplers_WREADY;
  wire m03_couplers_to_m03_couplers_WSTRB;
  wire m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arburst = m03_couplers_to_m03_couplers_ARBURST;
  assign M_AXI_arcache = m03_couplers_to_m03_couplers_ARCACHE;
  assign M_AXI_arlen = m03_couplers_to_m03_couplers_ARLEN;
  assign M_AXI_arlock = m03_couplers_to_m03_couplers_ARLOCK;
  assign M_AXI_arprot = m03_couplers_to_m03_couplers_ARPROT;
  assign M_AXI_arqos = m03_couplers_to_m03_couplers_ARQOS;
  assign M_AXI_arregion = m03_couplers_to_m03_couplers_ARREGION;
  assign M_AXI_arsize = m03_couplers_to_m03_couplers_ARSIZE;
  assign M_AXI_arvalid = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awburst = m03_couplers_to_m03_couplers_AWBURST;
  assign M_AXI_awcache = m03_couplers_to_m03_couplers_AWCACHE;
  assign M_AXI_awlen = m03_couplers_to_m03_couplers_AWLEN;
  assign M_AXI_awlock = m03_couplers_to_m03_couplers_AWLOCK;
  assign M_AXI_awprot = m03_couplers_to_m03_couplers_AWPROT;
  assign M_AXI_awqos = m03_couplers_to_m03_couplers_AWQOS;
  assign M_AXI_awregion = m03_couplers_to_m03_couplers_AWREGION;
  assign M_AXI_awsize = m03_couplers_to_m03_couplers_AWSIZE;
  assign M_AXI_awvalid = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wlast = m03_couplers_to_m03_couplers_WLAST;
  assign M_AXI_wstrb = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rlast = m03_couplers_to_m03_couplers_RLAST;
  assign S_AXI_rresp = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr;
  assign m03_couplers_to_m03_couplers_ARBURST = S_AXI_arburst;
  assign m03_couplers_to_m03_couplers_ARCACHE = S_AXI_arcache;
  assign m03_couplers_to_m03_couplers_ARLEN = S_AXI_arlen;
  assign m03_couplers_to_m03_couplers_ARLOCK = S_AXI_arlock;
  assign m03_couplers_to_m03_couplers_ARPROT = S_AXI_arprot;
  assign m03_couplers_to_m03_couplers_ARQOS = S_AXI_arqos;
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_couplers_to_m03_couplers_ARREGION = S_AXI_arregion;
  assign m03_couplers_to_m03_couplers_ARSIZE = S_AXI_arsize;
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr;
  assign m03_couplers_to_m03_couplers_AWBURST = S_AXI_awburst;
  assign m03_couplers_to_m03_couplers_AWCACHE = S_AXI_awcache;
  assign m03_couplers_to_m03_couplers_AWLEN = S_AXI_awlen;
  assign m03_couplers_to_m03_couplers_AWLOCK = S_AXI_awlock;
  assign m03_couplers_to_m03_couplers_AWPROT = S_AXI_awprot;
  assign m03_couplers_to_m03_couplers_AWQOS = S_AXI_awqos;
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_couplers_to_m03_couplers_AWREGION = S_AXI_awregion;
  assign m03_couplers_to_m03_couplers_AWSIZE = S_AXI_awsize;
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp;
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata;
  assign m03_couplers_to_m03_couplers_RLAST = M_AXI_rlast;
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp;
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata;
  assign m03_couplers_to_m03_couplers_WLAST = S_AXI_wlast;
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb;
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid;
endmodule

module m04_couplers_imp_1LLVX31
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [39:0]auto_pc_to_m04_couplers_ARADDR;
  wire auto_pc_to_m04_couplers_ARREADY;
  wire auto_pc_to_m04_couplers_ARVALID;
  wire [39:0]auto_pc_to_m04_couplers_AWADDR;
  wire auto_pc_to_m04_couplers_AWREADY;
  wire auto_pc_to_m04_couplers_AWVALID;
  wire auto_pc_to_m04_couplers_BREADY;
  wire [1:0]auto_pc_to_m04_couplers_BRESP;
  wire auto_pc_to_m04_couplers_BVALID;
  wire [31:0]auto_pc_to_m04_couplers_RDATA;
  wire auto_pc_to_m04_couplers_RREADY;
  wire [1:0]auto_pc_to_m04_couplers_RRESP;
  wire auto_pc_to_m04_couplers_RVALID;
  wire [31:0]auto_pc_to_m04_couplers_WDATA;
  wire auto_pc_to_m04_couplers_WREADY;
  wire [3:0]auto_pc_to_m04_couplers_WSTRB;
  wire auto_pc_to_m04_couplers_WVALID;
  wire [39:0]m04_couplers_to_auto_pc_ARADDR;
  wire [1:0]m04_couplers_to_auto_pc_ARBURST;
  wire [3:0]m04_couplers_to_auto_pc_ARCACHE;
  wire [15:0]m04_couplers_to_auto_pc_ARID;
  wire [7:0]m04_couplers_to_auto_pc_ARLEN;
  wire [0:0]m04_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m04_couplers_to_auto_pc_ARPROT;
  wire [3:0]m04_couplers_to_auto_pc_ARQOS;
  wire m04_couplers_to_auto_pc_ARREADY;
  wire [3:0]m04_couplers_to_auto_pc_ARREGION;
  wire [2:0]m04_couplers_to_auto_pc_ARSIZE;
  wire m04_couplers_to_auto_pc_ARVALID;
  wire [39:0]m04_couplers_to_auto_pc_AWADDR;
  wire [1:0]m04_couplers_to_auto_pc_AWBURST;
  wire [3:0]m04_couplers_to_auto_pc_AWCACHE;
  wire [15:0]m04_couplers_to_auto_pc_AWID;
  wire [7:0]m04_couplers_to_auto_pc_AWLEN;
  wire [0:0]m04_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m04_couplers_to_auto_pc_AWPROT;
  wire [3:0]m04_couplers_to_auto_pc_AWQOS;
  wire m04_couplers_to_auto_pc_AWREADY;
  wire [3:0]m04_couplers_to_auto_pc_AWREGION;
  wire [2:0]m04_couplers_to_auto_pc_AWSIZE;
  wire m04_couplers_to_auto_pc_AWVALID;
  wire [15:0]m04_couplers_to_auto_pc_BID;
  wire m04_couplers_to_auto_pc_BREADY;
  wire [1:0]m04_couplers_to_auto_pc_BRESP;
  wire m04_couplers_to_auto_pc_BVALID;
  wire [31:0]m04_couplers_to_auto_pc_RDATA;
  wire [15:0]m04_couplers_to_auto_pc_RID;
  wire m04_couplers_to_auto_pc_RLAST;
  wire m04_couplers_to_auto_pc_RREADY;
  wire [1:0]m04_couplers_to_auto_pc_RRESP;
  wire m04_couplers_to_auto_pc_RVALID;
  wire [31:0]m04_couplers_to_auto_pc_WDATA;
  wire m04_couplers_to_auto_pc_WLAST;
  wire m04_couplers_to_auto_pc_WREADY;
  wire [3:0]m04_couplers_to_auto_pc_WSTRB;
  wire m04_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[39:0] = auto_pc_to_m04_couplers_ARADDR;
  assign M_AXI_arvalid = auto_pc_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = auto_pc_to_m04_couplers_AWADDR;
  assign M_AXI_awvalid = auto_pc_to_m04_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m04_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m04_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m04_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m04_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[15:0] = m04_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m04_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[15:0] = m04_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m04_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m04_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m04_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m04_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m04_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_auto_pc_ARADDR = S_AXI_araddr[39:0];
  assign m04_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m04_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m04_couplers_to_auto_pc_ARID = S_AXI_arid[15:0];
  assign m04_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m04_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m04_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m04_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m04_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m04_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m04_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[39:0];
  assign m04_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m04_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m04_couplers_to_auto_pc_AWID = S_AXI_awid[15:0];
  assign m04_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m04_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m04_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m04_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m04_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m04_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m04_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m04_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m04_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m04_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  exdes_auto_pc_4 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m04_couplers_ARADDR),
        .m_axi_arready(auto_pc_to_m04_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m04_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m04_couplers_AWADDR),
        .m_axi_awready(auto_pc_to_m04_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m04_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m04_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m04_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m04_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m04_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m04_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m04_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m04_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m04_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m04_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m04_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m04_couplers_WVALID),
        .s_axi_araddr(m04_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m04_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m04_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m04_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m04_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m04_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m04_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m04_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m04_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m04_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m04_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m04_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m04_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m04_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m04_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m04_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m04_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m04_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m04_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m04_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m04_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m04_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m04_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m04_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m04_couplers_to_auto_pc_BID),
        .s_axi_bready(m04_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m04_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m04_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m04_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m04_couplers_to_auto_pc_RID),
        .s_axi_rlast(m04_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m04_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m04_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m04_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m04_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m04_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m04_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m04_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m04_couplers_to_auto_pc_WVALID));
endmodule

module m05_couplers_imp_WULHHX
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_aruser,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input [15:0]S_AXI_aruser;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input [15:0]S_AXI_awuser;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [39:0]auto_cc_to_auto_pc_ARADDR;
  wire [1:0]auto_cc_to_auto_pc_ARBURST;
  wire [3:0]auto_cc_to_auto_pc_ARCACHE;
  wire [15:0]auto_cc_to_auto_pc_ARID;
  wire [7:0]auto_cc_to_auto_pc_ARLEN;
  wire [0:0]auto_cc_to_auto_pc_ARLOCK;
  wire [2:0]auto_cc_to_auto_pc_ARPROT;
  wire [3:0]auto_cc_to_auto_pc_ARQOS;
  wire auto_cc_to_auto_pc_ARREADY;
  wire [3:0]auto_cc_to_auto_pc_ARREGION;
  wire [2:0]auto_cc_to_auto_pc_ARSIZE;
  wire auto_cc_to_auto_pc_ARVALID;
  wire [39:0]auto_cc_to_auto_pc_AWADDR;
  wire [1:0]auto_cc_to_auto_pc_AWBURST;
  wire [3:0]auto_cc_to_auto_pc_AWCACHE;
  wire [15:0]auto_cc_to_auto_pc_AWID;
  wire [7:0]auto_cc_to_auto_pc_AWLEN;
  wire [0:0]auto_cc_to_auto_pc_AWLOCK;
  wire [2:0]auto_cc_to_auto_pc_AWPROT;
  wire [3:0]auto_cc_to_auto_pc_AWQOS;
  wire auto_cc_to_auto_pc_AWREADY;
  wire [3:0]auto_cc_to_auto_pc_AWREGION;
  wire [2:0]auto_cc_to_auto_pc_AWSIZE;
  wire auto_cc_to_auto_pc_AWVALID;
  wire [15:0]auto_cc_to_auto_pc_BID;
  wire auto_cc_to_auto_pc_BREADY;
  wire [1:0]auto_cc_to_auto_pc_BRESP;
  wire auto_cc_to_auto_pc_BVALID;
  wire [31:0]auto_cc_to_auto_pc_RDATA;
  wire [15:0]auto_cc_to_auto_pc_RID;
  wire auto_cc_to_auto_pc_RLAST;
  wire auto_cc_to_auto_pc_RREADY;
  wire [1:0]auto_cc_to_auto_pc_RRESP;
  wire auto_cc_to_auto_pc_RVALID;
  wire [31:0]auto_cc_to_auto_pc_WDATA;
  wire auto_cc_to_auto_pc_WLAST;
  wire auto_cc_to_auto_pc_WREADY;
  wire [3:0]auto_cc_to_auto_pc_WSTRB;
  wire auto_cc_to_auto_pc_WVALID;
  wire [39:0]auto_pc_to_m05_couplers_ARADDR;
  wire auto_pc_to_m05_couplers_ARREADY;
  wire auto_pc_to_m05_couplers_ARVALID;
  wire [39:0]auto_pc_to_m05_couplers_AWADDR;
  wire auto_pc_to_m05_couplers_AWREADY;
  wire auto_pc_to_m05_couplers_AWVALID;
  wire auto_pc_to_m05_couplers_BREADY;
  wire [1:0]auto_pc_to_m05_couplers_BRESP;
  wire auto_pc_to_m05_couplers_BVALID;
  wire [31:0]auto_pc_to_m05_couplers_RDATA;
  wire auto_pc_to_m05_couplers_RREADY;
  wire [1:0]auto_pc_to_m05_couplers_RRESP;
  wire auto_pc_to_m05_couplers_RVALID;
  wire [31:0]auto_pc_to_m05_couplers_WDATA;
  wire auto_pc_to_m05_couplers_WREADY;
  wire [3:0]auto_pc_to_m05_couplers_WSTRB;
  wire auto_pc_to_m05_couplers_WVALID;
  wire [39:0]m05_couplers_to_auto_cc_ARADDR;
  wire [1:0]m05_couplers_to_auto_cc_ARBURST;
  wire [3:0]m05_couplers_to_auto_cc_ARCACHE;
  wire [15:0]m05_couplers_to_auto_cc_ARID;
  wire [7:0]m05_couplers_to_auto_cc_ARLEN;
  wire [0:0]m05_couplers_to_auto_cc_ARLOCK;
  wire [2:0]m05_couplers_to_auto_cc_ARPROT;
  wire [3:0]m05_couplers_to_auto_cc_ARQOS;
  wire m05_couplers_to_auto_cc_ARREADY;
  wire [3:0]m05_couplers_to_auto_cc_ARREGION;
  wire [2:0]m05_couplers_to_auto_cc_ARSIZE;
  wire [15:0]m05_couplers_to_auto_cc_ARUSER;
  wire m05_couplers_to_auto_cc_ARVALID;
  wire [39:0]m05_couplers_to_auto_cc_AWADDR;
  wire [1:0]m05_couplers_to_auto_cc_AWBURST;
  wire [3:0]m05_couplers_to_auto_cc_AWCACHE;
  wire [15:0]m05_couplers_to_auto_cc_AWID;
  wire [7:0]m05_couplers_to_auto_cc_AWLEN;
  wire [0:0]m05_couplers_to_auto_cc_AWLOCK;
  wire [2:0]m05_couplers_to_auto_cc_AWPROT;
  wire [3:0]m05_couplers_to_auto_cc_AWQOS;
  wire m05_couplers_to_auto_cc_AWREADY;
  wire [3:0]m05_couplers_to_auto_cc_AWREGION;
  wire [2:0]m05_couplers_to_auto_cc_AWSIZE;
  wire [15:0]m05_couplers_to_auto_cc_AWUSER;
  wire m05_couplers_to_auto_cc_AWVALID;
  wire [15:0]m05_couplers_to_auto_cc_BID;
  wire m05_couplers_to_auto_cc_BREADY;
  wire [1:0]m05_couplers_to_auto_cc_BRESP;
  wire m05_couplers_to_auto_cc_BVALID;
  wire [31:0]m05_couplers_to_auto_cc_RDATA;
  wire [15:0]m05_couplers_to_auto_cc_RID;
  wire m05_couplers_to_auto_cc_RLAST;
  wire m05_couplers_to_auto_cc_RREADY;
  wire [1:0]m05_couplers_to_auto_cc_RRESP;
  wire m05_couplers_to_auto_cc_RVALID;
  wire [31:0]m05_couplers_to_auto_cc_WDATA;
  wire m05_couplers_to_auto_cc_WLAST;
  wire m05_couplers_to_auto_cc_WREADY;
  wire [3:0]m05_couplers_to_auto_cc_WSTRB;
  wire m05_couplers_to_auto_cc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[39:0] = auto_pc_to_m05_couplers_ARADDR;
  assign M_AXI_arvalid = auto_pc_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = auto_pc_to_m05_couplers_AWADDR;
  assign M_AXI_awvalid = auto_pc_to_m05_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m05_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m05_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m05_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m05_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m05_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = m05_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bid[15:0] = m05_couplers_to_auto_cc_BID;
  assign S_AXI_bresp[1:0] = m05_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = m05_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_auto_cc_RDATA;
  assign S_AXI_rid[15:0] = m05_couplers_to_auto_cc_RID;
  assign S_AXI_rlast = m05_couplers_to_auto_cc_RLAST;
  assign S_AXI_rresp[1:0] = m05_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = m05_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = m05_couplers_to_auto_cc_WREADY;
  assign auto_pc_to_m05_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m05_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m05_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m05_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m05_couplers_WREADY = M_AXI_wready;
  assign m05_couplers_to_auto_cc_ARADDR = S_AXI_araddr[39:0];
  assign m05_couplers_to_auto_cc_ARBURST = S_AXI_arburst[1:0];
  assign m05_couplers_to_auto_cc_ARCACHE = S_AXI_arcache[3:0];
  assign m05_couplers_to_auto_cc_ARID = S_AXI_arid[15:0];
  assign m05_couplers_to_auto_cc_ARLEN = S_AXI_arlen[7:0];
  assign m05_couplers_to_auto_cc_ARLOCK = S_AXI_arlock[0];
  assign m05_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign m05_couplers_to_auto_cc_ARQOS = S_AXI_arqos[3:0];
  assign m05_couplers_to_auto_cc_ARREGION = S_AXI_arregion[3:0];
  assign m05_couplers_to_auto_cc_ARSIZE = S_AXI_arsize[2:0];
  assign m05_couplers_to_auto_cc_ARUSER = S_AXI_aruser[15:0];
  assign m05_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign m05_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[39:0];
  assign m05_couplers_to_auto_cc_AWBURST = S_AXI_awburst[1:0];
  assign m05_couplers_to_auto_cc_AWCACHE = S_AXI_awcache[3:0];
  assign m05_couplers_to_auto_cc_AWID = S_AXI_awid[15:0];
  assign m05_couplers_to_auto_cc_AWLEN = S_AXI_awlen[7:0];
  assign m05_couplers_to_auto_cc_AWLOCK = S_AXI_awlock[0];
  assign m05_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign m05_couplers_to_auto_cc_AWQOS = S_AXI_awqos[3:0];
  assign m05_couplers_to_auto_cc_AWREGION = S_AXI_awregion[3:0];
  assign m05_couplers_to_auto_cc_AWSIZE = S_AXI_awsize[2:0];
  assign m05_couplers_to_auto_cc_AWUSER = S_AXI_awuser[15:0];
  assign m05_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign m05_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign m05_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign m05_couplers_to_auto_cc_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_auto_cc_WLAST = S_AXI_wlast;
  assign m05_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[3:0];
  assign m05_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  exdes_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_auto_pc_ARADDR),
        .m_axi_arburst(auto_cc_to_auto_pc_ARBURST),
        .m_axi_arcache(auto_cc_to_auto_pc_ARCACHE),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arid(auto_cc_to_auto_pc_ARID),
        .m_axi_arlen(auto_cc_to_auto_pc_ARLEN),
        .m_axi_arlock(auto_cc_to_auto_pc_ARLOCK),
        .m_axi_arprot(auto_cc_to_auto_pc_ARPROT),
        .m_axi_arqos(auto_cc_to_auto_pc_ARQOS),
        .m_axi_arready(auto_cc_to_auto_pc_ARREADY),
        .m_axi_arregion(auto_cc_to_auto_pc_ARREGION),
        .m_axi_arsize(auto_cc_to_auto_pc_ARSIZE),
        .m_axi_arvalid(auto_cc_to_auto_pc_ARVALID),
        .m_axi_awaddr(auto_cc_to_auto_pc_AWADDR),
        .m_axi_awburst(auto_cc_to_auto_pc_AWBURST),
        .m_axi_awcache(auto_cc_to_auto_pc_AWCACHE),
        .m_axi_awid(auto_cc_to_auto_pc_AWID),
        .m_axi_awlen(auto_cc_to_auto_pc_AWLEN),
        .m_axi_awlock(auto_cc_to_auto_pc_AWLOCK),
        .m_axi_awprot(auto_cc_to_auto_pc_AWPROT),
        .m_axi_awqos(auto_cc_to_auto_pc_AWQOS),
        .m_axi_awready(auto_cc_to_auto_pc_AWREADY),
        .m_axi_awregion(auto_cc_to_auto_pc_AWREGION),
        .m_axi_awsize(auto_cc_to_auto_pc_AWSIZE),
        .m_axi_awvalid(auto_cc_to_auto_pc_AWVALID),
        .m_axi_bid(auto_cc_to_auto_pc_BID),
        .m_axi_bready(auto_cc_to_auto_pc_BREADY),
        .m_axi_bresp(auto_cc_to_auto_pc_BRESP),
        .m_axi_bvalid(auto_cc_to_auto_pc_BVALID),
        .m_axi_rdata(auto_cc_to_auto_pc_RDATA),
        .m_axi_rid(auto_cc_to_auto_pc_RID),
        .m_axi_rlast(auto_cc_to_auto_pc_RLAST),
        .m_axi_rready(auto_cc_to_auto_pc_RREADY),
        .m_axi_rresp(auto_cc_to_auto_pc_RRESP),
        .m_axi_rvalid(auto_cc_to_auto_pc_RVALID),
        .m_axi_wdata(auto_cc_to_auto_pc_WDATA),
        .m_axi_wlast(auto_cc_to_auto_pc_WLAST),
        .m_axi_wready(auto_cc_to_auto_pc_WREADY),
        .m_axi_wstrb(auto_cc_to_auto_pc_WSTRB),
        .m_axi_wvalid(auto_cc_to_auto_pc_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(m05_couplers_to_auto_cc_ARADDR),
        .s_axi_arburst(m05_couplers_to_auto_cc_ARBURST),
        .s_axi_arcache(m05_couplers_to_auto_cc_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(m05_couplers_to_auto_cc_ARID),
        .s_axi_arlen(m05_couplers_to_auto_cc_ARLEN),
        .s_axi_arlock(m05_couplers_to_auto_cc_ARLOCK),
        .s_axi_arprot(m05_couplers_to_auto_cc_ARPROT),
        .s_axi_arqos(m05_couplers_to_auto_cc_ARQOS),
        .s_axi_arready(m05_couplers_to_auto_cc_ARREADY),
        .s_axi_arregion(m05_couplers_to_auto_cc_ARREGION),
        .s_axi_arsize(m05_couplers_to_auto_cc_ARSIZE),
        .s_axi_aruser(m05_couplers_to_auto_cc_ARUSER),
        .s_axi_arvalid(m05_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(m05_couplers_to_auto_cc_AWADDR),
        .s_axi_awburst(m05_couplers_to_auto_cc_AWBURST),
        .s_axi_awcache(m05_couplers_to_auto_cc_AWCACHE),
        .s_axi_awid(m05_couplers_to_auto_cc_AWID),
        .s_axi_awlen(m05_couplers_to_auto_cc_AWLEN),
        .s_axi_awlock(m05_couplers_to_auto_cc_AWLOCK),
        .s_axi_awprot(m05_couplers_to_auto_cc_AWPROT),
        .s_axi_awqos(m05_couplers_to_auto_cc_AWQOS),
        .s_axi_awready(m05_couplers_to_auto_cc_AWREADY),
        .s_axi_awregion(m05_couplers_to_auto_cc_AWREGION),
        .s_axi_awsize(m05_couplers_to_auto_cc_AWSIZE),
        .s_axi_awuser(m05_couplers_to_auto_cc_AWUSER),
        .s_axi_awvalid(m05_couplers_to_auto_cc_AWVALID),
        .s_axi_bid(m05_couplers_to_auto_cc_BID),
        .s_axi_bready(m05_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(m05_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(m05_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(m05_couplers_to_auto_cc_RDATA),
        .s_axi_rid(m05_couplers_to_auto_cc_RID),
        .s_axi_rlast(m05_couplers_to_auto_cc_RLAST),
        .s_axi_rready(m05_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(m05_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(m05_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(m05_couplers_to_auto_cc_WDATA),
        .s_axi_wlast(m05_couplers_to_auto_cc_WLAST),
        .s_axi_wready(m05_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(m05_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(m05_couplers_to_auto_cc_WVALID));
  exdes_auto_pc_5 auto_pc
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m05_couplers_ARADDR),
        .m_axi_arready(auto_pc_to_m05_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m05_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m05_couplers_AWADDR),
        .m_axi_awready(auto_pc_to_m05_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m05_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m05_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m05_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m05_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m05_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m05_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m05_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m05_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m05_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m05_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m05_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m05_couplers_WVALID),
        .s_axi_araddr(auto_cc_to_auto_pc_ARADDR),
        .s_axi_arburst(auto_cc_to_auto_pc_ARBURST),
        .s_axi_arcache(auto_cc_to_auto_pc_ARCACHE),
        .s_axi_arid(auto_cc_to_auto_pc_ARID),
        .s_axi_arlen(auto_cc_to_auto_pc_ARLEN),
        .s_axi_arlock(auto_cc_to_auto_pc_ARLOCK),
        .s_axi_arprot(auto_cc_to_auto_pc_ARPROT),
        .s_axi_arqos(auto_cc_to_auto_pc_ARQOS),
        .s_axi_arready(auto_cc_to_auto_pc_ARREADY),
        .s_axi_arregion(auto_cc_to_auto_pc_ARREGION),
        .s_axi_arsize(auto_cc_to_auto_pc_ARSIZE),
        .s_axi_arvalid(auto_cc_to_auto_pc_ARVALID),
        .s_axi_awaddr(auto_cc_to_auto_pc_AWADDR),
        .s_axi_awburst(auto_cc_to_auto_pc_AWBURST),
        .s_axi_awcache(auto_cc_to_auto_pc_AWCACHE),
        .s_axi_awid(auto_cc_to_auto_pc_AWID),
        .s_axi_awlen(auto_cc_to_auto_pc_AWLEN),
        .s_axi_awlock(auto_cc_to_auto_pc_AWLOCK),
        .s_axi_awprot(auto_cc_to_auto_pc_AWPROT),
        .s_axi_awqos(auto_cc_to_auto_pc_AWQOS),
        .s_axi_awready(auto_cc_to_auto_pc_AWREADY),
        .s_axi_awregion(auto_cc_to_auto_pc_AWREGION),
        .s_axi_awsize(auto_cc_to_auto_pc_AWSIZE),
        .s_axi_awvalid(auto_cc_to_auto_pc_AWVALID),
        .s_axi_bid(auto_cc_to_auto_pc_BID),
        .s_axi_bready(auto_cc_to_auto_pc_BREADY),
        .s_axi_bresp(auto_cc_to_auto_pc_BRESP),
        .s_axi_bvalid(auto_cc_to_auto_pc_BVALID),
        .s_axi_rdata(auto_cc_to_auto_pc_RDATA),
        .s_axi_rid(auto_cc_to_auto_pc_RID),
        .s_axi_rlast(auto_cc_to_auto_pc_RLAST),
        .s_axi_rready(auto_cc_to_auto_pc_RREADY),
        .s_axi_rresp(auto_cc_to_auto_pc_RRESP),
        .s_axi_rvalid(auto_cc_to_auto_pc_RVALID),
        .s_axi_wdata(auto_cc_to_auto_pc_WDATA),
        .s_axi_wlast(auto_cc_to_auto_pc_WLAST),
        .s_axi_wready(auto_cc_to_auto_pc_WREADY),
        .s_axi_wstrb(auto_cc_to_auto_pc_WSTRB),
        .s_axi_wvalid(auto_cc_to_auto_pc_WVALID));
endmodule

module m06_couplers_imp_SLUD9O
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arregion,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awregion,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [15:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input [0:0]M_AXI_arready;
  output [3:0]M_AXI_arregion;
  output [2:0]M_AXI_arsize;
  output [0:0]M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [15:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input [0:0]M_AXI_awready;
  output [3:0]M_AXI_awregion;
  output [2:0]M_AXI_awsize;
  output [0:0]M_AXI_awvalid;
  input [15:0]M_AXI_bid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [15:0]M_AXI_rid;
  input [0:0]M_AXI_rlast;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output [0:0]M_AXI_wlast;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output [0:0]S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output [0:0]S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output [0:0]S_AXI_rlast;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [0:0]S_AXI_wlast;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [39:0]m06_couplers_to_m06_couplers_ARADDR;
  wire [1:0]m06_couplers_to_m06_couplers_ARBURST;
  wire [3:0]m06_couplers_to_m06_couplers_ARCACHE;
  wire [15:0]m06_couplers_to_m06_couplers_ARID;
  wire [7:0]m06_couplers_to_m06_couplers_ARLEN;
  wire [0:0]m06_couplers_to_m06_couplers_ARLOCK;
  wire [2:0]m06_couplers_to_m06_couplers_ARPROT;
  wire [3:0]m06_couplers_to_m06_couplers_ARQOS;
  wire [0:0]m06_couplers_to_m06_couplers_ARREADY;
  wire [3:0]m06_couplers_to_m06_couplers_ARREGION;
  wire [2:0]m06_couplers_to_m06_couplers_ARSIZE;
  wire [0:0]m06_couplers_to_m06_couplers_ARVALID;
  wire [39:0]m06_couplers_to_m06_couplers_AWADDR;
  wire [1:0]m06_couplers_to_m06_couplers_AWBURST;
  wire [3:0]m06_couplers_to_m06_couplers_AWCACHE;
  wire [15:0]m06_couplers_to_m06_couplers_AWID;
  wire [7:0]m06_couplers_to_m06_couplers_AWLEN;
  wire [0:0]m06_couplers_to_m06_couplers_AWLOCK;
  wire [2:0]m06_couplers_to_m06_couplers_AWPROT;
  wire [3:0]m06_couplers_to_m06_couplers_AWQOS;
  wire [0:0]m06_couplers_to_m06_couplers_AWREADY;
  wire [3:0]m06_couplers_to_m06_couplers_AWREGION;
  wire [2:0]m06_couplers_to_m06_couplers_AWSIZE;
  wire [0:0]m06_couplers_to_m06_couplers_AWVALID;
  wire [15:0]m06_couplers_to_m06_couplers_BID;
  wire [0:0]m06_couplers_to_m06_couplers_BREADY;
  wire [1:0]m06_couplers_to_m06_couplers_BRESP;
  wire [0:0]m06_couplers_to_m06_couplers_BVALID;
  wire [31:0]m06_couplers_to_m06_couplers_RDATA;
  wire [15:0]m06_couplers_to_m06_couplers_RID;
  wire [0:0]m06_couplers_to_m06_couplers_RLAST;
  wire [0:0]m06_couplers_to_m06_couplers_RREADY;
  wire [1:0]m06_couplers_to_m06_couplers_RRESP;
  wire [0:0]m06_couplers_to_m06_couplers_RVALID;
  wire [31:0]m06_couplers_to_m06_couplers_WDATA;
  wire [0:0]m06_couplers_to_m06_couplers_WLAST;
  wire [0:0]m06_couplers_to_m06_couplers_WREADY;
  wire [3:0]m06_couplers_to_m06_couplers_WSTRB;
  wire [0:0]m06_couplers_to_m06_couplers_WVALID;

  assign M_AXI_araddr[39:0] = m06_couplers_to_m06_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = m06_couplers_to_m06_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = m06_couplers_to_m06_couplers_ARCACHE;
  assign M_AXI_arid[15:0] = m06_couplers_to_m06_couplers_ARID;
  assign M_AXI_arlen[7:0] = m06_couplers_to_m06_couplers_ARLEN;
  assign M_AXI_arlock[0] = m06_couplers_to_m06_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = m06_couplers_to_m06_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = m06_couplers_to_m06_couplers_ARQOS;
  assign M_AXI_arregion[3:0] = m06_couplers_to_m06_couplers_ARREGION;
  assign M_AXI_arsize[2:0] = m06_couplers_to_m06_couplers_ARSIZE;
  assign M_AXI_arvalid[0] = m06_couplers_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = m06_couplers_to_m06_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = m06_couplers_to_m06_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = m06_couplers_to_m06_couplers_AWCACHE;
  assign M_AXI_awid[15:0] = m06_couplers_to_m06_couplers_AWID;
  assign M_AXI_awlen[7:0] = m06_couplers_to_m06_couplers_AWLEN;
  assign M_AXI_awlock[0] = m06_couplers_to_m06_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = m06_couplers_to_m06_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = m06_couplers_to_m06_couplers_AWQOS;
  assign M_AXI_awregion[3:0] = m06_couplers_to_m06_couplers_AWREGION;
  assign M_AXI_awsize[2:0] = m06_couplers_to_m06_couplers_AWSIZE;
  assign M_AXI_awvalid[0] = m06_couplers_to_m06_couplers_AWVALID;
  assign M_AXI_bready[0] = m06_couplers_to_m06_couplers_BREADY;
  assign M_AXI_rready[0] = m06_couplers_to_m06_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m06_couplers_to_m06_couplers_WDATA;
  assign M_AXI_wlast[0] = m06_couplers_to_m06_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = m06_couplers_to_m06_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m06_couplers_to_m06_couplers_WVALID;
  assign S_AXI_arready[0] = m06_couplers_to_m06_couplers_ARREADY;
  assign S_AXI_awready[0] = m06_couplers_to_m06_couplers_AWREADY;
  assign S_AXI_bid[15:0] = m06_couplers_to_m06_couplers_BID;
  assign S_AXI_bresp[1:0] = m06_couplers_to_m06_couplers_BRESP;
  assign S_AXI_bvalid[0] = m06_couplers_to_m06_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m06_couplers_to_m06_couplers_RDATA;
  assign S_AXI_rid[15:0] = m06_couplers_to_m06_couplers_RID;
  assign S_AXI_rlast[0] = m06_couplers_to_m06_couplers_RLAST;
  assign S_AXI_rresp[1:0] = m06_couplers_to_m06_couplers_RRESP;
  assign S_AXI_rvalid[0] = m06_couplers_to_m06_couplers_RVALID;
  assign S_AXI_wready[0] = m06_couplers_to_m06_couplers_WREADY;
  assign m06_couplers_to_m06_couplers_ARADDR = S_AXI_araddr[39:0];
  assign m06_couplers_to_m06_couplers_ARBURST = S_AXI_arburst[1:0];
  assign m06_couplers_to_m06_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign m06_couplers_to_m06_couplers_ARID = S_AXI_arid[15:0];
  assign m06_couplers_to_m06_couplers_ARLEN = S_AXI_arlen[7:0];
  assign m06_couplers_to_m06_couplers_ARLOCK = S_AXI_arlock[0];
  assign m06_couplers_to_m06_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m06_couplers_to_m06_couplers_ARQOS = S_AXI_arqos[3:0];
  assign m06_couplers_to_m06_couplers_ARREADY = M_AXI_arready[0];
  assign m06_couplers_to_m06_couplers_ARREGION = S_AXI_arregion[3:0];
  assign m06_couplers_to_m06_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign m06_couplers_to_m06_couplers_ARVALID = S_AXI_arvalid[0];
  assign m06_couplers_to_m06_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign m06_couplers_to_m06_couplers_AWBURST = S_AXI_awburst[1:0];
  assign m06_couplers_to_m06_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign m06_couplers_to_m06_couplers_AWID = S_AXI_awid[15:0];
  assign m06_couplers_to_m06_couplers_AWLEN = S_AXI_awlen[7:0];
  assign m06_couplers_to_m06_couplers_AWLOCK = S_AXI_awlock[0];
  assign m06_couplers_to_m06_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m06_couplers_to_m06_couplers_AWQOS = S_AXI_awqos[3:0];
  assign m06_couplers_to_m06_couplers_AWREADY = M_AXI_awready[0];
  assign m06_couplers_to_m06_couplers_AWREGION = S_AXI_awregion[3:0];
  assign m06_couplers_to_m06_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign m06_couplers_to_m06_couplers_AWVALID = S_AXI_awvalid[0];
  assign m06_couplers_to_m06_couplers_BID = M_AXI_bid[15:0];
  assign m06_couplers_to_m06_couplers_BREADY = S_AXI_bready[0];
  assign m06_couplers_to_m06_couplers_BRESP = M_AXI_bresp[1:0];
  assign m06_couplers_to_m06_couplers_BVALID = M_AXI_bvalid[0];
  assign m06_couplers_to_m06_couplers_RDATA = M_AXI_rdata[31:0];
  assign m06_couplers_to_m06_couplers_RID = M_AXI_rid[15:0];
  assign m06_couplers_to_m06_couplers_RLAST = M_AXI_rlast[0];
  assign m06_couplers_to_m06_couplers_RREADY = S_AXI_rready[0];
  assign m06_couplers_to_m06_couplers_RRESP = M_AXI_rresp[1:0];
  assign m06_couplers_to_m06_couplers_RVALID = M_AXI_rvalid[0];
  assign m06_couplers_to_m06_couplers_WDATA = S_AXI_wdata[31:0];
  assign m06_couplers_to_m06_couplers_WLAST = S_AXI_wlast[0];
  assign m06_couplers_to_m06_couplers_WREADY = M_AXI_wready[0];
  assign m06_couplers_to_m06_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m06_couplers_to_m06_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m07_couplers_imp_1PUBG3O
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arregion,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awregion,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output M_AXI_araddr;
  output M_AXI_arburst;
  output M_AXI_arcache;
  output M_AXI_arlen;
  output M_AXI_arlock;
  output M_AXI_arprot;
  output M_AXI_arqos;
  input M_AXI_arready;
  output M_AXI_arregion;
  output M_AXI_arsize;
  output M_AXI_arvalid;
  output M_AXI_awaddr;
  output M_AXI_awburst;
  output M_AXI_awcache;
  output M_AXI_awlen;
  output M_AXI_awlock;
  output M_AXI_awprot;
  output M_AXI_awqos;
  input M_AXI_awready;
  output M_AXI_awregion;
  output M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input M_AXI_rresp;
  input M_AXI_rvalid;
  output M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input S_AXI_araddr;
  input S_AXI_arburst;
  input S_AXI_arcache;
  input S_AXI_arlen;
  input S_AXI_arlock;
  input S_AXI_arprot;
  input S_AXI_arqos;
  output S_AXI_arready;
  input S_AXI_arregion;
  input S_AXI_arsize;
  input S_AXI_arvalid;
  input S_AXI_awaddr;
  input S_AXI_awburst;
  input S_AXI_awcache;
  input S_AXI_awlen;
  input S_AXI_awlock;
  input S_AXI_awprot;
  input S_AXI_awqos;
  output S_AXI_awready;
  input S_AXI_awregion;
  input S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output S_AXI_bresp;
  output S_AXI_bvalid;
  output S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output S_AXI_rresp;
  output S_AXI_rvalid;
  input S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input S_AXI_wstrb;
  input S_AXI_wvalid;

  wire m07_couplers_to_m07_couplers_ARADDR;
  wire m07_couplers_to_m07_couplers_ARBURST;
  wire m07_couplers_to_m07_couplers_ARCACHE;
  wire m07_couplers_to_m07_couplers_ARLEN;
  wire m07_couplers_to_m07_couplers_ARLOCK;
  wire m07_couplers_to_m07_couplers_ARPROT;
  wire m07_couplers_to_m07_couplers_ARQOS;
  wire m07_couplers_to_m07_couplers_ARREADY;
  wire m07_couplers_to_m07_couplers_ARREGION;
  wire m07_couplers_to_m07_couplers_ARSIZE;
  wire m07_couplers_to_m07_couplers_ARVALID;
  wire m07_couplers_to_m07_couplers_AWADDR;
  wire m07_couplers_to_m07_couplers_AWBURST;
  wire m07_couplers_to_m07_couplers_AWCACHE;
  wire m07_couplers_to_m07_couplers_AWLEN;
  wire m07_couplers_to_m07_couplers_AWLOCK;
  wire m07_couplers_to_m07_couplers_AWPROT;
  wire m07_couplers_to_m07_couplers_AWQOS;
  wire m07_couplers_to_m07_couplers_AWREADY;
  wire m07_couplers_to_m07_couplers_AWREGION;
  wire m07_couplers_to_m07_couplers_AWSIZE;
  wire m07_couplers_to_m07_couplers_AWVALID;
  wire m07_couplers_to_m07_couplers_BREADY;
  wire m07_couplers_to_m07_couplers_BRESP;
  wire m07_couplers_to_m07_couplers_BVALID;
  wire m07_couplers_to_m07_couplers_RDATA;
  wire m07_couplers_to_m07_couplers_RLAST;
  wire m07_couplers_to_m07_couplers_RREADY;
  wire m07_couplers_to_m07_couplers_RRESP;
  wire m07_couplers_to_m07_couplers_RVALID;
  wire m07_couplers_to_m07_couplers_WDATA;
  wire m07_couplers_to_m07_couplers_WLAST;
  wire m07_couplers_to_m07_couplers_WREADY;
  wire m07_couplers_to_m07_couplers_WSTRB;
  wire m07_couplers_to_m07_couplers_WVALID;

  assign M_AXI_araddr = m07_couplers_to_m07_couplers_ARADDR;
  assign M_AXI_arburst = m07_couplers_to_m07_couplers_ARBURST;
  assign M_AXI_arcache = m07_couplers_to_m07_couplers_ARCACHE;
  assign M_AXI_arlen = m07_couplers_to_m07_couplers_ARLEN;
  assign M_AXI_arlock = m07_couplers_to_m07_couplers_ARLOCK;
  assign M_AXI_arprot = m07_couplers_to_m07_couplers_ARPROT;
  assign M_AXI_arqos = m07_couplers_to_m07_couplers_ARQOS;
  assign M_AXI_arregion = m07_couplers_to_m07_couplers_ARREGION;
  assign M_AXI_arsize = m07_couplers_to_m07_couplers_ARSIZE;
  assign M_AXI_arvalid = m07_couplers_to_m07_couplers_ARVALID;
  assign M_AXI_awaddr = m07_couplers_to_m07_couplers_AWADDR;
  assign M_AXI_awburst = m07_couplers_to_m07_couplers_AWBURST;
  assign M_AXI_awcache = m07_couplers_to_m07_couplers_AWCACHE;
  assign M_AXI_awlen = m07_couplers_to_m07_couplers_AWLEN;
  assign M_AXI_awlock = m07_couplers_to_m07_couplers_AWLOCK;
  assign M_AXI_awprot = m07_couplers_to_m07_couplers_AWPROT;
  assign M_AXI_awqos = m07_couplers_to_m07_couplers_AWQOS;
  assign M_AXI_awregion = m07_couplers_to_m07_couplers_AWREGION;
  assign M_AXI_awsize = m07_couplers_to_m07_couplers_AWSIZE;
  assign M_AXI_awvalid = m07_couplers_to_m07_couplers_AWVALID;
  assign M_AXI_bready = m07_couplers_to_m07_couplers_BREADY;
  assign M_AXI_rready = m07_couplers_to_m07_couplers_RREADY;
  assign M_AXI_wdata = m07_couplers_to_m07_couplers_WDATA;
  assign M_AXI_wlast = m07_couplers_to_m07_couplers_WLAST;
  assign M_AXI_wstrb = m07_couplers_to_m07_couplers_WSTRB;
  assign M_AXI_wvalid = m07_couplers_to_m07_couplers_WVALID;
  assign S_AXI_arready = m07_couplers_to_m07_couplers_ARREADY;
  assign S_AXI_awready = m07_couplers_to_m07_couplers_AWREADY;
  assign S_AXI_bresp = m07_couplers_to_m07_couplers_BRESP;
  assign S_AXI_bvalid = m07_couplers_to_m07_couplers_BVALID;
  assign S_AXI_rdata = m07_couplers_to_m07_couplers_RDATA;
  assign S_AXI_rlast = m07_couplers_to_m07_couplers_RLAST;
  assign S_AXI_rresp = m07_couplers_to_m07_couplers_RRESP;
  assign S_AXI_rvalid = m07_couplers_to_m07_couplers_RVALID;
  assign S_AXI_wready = m07_couplers_to_m07_couplers_WREADY;
  assign m07_couplers_to_m07_couplers_ARADDR = S_AXI_araddr;
  assign m07_couplers_to_m07_couplers_ARBURST = S_AXI_arburst;
  assign m07_couplers_to_m07_couplers_ARCACHE = S_AXI_arcache;
  assign m07_couplers_to_m07_couplers_ARLEN = S_AXI_arlen;
  assign m07_couplers_to_m07_couplers_ARLOCK = S_AXI_arlock;
  assign m07_couplers_to_m07_couplers_ARPROT = S_AXI_arprot;
  assign m07_couplers_to_m07_couplers_ARQOS = S_AXI_arqos;
  assign m07_couplers_to_m07_couplers_ARREADY = M_AXI_arready;
  assign m07_couplers_to_m07_couplers_ARREGION = S_AXI_arregion;
  assign m07_couplers_to_m07_couplers_ARSIZE = S_AXI_arsize;
  assign m07_couplers_to_m07_couplers_ARVALID = S_AXI_arvalid;
  assign m07_couplers_to_m07_couplers_AWADDR = S_AXI_awaddr;
  assign m07_couplers_to_m07_couplers_AWBURST = S_AXI_awburst;
  assign m07_couplers_to_m07_couplers_AWCACHE = S_AXI_awcache;
  assign m07_couplers_to_m07_couplers_AWLEN = S_AXI_awlen;
  assign m07_couplers_to_m07_couplers_AWLOCK = S_AXI_awlock;
  assign m07_couplers_to_m07_couplers_AWPROT = S_AXI_awprot;
  assign m07_couplers_to_m07_couplers_AWQOS = S_AXI_awqos;
  assign m07_couplers_to_m07_couplers_AWREADY = M_AXI_awready;
  assign m07_couplers_to_m07_couplers_AWREGION = S_AXI_awregion;
  assign m07_couplers_to_m07_couplers_AWSIZE = S_AXI_awsize;
  assign m07_couplers_to_m07_couplers_AWVALID = S_AXI_awvalid;
  assign m07_couplers_to_m07_couplers_BREADY = S_AXI_bready;
  assign m07_couplers_to_m07_couplers_BRESP = M_AXI_bresp;
  assign m07_couplers_to_m07_couplers_BVALID = M_AXI_bvalid;
  assign m07_couplers_to_m07_couplers_RDATA = M_AXI_rdata;
  assign m07_couplers_to_m07_couplers_RLAST = M_AXI_rlast;
  assign m07_couplers_to_m07_couplers_RREADY = S_AXI_rready;
  assign m07_couplers_to_m07_couplers_RRESP = M_AXI_rresp;
  assign m07_couplers_to_m07_couplers_RVALID = M_AXI_rvalid;
  assign m07_couplers_to_m07_couplers_WDATA = S_AXI_wdata;
  assign m07_couplers_to_m07_couplers_WLAST = S_AXI_wlast;
  assign m07_couplers_to_m07_couplers_WREADY = M_AXI_wready;
  assign m07_couplers_to_m07_couplers_WSTRB = S_AXI_wstrb;
  assign m07_couplers_to_m07_couplers_WVALID = S_AXI_wvalid;
endmodule

module m08_couplers_imp_12EM2FT
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_aruser,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input [15:0]S_AXI_aruser;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input [15:0]S_AXI_awuser;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [39:0]auto_cc_to_auto_pc_ARADDR;
  wire [1:0]auto_cc_to_auto_pc_ARBURST;
  wire [3:0]auto_cc_to_auto_pc_ARCACHE;
  wire [15:0]auto_cc_to_auto_pc_ARID;
  wire [7:0]auto_cc_to_auto_pc_ARLEN;
  wire [0:0]auto_cc_to_auto_pc_ARLOCK;
  wire [2:0]auto_cc_to_auto_pc_ARPROT;
  wire [3:0]auto_cc_to_auto_pc_ARQOS;
  wire auto_cc_to_auto_pc_ARREADY;
  wire [3:0]auto_cc_to_auto_pc_ARREGION;
  wire [2:0]auto_cc_to_auto_pc_ARSIZE;
  wire auto_cc_to_auto_pc_ARVALID;
  wire [39:0]auto_cc_to_auto_pc_AWADDR;
  wire [1:0]auto_cc_to_auto_pc_AWBURST;
  wire [3:0]auto_cc_to_auto_pc_AWCACHE;
  wire [15:0]auto_cc_to_auto_pc_AWID;
  wire [7:0]auto_cc_to_auto_pc_AWLEN;
  wire [0:0]auto_cc_to_auto_pc_AWLOCK;
  wire [2:0]auto_cc_to_auto_pc_AWPROT;
  wire [3:0]auto_cc_to_auto_pc_AWQOS;
  wire auto_cc_to_auto_pc_AWREADY;
  wire [3:0]auto_cc_to_auto_pc_AWREGION;
  wire [2:0]auto_cc_to_auto_pc_AWSIZE;
  wire auto_cc_to_auto_pc_AWVALID;
  wire [15:0]auto_cc_to_auto_pc_BID;
  wire auto_cc_to_auto_pc_BREADY;
  wire [1:0]auto_cc_to_auto_pc_BRESP;
  wire auto_cc_to_auto_pc_BVALID;
  wire [31:0]auto_cc_to_auto_pc_RDATA;
  wire [15:0]auto_cc_to_auto_pc_RID;
  wire auto_cc_to_auto_pc_RLAST;
  wire auto_cc_to_auto_pc_RREADY;
  wire [1:0]auto_cc_to_auto_pc_RRESP;
  wire auto_cc_to_auto_pc_RVALID;
  wire [31:0]auto_cc_to_auto_pc_WDATA;
  wire auto_cc_to_auto_pc_WLAST;
  wire auto_cc_to_auto_pc_WREADY;
  wire [3:0]auto_cc_to_auto_pc_WSTRB;
  wire auto_cc_to_auto_pc_WVALID;
  wire [39:0]auto_pc_to_m08_couplers_ARADDR;
  wire auto_pc_to_m08_couplers_ARREADY;
  wire auto_pc_to_m08_couplers_ARVALID;
  wire [39:0]auto_pc_to_m08_couplers_AWADDR;
  wire auto_pc_to_m08_couplers_AWREADY;
  wire auto_pc_to_m08_couplers_AWVALID;
  wire auto_pc_to_m08_couplers_BREADY;
  wire [1:0]auto_pc_to_m08_couplers_BRESP;
  wire auto_pc_to_m08_couplers_BVALID;
  wire [31:0]auto_pc_to_m08_couplers_RDATA;
  wire auto_pc_to_m08_couplers_RREADY;
  wire [1:0]auto_pc_to_m08_couplers_RRESP;
  wire auto_pc_to_m08_couplers_RVALID;
  wire [31:0]auto_pc_to_m08_couplers_WDATA;
  wire auto_pc_to_m08_couplers_WREADY;
  wire [3:0]auto_pc_to_m08_couplers_WSTRB;
  wire auto_pc_to_m08_couplers_WVALID;
  wire [39:0]m08_couplers_to_auto_cc_ARADDR;
  wire [1:0]m08_couplers_to_auto_cc_ARBURST;
  wire [3:0]m08_couplers_to_auto_cc_ARCACHE;
  wire [15:0]m08_couplers_to_auto_cc_ARID;
  wire [7:0]m08_couplers_to_auto_cc_ARLEN;
  wire [0:0]m08_couplers_to_auto_cc_ARLOCK;
  wire [2:0]m08_couplers_to_auto_cc_ARPROT;
  wire [3:0]m08_couplers_to_auto_cc_ARQOS;
  wire m08_couplers_to_auto_cc_ARREADY;
  wire [3:0]m08_couplers_to_auto_cc_ARREGION;
  wire [2:0]m08_couplers_to_auto_cc_ARSIZE;
  wire [15:0]m08_couplers_to_auto_cc_ARUSER;
  wire m08_couplers_to_auto_cc_ARVALID;
  wire [39:0]m08_couplers_to_auto_cc_AWADDR;
  wire [1:0]m08_couplers_to_auto_cc_AWBURST;
  wire [3:0]m08_couplers_to_auto_cc_AWCACHE;
  wire [15:0]m08_couplers_to_auto_cc_AWID;
  wire [7:0]m08_couplers_to_auto_cc_AWLEN;
  wire [0:0]m08_couplers_to_auto_cc_AWLOCK;
  wire [2:0]m08_couplers_to_auto_cc_AWPROT;
  wire [3:0]m08_couplers_to_auto_cc_AWQOS;
  wire m08_couplers_to_auto_cc_AWREADY;
  wire [3:0]m08_couplers_to_auto_cc_AWREGION;
  wire [2:0]m08_couplers_to_auto_cc_AWSIZE;
  wire [15:0]m08_couplers_to_auto_cc_AWUSER;
  wire m08_couplers_to_auto_cc_AWVALID;
  wire [15:0]m08_couplers_to_auto_cc_BID;
  wire m08_couplers_to_auto_cc_BREADY;
  wire [1:0]m08_couplers_to_auto_cc_BRESP;
  wire m08_couplers_to_auto_cc_BVALID;
  wire [31:0]m08_couplers_to_auto_cc_RDATA;
  wire [15:0]m08_couplers_to_auto_cc_RID;
  wire m08_couplers_to_auto_cc_RLAST;
  wire m08_couplers_to_auto_cc_RREADY;
  wire [1:0]m08_couplers_to_auto_cc_RRESP;
  wire m08_couplers_to_auto_cc_RVALID;
  wire [31:0]m08_couplers_to_auto_cc_WDATA;
  wire m08_couplers_to_auto_cc_WLAST;
  wire m08_couplers_to_auto_cc_WREADY;
  wire [3:0]m08_couplers_to_auto_cc_WSTRB;
  wire m08_couplers_to_auto_cc_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[39:0] = auto_pc_to_m08_couplers_ARADDR;
  assign M_AXI_arvalid = auto_pc_to_m08_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = auto_pc_to_m08_couplers_AWADDR;
  assign M_AXI_awvalid = auto_pc_to_m08_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m08_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m08_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m08_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m08_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m08_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m08_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = m08_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bid[15:0] = m08_couplers_to_auto_cc_BID;
  assign S_AXI_bresp[1:0] = m08_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = m08_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[31:0] = m08_couplers_to_auto_cc_RDATA;
  assign S_AXI_rid[15:0] = m08_couplers_to_auto_cc_RID;
  assign S_AXI_rlast = m08_couplers_to_auto_cc_RLAST;
  assign S_AXI_rresp[1:0] = m08_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = m08_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = m08_couplers_to_auto_cc_WREADY;
  assign auto_pc_to_m08_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m08_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m08_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m08_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m08_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m08_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m08_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m08_couplers_WREADY = M_AXI_wready;
  assign m08_couplers_to_auto_cc_ARADDR = S_AXI_araddr[39:0];
  assign m08_couplers_to_auto_cc_ARBURST = S_AXI_arburst[1:0];
  assign m08_couplers_to_auto_cc_ARCACHE = S_AXI_arcache[3:0];
  assign m08_couplers_to_auto_cc_ARID = S_AXI_arid[15:0];
  assign m08_couplers_to_auto_cc_ARLEN = S_AXI_arlen[7:0];
  assign m08_couplers_to_auto_cc_ARLOCK = S_AXI_arlock[0];
  assign m08_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign m08_couplers_to_auto_cc_ARQOS = S_AXI_arqos[3:0];
  assign m08_couplers_to_auto_cc_ARREGION = S_AXI_arregion[3:0];
  assign m08_couplers_to_auto_cc_ARSIZE = S_AXI_arsize[2:0];
  assign m08_couplers_to_auto_cc_ARUSER = S_AXI_aruser[15:0];
  assign m08_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign m08_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[39:0];
  assign m08_couplers_to_auto_cc_AWBURST = S_AXI_awburst[1:0];
  assign m08_couplers_to_auto_cc_AWCACHE = S_AXI_awcache[3:0];
  assign m08_couplers_to_auto_cc_AWID = S_AXI_awid[15:0];
  assign m08_couplers_to_auto_cc_AWLEN = S_AXI_awlen[7:0];
  assign m08_couplers_to_auto_cc_AWLOCK = S_AXI_awlock[0];
  assign m08_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign m08_couplers_to_auto_cc_AWQOS = S_AXI_awqos[3:0];
  assign m08_couplers_to_auto_cc_AWREGION = S_AXI_awregion[3:0];
  assign m08_couplers_to_auto_cc_AWSIZE = S_AXI_awsize[2:0];
  assign m08_couplers_to_auto_cc_AWUSER = S_AXI_awuser[15:0];
  assign m08_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign m08_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign m08_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign m08_couplers_to_auto_cc_WDATA = S_AXI_wdata[31:0];
  assign m08_couplers_to_auto_cc_WLAST = S_AXI_wlast;
  assign m08_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[3:0];
  assign m08_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  exdes_auto_cc_1 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_auto_pc_ARADDR),
        .m_axi_arburst(auto_cc_to_auto_pc_ARBURST),
        .m_axi_arcache(auto_cc_to_auto_pc_ARCACHE),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arid(auto_cc_to_auto_pc_ARID),
        .m_axi_arlen(auto_cc_to_auto_pc_ARLEN),
        .m_axi_arlock(auto_cc_to_auto_pc_ARLOCK),
        .m_axi_arprot(auto_cc_to_auto_pc_ARPROT),
        .m_axi_arqos(auto_cc_to_auto_pc_ARQOS),
        .m_axi_arready(auto_cc_to_auto_pc_ARREADY),
        .m_axi_arregion(auto_cc_to_auto_pc_ARREGION),
        .m_axi_arsize(auto_cc_to_auto_pc_ARSIZE),
        .m_axi_arvalid(auto_cc_to_auto_pc_ARVALID),
        .m_axi_awaddr(auto_cc_to_auto_pc_AWADDR),
        .m_axi_awburst(auto_cc_to_auto_pc_AWBURST),
        .m_axi_awcache(auto_cc_to_auto_pc_AWCACHE),
        .m_axi_awid(auto_cc_to_auto_pc_AWID),
        .m_axi_awlen(auto_cc_to_auto_pc_AWLEN),
        .m_axi_awlock(auto_cc_to_auto_pc_AWLOCK),
        .m_axi_awprot(auto_cc_to_auto_pc_AWPROT),
        .m_axi_awqos(auto_cc_to_auto_pc_AWQOS),
        .m_axi_awready(auto_cc_to_auto_pc_AWREADY),
        .m_axi_awregion(auto_cc_to_auto_pc_AWREGION),
        .m_axi_awsize(auto_cc_to_auto_pc_AWSIZE),
        .m_axi_awvalid(auto_cc_to_auto_pc_AWVALID),
        .m_axi_bid(auto_cc_to_auto_pc_BID),
        .m_axi_bready(auto_cc_to_auto_pc_BREADY),
        .m_axi_bresp(auto_cc_to_auto_pc_BRESP),
        .m_axi_bvalid(auto_cc_to_auto_pc_BVALID),
        .m_axi_rdata(auto_cc_to_auto_pc_RDATA),
        .m_axi_rid(auto_cc_to_auto_pc_RID),
        .m_axi_rlast(auto_cc_to_auto_pc_RLAST),
        .m_axi_rready(auto_cc_to_auto_pc_RREADY),
        .m_axi_rresp(auto_cc_to_auto_pc_RRESP),
        .m_axi_rvalid(auto_cc_to_auto_pc_RVALID),
        .m_axi_wdata(auto_cc_to_auto_pc_WDATA),
        .m_axi_wlast(auto_cc_to_auto_pc_WLAST),
        .m_axi_wready(auto_cc_to_auto_pc_WREADY),
        .m_axi_wstrb(auto_cc_to_auto_pc_WSTRB),
        .m_axi_wvalid(auto_cc_to_auto_pc_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(m08_couplers_to_auto_cc_ARADDR),
        .s_axi_arburst(m08_couplers_to_auto_cc_ARBURST),
        .s_axi_arcache(m08_couplers_to_auto_cc_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(m08_couplers_to_auto_cc_ARID),
        .s_axi_arlen(m08_couplers_to_auto_cc_ARLEN),
        .s_axi_arlock(m08_couplers_to_auto_cc_ARLOCK),
        .s_axi_arprot(m08_couplers_to_auto_cc_ARPROT),
        .s_axi_arqos(m08_couplers_to_auto_cc_ARQOS),
        .s_axi_arready(m08_couplers_to_auto_cc_ARREADY),
        .s_axi_arregion(m08_couplers_to_auto_cc_ARREGION),
        .s_axi_arsize(m08_couplers_to_auto_cc_ARSIZE),
        .s_axi_aruser(m08_couplers_to_auto_cc_ARUSER),
        .s_axi_arvalid(m08_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(m08_couplers_to_auto_cc_AWADDR),
        .s_axi_awburst(m08_couplers_to_auto_cc_AWBURST),
        .s_axi_awcache(m08_couplers_to_auto_cc_AWCACHE),
        .s_axi_awid(m08_couplers_to_auto_cc_AWID),
        .s_axi_awlen(m08_couplers_to_auto_cc_AWLEN),
        .s_axi_awlock(m08_couplers_to_auto_cc_AWLOCK),
        .s_axi_awprot(m08_couplers_to_auto_cc_AWPROT),
        .s_axi_awqos(m08_couplers_to_auto_cc_AWQOS),
        .s_axi_awready(m08_couplers_to_auto_cc_AWREADY),
        .s_axi_awregion(m08_couplers_to_auto_cc_AWREGION),
        .s_axi_awsize(m08_couplers_to_auto_cc_AWSIZE),
        .s_axi_awuser(m08_couplers_to_auto_cc_AWUSER),
        .s_axi_awvalid(m08_couplers_to_auto_cc_AWVALID),
        .s_axi_bid(m08_couplers_to_auto_cc_BID),
        .s_axi_bready(m08_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(m08_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(m08_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(m08_couplers_to_auto_cc_RDATA),
        .s_axi_rid(m08_couplers_to_auto_cc_RID),
        .s_axi_rlast(m08_couplers_to_auto_cc_RLAST),
        .s_axi_rready(m08_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(m08_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(m08_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(m08_couplers_to_auto_cc_WDATA),
        .s_axi_wlast(m08_couplers_to_auto_cc_WLAST),
        .s_axi_wready(m08_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(m08_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(m08_couplers_to_auto_cc_WVALID));
  exdes_auto_pc_6 auto_pc
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m08_couplers_ARADDR),
        .m_axi_arready(auto_pc_to_m08_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_m08_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m08_couplers_AWADDR),
        .m_axi_awready(auto_pc_to_m08_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_m08_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m08_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m08_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m08_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m08_couplers_RDATA),
        .m_axi_rready(auto_pc_to_m08_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m08_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m08_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m08_couplers_WDATA),
        .m_axi_wready(auto_pc_to_m08_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m08_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m08_couplers_WVALID),
        .s_axi_araddr(auto_cc_to_auto_pc_ARADDR),
        .s_axi_arburst(auto_cc_to_auto_pc_ARBURST),
        .s_axi_arcache(auto_cc_to_auto_pc_ARCACHE),
        .s_axi_arid(auto_cc_to_auto_pc_ARID),
        .s_axi_arlen(auto_cc_to_auto_pc_ARLEN),
        .s_axi_arlock(auto_cc_to_auto_pc_ARLOCK),
        .s_axi_arprot(auto_cc_to_auto_pc_ARPROT),
        .s_axi_arqos(auto_cc_to_auto_pc_ARQOS),
        .s_axi_arready(auto_cc_to_auto_pc_ARREADY),
        .s_axi_arregion(auto_cc_to_auto_pc_ARREGION),
        .s_axi_arsize(auto_cc_to_auto_pc_ARSIZE),
        .s_axi_arvalid(auto_cc_to_auto_pc_ARVALID),
        .s_axi_awaddr(auto_cc_to_auto_pc_AWADDR),
        .s_axi_awburst(auto_cc_to_auto_pc_AWBURST),
        .s_axi_awcache(auto_cc_to_auto_pc_AWCACHE),
        .s_axi_awid(auto_cc_to_auto_pc_AWID),
        .s_axi_awlen(auto_cc_to_auto_pc_AWLEN),
        .s_axi_awlock(auto_cc_to_auto_pc_AWLOCK),
        .s_axi_awprot(auto_cc_to_auto_pc_AWPROT),
        .s_axi_awqos(auto_cc_to_auto_pc_AWQOS),
        .s_axi_awready(auto_cc_to_auto_pc_AWREADY),
        .s_axi_awregion(auto_cc_to_auto_pc_AWREGION),
        .s_axi_awsize(auto_cc_to_auto_pc_AWSIZE),
        .s_axi_awvalid(auto_cc_to_auto_pc_AWVALID),
        .s_axi_bid(auto_cc_to_auto_pc_BID),
        .s_axi_bready(auto_cc_to_auto_pc_BREADY),
        .s_axi_bresp(auto_cc_to_auto_pc_BRESP),
        .s_axi_bvalid(auto_cc_to_auto_pc_BVALID),
        .s_axi_rdata(auto_cc_to_auto_pc_RDATA),
        .s_axi_rid(auto_cc_to_auto_pc_RID),
        .s_axi_rlast(auto_cc_to_auto_pc_RLAST),
        .s_axi_rready(auto_cc_to_auto_pc_RREADY),
        .s_axi_rresp(auto_cc_to_auto_pc_RRESP),
        .s_axi_rvalid(auto_cc_to_auto_pc_RVALID),
        .s_axi_wdata(auto_cc_to_auto_pc_WDATA),
        .s_axi_wlast(auto_cc_to_auto_pc_WLAST),
        .s_axi_wready(auto_cc_to_auto_pc_WREADY),
        .s_axi_wstrb(auto_cc_to_auto_pc_WSTRB),
        .s_axi_wvalid(auto_cc_to_auto_pc_WVALID));
endmodule

module s00_couplers_imp_5FNMWL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_aruser,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awuser,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_aruser,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awuser,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [15:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output [15:0]M_AXI_aruser;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [15:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [15:0]M_AXI_awuser;
  output M_AXI_awvalid;
  input [15:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [15:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input [15:0]S_AXI_aruser;
  input S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [15:0]S_AXI_awuser;
  input S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [39:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [15:0]s00_couplers_to_s00_couplers_ARID;
  wire [7:0]s00_couplers_to_s00_couplers_ARLEN;
  wire s00_couplers_to_s00_couplers_ARLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [3:0]s00_couplers_to_s00_couplers_ARQOS;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire [15:0]s00_couplers_to_s00_couplers_ARUSER;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [39:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [15:0]s00_couplers_to_s00_couplers_AWID;
  wire [7:0]s00_couplers_to_s00_couplers_AWLEN;
  wire s00_couplers_to_s00_couplers_AWLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [3:0]s00_couplers_to_s00_couplers_AWQOS;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire [15:0]s00_couplers_to_s00_couplers_AWUSER;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire [15:0]s00_couplers_to_s00_couplers_BID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [15:0]s00_couplers_to_s00_couplers_RID;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[39:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[15:0] = s00_couplers_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arlock = s00_couplers_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_couplers_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_aruser[15:0] = s00_couplers_to_s00_couplers_ARUSER;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[15:0] = s00_couplers_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awlock = s00_couplers_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_couplers_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awuser[15:0] = s00_couplers_to_s00_couplers_AWUSER;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bid[15:0] = s00_couplers_to_s00_couplers_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rid[15:0] = s00_couplers_to_s00_couplers_RID;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[39:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARID = S_AXI_arid[15:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_s00_couplers_ARLOCK = S_AXI_arlock;
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARUSER = S_AXI_aruser[15:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[39:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWID = S_AXI_awid[15:0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_s00_couplers_AWLOCK = S_AXI_awlock;
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWUSER = S_AXI_awuser[15:0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BID = M_AXI_bid[15:0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RID = M_AXI_rid[15:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_O40D8P
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [39:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [39:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [39:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [15:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output [0:0]S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_arvalid;
  input [39:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [15:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output [0:0]S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awvalid;
  output [15:0]S_AXI_bid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [15:0]S_AXI_rid;
  output [0:0]S_AXI_rlast;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [0:0]S_AXI_wlast;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [39:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [39:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [39:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [15:0]s00_couplers_to_auto_pc_ARID;
  wire [7:0]s00_couplers_to_auto_pc_ARLEN;
  wire [0:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [3:0]s00_couplers_to_auto_pc_ARREGION;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire [0:0]s00_couplers_to_auto_pc_ARVALID;
  wire [39:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [15:0]s00_couplers_to_auto_pc_AWID;
  wire [7:0]s00_couplers_to_auto_pc_AWLEN;
  wire [0:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [3:0]s00_couplers_to_auto_pc_AWREGION;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire [0:0]s00_couplers_to_auto_pc_AWVALID;
  wire [15:0]s00_couplers_to_auto_pc_BID;
  wire [0:0]s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [15:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire [0:0]s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [0:0]s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire [0:0]s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[39:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[39:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready[0] = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[15:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[15:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast[0] = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[39:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[15:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[39:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[15:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast[0];
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid[0];
  exdes_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(s00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(s00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module v_tpg_ss_0_imp_5QXXBT
   (S_AXI_GPIO_araddr,
    S_AXI_GPIO_arready,
    S_AXI_GPIO_arvalid,
    S_AXI_GPIO_awaddr,
    S_AXI_GPIO_awready,
    S_AXI_GPIO_awvalid,
    S_AXI_GPIO_bready,
    S_AXI_GPIO_bresp,
    S_AXI_GPIO_bvalid,
    S_AXI_GPIO_rdata,
    S_AXI_GPIO_rready,
    S_AXI_GPIO_rresp,
    S_AXI_GPIO_rvalid,
    S_AXI_GPIO_wdata,
    S_AXI_GPIO_wready,
    S_AXI_GPIO_wstrb,
    S_AXI_GPIO_wvalid,
    S_AXI_TPG_araddr,
    S_AXI_TPG_arready,
    S_AXI_TPG_arvalid,
    S_AXI_TPG_awaddr,
    S_AXI_TPG_awready,
    S_AXI_TPG_awvalid,
    S_AXI_TPG_bready,
    S_AXI_TPG_bresp,
    S_AXI_TPG_bvalid,
    S_AXI_TPG_rdata,
    S_AXI_TPG_rready,
    S_AXI_TPG_rresp,
    S_AXI_TPG_rvalid,
    S_AXI_TPG_wdata,
    S_AXI_TPG_wready,
    S_AXI_TPG_wstrb,
    S_AXI_TPG_wvalid,
    ap_clk,
    m_axi_aresetn,
    m_axis_video_tdata,
    m_axis_video_tdest,
    m_axis_video_tid,
    m_axis_video_tkeep,
    m_axis_video_tlast,
    m_axis_video_tready,
    m_axis_video_tstrb,
    m_axis_video_tuser,
    m_axis_video_tvalid,
    s_axis_video_tdata,
    s_axis_video_tlast,
    s_axis_video_tready,
    s_axis_video_tuser,
    s_axis_video_tvalid);
  input [39:0]S_AXI_GPIO_araddr;
  output S_AXI_GPIO_arready;
  input S_AXI_GPIO_arvalid;
  input [39:0]S_AXI_GPIO_awaddr;
  output S_AXI_GPIO_awready;
  input S_AXI_GPIO_awvalid;
  input S_AXI_GPIO_bready;
  output [1:0]S_AXI_GPIO_bresp;
  output S_AXI_GPIO_bvalid;
  output [31:0]S_AXI_GPIO_rdata;
  input S_AXI_GPIO_rready;
  output [1:0]S_AXI_GPIO_rresp;
  output S_AXI_GPIO_rvalid;
  input [31:0]S_AXI_GPIO_wdata;
  output S_AXI_GPIO_wready;
  input [3:0]S_AXI_GPIO_wstrb;
  input S_AXI_GPIO_wvalid;
  input [39:0]S_AXI_TPG_araddr;
  output S_AXI_TPG_arready;
  input S_AXI_TPG_arvalid;
  input [39:0]S_AXI_TPG_awaddr;
  output S_AXI_TPG_awready;
  input S_AXI_TPG_awvalid;
  input S_AXI_TPG_bready;
  output [1:0]S_AXI_TPG_bresp;
  output S_AXI_TPG_bvalid;
  output [31:0]S_AXI_TPG_rdata;
  input S_AXI_TPG_rready;
  output [1:0]S_AXI_TPG_rresp;
  output S_AXI_TPG_rvalid;
  input [31:0]S_AXI_TPG_wdata;
  output S_AXI_TPG_wready;
  input [3:0]S_AXI_TPG_wstrb;
  input S_AXI_TPG_wvalid;
  input ap_clk;
  input m_axi_aresetn;
  output [95:0]m_axis_video_tdata;
  output [0:0]m_axis_video_tdest;
  output [0:0]m_axis_video_tid;
  output [11:0]m_axis_video_tkeep;
  output [0:0]m_axis_video_tlast;
  input m_axis_video_tready;
  output [11:0]m_axis_video_tstrb;
  output [0:0]m_axis_video_tuser;
  output m_axis_video_tvalid;
  input [95:0]s_axis_video_tdata;
  input [0:0]s_axis_video_tlast;
  output s_axis_video_tready;
  input [0:0]s_axis_video_tuser;
  input s_axis_video_tvalid;

  wire [39:0]intf_net_bdry_in_S_AXI_GPIO_ARADDR;
  wire intf_net_bdry_in_S_AXI_GPIO_ARREADY;
  wire intf_net_bdry_in_S_AXI_GPIO_ARVALID;
  wire [39:0]intf_net_bdry_in_S_AXI_GPIO_AWADDR;
  wire intf_net_bdry_in_S_AXI_GPIO_AWREADY;
  wire intf_net_bdry_in_S_AXI_GPIO_AWVALID;
  wire intf_net_bdry_in_S_AXI_GPIO_BREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_GPIO_BRESP;
  wire intf_net_bdry_in_S_AXI_GPIO_BVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_GPIO_RDATA;
  wire intf_net_bdry_in_S_AXI_GPIO_RREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_GPIO_RRESP;
  wire intf_net_bdry_in_S_AXI_GPIO_RVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_GPIO_WDATA;
  wire intf_net_bdry_in_S_AXI_GPIO_WREADY;
  wire [3:0]intf_net_bdry_in_S_AXI_GPIO_WSTRB;
  wire intf_net_bdry_in_S_AXI_GPIO_WVALID;
  wire [39:0]intf_net_bdry_in_S_AXI_TPG_ARADDR;
  wire intf_net_bdry_in_S_AXI_TPG_ARREADY;
  wire intf_net_bdry_in_S_AXI_TPG_ARVALID;
  wire [39:0]intf_net_bdry_in_S_AXI_TPG_AWADDR;
  wire intf_net_bdry_in_S_AXI_TPG_AWREADY;
  wire intf_net_bdry_in_S_AXI_TPG_AWVALID;
  wire intf_net_bdry_in_S_AXI_TPG_BREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_TPG_BRESP;
  wire intf_net_bdry_in_S_AXI_TPG_BVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_TPG_RDATA;
  wire intf_net_bdry_in_S_AXI_TPG_RREADY;
  wire [1:0]intf_net_bdry_in_S_AXI_TPG_RRESP;
  wire intf_net_bdry_in_S_AXI_TPG_RVALID;
  wire [31:0]intf_net_bdry_in_S_AXI_TPG_WDATA;
  wire intf_net_bdry_in_S_AXI_TPG_WREADY;
  wire [3:0]intf_net_bdry_in_S_AXI_TPG_WSTRB;
  wire intf_net_bdry_in_S_AXI_TPG_WVALID;
  wire [95:0]intf_net_bdry_in_s_axis_video_TDATA;
  wire [0:0]intf_net_bdry_in_s_axis_video_TLAST;
  wire intf_net_bdry_in_s_axis_video_TREADY;
  wire [0:0]intf_net_bdry_in_s_axis_video_TUSER;
  wire intf_net_bdry_in_s_axis_video_TVALID;
  wire [95:0]intf_net_v_tpg_m_axis_video_TDATA;
  wire [0:0]intf_net_v_tpg_m_axis_video_TDEST;
  wire [0:0]intf_net_v_tpg_m_axis_video_TID;
  wire [11:0]intf_net_v_tpg_m_axis_video_TKEEP;
  wire [0:0]intf_net_v_tpg_m_axis_video_TLAST;
  wire intf_net_v_tpg_m_axis_video_TREADY;
  wire [11:0]intf_net_v_tpg_m_axis_video_TSTRB;
  wire [0:0]intf_net_v_tpg_m_axis_video_TUSER;
  wire intf_net_v_tpg_m_axis_video_TVALID;
  wire [0:0]net_axi_gpio_gpio_io_o;
  wire net_bdry_in_ap_clk;
  wire net_bdry_in_m_axi_aresetn;

  assign S_AXI_GPIO_arready = intf_net_bdry_in_S_AXI_GPIO_ARREADY;
  assign S_AXI_GPIO_awready = intf_net_bdry_in_S_AXI_GPIO_AWREADY;
  assign S_AXI_GPIO_bresp[1:0] = intf_net_bdry_in_S_AXI_GPIO_BRESP;
  assign S_AXI_GPIO_bvalid = intf_net_bdry_in_S_AXI_GPIO_BVALID;
  assign S_AXI_GPIO_rdata[31:0] = intf_net_bdry_in_S_AXI_GPIO_RDATA;
  assign S_AXI_GPIO_rresp[1:0] = intf_net_bdry_in_S_AXI_GPIO_RRESP;
  assign S_AXI_GPIO_rvalid = intf_net_bdry_in_S_AXI_GPIO_RVALID;
  assign S_AXI_GPIO_wready = intf_net_bdry_in_S_AXI_GPIO_WREADY;
  assign S_AXI_TPG_arready = intf_net_bdry_in_S_AXI_TPG_ARREADY;
  assign S_AXI_TPG_awready = intf_net_bdry_in_S_AXI_TPG_AWREADY;
  assign S_AXI_TPG_bresp[1:0] = intf_net_bdry_in_S_AXI_TPG_BRESP;
  assign S_AXI_TPG_bvalid = intf_net_bdry_in_S_AXI_TPG_BVALID;
  assign S_AXI_TPG_rdata[31:0] = intf_net_bdry_in_S_AXI_TPG_RDATA;
  assign S_AXI_TPG_rresp[1:0] = intf_net_bdry_in_S_AXI_TPG_RRESP;
  assign S_AXI_TPG_rvalid = intf_net_bdry_in_S_AXI_TPG_RVALID;
  assign S_AXI_TPG_wready = intf_net_bdry_in_S_AXI_TPG_WREADY;
  assign intf_net_bdry_in_S_AXI_GPIO_ARADDR = S_AXI_GPIO_araddr[39:0];
  assign intf_net_bdry_in_S_AXI_GPIO_ARVALID = S_AXI_GPIO_arvalid;
  assign intf_net_bdry_in_S_AXI_GPIO_AWADDR = S_AXI_GPIO_awaddr[39:0];
  assign intf_net_bdry_in_S_AXI_GPIO_AWVALID = S_AXI_GPIO_awvalid;
  assign intf_net_bdry_in_S_AXI_GPIO_BREADY = S_AXI_GPIO_bready;
  assign intf_net_bdry_in_S_AXI_GPIO_RREADY = S_AXI_GPIO_rready;
  assign intf_net_bdry_in_S_AXI_GPIO_WDATA = S_AXI_GPIO_wdata[31:0];
  assign intf_net_bdry_in_S_AXI_GPIO_WSTRB = S_AXI_GPIO_wstrb[3:0];
  assign intf_net_bdry_in_S_AXI_GPIO_WVALID = S_AXI_GPIO_wvalid;
  assign intf_net_bdry_in_S_AXI_TPG_ARADDR = S_AXI_TPG_araddr[39:0];
  assign intf_net_bdry_in_S_AXI_TPG_ARVALID = S_AXI_TPG_arvalid;
  assign intf_net_bdry_in_S_AXI_TPG_AWADDR = S_AXI_TPG_awaddr[39:0];
  assign intf_net_bdry_in_S_AXI_TPG_AWVALID = S_AXI_TPG_awvalid;
  assign intf_net_bdry_in_S_AXI_TPG_BREADY = S_AXI_TPG_bready;
  assign intf_net_bdry_in_S_AXI_TPG_RREADY = S_AXI_TPG_rready;
  assign intf_net_bdry_in_S_AXI_TPG_WDATA = S_AXI_TPG_wdata[31:0];
  assign intf_net_bdry_in_S_AXI_TPG_WSTRB = S_AXI_TPG_wstrb[3:0];
  assign intf_net_bdry_in_S_AXI_TPG_WVALID = S_AXI_TPG_wvalid;
  assign intf_net_bdry_in_s_axis_video_TDATA = s_axis_video_tdata[95:0];
  assign intf_net_bdry_in_s_axis_video_TLAST = s_axis_video_tlast[0];
  assign intf_net_bdry_in_s_axis_video_TUSER = s_axis_video_tuser[0];
  assign intf_net_bdry_in_s_axis_video_TVALID = s_axis_video_tvalid;
  assign intf_net_v_tpg_m_axis_video_TREADY = m_axis_video_tready;
  assign m_axis_video_tdata[95:0] = intf_net_v_tpg_m_axis_video_TDATA;
  assign m_axis_video_tdest[0] = intf_net_v_tpg_m_axis_video_TDEST;
  assign m_axis_video_tid[0] = intf_net_v_tpg_m_axis_video_TID;
  assign m_axis_video_tkeep[11:0] = intf_net_v_tpg_m_axis_video_TKEEP;
  assign m_axis_video_tlast[0] = intf_net_v_tpg_m_axis_video_TLAST;
  assign m_axis_video_tstrb[11:0] = intf_net_v_tpg_m_axis_video_TSTRB;
  assign m_axis_video_tuser[0] = intf_net_v_tpg_m_axis_video_TUSER;
  assign m_axis_video_tvalid = intf_net_v_tpg_m_axis_video_TVALID;
  assign net_bdry_in_ap_clk = ap_clk;
  assign net_bdry_in_m_axi_aresetn = m_axi_aresetn;
  assign s_axis_video_tready = intf_net_bdry_in_s_axis_video_TREADY;
  exdes_axi_gpio_0 axi_gpio
       (.gpio_io_o(net_axi_gpio_gpio_io_o),
        .s_axi_aclk(net_bdry_in_ap_clk),
        .s_axi_araddr(intf_net_bdry_in_S_AXI_GPIO_ARADDR[8:0]),
        .s_axi_aresetn(net_bdry_in_m_axi_aresetn),
        .s_axi_arready(intf_net_bdry_in_S_AXI_GPIO_ARREADY),
        .s_axi_arvalid(intf_net_bdry_in_S_AXI_GPIO_ARVALID),
        .s_axi_awaddr(intf_net_bdry_in_S_AXI_GPIO_AWADDR[8:0]),
        .s_axi_awready(intf_net_bdry_in_S_AXI_GPIO_AWREADY),
        .s_axi_awvalid(intf_net_bdry_in_S_AXI_GPIO_AWVALID),
        .s_axi_bready(intf_net_bdry_in_S_AXI_GPIO_BREADY),
        .s_axi_bresp(intf_net_bdry_in_S_AXI_GPIO_BRESP),
        .s_axi_bvalid(intf_net_bdry_in_S_AXI_GPIO_BVALID),
        .s_axi_rdata(intf_net_bdry_in_S_AXI_GPIO_RDATA),
        .s_axi_rready(intf_net_bdry_in_S_AXI_GPIO_RREADY),
        .s_axi_rresp(intf_net_bdry_in_S_AXI_GPIO_RRESP),
        .s_axi_rvalid(intf_net_bdry_in_S_AXI_GPIO_RVALID),
        .s_axi_wdata(intf_net_bdry_in_S_AXI_GPIO_WDATA),
        .s_axi_wready(intf_net_bdry_in_S_AXI_GPIO_WREADY),
        .s_axi_wstrb(intf_net_bdry_in_S_AXI_GPIO_WSTRB),
        .s_axi_wvalid(intf_net_bdry_in_S_AXI_GPIO_WVALID));
  exdes_v_tpg_0 v_tpg
       (.ap_clk(net_bdry_in_ap_clk),
        .ap_rst_n(net_axi_gpio_gpio_io_o),
        .m_axis_video_TDATA(intf_net_v_tpg_m_axis_video_TDATA),
        .m_axis_video_TDEST(intf_net_v_tpg_m_axis_video_TDEST),
        .m_axis_video_TID(intf_net_v_tpg_m_axis_video_TID),
        .m_axis_video_TKEEP(intf_net_v_tpg_m_axis_video_TKEEP),
        .m_axis_video_TLAST(intf_net_v_tpg_m_axis_video_TLAST),
        .m_axis_video_TREADY(intf_net_v_tpg_m_axis_video_TREADY),
        .m_axis_video_TSTRB(intf_net_v_tpg_m_axis_video_TSTRB),
        .m_axis_video_TUSER(intf_net_v_tpg_m_axis_video_TUSER),
        .m_axis_video_TVALID(intf_net_v_tpg_m_axis_video_TVALID),
        .s_axi_CTRL_ARADDR(intf_net_bdry_in_S_AXI_TPG_ARADDR[7:0]),
        .s_axi_CTRL_ARREADY(intf_net_bdry_in_S_AXI_TPG_ARREADY),
        .s_axi_CTRL_ARVALID(intf_net_bdry_in_S_AXI_TPG_ARVALID),
        .s_axi_CTRL_AWADDR(intf_net_bdry_in_S_AXI_TPG_AWADDR[7:0]),
        .s_axi_CTRL_AWREADY(intf_net_bdry_in_S_AXI_TPG_AWREADY),
        .s_axi_CTRL_AWVALID(intf_net_bdry_in_S_AXI_TPG_AWVALID),
        .s_axi_CTRL_BREADY(intf_net_bdry_in_S_AXI_TPG_BREADY),
        .s_axi_CTRL_BRESP(intf_net_bdry_in_S_AXI_TPG_BRESP),
        .s_axi_CTRL_BVALID(intf_net_bdry_in_S_AXI_TPG_BVALID),
        .s_axi_CTRL_RDATA(intf_net_bdry_in_S_AXI_TPG_RDATA),
        .s_axi_CTRL_RREADY(intf_net_bdry_in_S_AXI_TPG_RREADY),
        .s_axi_CTRL_RRESP(intf_net_bdry_in_S_AXI_TPG_RRESP),
        .s_axi_CTRL_RVALID(intf_net_bdry_in_S_AXI_TPG_RVALID),
        .s_axi_CTRL_WDATA(intf_net_bdry_in_S_AXI_TPG_WDATA),
        .s_axi_CTRL_WREADY(intf_net_bdry_in_S_AXI_TPG_WREADY),
        .s_axi_CTRL_WSTRB(intf_net_bdry_in_S_AXI_TPG_WSTRB),
        .s_axi_CTRL_WVALID(intf_net_bdry_in_S_AXI_TPG_WVALID),
        .s_axis_video_TDATA(intf_net_bdry_in_s_axis_video_TDATA),
        .s_axis_video_TDEST(1'b0),
        .s_axis_video_TID(1'b0),
        .s_axis_video_TKEEP({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_video_TLAST(intf_net_bdry_in_s_axis_video_TLAST),
        .s_axis_video_TREADY(intf_net_bdry_in_s_axis_video_TREADY),
        .s_axis_video_TSTRB({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_video_TUSER(intf_net_bdry_in_s_axis_video_TUSER),
        .s_axis_video_TVALID(intf_net_bdry_in_s_axis_video_TVALID));
endmodule

module zynq_us_ss_0_imp_1A5BJWS
   (IIC_scl_i,
    IIC_scl_o,
    IIC_scl_t,
    IIC_sda_i,
    IIC_sda_o,
    IIC_sda_t,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_AXI_araddr,
    M06_AXI_arburst,
    M06_AXI_arcache,
    M06_AXI_arid,
    M06_AXI_arlen,
    M06_AXI_arlock,
    M06_AXI_arprot,
    M06_AXI_arqos,
    M06_AXI_arready,
    M06_AXI_arregion,
    M06_AXI_arsize,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awburst,
    M06_AXI_awcache,
    M06_AXI_awid,
    M06_AXI_awlen,
    M06_AXI_awlock,
    M06_AXI_awprot,
    M06_AXI_awqos,
    M06_AXI_awready,
    M06_AXI_awregion,
    M06_AXI_awsize,
    M06_AXI_awvalid,
    M06_AXI_bid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rid,
    M06_AXI_rlast,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wlast,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M08_AXI_araddr,
    M08_AXI_arready,
    M08_AXI_arvalid,
    M08_AXI_awaddr,
    M08_AXI_awready,
    M08_AXI_awvalid,
    M08_AXI_bready,
    M08_AXI_bresp,
    M08_AXI_bvalid,
    M08_AXI_rdata,
    M08_AXI_rready,
    M08_AXI_rresp,
    M08_AXI_rvalid,
    M08_AXI_wdata,
    M08_AXI_wready,
    M08_AXI_wstrb,
    M08_AXI_wvalid,
    clk_out2,
    dcm_locked,
    ext_reset_in,
    hdmi_rx_irq,
    hdmi_tx_irq,
    peripheral_aresetn,
    s_axi_aclk,
    vphy_irq);
  input IIC_scl_i;
  output IIC_scl_o;
  output IIC_scl_t;
  input IIC_sda_i;
  output IIC_sda_o;
  output IIC_sda_t;
  output [39:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [39:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  output [15:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [15:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  output [16:0]M02_AXI_araddr;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [16:0]M02_AXI_awaddr;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  output [39:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [39:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  output [39:0]M06_AXI_araddr;
  output [1:0]M06_AXI_arburst;
  output [3:0]M06_AXI_arcache;
  output [15:0]M06_AXI_arid;
  output [7:0]M06_AXI_arlen;
  output [0:0]M06_AXI_arlock;
  output [2:0]M06_AXI_arprot;
  output [3:0]M06_AXI_arqos;
  input [0:0]M06_AXI_arready;
  output [3:0]M06_AXI_arregion;
  output [2:0]M06_AXI_arsize;
  output [0:0]M06_AXI_arvalid;
  output [39:0]M06_AXI_awaddr;
  output [1:0]M06_AXI_awburst;
  output [3:0]M06_AXI_awcache;
  output [15:0]M06_AXI_awid;
  output [7:0]M06_AXI_awlen;
  output [0:0]M06_AXI_awlock;
  output [2:0]M06_AXI_awprot;
  output [3:0]M06_AXI_awqos;
  input [0:0]M06_AXI_awready;
  output [3:0]M06_AXI_awregion;
  output [2:0]M06_AXI_awsize;
  output [0:0]M06_AXI_awvalid;
  input [15:0]M06_AXI_bid;
  output [0:0]M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input [0:0]M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  input [15:0]M06_AXI_rid;
  input [0:0]M06_AXI_rlast;
  output [0:0]M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input [0:0]M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  output [0:0]M06_AXI_wlast;
  input [0:0]M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output [0:0]M06_AXI_wvalid;
  output [39:0]M08_AXI_araddr;
  input M08_AXI_arready;
  output M08_AXI_arvalid;
  output [39:0]M08_AXI_awaddr;
  input M08_AXI_awready;
  output M08_AXI_awvalid;
  output M08_AXI_bready;
  input [1:0]M08_AXI_bresp;
  input M08_AXI_bvalid;
  input [31:0]M08_AXI_rdata;
  output M08_AXI_rready;
  input [1:0]M08_AXI_rresp;
  input M08_AXI_rvalid;
  output [31:0]M08_AXI_wdata;
  input M08_AXI_wready;
  output [3:0]M08_AXI_wstrb;
  output M08_AXI_wvalid;
  output clk_out2;
  output [0:0]dcm_locked;
  input ext_reset_in;
  input hdmi_rx_irq;
  input hdmi_tx_irq;
  output [0:0]peripheral_aresetn;
  output s_axi_aclk;
  input vphy_irq;

  wire [39:0]intf_net_axi_interconnect_M00_AXI_ARADDR;
  wire [2:0]intf_net_axi_interconnect_M00_AXI_ARPROT;
  wire intf_net_axi_interconnect_M00_AXI_ARREADY;
  wire intf_net_axi_interconnect_M00_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M00_AXI_AWADDR;
  wire [2:0]intf_net_axi_interconnect_M00_AXI_AWPROT;
  wire intf_net_axi_interconnect_M00_AXI_AWREADY;
  wire intf_net_axi_interconnect_M00_AXI_AWVALID;
  wire intf_net_axi_interconnect_M00_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M00_AXI_BRESP;
  wire intf_net_axi_interconnect_M00_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M00_AXI_RDATA;
  wire intf_net_axi_interconnect_M00_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M00_AXI_RRESP;
  wire intf_net_axi_interconnect_M00_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M00_AXI_WDATA;
  wire intf_net_axi_interconnect_M00_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M00_AXI_WSTRB;
  wire intf_net_axi_interconnect_M00_AXI_WVALID;
  wire [15:0]intf_net_axi_interconnect_M01_AXI_ARADDR;
  wire [2:0]intf_net_axi_interconnect_M01_AXI_ARPROT;
  wire intf_net_axi_interconnect_M01_AXI_ARREADY;
  wire intf_net_axi_interconnect_M01_AXI_ARVALID;
  wire [15:0]intf_net_axi_interconnect_M01_AXI_AWADDR;
  wire [2:0]intf_net_axi_interconnect_M01_AXI_AWPROT;
  wire intf_net_axi_interconnect_M01_AXI_AWREADY;
  wire intf_net_axi_interconnect_M01_AXI_AWVALID;
  wire intf_net_axi_interconnect_M01_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M01_AXI_BRESP;
  wire intf_net_axi_interconnect_M01_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M01_AXI_RDATA;
  wire intf_net_axi_interconnect_M01_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M01_AXI_RRESP;
  wire intf_net_axi_interconnect_M01_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M01_AXI_WDATA;
  wire intf_net_axi_interconnect_M01_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M01_AXI_WSTRB;
  wire intf_net_axi_interconnect_M01_AXI_WVALID;
  wire [16:0]intf_net_axi_interconnect_M02_AXI_ARADDR;
  wire [2:0]intf_net_axi_interconnect_M02_AXI_ARPROT;
  wire intf_net_axi_interconnect_M02_AXI_ARREADY;
  wire intf_net_axi_interconnect_M02_AXI_ARVALID;
  wire [16:0]intf_net_axi_interconnect_M02_AXI_AWADDR;
  wire [2:0]intf_net_axi_interconnect_M02_AXI_AWPROT;
  wire intf_net_axi_interconnect_M02_AXI_AWREADY;
  wire intf_net_axi_interconnect_M02_AXI_AWVALID;
  wire intf_net_axi_interconnect_M02_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M02_AXI_BRESP;
  wire intf_net_axi_interconnect_M02_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M02_AXI_RDATA;
  wire intf_net_axi_interconnect_M02_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M02_AXI_RRESP;
  wire intf_net_axi_interconnect_M02_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M02_AXI_WDATA;
  wire intf_net_axi_interconnect_M02_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M02_AXI_WSTRB;
  wire intf_net_axi_interconnect_M02_AXI_WVALID;
  wire [39:0]intf_net_axi_interconnect_M04_AXI_ARADDR;
  wire intf_net_axi_interconnect_M04_AXI_ARREADY;
  wire intf_net_axi_interconnect_M04_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M04_AXI_AWADDR;
  wire intf_net_axi_interconnect_M04_AXI_AWREADY;
  wire intf_net_axi_interconnect_M04_AXI_AWVALID;
  wire intf_net_axi_interconnect_M04_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M04_AXI_BRESP;
  wire intf_net_axi_interconnect_M04_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M04_AXI_RDATA;
  wire intf_net_axi_interconnect_M04_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M04_AXI_RRESP;
  wire intf_net_axi_interconnect_M04_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M04_AXI_WDATA;
  wire intf_net_axi_interconnect_M04_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M04_AXI_WSTRB;
  wire intf_net_axi_interconnect_M04_AXI_WVALID;
  wire [39:0]intf_net_axi_interconnect_M05_AXI_ARADDR;
  wire intf_net_axi_interconnect_M05_AXI_ARREADY;
  wire intf_net_axi_interconnect_M05_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M05_AXI_AWADDR;
  wire intf_net_axi_interconnect_M05_AXI_AWREADY;
  wire intf_net_axi_interconnect_M05_AXI_AWVALID;
  wire intf_net_axi_interconnect_M05_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M05_AXI_BRESP;
  wire intf_net_axi_interconnect_M05_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M05_AXI_RDATA;
  wire intf_net_axi_interconnect_M05_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M05_AXI_RRESP;
  wire intf_net_axi_interconnect_M05_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M05_AXI_WDATA;
  wire intf_net_axi_interconnect_M05_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M05_AXI_WSTRB;
  wire intf_net_axi_interconnect_M05_AXI_WVALID;
  wire [39:0]intf_net_axi_interconnect_M06_AXI_ARADDR;
  wire [1:0]intf_net_axi_interconnect_M06_AXI_ARBURST;
  wire [3:0]intf_net_axi_interconnect_M06_AXI_ARCACHE;
  wire [15:0]intf_net_axi_interconnect_M06_AXI_ARID;
  wire [7:0]intf_net_axi_interconnect_M06_AXI_ARLEN;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_ARLOCK;
  wire [2:0]intf_net_axi_interconnect_M06_AXI_ARPROT;
  wire [3:0]intf_net_axi_interconnect_M06_AXI_ARQOS;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_ARREADY;
  wire [3:0]intf_net_axi_interconnect_M06_AXI_ARREGION;
  wire [2:0]intf_net_axi_interconnect_M06_AXI_ARSIZE;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M06_AXI_AWADDR;
  wire [1:0]intf_net_axi_interconnect_M06_AXI_AWBURST;
  wire [3:0]intf_net_axi_interconnect_M06_AXI_AWCACHE;
  wire [15:0]intf_net_axi_interconnect_M06_AXI_AWID;
  wire [7:0]intf_net_axi_interconnect_M06_AXI_AWLEN;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_AWLOCK;
  wire [2:0]intf_net_axi_interconnect_M06_AXI_AWPROT;
  wire [3:0]intf_net_axi_interconnect_M06_AXI_AWQOS;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_AWREADY;
  wire [3:0]intf_net_axi_interconnect_M06_AXI_AWREGION;
  wire [2:0]intf_net_axi_interconnect_M06_AXI_AWSIZE;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_AWVALID;
  wire [15:0]intf_net_axi_interconnect_M06_AXI_BID;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M06_AXI_BRESP;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M06_AXI_RDATA;
  wire [15:0]intf_net_axi_interconnect_M06_AXI_RID;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_RLAST;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M06_AXI_RRESP;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M06_AXI_WDATA;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_WLAST;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M06_AXI_WSTRB;
  wire [0:0]intf_net_axi_interconnect_M06_AXI_WVALID;
  wire [39:0]intf_net_axi_interconnect_M08_AXI_ARADDR;
  wire intf_net_axi_interconnect_M08_AXI_ARREADY;
  wire intf_net_axi_interconnect_M08_AXI_ARVALID;
  wire [39:0]intf_net_axi_interconnect_M08_AXI_AWADDR;
  wire intf_net_axi_interconnect_M08_AXI_AWREADY;
  wire intf_net_axi_interconnect_M08_AXI_AWVALID;
  wire intf_net_axi_interconnect_M08_AXI_BREADY;
  wire [1:0]intf_net_axi_interconnect_M08_AXI_BRESP;
  wire intf_net_axi_interconnect_M08_AXI_BVALID;
  wire [31:0]intf_net_axi_interconnect_M08_AXI_RDATA;
  wire intf_net_axi_interconnect_M08_AXI_RREADY;
  wire [1:0]intf_net_axi_interconnect_M08_AXI_RRESP;
  wire intf_net_axi_interconnect_M08_AXI_RVALID;
  wire [31:0]intf_net_axi_interconnect_M08_AXI_WDATA;
  wire intf_net_axi_interconnect_M08_AXI_WREADY;
  wire [3:0]intf_net_axi_interconnect_M08_AXI_WSTRB;
  wire intf_net_axi_interconnect_M08_AXI_WVALID;
  wire intf_net_fmch_axi_iic_IIC_SCL_I;
  wire intf_net_fmch_axi_iic_IIC_SCL_O;
  wire intf_net_fmch_axi_iic_IIC_SCL_T;
  wire intf_net_fmch_axi_iic_IIC_SDA_I;
  wire intf_net_fmch_axi_iic_IIC_SDA_O;
  wire intf_net_fmch_axi_iic_IIC_SDA_T;
  wire [39:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARADDR;
  wire [1:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARBURST;
  wire [3:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARCACHE;
  wire [15:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARID;
  wire [7:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARLEN;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_ARLOCK;
  wire [2:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARPROT;
  wire [3:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARQOS;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_ARREADY;
  wire [2:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARSIZE;
  wire [15:0]intf_net_zynq_us_M_AXI_HPM0_LPD_ARUSER;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_ARVALID;
  wire [39:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWADDR;
  wire [1:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWBURST;
  wire [3:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWCACHE;
  wire [15:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWID;
  wire [7:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWLEN;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_AWLOCK;
  wire [2:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWPROT;
  wire [3:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWQOS;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_AWREADY;
  wire [2:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWSIZE;
  wire [15:0]intf_net_zynq_us_M_AXI_HPM0_LPD_AWUSER;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_AWVALID;
  wire [15:0]intf_net_zynq_us_M_AXI_HPM0_LPD_BID;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_BREADY;
  wire [1:0]intf_net_zynq_us_M_AXI_HPM0_LPD_BRESP;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_BVALID;
  wire [31:0]intf_net_zynq_us_M_AXI_HPM0_LPD_RDATA;
  wire [15:0]intf_net_zynq_us_M_AXI_HPM0_LPD_RID;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_RLAST;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_RREADY;
  wire [1:0]intf_net_zynq_us_M_AXI_HPM0_LPD_RRESP;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_RVALID;
  wire [31:0]intf_net_zynq_us_M_AXI_HPM0_LPD_WDATA;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_WLAST;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_WREADY;
  wire [3:0]intf_net_zynq_us_M_AXI_HPM0_LPD_WSTRB;
  wire intf_net_zynq_us_M_AXI_HPM0_LPD_WVALID;
  wire net_bdry_in_ext_reset_in;
  wire net_bdry_in_hdmi_rx_irq;
  wire net_bdry_in_hdmi_tx_irq;
  wire net_bdry_in_vphy_irq;
  wire [0:0]net_rst_processor_1_100M_interconnect_aresetn;
  wire [0:0]net_rst_processor_1_100M_peripheral_aresetn;
  wire [0:0]net_rst_processor_1_300M_interconnect_aresetn;
  wire [0:0]net_rst_processor_1_300M_peripheral_aresetn;
  wire [2:0]net_xlconcat0_dout;
  wire net_zynq_us_pl_clk0;
  wire net_zynq_us_pl_clk1;
  wire net_zynq_us_pl_resetn0;

  assign IIC_scl_o = intf_net_fmch_axi_iic_IIC_SCL_O;
  assign IIC_scl_t = intf_net_fmch_axi_iic_IIC_SCL_T;
  assign IIC_sda_o = intf_net_fmch_axi_iic_IIC_SDA_O;
  assign IIC_sda_t = intf_net_fmch_axi_iic_IIC_SDA_T;
  assign M00_AXI_araddr[39:0] = intf_net_axi_interconnect_M00_AXI_ARADDR;
  assign M00_AXI_arprot[2:0] = intf_net_axi_interconnect_M00_AXI_ARPROT;
  assign M00_AXI_arvalid = intf_net_axi_interconnect_M00_AXI_ARVALID;
  assign M00_AXI_awaddr[39:0] = intf_net_axi_interconnect_M00_AXI_AWADDR;
  assign M00_AXI_awprot[2:0] = intf_net_axi_interconnect_M00_AXI_AWPROT;
  assign M00_AXI_awvalid = intf_net_axi_interconnect_M00_AXI_AWVALID;
  assign M00_AXI_bready = intf_net_axi_interconnect_M00_AXI_BREADY;
  assign M00_AXI_rready = intf_net_axi_interconnect_M00_AXI_RREADY;
  assign M00_AXI_wdata[31:0] = intf_net_axi_interconnect_M00_AXI_WDATA;
  assign M00_AXI_wstrb[3:0] = intf_net_axi_interconnect_M00_AXI_WSTRB;
  assign M00_AXI_wvalid = intf_net_axi_interconnect_M00_AXI_WVALID;
  assign M01_AXI_araddr[15:0] = intf_net_axi_interconnect_M01_AXI_ARADDR;
  assign M01_AXI_arprot[2:0] = intf_net_axi_interconnect_M01_AXI_ARPROT;
  assign M01_AXI_arvalid = intf_net_axi_interconnect_M01_AXI_ARVALID;
  assign M01_AXI_awaddr[15:0] = intf_net_axi_interconnect_M01_AXI_AWADDR;
  assign M01_AXI_awprot[2:0] = intf_net_axi_interconnect_M01_AXI_AWPROT;
  assign M01_AXI_awvalid = intf_net_axi_interconnect_M01_AXI_AWVALID;
  assign M01_AXI_bready = intf_net_axi_interconnect_M01_AXI_BREADY;
  assign M01_AXI_rready = intf_net_axi_interconnect_M01_AXI_RREADY;
  assign M01_AXI_wdata[31:0] = intf_net_axi_interconnect_M01_AXI_WDATA;
  assign M01_AXI_wstrb[3:0] = intf_net_axi_interconnect_M01_AXI_WSTRB;
  assign M01_AXI_wvalid = intf_net_axi_interconnect_M01_AXI_WVALID;
  assign M02_AXI_araddr[16:0] = intf_net_axi_interconnect_M02_AXI_ARADDR;
  assign M02_AXI_arprot[2:0] = intf_net_axi_interconnect_M02_AXI_ARPROT;
  assign M02_AXI_arvalid = intf_net_axi_interconnect_M02_AXI_ARVALID;
  assign M02_AXI_awaddr[16:0] = intf_net_axi_interconnect_M02_AXI_AWADDR;
  assign M02_AXI_awprot[2:0] = intf_net_axi_interconnect_M02_AXI_AWPROT;
  assign M02_AXI_awvalid = intf_net_axi_interconnect_M02_AXI_AWVALID;
  assign M02_AXI_bready = intf_net_axi_interconnect_M02_AXI_BREADY;
  assign M02_AXI_rready = intf_net_axi_interconnect_M02_AXI_RREADY;
  assign M02_AXI_wdata[31:0] = intf_net_axi_interconnect_M02_AXI_WDATA;
  assign M02_AXI_wstrb[3:0] = intf_net_axi_interconnect_M02_AXI_WSTRB;
  assign M02_AXI_wvalid = intf_net_axi_interconnect_M02_AXI_WVALID;
  assign M05_AXI_araddr[39:0] = intf_net_axi_interconnect_M05_AXI_ARADDR;
  assign M05_AXI_arvalid = intf_net_axi_interconnect_M05_AXI_ARVALID;
  assign M05_AXI_awaddr[39:0] = intf_net_axi_interconnect_M05_AXI_AWADDR;
  assign M05_AXI_awvalid = intf_net_axi_interconnect_M05_AXI_AWVALID;
  assign M05_AXI_bready = intf_net_axi_interconnect_M05_AXI_BREADY;
  assign M05_AXI_rready = intf_net_axi_interconnect_M05_AXI_RREADY;
  assign M05_AXI_wdata[31:0] = intf_net_axi_interconnect_M05_AXI_WDATA;
  assign M05_AXI_wstrb[3:0] = intf_net_axi_interconnect_M05_AXI_WSTRB;
  assign M05_AXI_wvalid = intf_net_axi_interconnect_M05_AXI_WVALID;
  assign M06_AXI_araddr[39:0] = intf_net_axi_interconnect_M06_AXI_ARADDR;
  assign M06_AXI_arburst[1:0] = intf_net_axi_interconnect_M06_AXI_ARBURST;
  assign M06_AXI_arcache[3:0] = intf_net_axi_interconnect_M06_AXI_ARCACHE;
  assign M06_AXI_arid[15:0] = intf_net_axi_interconnect_M06_AXI_ARID;
  assign M06_AXI_arlen[7:0] = intf_net_axi_interconnect_M06_AXI_ARLEN;
  assign M06_AXI_arlock[0] = intf_net_axi_interconnect_M06_AXI_ARLOCK;
  assign M06_AXI_arprot[2:0] = intf_net_axi_interconnect_M06_AXI_ARPROT;
  assign M06_AXI_arqos[3:0] = intf_net_axi_interconnect_M06_AXI_ARQOS;
  assign M06_AXI_arregion[3:0] = intf_net_axi_interconnect_M06_AXI_ARREGION;
  assign M06_AXI_arsize[2:0] = intf_net_axi_interconnect_M06_AXI_ARSIZE;
  assign M06_AXI_arvalid[0] = intf_net_axi_interconnect_M06_AXI_ARVALID;
  assign M06_AXI_awaddr[39:0] = intf_net_axi_interconnect_M06_AXI_AWADDR;
  assign M06_AXI_awburst[1:0] = intf_net_axi_interconnect_M06_AXI_AWBURST;
  assign M06_AXI_awcache[3:0] = intf_net_axi_interconnect_M06_AXI_AWCACHE;
  assign M06_AXI_awid[15:0] = intf_net_axi_interconnect_M06_AXI_AWID;
  assign M06_AXI_awlen[7:0] = intf_net_axi_interconnect_M06_AXI_AWLEN;
  assign M06_AXI_awlock[0] = intf_net_axi_interconnect_M06_AXI_AWLOCK;
  assign M06_AXI_awprot[2:0] = intf_net_axi_interconnect_M06_AXI_AWPROT;
  assign M06_AXI_awqos[3:0] = intf_net_axi_interconnect_M06_AXI_AWQOS;
  assign M06_AXI_awregion[3:0] = intf_net_axi_interconnect_M06_AXI_AWREGION;
  assign M06_AXI_awsize[2:0] = intf_net_axi_interconnect_M06_AXI_AWSIZE;
  assign M06_AXI_awvalid[0] = intf_net_axi_interconnect_M06_AXI_AWVALID;
  assign M06_AXI_bready[0] = intf_net_axi_interconnect_M06_AXI_BREADY;
  assign M06_AXI_rready[0] = intf_net_axi_interconnect_M06_AXI_RREADY;
  assign M06_AXI_wdata[31:0] = intf_net_axi_interconnect_M06_AXI_WDATA;
  assign M06_AXI_wlast[0] = intf_net_axi_interconnect_M06_AXI_WLAST;
  assign M06_AXI_wstrb[3:0] = intf_net_axi_interconnect_M06_AXI_WSTRB;
  assign M06_AXI_wvalid[0] = intf_net_axi_interconnect_M06_AXI_WVALID;
  assign M08_AXI_araddr[39:0] = intf_net_axi_interconnect_M08_AXI_ARADDR;
  assign M08_AXI_arvalid = intf_net_axi_interconnect_M08_AXI_ARVALID;
  assign M08_AXI_awaddr[39:0] = intf_net_axi_interconnect_M08_AXI_AWADDR;
  assign M08_AXI_awvalid = intf_net_axi_interconnect_M08_AXI_AWVALID;
  assign M08_AXI_bready = intf_net_axi_interconnect_M08_AXI_BREADY;
  assign M08_AXI_rready = intf_net_axi_interconnect_M08_AXI_RREADY;
  assign M08_AXI_wdata[31:0] = intf_net_axi_interconnect_M08_AXI_WDATA;
  assign M08_AXI_wstrb[3:0] = intf_net_axi_interconnect_M08_AXI_WSTRB;
  assign M08_AXI_wvalid = intf_net_axi_interconnect_M08_AXI_WVALID;
  assign clk_out2 = net_zynq_us_pl_clk1;
  assign dcm_locked[0] = net_rst_processor_1_300M_peripheral_aresetn;
  assign intf_net_axi_interconnect_M00_AXI_ARREADY = M00_AXI_arready;
  assign intf_net_axi_interconnect_M00_AXI_AWREADY = M00_AXI_awready;
  assign intf_net_axi_interconnect_M00_AXI_BRESP = M00_AXI_bresp[1:0];
  assign intf_net_axi_interconnect_M00_AXI_BVALID = M00_AXI_bvalid;
  assign intf_net_axi_interconnect_M00_AXI_RDATA = M00_AXI_rdata[31:0];
  assign intf_net_axi_interconnect_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign intf_net_axi_interconnect_M00_AXI_RVALID = M00_AXI_rvalid;
  assign intf_net_axi_interconnect_M00_AXI_WREADY = M00_AXI_wready;
  assign intf_net_axi_interconnect_M01_AXI_ARREADY = M01_AXI_arready;
  assign intf_net_axi_interconnect_M01_AXI_AWREADY = M01_AXI_awready;
  assign intf_net_axi_interconnect_M01_AXI_BRESP = M01_AXI_bresp[1:0];
  assign intf_net_axi_interconnect_M01_AXI_BVALID = M01_AXI_bvalid;
  assign intf_net_axi_interconnect_M01_AXI_RDATA = M01_AXI_rdata[31:0];
  assign intf_net_axi_interconnect_M01_AXI_RRESP = M01_AXI_rresp[1:0];
  assign intf_net_axi_interconnect_M01_AXI_RVALID = M01_AXI_rvalid;
  assign intf_net_axi_interconnect_M01_AXI_WREADY = M01_AXI_wready;
  assign intf_net_axi_interconnect_M02_AXI_ARREADY = M02_AXI_arready;
  assign intf_net_axi_interconnect_M02_AXI_AWREADY = M02_AXI_awready;
  assign intf_net_axi_interconnect_M02_AXI_BRESP = M02_AXI_bresp[1:0];
  assign intf_net_axi_interconnect_M02_AXI_BVALID = M02_AXI_bvalid;
  assign intf_net_axi_interconnect_M02_AXI_RDATA = M02_AXI_rdata[31:0];
  assign intf_net_axi_interconnect_M02_AXI_RRESP = M02_AXI_rresp[1:0];
  assign intf_net_axi_interconnect_M02_AXI_RVALID = M02_AXI_rvalid;
  assign intf_net_axi_interconnect_M02_AXI_WREADY = M02_AXI_wready;
  assign intf_net_axi_interconnect_M05_AXI_ARREADY = M05_AXI_arready;
  assign intf_net_axi_interconnect_M05_AXI_AWREADY = M05_AXI_awready;
  assign intf_net_axi_interconnect_M05_AXI_BRESP = M05_AXI_bresp[1:0];
  assign intf_net_axi_interconnect_M05_AXI_BVALID = M05_AXI_bvalid;
  assign intf_net_axi_interconnect_M05_AXI_RDATA = M05_AXI_rdata[31:0];
  assign intf_net_axi_interconnect_M05_AXI_RRESP = M05_AXI_rresp[1:0];
  assign intf_net_axi_interconnect_M05_AXI_RVALID = M05_AXI_rvalid;
  assign intf_net_axi_interconnect_M05_AXI_WREADY = M05_AXI_wready;
  assign intf_net_axi_interconnect_M06_AXI_ARREADY = M06_AXI_arready[0];
  assign intf_net_axi_interconnect_M06_AXI_AWREADY = M06_AXI_awready[0];
  assign intf_net_axi_interconnect_M06_AXI_BID = M06_AXI_bid[15:0];
  assign intf_net_axi_interconnect_M06_AXI_BRESP = M06_AXI_bresp[1:0];
  assign intf_net_axi_interconnect_M06_AXI_BVALID = M06_AXI_bvalid[0];
  assign intf_net_axi_interconnect_M06_AXI_RDATA = M06_AXI_rdata[31:0];
  assign intf_net_axi_interconnect_M06_AXI_RID = M06_AXI_rid[15:0];
  assign intf_net_axi_interconnect_M06_AXI_RLAST = M06_AXI_rlast[0];
  assign intf_net_axi_interconnect_M06_AXI_RRESP = M06_AXI_rresp[1:0];
  assign intf_net_axi_interconnect_M06_AXI_RVALID = M06_AXI_rvalid[0];
  assign intf_net_axi_interconnect_M06_AXI_WREADY = M06_AXI_wready[0];
  assign intf_net_axi_interconnect_M08_AXI_ARREADY = M08_AXI_arready;
  assign intf_net_axi_interconnect_M08_AXI_AWREADY = M08_AXI_awready;
  assign intf_net_axi_interconnect_M08_AXI_BRESP = M08_AXI_bresp[1:0];
  assign intf_net_axi_interconnect_M08_AXI_BVALID = M08_AXI_bvalid;
  assign intf_net_axi_interconnect_M08_AXI_RDATA = M08_AXI_rdata[31:0];
  assign intf_net_axi_interconnect_M08_AXI_RRESP = M08_AXI_rresp[1:0];
  assign intf_net_axi_interconnect_M08_AXI_RVALID = M08_AXI_rvalid;
  assign intf_net_axi_interconnect_M08_AXI_WREADY = M08_AXI_wready;
  assign intf_net_fmch_axi_iic_IIC_SCL_I = IIC_scl_i;
  assign intf_net_fmch_axi_iic_IIC_SDA_I = IIC_sda_i;
  assign net_bdry_in_ext_reset_in = ext_reset_in;
  assign net_bdry_in_hdmi_rx_irq = hdmi_rx_irq;
  assign net_bdry_in_hdmi_tx_irq = hdmi_tx_irq;
  assign net_bdry_in_vphy_irq = vphy_irq;
  assign peripheral_aresetn[0] = net_rst_processor_1_100M_peripheral_aresetn;
  assign s_axi_aclk = net_zynq_us_pl_clk0;
  exdes_axi_interconnect_1 axi_interconnect
       (.ACLK(net_zynq_us_pl_clk0),
        .ARESETN(net_rst_processor_1_100M_interconnect_aresetn),
        .M00_ACLK(net_zynq_us_pl_clk0),
        .M00_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .M00_AXI_araddr(intf_net_axi_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arprot(intf_net_axi_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(intf_net_axi_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(intf_net_axi_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(intf_net_axi_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awprot(intf_net_axi_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(intf_net_axi_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(intf_net_axi_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(intf_net_axi_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(intf_net_axi_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(intf_net_axi_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(intf_net_axi_interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(intf_net_axi_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(intf_net_axi_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(intf_net_axi_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(intf_net_axi_interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(intf_net_axi_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(intf_net_axi_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(intf_net_axi_interconnect_M00_AXI_WVALID),
        .M01_ACLK(net_zynq_us_pl_clk0),
        .M01_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .M01_AXI_araddr(intf_net_axi_interconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(intf_net_axi_interconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(intf_net_axi_interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(intf_net_axi_interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(intf_net_axi_interconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(intf_net_axi_interconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(intf_net_axi_interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(intf_net_axi_interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(intf_net_axi_interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(intf_net_axi_interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(intf_net_axi_interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(intf_net_axi_interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(intf_net_axi_interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(intf_net_axi_interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(intf_net_axi_interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(intf_net_axi_interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(intf_net_axi_interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(intf_net_axi_interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(intf_net_axi_interconnect_M01_AXI_WVALID),
        .M02_ACLK(net_zynq_us_pl_clk0),
        .M02_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .M02_AXI_araddr(intf_net_axi_interconnect_M02_AXI_ARADDR),
        .M02_AXI_arprot(intf_net_axi_interconnect_M02_AXI_ARPROT),
        .M02_AXI_arready(intf_net_axi_interconnect_M02_AXI_ARREADY),
        .M02_AXI_arvalid(intf_net_axi_interconnect_M02_AXI_ARVALID),
        .M02_AXI_awaddr(intf_net_axi_interconnect_M02_AXI_AWADDR),
        .M02_AXI_awprot(intf_net_axi_interconnect_M02_AXI_AWPROT),
        .M02_AXI_awready(intf_net_axi_interconnect_M02_AXI_AWREADY),
        .M02_AXI_awvalid(intf_net_axi_interconnect_M02_AXI_AWVALID),
        .M02_AXI_bready(intf_net_axi_interconnect_M02_AXI_BREADY),
        .M02_AXI_bresp(intf_net_axi_interconnect_M02_AXI_BRESP),
        .M02_AXI_bvalid(intf_net_axi_interconnect_M02_AXI_BVALID),
        .M02_AXI_rdata(intf_net_axi_interconnect_M02_AXI_RDATA),
        .M02_AXI_rready(intf_net_axi_interconnect_M02_AXI_RREADY),
        .M02_AXI_rresp(intf_net_axi_interconnect_M02_AXI_RRESP),
        .M02_AXI_rvalid(intf_net_axi_interconnect_M02_AXI_RVALID),
        .M02_AXI_wdata(intf_net_axi_interconnect_M02_AXI_WDATA),
        .M02_AXI_wready(intf_net_axi_interconnect_M02_AXI_WREADY),
        .M02_AXI_wstrb(intf_net_axi_interconnect_M02_AXI_WSTRB),
        .M02_AXI_wvalid(intf_net_axi_interconnect_M02_AXI_WVALID),
        .M03_ACLK(net_zynq_us_pl_clk0),
        .M03_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .M03_AXI_arready(1'b0),
        .M03_AXI_awready(1'b0),
        .M03_AXI_bresp(1'b0),
        .M03_AXI_bvalid(1'b0),
        .M03_AXI_rdata(1'b0),
        .M03_AXI_rlast(1'b0),
        .M03_AXI_rresp(1'b0),
        .M03_AXI_rvalid(1'b0),
        .M03_AXI_wready(1'b0),
        .M04_ACLK(net_zynq_us_pl_clk0),
        .M04_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .M04_AXI_araddr(intf_net_axi_interconnect_M04_AXI_ARADDR),
        .M04_AXI_arready(intf_net_axi_interconnect_M04_AXI_ARREADY),
        .M04_AXI_arvalid(intf_net_axi_interconnect_M04_AXI_ARVALID),
        .M04_AXI_awaddr(intf_net_axi_interconnect_M04_AXI_AWADDR),
        .M04_AXI_awready(intf_net_axi_interconnect_M04_AXI_AWREADY),
        .M04_AXI_awvalid(intf_net_axi_interconnect_M04_AXI_AWVALID),
        .M04_AXI_bready(intf_net_axi_interconnect_M04_AXI_BREADY),
        .M04_AXI_bresp(intf_net_axi_interconnect_M04_AXI_BRESP),
        .M04_AXI_bvalid(intf_net_axi_interconnect_M04_AXI_BVALID),
        .M04_AXI_rdata(intf_net_axi_interconnect_M04_AXI_RDATA),
        .M04_AXI_rready(intf_net_axi_interconnect_M04_AXI_RREADY),
        .M04_AXI_rresp(intf_net_axi_interconnect_M04_AXI_RRESP),
        .M04_AXI_rvalid(intf_net_axi_interconnect_M04_AXI_RVALID),
        .M04_AXI_wdata(intf_net_axi_interconnect_M04_AXI_WDATA),
        .M04_AXI_wready(intf_net_axi_interconnect_M04_AXI_WREADY),
        .M04_AXI_wstrb(intf_net_axi_interconnect_M04_AXI_WSTRB),
        .M04_AXI_wvalid(intf_net_axi_interconnect_M04_AXI_WVALID),
        .M05_ACLK(net_zynq_us_pl_clk1),
        .M05_ARESETN(net_rst_processor_1_300M_interconnect_aresetn),
        .M05_AXI_araddr(intf_net_axi_interconnect_M05_AXI_ARADDR),
        .M05_AXI_arready(intf_net_axi_interconnect_M05_AXI_ARREADY),
        .M05_AXI_arvalid(intf_net_axi_interconnect_M05_AXI_ARVALID),
        .M05_AXI_awaddr(intf_net_axi_interconnect_M05_AXI_AWADDR),
        .M05_AXI_awready(intf_net_axi_interconnect_M05_AXI_AWREADY),
        .M05_AXI_awvalid(intf_net_axi_interconnect_M05_AXI_AWVALID),
        .M05_AXI_bready(intf_net_axi_interconnect_M05_AXI_BREADY),
        .M05_AXI_bresp(intf_net_axi_interconnect_M05_AXI_BRESP),
        .M05_AXI_bvalid(intf_net_axi_interconnect_M05_AXI_BVALID),
        .M05_AXI_rdata(intf_net_axi_interconnect_M05_AXI_RDATA),
        .M05_AXI_rready(intf_net_axi_interconnect_M05_AXI_RREADY),
        .M05_AXI_rresp(intf_net_axi_interconnect_M05_AXI_RRESP),
        .M05_AXI_rvalid(intf_net_axi_interconnect_M05_AXI_RVALID),
        .M05_AXI_wdata(intf_net_axi_interconnect_M05_AXI_WDATA),
        .M05_AXI_wready(intf_net_axi_interconnect_M05_AXI_WREADY),
        .M05_AXI_wstrb(intf_net_axi_interconnect_M05_AXI_WSTRB),
        .M05_AXI_wvalid(intf_net_axi_interconnect_M05_AXI_WVALID),
        .M06_ACLK(net_zynq_us_pl_clk0),
        .M06_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .M06_AXI_araddr(intf_net_axi_interconnect_M06_AXI_ARADDR),
        .M06_AXI_arburst(intf_net_axi_interconnect_M06_AXI_ARBURST),
        .M06_AXI_arcache(intf_net_axi_interconnect_M06_AXI_ARCACHE),
        .M06_AXI_arid(intf_net_axi_interconnect_M06_AXI_ARID),
        .M06_AXI_arlen(intf_net_axi_interconnect_M06_AXI_ARLEN),
        .M06_AXI_arlock(intf_net_axi_interconnect_M06_AXI_ARLOCK),
        .M06_AXI_arprot(intf_net_axi_interconnect_M06_AXI_ARPROT),
        .M06_AXI_arqos(intf_net_axi_interconnect_M06_AXI_ARQOS),
        .M06_AXI_arready(intf_net_axi_interconnect_M06_AXI_ARREADY),
        .M06_AXI_arregion(intf_net_axi_interconnect_M06_AXI_ARREGION),
        .M06_AXI_arsize(intf_net_axi_interconnect_M06_AXI_ARSIZE),
        .M06_AXI_arvalid(intf_net_axi_interconnect_M06_AXI_ARVALID),
        .M06_AXI_awaddr(intf_net_axi_interconnect_M06_AXI_AWADDR),
        .M06_AXI_awburst(intf_net_axi_interconnect_M06_AXI_AWBURST),
        .M06_AXI_awcache(intf_net_axi_interconnect_M06_AXI_AWCACHE),
        .M06_AXI_awid(intf_net_axi_interconnect_M06_AXI_AWID),
        .M06_AXI_awlen(intf_net_axi_interconnect_M06_AXI_AWLEN),
        .M06_AXI_awlock(intf_net_axi_interconnect_M06_AXI_AWLOCK),
        .M06_AXI_awprot(intf_net_axi_interconnect_M06_AXI_AWPROT),
        .M06_AXI_awqos(intf_net_axi_interconnect_M06_AXI_AWQOS),
        .M06_AXI_awready(intf_net_axi_interconnect_M06_AXI_AWREADY),
        .M06_AXI_awregion(intf_net_axi_interconnect_M06_AXI_AWREGION),
        .M06_AXI_awsize(intf_net_axi_interconnect_M06_AXI_AWSIZE),
        .M06_AXI_awvalid(intf_net_axi_interconnect_M06_AXI_AWVALID),
        .M06_AXI_bid(intf_net_axi_interconnect_M06_AXI_BID),
        .M06_AXI_bready(intf_net_axi_interconnect_M06_AXI_BREADY),
        .M06_AXI_bresp(intf_net_axi_interconnect_M06_AXI_BRESP),
        .M06_AXI_bvalid(intf_net_axi_interconnect_M06_AXI_BVALID),
        .M06_AXI_rdata(intf_net_axi_interconnect_M06_AXI_RDATA),
        .M06_AXI_rid(intf_net_axi_interconnect_M06_AXI_RID),
        .M06_AXI_rlast(intf_net_axi_interconnect_M06_AXI_RLAST),
        .M06_AXI_rready(intf_net_axi_interconnect_M06_AXI_RREADY),
        .M06_AXI_rresp(intf_net_axi_interconnect_M06_AXI_RRESP),
        .M06_AXI_rvalid(intf_net_axi_interconnect_M06_AXI_RVALID),
        .M06_AXI_wdata(intf_net_axi_interconnect_M06_AXI_WDATA),
        .M06_AXI_wlast(intf_net_axi_interconnect_M06_AXI_WLAST),
        .M06_AXI_wready(intf_net_axi_interconnect_M06_AXI_WREADY),
        .M06_AXI_wstrb(intf_net_axi_interconnect_M06_AXI_WSTRB),
        .M06_AXI_wvalid(intf_net_axi_interconnect_M06_AXI_WVALID),
        .M07_ACLK(net_zynq_us_pl_clk0),
        .M07_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .M07_AXI_arready(1'b0),
        .M07_AXI_awready(1'b0),
        .M07_AXI_bresp(1'b0),
        .M07_AXI_bvalid(1'b0),
        .M07_AXI_rdata(1'b0),
        .M07_AXI_rlast(1'b0),
        .M07_AXI_rresp(1'b0),
        .M07_AXI_rvalid(1'b0),
        .M07_AXI_wready(1'b0),
        .M08_ACLK(net_zynq_us_pl_clk1),
        .M08_ARESETN(net_rst_processor_1_300M_interconnect_aresetn),
        .M08_AXI_araddr(intf_net_axi_interconnect_M08_AXI_ARADDR),
        .M08_AXI_arready(intf_net_axi_interconnect_M08_AXI_ARREADY),
        .M08_AXI_arvalid(intf_net_axi_interconnect_M08_AXI_ARVALID),
        .M08_AXI_awaddr(intf_net_axi_interconnect_M08_AXI_AWADDR),
        .M08_AXI_awready(intf_net_axi_interconnect_M08_AXI_AWREADY),
        .M08_AXI_awvalid(intf_net_axi_interconnect_M08_AXI_AWVALID),
        .M08_AXI_bready(intf_net_axi_interconnect_M08_AXI_BREADY),
        .M08_AXI_bresp(intf_net_axi_interconnect_M08_AXI_BRESP),
        .M08_AXI_bvalid(intf_net_axi_interconnect_M08_AXI_BVALID),
        .M08_AXI_rdata(intf_net_axi_interconnect_M08_AXI_RDATA),
        .M08_AXI_rready(intf_net_axi_interconnect_M08_AXI_RREADY),
        .M08_AXI_rresp(intf_net_axi_interconnect_M08_AXI_RRESP),
        .M08_AXI_rvalid(intf_net_axi_interconnect_M08_AXI_RVALID),
        .M08_AXI_wdata(intf_net_axi_interconnect_M08_AXI_WDATA),
        .M08_AXI_wready(intf_net_axi_interconnect_M08_AXI_WREADY),
        .M08_AXI_wstrb(intf_net_axi_interconnect_M08_AXI_WSTRB),
        .M08_AXI_wvalid(intf_net_axi_interconnect_M08_AXI_WVALID),
        .S00_ACLK(net_zynq_us_pl_clk0),
        .S00_ARESETN(net_rst_processor_1_100M_peripheral_aresetn),
        .S00_AXI_araddr(intf_net_zynq_us_M_AXI_HPM0_LPD_ARADDR),
        .S00_AXI_arburst(intf_net_zynq_us_M_AXI_HPM0_LPD_ARBURST),
        .S00_AXI_arcache(intf_net_zynq_us_M_AXI_HPM0_LPD_ARCACHE),
        .S00_AXI_arid(intf_net_zynq_us_M_AXI_HPM0_LPD_ARID),
        .S00_AXI_arlen(intf_net_zynq_us_M_AXI_HPM0_LPD_ARLEN),
        .S00_AXI_arlock(intf_net_zynq_us_M_AXI_HPM0_LPD_ARLOCK),
        .S00_AXI_arprot(intf_net_zynq_us_M_AXI_HPM0_LPD_ARPROT),
        .S00_AXI_arqos(intf_net_zynq_us_M_AXI_HPM0_LPD_ARQOS),
        .S00_AXI_arready(intf_net_zynq_us_M_AXI_HPM0_LPD_ARREADY),
        .S00_AXI_arsize(intf_net_zynq_us_M_AXI_HPM0_LPD_ARSIZE),
        .S00_AXI_aruser(intf_net_zynq_us_M_AXI_HPM0_LPD_ARUSER),
        .S00_AXI_arvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_ARVALID),
        .S00_AXI_awaddr(intf_net_zynq_us_M_AXI_HPM0_LPD_AWADDR),
        .S00_AXI_awburst(intf_net_zynq_us_M_AXI_HPM0_LPD_AWBURST),
        .S00_AXI_awcache(intf_net_zynq_us_M_AXI_HPM0_LPD_AWCACHE),
        .S00_AXI_awid(intf_net_zynq_us_M_AXI_HPM0_LPD_AWID),
        .S00_AXI_awlen(intf_net_zynq_us_M_AXI_HPM0_LPD_AWLEN),
        .S00_AXI_awlock(intf_net_zynq_us_M_AXI_HPM0_LPD_AWLOCK),
        .S00_AXI_awprot(intf_net_zynq_us_M_AXI_HPM0_LPD_AWPROT),
        .S00_AXI_awqos(intf_net_zynq_us_M_AXI_HPM0_LPD_AWQOS),
        .S00_AXI_awready(intf_net_zynq_us_M_AXI_HPM0_LPD_AWREADY),
        .S00_AXI_awsize(intf_net_zynq_us_M_AXI_HPM0_LPD_AWSIZE),
        .S00_AXI_awuser(intf_net_zynq_us_M_AXI_HPM0_LPD_AWUSER),
        .S00_AXI_awvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_AWVALID),
        .S00_AXI_bid(intf_net_zynq_us_M_AXI_HPM0_LPD_BID),
        .S00_AXI_bready(intf_net_zynq_us_M_AXI_HPM0_LPD_BREADY),
        .S00_AXI_bresp(intf_net_zynq_us_M_AXI_HPM0_LPD_BRESP),
        .S00_AXI_bvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_BVALID),
        .S00_AXI_rdata(intf_net_zynq_us_M_AXI_HPM0_LPD_RDATA),
        .S00_AXI_rid(intf_net_zynq_us_M_AXI_HPM0_LPD_RID),
        .S00_AXI_rlast(intf_net_zynq_us_M_AXI_HPM0_LPD_RLAST),
        .S00_AXI_rready(intf_net_zynq_us_M_AXI_HPM0_LPD_RREADY),
        .S00_AXI_rresp(intf_net_zynq_us_M_AXI_HPM0_LPD_RRESP),
        .S00_AXI_rvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_RVALID),
        .S00_AXI_wdata(intf_net_zynq_us_M_AXI_HPM0_LPD_WDATA),
        .S00_AXI_wlast(intf_net_zynq_us_M_AXI_HPM0_LPD_WLAST),
        .S00_AXI_wready(intf_net_zynq_us_M_AXI_HPM0_LPD_WREADY),
        .S00_AXI_wstrb(intf_net_zynq_us_M_AXI_HPM0_LPD_WSTRB),
        .S00_AXI_wvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_WVALID));
  exdes_fmch_axi_iic_0 fmch_axi_iic
       (.s_axi_aclk(net_zynq_us_pl_clk0),
        .s_axi_araddr(intf_net_axi_interconnect_M04_AXI_ARADDR[8:0]),
        .s_axi_aresetn(net_rst_processor_1_100M_peripheral_aresetn),
        .s_axi_arready(intf_net_axi_interconnect_M04_AXI_ARREADY),
        .s_axi_arvalid(intf_net_axi_interconnect_M04_AXI_ARVALID),
        .s_axi_awaddr(intf_net_axi_interconnect_M04_AXI_AWADDR[8:0]),
        .s_axi_awready(intf_net_axi_interconnect_M04_AXI_AWREADY),
        .s_axi_awvalid(intf_net_axi_interconnect_M04_AXI_AWVALID),
        .s_axi_bready(intf_net_axi_interconnect_M04_AXI_BREADY),
        .s_axi_bresp(intf_net_axi_interconnect_M04_AXI_BRESP),
        .s_axi_bvalid(intf_net_axi_interconnect_M04_AXI_BVALID),
        .s_axi_rdata(intf_net_axi_interconnect_M04_AXI_RDATA),
        .s_axi_rready(intf_net_axi_interconnect_M04_AXI_RREADY),
        .s_axi_rresp(intf_net_axi_interconnect_M04_AXI_RRESP),
        .s_axi_rvalid(intf_net_axi_interconnect_M04_AXI_RVALID),
        .s_axi_wdata(intf_net_axi_interconnect_M04_AXI_WDATA),
        .s_axi_wready(intf_net_axi_interconnect_M04_AXI_WREADY),
        .s_axi_wstrb(intf_net_axi_interconnect_M04_AXI_WSTRB),
        .s_axi_wvalid(intf_net_axi_interconnect_M04_AXI_WVALID),
        .scl_i(intf_net_fmch_axi_iic_IIC_SCL_I),
        .scl_o(intf_net_fmch_axi_iic_IIC_SCL_O),
        .scl_t(intf_net_fmch_axi_iic_IIC_SCL_T),
        .sda_i(intf_net_fmch_axi_iic_IIC_SDA_I),
        .sda_o(intf_net_fmch_axi_iic_IIC_SDA_O),
        .sda_t(intf_net_fmch_axi_iic_IIC_SDA_T));
  exdes_rst_processor_1_100M_0 rst_processor_1_100M
       (.aux_reset_in(net_zynq_us_pl_resetn0),
        .dcm_locked(net_zynq_us_pl_resetn0),
        .ext_reset_in(net_bdry_in_ext_reset_in),
        .interconnect_aresetn(net_rst_processor_1_100M_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(net_rst_processor_1_100M_peripheral_aresetn),
        .slowest_sync_clk(net_zynq_us_pl_clk0));
  exdes_rst_processor_1_300M_0 rst_processor_1_300M
       (.aux_reset_in(net_zynq_us_pl_resetn0),
        .dcm_locked(net_zynq_us_pl_resetn0),
        .ext_reset_in(net_bdry_in_ext_reset_in),
        .interconnect_aresetn(net_rst_processor_1_300M_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(net_rst_processor_1_300M_peripheral_aresetn),
        .slowest_sync_clk(net_zynq_us_pl_clk1));
  exdes_xlconcat0_0 xlconcat0
       (.In0(net_bdry_in_vphy_irq),
        .In1(net_bdry_in_hdmi_rx_irq),
        .In2(net_bdry_in_hdmi_tx_irq),
        .dout(net_xlconcat0_dout));
  exdes_zynq_us_0 zynq_us
       (.maxigp2_araddr(intf_net_zynq_us_M_AXI_HPM0_LPD_ARADDR),
        .maxigp2_arburst(intf_net_zynq_us_M_AXI_HPM0_LPD_ARBURST),
        .maxigp2_arcache(intf_net_zynq_us_M_AXI_HPM0_LPD_ARCACHE),
        .maxigp2_arid(intf_net_zynq_us_M_AXI_HPM0_LPD_ARID),
        .maxigp2_arlen(intf_net_zynq_us_M_AXI_HPM0_LPD_ARLEN),
        .maxigp2_arlock(intf_net_zynq_us_M_AXI_HPM0_LPD_ARLOCK),
        .maxigp2_arprot(intf_net_zynq_us_M_AXI_HPM0_LPD_ARPROT),
        .maxigp2_arqos(intf_net_zynq_us_M_AXI_HPM0_LPD_ARQOS),
        .maxigp2_arready(intf_net_zynq_us_M_AXI_HPM0_LPD_ARREADY),
        .maxigp2_arsize(intf_net_zynq_us_M_AXI_HPM0_LPD_ARSIZE),
        .maxigp2_aruser(intf_net_zynq_us_M_AXI_HPM0_LPD_ARUSER),
        .maxigp2_arvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_ARVALID),
        .maxigp2_awaddr(intf_net_zynq_us_M_AXI_HPM0_LPD_AWADDR),
        .maxigp2_awburst(intf_net_zynq_us_M_AXI_HPM0_LPD_AWBURST),
        .maxigp2_awcache(intf_net_zynq_us_M_AXI_HPM0_LPD_AWCACHE),
        .maxigp2_awid(intf_net_zynq_us_M_AXI_HPM0_LPD_AWID),
        .maxigp2_awlen(intf_net_zynq_us_M_AXI_HPM0_LPD_AWLEN),
        .maxigp2_awlock(intf_net_zynq_us_M_AXI_HPM0_LPD_AWLOCK),
        .maxigp2_awprot(intf_net_zynq_us_M_AXI_HPM0_LPD_AWPROT),
        .maxigp2_awqos(intf_net_zynq_us_M_AXI_HPM0_LPD_AWQOS),
        .maxigp2_awready(intf_net_zynq_us_M_AXI_HPM0_LPD_AWREADY),
        .maxigp2_awsize(intf_net_zynq_us_M_AXI_HPM0_LPD_AWSIZE),
        .maxigp2_awuser(intf_net_zynq_us_M_AXI_HPM0_LPD_AWUSER),
        .maxigp2_awvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_AWVALID),
        .maxigp2_bid(intf_net_zynq_us_M_AXI_HPM0_LPD_BID),
        .maxigp2_bready(intf_net_zynq_us_M_AXI_HPM0_LPD_BREADY),
        .maxigp2_bresp(intf_net_zynq_us_M_AXI_HPM0_LPD_BRESP),
        .maxigp2_bvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_BVALID),
        .maxigp2_rdata(intf_net_zynq_us_M_AXI_HPM0_LPD_RDATA),
        .maxigp2_rid(intf_net_zynq_us_M_AXI_HPM0_LPD_RID),
        .maxigp2_rlast(intf_net_zynq_us_M_AXI_HPM0_LPD_RLAST),
        .maxigp2_rready(intf_net_zynq_us_M_AXI_HPM0_LPD_RREADY),
        .maxigp2_rresp(intf_net_zynq_us_M_AXI_HPM0_LPD_RRESP),
        .maxigp2_rvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_RVALID),
        .maxigp2_wdata(intf_net_zynq_us_M_AXI_HPM0_LPD_WDATA),
        .maxigp2_wlast(intf_net_zynq_us_M_AXI_HPM0_LPD_WLAST),
        .maxigp2_wready(intf_net_zynq_us_M_AXI_HPM0_LPD_WREADY),
        .maxigp2_wstrb(intf_net_zynq_us_M_AXI_HPM0_LPD_WSTRB),
        .maxigp2_wvalid(intf_net_zynq_us_M_AXI_HPM0_LPD_WVALID),
        .maxihpm0_lpd_aclk(net_zynq_us_pl_clk0),
        .pl_clk0(net_zynq_us_pl_clk0),
        .pl_clk1(net_zynq_us_pl_clk1),
        .pl_ps_irq0(net_xlconcat0_dout),
        .pl_ps_irq1(1'b0),
        .pl_resetn0(net_zynq_us_pl_resetn0));
endmodule
