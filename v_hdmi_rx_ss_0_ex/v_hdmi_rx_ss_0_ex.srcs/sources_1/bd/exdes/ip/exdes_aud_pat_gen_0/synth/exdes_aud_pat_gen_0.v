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


// IP VLNV: xilinx.com:module_ref:aud_pat_gen:1.0
// IP Revision: 1

(* X_CORE_INFO = "aud_pat_gen,Vivado 2018.2" *)
(* CHECK_LICENSE_TYPE = "exdes_aud_pat_gen_0,aud_pat_gen,{}" *)
(* CORE_GENERATION_INFO = "exdes_aud_pat_gen_0,aud_pat_gen,{x_ipProduct=Vivado 2018.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=aud_pat_gen,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module exdes_aud_pat_gen_0 (
  axi_aclk,
  axi_aresetn,
  axi_awvalid,
  axi_awready,
  axi_awaddr,
  axi_awprot,
  axi_wvalid,
  axi_wready,
  axi_wdata,
  axi_wstrb,
  axi_bvalid,
  axi_bready,
  axi_bresp,
  axi_arvalid,
  axi_arready,
  axi_araddr,
  axi_arprot,
  axi_rvalid,
  axi_rready,
  axi_rdata,
  axi_rresp,
  aud_clk,
  axis_clk,
  axis_resetn,
  axis_aud_pattern_tdata_in,
  axis_aud_pattern_tid_in,
  axis_aud_pattern_tvalid_in,
  axis_aud_pattern_tready_out,
  axis_aud_pattern_tdata_out,
  axis_aud_pattern_tid_out,
  axis_aud_pattern_tvalid_out,
  axis_aud_pattern_tready_in
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi_aclk, ASSOCIATED_BUSIF axi, ASSOCIATED_RESET axi_aresetn, FREQ_HZ 99999000, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axi_aclk CLK" *)
input wire axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi_aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_aresetn RST" *)
input wire axi_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWVALID" *)
input wire axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWREADY" *)
output wire axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWADDR" *)
input wire [31 : 0] axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWPROT" *)
input wire [2 : 0] axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WVALID" *)
input wire axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WREADY" *)
output wire axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WDATA" *)
input wire [31 : 0] axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WSTRB" *)
input wire [3 : 0] axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BVALID" *)
output wire axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BREADY" *)
input wire axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BRESP" *)
output wire [1 : 0] axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi ARVALID" *)
input wire axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi ARREADY" *)
output wire axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi ARADDR" *)
input wire [31 : 0] axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi ARPROT" *)
input wire [2 : 0] axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi RVALID" *)
output wire axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi RREADY" *)
input wire axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi RDATA" *)
output wire [31 : 0] axi_rdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 99999000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN exdes_zynq_us_0_pl_clk0, NUM_READ_THREADS 1, NUM_WRITE_THREAD\
S 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi RRESP" *)
output wire [1 : 0] axi_rresp;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aud_clk, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aud_clk CLK" *)
input wire aud_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_clk, ASSOCIATED_RESET axis_resetn, ASSOCIATED_BUSIF axis_audio_in:axis_audio_out, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axis_clk CLK" *)
input wire axis_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_resetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axis_resetn RST" *)
input wire axis_resetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_in TDATA" *)
input wire [31 : 0] axis_aud_pattern_tdata_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_in TID" *)
input wire [2 : 0] axis_aud_pattern_tid_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_in TVALID" *)
input wire axis_aud_pattern_tvalid_in;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_audio_in, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_in TREADY" *)
output wire axis_aud_pattern_tready_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_out TDATA" *)
output wire [31 : 0] axis_aud_pattern_tdata_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_out TID" *)
output wire [2 : 0] axis_aud_pattern_tid_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_out TVALID" *)
output wire axis_aud_pattern_tvalid_out;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_audio_out, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 99999000, PHASE 0.0, CLK_DOMAIN exdes_clk_wiz_0_clk_out1, LAYERED_METADATA undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_audio_out TREADY" *)
input wire axis_aud_pattern_tready_in;

  aud_pat_gen inst (
    .axi_aclk(axi_aclk),
    .axi_aresetn(axi_aresetn),
    .axi_awvalid(axi_awvalid),
    .axi_awready(axi_awready),
    .axi_awaddr(axi_awaddr),
    .axi_awprot(axi_awprot),
    .axi_wvalid(axi_wvalid),
    .axi_wready(axi_wready),
    .axi_wdata(axi_wdata),
    .axi_wstrb(axi_wstrb),
    .axi_bvalid(axi_bvalid),
    .axi_bready(axi_bready),
    .axi_bresp(axi_bresp),
    .axi_arvalid(axi_arvalid),
    .axi_arready(axi_arready),
    .axi_araddr(axi_araddr),
    .axi_arprot(axi_arprot),
    .axi_rvalid(axi_rvalid),
    .axi_rready(axi_rready),
    .axi_rdata(axi_rdata),
    .axi_rresp(axi_rresp),
    .aud_clk(aud_clk),
    .axis_clk(axis_clk),
    .axis_resetn(axis_resetn),
    .axis_aud_pattern_tdata_in(axis_aud_pattern_tdata_in),
    .axis_aud_pattern_tid_in(axis_aud_pattern_tid_in),
    .axis_aud_pattern_tvalid_in(axis_aud_pattern_tvalid_in),
    .axis_aud_pattern_tready_out(axis_aud_pattern_tready_out),
    .axis_aud_pattern_tdata_out(axis_aud_pattern_tdata_out),
    .axis_aud_pattern_tid_out(axis_aud_pattern_tid_out),
    .axis_aud_pattern_tvalid_out(axis_aud_pattern_tvalid_out),
    .axis_aud_pattern_tready_in(axis_aud_pattern_tready_in)
  );
endmodule
