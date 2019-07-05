
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

`include "vid_phy_controller_v2_2_1_defs.v"
`timescale 1ns / 1ps
`define DLY #1

//***********************************Entity Declaration************************
(* DowngradeIPIdentifiedWarnings="yes" *)
module exdes_vid_phy_controller_0_top #
    (

        parameter         C_COMPONENT_NAME              = "vid_phy_controller_v",
        parameter         C_FAMILY                      = "kintex8",
        parameter         C_DEVICE                      = "xc7k325t",
        parameter         C_SPEEDGRADE                  = "-3",
        parameter         C_SILICON_REVISION            = "0",
        
        // HDMI
        parameter integer C_NIDRU                       = 1,
        parameter integer C_NIDRU_REFCLK_SEL            = 3,
        parameter integer C_TX_REFCLK_SEL               = 0,
        parameter integer C_RX_REFCLK_SEL               = 1,        
    
        parameter integer C_SupportLevel                = 0,
        parameter integer C_TransceiverControl          = "false",
        parameter         c_sub_core_name               = "subcore",
        // GT Specific Parameters       
        parameter integer C_Tx_No_Of_Channels           =  3,   // baoshan: get from modelparam
        parameter integer C_Rx_No_Of_Channels           =  3,   // baoshan: get from modelparam
        parameter integer C_Tx_Protocol                 =  1,         // baoshan: get from modelparam
        parameter integer C_Rx_Protocol                 =  1,         // baoshan: get from modelparam
        parameter integer C_TX_PLL_SELECTION            =  6,                // baoshan: get from modelparam
        parameter integer C_RX_PLL_SELECTION            =  0,                // baoshan: get from modelparam
        parameter integer C_INPUT_PIXELS_PER_CLOCK          =  4,                           // for HDMI only - value directly propagated from XGUI

        parameter integer Tx_Buffer_Bypass              = 1,
        parameter integer C_Hdmi_Fast_Switch            = 1,
        parameter integer C_Err_Irq_En                  = 0,
        
        parameter integer C_Txrefclk_Rdy_Invert         = 1,
        parameter integer C_Use_GT_CH4_HDMI             = 0,
        
        // Parameters of Axi Slave Bus Interface vid_phy_axi4lite
        parameter integer C_vid_phy_axi4lite_DATA_WIDTH         = 32,
        parameter integer C_vid_phy_axi4lite_ADDR_WIDTH         = 10,   // baoshan: 1 bit added on addr width for HDMI - review this with Vamsi
        parameter integer C_vid_phy_tx_axi4s_ch_TDATA_WIDTH     = 40,
        parameter integer C_vid_phy_tx_axi4s_ch_INT_TDATA_WIDTH = 40,
        parameter integer C_vid_phy_tx_axi4s_ch_TUSER_WIDTH     = 1,
        parameter integer C_vid_phy_rx_axi4s_ch_TDATA_WIDTH     = 40,
        parameter integer C_vid_phy_rx_axi4s_ch_INT_TDATA_WIDTH = 40,
        parameter integer C_vid_phy_rx_axi4s_ch_TUSER_WIDTH     = 1,
        parameter integer C_vid_phy_control_sb_tx_TDATA_WIDTH   = 32,
        parameter integer C_vid_phy_status_sb_tx_TDATA_WIDTH    = 32,
        parameter integer C_vid_phy_control_sb_rx_TDATA_WIDTH   = 32,
        parameter integer C_vid_phy_status_sb_rx_TDATA_WIDTH    = 32

    )
    (
        // Ports of GT
        input wire  mgtrefclk0_pad_n_in,
        input wire  mgtrefclk0_pad_p_in,
        input wire  mgtrefclk1_pad_n_in,
        input wire  mgtrefclk1_pad_p_in,
        input wire  mgtrefclk0_in,
        input wire  mgtrefclk1_in,

        input wire  drpclk,

        //7-series clocks AND 8-series CPLL clocks
        //input wire  gtgrefclk_in,
        input wire  gtnorthrefclk0_in,
        input wire  gtnorthrefclk1_in,
        input wire  gtsouthrefclk0_in,
        input wire  gtsouthrefclk1_in,
        //gtp ports
        input wire  gteastrefclk0_in,
        input wire  gteastrefclk1_in,
        input wire  gtwestrefclk0_in,
        input wire  gtwestrefclk1_in,

        // 8-series QPLL clocks
        //input wire  gtgrefclk0_in,
        //input wire  gtgrefclk1_in,
        input wire  gtnorthrefclk00_in,
        input wire  gtnorthrefclk01_in,
        input wire  gtnorthrefclk10_in,
        input wire  gtnorthrefclk11_in,
        input wire  gtsouthrefclk00_in,
        input wire  gtsouthrefclk01_in,
        input wire  gtsouthrefclk10_in,
        input wire  gtsouthrefclk11_in,

        input wire [C_Rx_No_Of_Channels-1 : 0]  phy_rxn_in,
        input wire [C_Rx_No_Of_Channels-1 : 0]  phy_rxp_in,
        output wire [C_Tx_No_Of_Channels-1 : 0]  phy_txn_out,
        output wire [C_Tx_No_Of_Channels-1 : 0]  phy_txp_out,

        // Ports of Axi Slave Bus Interface vid_phy_axi4lite
        input wire  vid_phy_axi4lite_aclk,
        input wire  vid_phy_axi4lite_aresetn,
        input wire [C_vid_phy_axi4lite_ADDR_WIDTH-1 : 0] vid_phy_axi4lite_awaddr,
        input wire [2 : 0] vid_phy_axi4lite_awprot,
        input wire  vid_phy_axi4lite_awvalid,
        output wire  vid_phy_axi4lite_awready,
        input wire [C_vid_phy_axi4lite_DATA_WIDTH-1 : 0] vid_phy_axi4lite_wdata,
        input wire [(C_vid_phy_axi4lite_DATA_WIDTH/8)-1 : 0] vid_phy_axi4lite_wstrb,
        input wire  vid_phy_axi4lite_wvalid,
        output wire  vid_phy_axi4lite_wready,
        output wire [1 : 0] vid_phy_axi4lite_bresp,
        output wire  vid_phy_axi4lite_bvalid,
        input wire  vid_phy_axi4lite_bready,
        input wire [C_vid_phy_axi4lite_ADDR_WIDTH-1 : 0] vid_phy_axi4lite_araddr,
        input wire [2 : 0] vid_phy_axi4lite_arprot,
        input wire  vid_phy_axi4lite_arvalid,
        output wire  vid_phy_axi4lite_arready,
        output wire [C_vid_phy_axi4lite_DATA_WIDTH-1 : 0] vid_phy_axi4lite_rdata,
        output wire [1 : 0] vid_phy_axi4lite_rresp,
        output wire  vid_phy_axi4lite_rvalid,
        input wire  vid_phy_axi4lite_rready,

        // Ports of Axi Slave Bus Interface vid_phy_tx_axi4s_ch0
        input wire  vid_phy_tx_axi4s_aclk,
        input wire  vid_phy_tx_axi4s_aresetn,
        
        output wire  vid_phy_tx_axi4s_ch0_tready,
        input wire [C_vid_phy_tx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_tx_axi4s_ch0_tdata,
        input wire [C_vid_phy_tx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_tx_axi4s_ch0_tuser,
        input wire  vid_phy_tx_axi4s_ch0_tvalid,

        // Ports of Axi Slave Bus Interface vid_phy_tx_axi4s_ch1
        output wire  vid_phy_tx_axi4s_ch1_tready,
        input wire [C_vid_phy_tx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_tx_axi4s_ch1_tdata,
        input wire [C_vid_phy_tx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_tx_axi4s_ch1_tuser,
        input wire  vid_phy_tx_axi4s_ch1_tvalid,

        // Ports of Axi Slave Bus Interface vid_phy_tx_axi4s_ch2
        output wire  vid_phy_tx_axi4s_ch2_tready,
        input wire [C_vid_phy_tx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_tx_axi4s_ch2_tdata,
        input wire [C_vid_phy_tx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_tx_axi4s_ch2_tuser,
        input wire  vid_phy_tx_axi4s_ch2_tvalid,

        // Ports of Axi Slave Bus Interface vid_phy_tx_axi4s_ch3
        output wire  vid_phy_tx_axi4s_ch3_tready,
        input wire [C_vid_phy_tx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_tx_axi4s_ch3_tdata,
        input wire [C_vid_phy_tx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_tx_axi4s_ch3_tuser,
        input wire  vid_phy_tx_axi4s_ch3_tvalid,

        // Ports of Axi Master Bus Interface vid_phy_rx_axi4s_ch0
        input wire  vid_phy_rx_axi4s_aclk,
        input wire  vid_phy_rx_axi4s_aresetn,
        
        output wire  vid_phy_rx_axi4s_ch0_tvalid,
        output wire [C_vid_phy_rx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_rx_axi4s_ch0_tdata,
        output wire [C_vid_phy_rx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_rx_axi4s_ch0_tuser,
        input wire  vid_phy_rx_axi4s_ch0_tready,

        // Ports of Axi Master Bus Interface vid_phy_rx_axi4s_ch1
        output wire  vid_phy_rx_axi4s_ch1_tvalid,
        output wire [C_vid_phy_rx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_rx_axi4s_ch1_tdata,
        output wire [C_vid_phy_rx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_rx_axi4s_ch1_tuser,
        input wire  vid_phy_rx_axi4s_ch1_tready,

        // Ports of Axi Master Bus Interface vid_phy_rx_axi4s_ch2
        output wire  vid_phy_rx_axi4s_ch2_tvalid,
        output wire [C_vid_phy_rx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_rx_axi4s_ch2_tdata,
        output wire [C_vid_phy_rx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_rx_axi4s_ch2_tuser,
        input wire  vid_phy_rx_axi4s_ch2_tready,

        // Ports of Axi Master Bus Interface vid_phy_rx_axi4s_ch3
        output wire  vid_phy_rx_axi4s_ch3_tvalid,
        output wire [C_vid_phy_rx_axi4s_ch_TDATA_WIDTH-1 : 0] vid_phy_rx_axi4s_ch3_tdata,
        output wire [C_vid_phy_rx_axi4s_ch_TUSER_WIDTH-1 : 0] vid_phy_rx_axi4s_ch3_tuser,
        input wire  vid_phy_rx_axi4s_ch3_tready,

        // Ports of Axi Slave Bus Interface vid_phy_control_sb_tx
        input wire  vid_phy_sb_aclk,
        input wire  vid_phy_sb_aresetn,

        output wire  vid_phy_control_sb_tx_tready,
        input wire [C_vid_phy_control_sb_tx_TDATA_WIDTH-1 : 0] vid_phy_control_sb_tx_tdata,
        input wire  vid_phy_control_sb_tx_tvalid,

        // Ports of Axi Master Bus Interface vid_phy_status_sb_tx
        output wire  vid_phy_status_sb_tx_tvalid,
        output wire [C_vid_phy_status_sb_tx_TDATA_WIDTH-1 : 0] vid_phy_status_sb_tx_tdata,
        input wire  vid_phy_status_sb_tx_tready,

        // Ports of Axi Slave Bus Interface vid_phy_control_sb_rx
        output wire  vid_phy_control_sb_rx_tready,
        input wire [C_vid_phy_control_sb_rx_TDATA_WIDTH-1 : 0] vid_phy_control_sb_rx_tdata,
        input wire  vid_phy_control_sb_rx_tvalid,

        // Ports of Axi Master Bus Interface vid_phy_status_sb_rx
        output wire  vid_phy_status_sb_rx_tvalid,
        output wire [C_vid_phy_status_sb_rx_TDATA_WIDTH-1 : 0] vid_phy_status_sb_rx_tdata,
        input wire  vid_phy_status_sb_rx_tready,

        // HDMI sideband
        input wire   tx_refclk_rdy,
        output wire  tx_tmds_clk, 
        output wire  tx_video_clk, 
        output wire  rx_tmds_clk,  
        output wire  rx_video_clk, 
        output wire  tx_tmds_clk_p,  
        output wire  tx_tmds_clk_n,         
        output wire  rx_tmds_clk_p,  
        output wire  rx_tmds_clk_n,         
        
        input wire  mgtrefclk0_odiv2_in,
        input wire  mgtrefclk1_odiv2_in,
        input wire  gtnorthrefclk0_odiv2_in,
        input wire  gtnorthrefclk1_odiv2_in,
        input wire  gtsouthrefclk0_odiv2_in,
        input wire  gtsouthrefclk1_odiv2_in,
                
        output wire  txrefclk_ceb, //To Mak: activate only if txrefclk is outside the quad i.e. NORTH, SOUTH, WEST and EAST
        output wire  rxrefclk_ceb, //To Mak: activate only if rxrefclk is outside the quad i.e. NORTH, SOUTH, WEST and EAST

                input wire  [C_Tx_No_Of_Channels   -1 : 0] gttxpippmen_in,
                input wire  [C_Tx_No_Of_Channels   -1 : 0] gttxpippmovrden_in,
                input wire  [C_Tx_No_Of_Channels   -1 : 0] gttxpippmpd_in,
                input wire  [C_Tx_No_Of_Channels   -1 : 0] gttxpippmsel_in,
                input wire  [C_Tx_No_Of_Channels*5 -1 : 0] gttxpippmstepsize_in,
        output wire err_irq,

        output wire  txoutclk,
        output wire  rxoutclk,
        output wire  irq
    );

    wire [2:0] gthtxn_out_dummy;
    wire [2:0] gthtxp_out_dummy;
    wire mgtrefclk0_i;
    wire mgtrefclk1_i;
    wire mgtrefclk0_odiv2_i;
    wire mgtrefclk1_odiv2_i;
    wire vid_phy_axi4lite_areset = ~vid_phy_axi4lite_aresetn;

    wire drpclk_i = drpclk;

    localparam pBANK0 = 5'h00;
    localparam pBANK1 = 5'h01;
    localparam pBANK2 = 5'h02;
    localparam pBANK3 = 5'h03;
    localparam GTREFCLK0 = 0;
    localparam GTREFCLK1 = 1;
    localparam GTNORTHREFCLK0 = 2;
    localparam GTNORTHREFCLK1 = 3;
    localparam GTSOUTHREFCLK0 = 4;
    localparam GTSOUTHREFCLK1 = 5;
    localparam GTEASTREFCLK0  = 6;
    localparam GTEASTREFCLK1  = 7;
    localparam GTWESTREFCLK0  = 8;
    localparam GTWESTREFCLK1  = 9;
    
    wire [2 : 0] vid_phy_rx_axi4s_tvalid;   // for NIDRU usage
    wire `tPHY_MEM_MAP_FIELDS_CONTROL   cfg_phy_mem_map_control;
    wire `tPHY_MEM_MAP_FIELDS_STATUS    cfg_phy_mem_map_status;  
    wire [6:0] drp_txn_available;
    wire [6:0] drp_rsp_read; 
    wire [3:0] rx_sym_err_cntr_read; 

  wire i_dp_train_itr_reset;    //resets for every TP lane set access
  wire i_dp_start_of_tp1_reset; //resets GT for every start of TP1 event

    wire `tPHY_MEM_MAP_FIELDS_CONTROL   cfg_phy_mem_map_control_b0;
    wire `tPHY_MEM_MAP_FIELDS_STATUS    cfg_phy_mem_map_status_b0;  




//Async control inputs are assigned directly to wires
wire [0 : 0] gtwiz_userclk_tx_reset_in               =  cfg_phy_mem_map_control_b0[`BUFGT_TXUSRCLK_CLEAR];
wire [0 : 0] gtwiz_userclk_tx_active_in;
wire [0 : 0] gtwiz_userclk_rx_reset_in               =  cfg_phy_mem_map_control_b0[`BUFGT_RXUSRCLK_CLEAR];
wire [0 : 0] gtwiz_userclk_rx_active_in;
    // HDMI
    wire [0 : 0] gtwiz_reset_rx_datapath_in              =  cfg_phy_mem_map_control_b0[`CH1_GTRXRESET];
    wire [0 : 0] gtwiz_reset_qpll_lock_in;
    wire [0 : 0] gtwiz_reset_qpll_reset_out;
wire [0 : 0] gtwiz_reset_rx_datapath_in_sync_drpclk;
wire [0 : 0] gtwiz_buffbypass_tx_done_out;
wire [0 : 0] gtwiz_buffbypass_tx_done_out_sync;
wire [0 : 0] gtwiz_buffbypass_tx_error_out;
wire [0 : 0] gtwiz_reset_clk_freerun_in              =  drpclk_i;
wire [0 : 0] gtwiz_reset_all_in                      =  vid_phy_axi4lite_areset;
wire [0 : 0] gtwiz_reset_tx_pll_and_datapath_in      =  cfg_phy_mem_map_control_b0[`CH1_TX_PLL_GT_RST];
wire [0 : 0] gtwiz_reset_tx_pll_and_datapath_in_sync_drpclk;
wire [0 : 0] gtwiz_reset_tx_datapath_in              =  cfg_phy_mem_map_control_b0[`CH1_GTTXRESET];
wire [0 : 0] gtwiz_reset_tx_datapath_in_sync_drpclk;
wire [0 : 0] gtwiz_reset_rx_pll_and_datapath_in      =  cfg_phy_mem_map_control_b0[`CH1_RX_PLL_GT_RST];
wire [0 : 0] gtwiz_reset_rx_pll_and_datapath_in_sync_drpclk;
wire [0 : 0] gtwiz_reset_rx_cdr_stable_out;
wire [0 : 0] gtwiz_reset_tx_done_out;
wire [0 : 0] gtwiz_reset_rx_done_out;
wire [17 : 0] gtwiz_gte4_cpll_cal_txoutclk_period_sync;
wire [17 : 0] gtwiz_gte4_cpll_cal_cnt_tol_in_sync;        
wire [53 : 0] gtwiz_gte4_cpll_cal_txoutclk_period_in;
wire [53 : 0] gtwiz_gte4_cpll_cal_cnt_tol_in;        
wire [2 : 0] gtwiz_gte4_cpll_cal_bufg_ce_in             = {3 {1'b1}};        
wire [0 : 0] gtwiz_reset_tx_done_out_sync;
wire [0 : 0] gtwiz_reset_rx_done_out_sync;
wire [2 : 0] gtrefclk0_in_int;
wire [2 : 0] gtrefclk1_in_int;
wire [2 : 0] gtgrefclk_in_int;     
wire [2 : 0] gtnorthrefclk0_in_int;
wire [2 : 0] gtnorthrefclk1_in_int;
wire [2 : 0] gtsouthrefclk0_in_int;
wire [2 : 0] gtsouthrefclk1_in_int;
wire [119: 0] gtwiz_userdata_tx_in;
wire [119: 0] gtwiz_userdata_rx_out;
wire [119: 0] gtwiz_userdata_rx_out_i;   // for HDMI
wire [16-1 : 0] drpaddr_common_in;
wire [0 : 0] drpclk_common_in                        = drpclk_i;
wire [15 : 0] drpdi_common_in;
wire [0 : 0] drpen_common_in;
wire [0 : 0] drpwe_common_in;
wire [0 : 0] qpll0pd_in                              =  cfg_phy_mem_map_control_b0[`CH1_QPLL0PD];
wire [2 : 0] qpll0refclksel_in                       =  cfg_phy_mem_map_control_b0[`QPLL0REFCLKSEL];
wire [0 : 0] qpll1pd_in                              =  cfg_phy_mem_map_control_b0[`CH1_QPLL1PD];
wire [2 : 0] qpll1refclksel_in                       =  cfg_phy_mem_map_control_b0[`QPLL1REFCLKSEL];
wire [15 : 0] drpdo_common_out;
wire [0 : 0] drprdy_common_out;
wire [2 : 0] cplllock_out;
wire [0 : 0] cplllock_out_dly;
wire [0 : 0] qpll0lock_out;
wire [0 : 0] qpll0lock_out_dly;
wire [0 : 0] qpll1lock_out;
wire [0 : 0] qpll1lock_out_dly;
wire [0 : 0] qpll1outclk_out;
wire [0 : 0] qpll1outrefclk_out;
wire [0 : 0] refclkoutmonitor0_out;
wire [0 : 0] refclkoutmonitor1_out;

    // HDMI uses these signals
    wire [0 : 0] qpll0outclk_out;
    wire [2 : 0] qpll0outclk_out_int;
    wire [0 : 0] qpll0outrefclk_out;
    wire [2 : 0] qpll0outrefclk_out_int;
    wire [2 : 0] qpll1outclk_out_int;
    wire [2 : 0] qpll1outrefclk_out_int;
    wire [2 : 0] rxcdrhold_in;
    wire [2 : 0] rxlpmhfovrden_in;
    wire [2 : 0] rxlpmlfklovrden_in;
    wire [2 : 0] rxosovrden_in;
    wire [2 : 0] txelecidle_in;
    wire [2 : 0] txprgdivresetdone_out;
    wire [14 : 0] txdiffctrl_in;
    wire [2 : 0] txinhibit_in;
    wire [2 : 0] txpolarity_in;
    wire [14 : 0] txpostcursor_in;
    wire [2 : 0] rxpolarity_in;
    wire [2 : 0] rxcdrlock_out;

wire [8 : 0] cpllrefclksel_in;
wire [29 : 0] drpaddr_in;
wire [2 : 0] drpclk_in;
wire [47 : 0] drpdi_in;
wire [2 : 0] drpen_in;
wire [2 : 0] drpwe_in;
wire [8 : 0] loopback_in;

wire [2 : 0] rxlpmen_in;
wire [5 : 0] rxpllclksel_in;
wire [2 : 0] rxprbscntreset_in;
wire [11 : 0] rxprbssel_in;
wire [5 : 0] rxsysclksel_in;
wire [2 : 0] rxusrclk_in;
wire [2 : 0] rxusrclk2_in;

wire [5 : 0] txpllclksel_in;
wire [2 : 0] txprbsforceerr_in;
wire [11 : 0] txprbssel_in;
wire [14 : 0] txprecursor_in;
wire [5 : 0] txsysclksel_in;
wire [2 : 0] txusrclk_in;
wire [2 : 0] txusrclk2_in;
wire [2 : 0] cpllfbclklost_out;
wire [2 : 0] cpllrefclklost_out;
wire [47 : 0] drpdo_out;
wire [2 : 0] drprdy_out;
wire [2 : 0] gtpowergood_out;        
wire [2 : 0] gtrefclkmonitor_out;
wire [8 : 0] rxbufstatus_out;
wire [2 : 0] rxpmaresetdone_out;
wire [2 : 0] rxprbserr_out;
wire [2 : 0] rxprbserr_out_sync;
wire [2 : 0] rxprbslocked_out;
wire [2 : 0] rxresetdone_out;
wire [5 : 0] txbufstatus_out;
wire [2 : 0] txphaligndone_out;
wire [2 : 0] txpmaresetdone_out;
wire [2 : 0] txresetdone_out;
wire [2 : 0] txoutclk_out;
wire [2 : 0] rxoutclk_out;

reg [23 : 0] b0_QPLL_LOCK_DLY_CNT;
reg          b0_QPLL_LOCK_DLY;
wire         b0_QPLL_LOCK_DLY_SYNC_AXICLK;
reg [23 : 0] b0_CPLL_LOCK_DLY_CNT;
reg          b0_CPLL_LOCK_DLY;
wire         b0_CPLL_LOCK_DLY_SYNC_AXICLK;
wire         b0_CPLL_RESET;
reg [2 : 0]  b0_TX_LINK_RDY_SYNC;
wire         b0_TX_LINK_RDY_RE;
reg          b0_TX_LINK_RDY;
wire         b0_TX_PLL_LOCK;
reg [23 : 0] b0_MMCM_TX_DRP_LOCKED_DLY_CNT;
reg [23 : 0] b0_MMCM_RX_DRP_LOCKED_DLY_CNT;
    



    // ---------------------- Bank 0, GT Channel 0 ------------------------------
    assign gtwiz_userdata_tx_in[39: 0] = vid_phy_tx_axi4s_ch0_tdata;
    assign vid_phy_tx_axi4s_ch0_tready    = 1'b1;
    assign vid_phy_rx_axi4s_ch0_tdata        = gtwiz_userdata_rx_out[39: 0];
    assign vid_phy_rx_axi4s_ch0_tuser[0]     = 1'b0;
    assign vid_phy_rx_axi4s_ch0_tvalid       = (C_NIDRU==1)? vid_phy_rx_axi4s_tvalid[0] : 1'b1;

    // ---------------------- Bank 0, GT Channel 1 ------------------------------
    assign gtwiz_userdata_tx_in[79: 40] = vid_phy_tx_axi4s_ch1_tdata;
    assign vid_phy_tx_axi4s_ch1_tready    = 1'b1;
    assign vid_phy_rx_axi4s_ch1_tdata        = gtwiz_userdata_rx_out[79: 40];
    assign vid_phy_rx_axi4s_ch1_tuser[0]     = 1'b0;
    assign vid_phy_rx_axi4s_ch1_tvalid       = (C_NIDRU==1)? vid_phy_rx_axi4s_tvalid[1] : 1'b1;

    // ---------------------- Bank 0, GT Channel 2 ------------------------------
    assign gtwiz_userdata_tx_in[119: 80] = vid_phy_tx_axi4s_ch2_tdata;
    assign vid_phy_tx_axi4s_ch2_tready    = 1'b1;
    assign vid_phy_rx_axi4s_ch2_tdata        = gtwiz_userdata_rx_out[119: 80];
    assign vid_phy_rx_axi4s_ch2_tuser[0]     = 1'b0;
    assign vid_phy_rx_axi4s_ch2_tvalid       = (C_NIDRU==1)? vid_phy_rx_axi4s_tvalid[2] : 1'b1;




  // ---------- Channel # 0 Assignments...
  assign rxcdrhold_in[0] = cfg_phy_mem_map_control_b0[`CH1_RXCDRHOLD]; 
  assign rxlpmhfovrden_in[0] = cfg_phy_mem_map_control_b0[`CH1_RXLPMHFOVRDEN];
  assign rxlpmlfklovrden_in[0] = cfg_phy_mem_map_control_b0[`CH1_RXLPMLFKLOVRDEN];
  assign rxosovrden_in[0] = cfg_phy_mem_map_control_b0[`CH1_RXOSOVRDEN];
  assign txpostcursor_in[4: 0] = cfg_phy_mem_map_control_b0[`CH1_TXPOSTCURSOR]; 
  assign cpllrefclksel_in[2: 0] = cfg_phy_mem_map_control_b0[`CPLLREFCLKSEL];
  assign loopback_in[2: 0] = cfg_phy_mem_map_control_b0[`CH1_LOOPBACK]; 
  assign rxlpmen_in[0] = cfg_phy_mem_map_control_b0[`CH1_RXLPMEN]; //Removed dependency with RXUSRCLK2 sync
  assign rxpllclksel_in[1: 0] = cfg_phy_mem_map_control_b0[`RXPLLCLKSEL]; 
  assign rxsysclksel_in[1: 0] = cfg_phy_mem_map_control_b0[`RXSYSCLKSEL];  
  assign txpllclksel_in[1: 0] = cfg_phy_mem_map_control_b0[`TXPLLCLKSEL]; 
  assign txprecursor_in[4: 0] = cfg_phy_mem_map_control_b0[`CH1_TXPRECURSOR]; 
  assign txsysclksel_in[1: 0] = cfg_phy_mem_map_control_b0[`TXSYSCLKSEL]; 
  assign drpclk_in[0] = drpclk_i;

  // ---------- Channel # 1 Assignments...
  assign rxcdrhold_in[1] = cfg_phy_mem_map_control_b0[`CH2_RXCDRHOLD]; 
  assign rxlpmhfovrden_in[1] = cfg_phy_mem_map_control_b0[`CH2_RXLPMHFOVRDEN];
  assign rxlpmlfklovrden_in[1] = cfg_phy_mem_map_control_b0[`CH2_RXLPMLFKLOVRDEN];
  assign rxosovrden_in[1] = cfg_phy_mem_map_control_b0[`CH2_RXOSOVRDEN];
  assign txpostcursor_in[9: 5] = cfg_phy_mem_map_control_b0[`CH2_TXPOSTCURSOR]; 
  assign cpllrefclksel_in[5: 3] = cfg_phy_mem_map_control_b0[`CPLLREFCLKSEL];
  assign loopback_in[5: 3] = cfg_phy_mem_map_control_b0[`CH2_LOOPBACK]; 
  assign rxlpmen_in[1] = cfg_phy_mem_map_control_b0[`CH2_RXLPMEN]; //Removed dependency with RXUSRCLK2 sync
  assign rxpllclksel_in[3: 2] = cfg_phy_mem_map_control_b0[`RXPLLCLKSEL]; 
  assign rxsysclksel_in[3: 2] = cfg_phy_mem_map_control_b0[`RXSYSCLKSEL];  
  assign txpllclksel_in[3: 2] = cfg_phy_mem_map_control_b0[`TXPLLCLKSEL]; 
  assign txprecursor_in[9: 5] = cfg_phy_mem_map_control_b0[`CH2_TXPRECURSOR]; 
  assign txsysclksel_in[3: 2] = cfg_phy_mem_map_control_b0[`TXSYSCLKSEL]; 
  assign drpclk_in[1] = drpclk_i;

  // ---------- Channel # 2 Assignments...
  assign rxcdrhold_in[2] = cfg_phy_mem_map_control_b0[`CH3_RXCDRHOLD]; 
  assign rxlpmhfovrden_in[2] = cfg_phy_mem_map_control_b0[`CH3_RXLPMHFOVRDEN];
  assign rxlpmlfklovrden_in[2] = cfg_phy_mem_map_control_b0[`CH3_RXLPMLFKLOVRDEN];
  assign rxosovrden_in[2] = cfg_phy_mem_map_control_b0[`CH3_RXOSOVRDEN];
  assign txpostcursor_in[14: 10] = cfg_phy_mem_map_control_b0[`CH3_TXPOSTCURSOR]; 
  assign cpllrefclksel_in[8: 6] = cfg_phy_mem_map_control_b0[`CPLLREFCLKSEL];
  assign loopback_in[8: 6] = cfg_phy_mem_map_control_b0[`CH3_LOOPBACK]; 
  assign rxlpmen_in[2] = cfg_phy_mem_map_control_b0[`CH3_RXLPMEN]; //Removed dependency with RXUSRCLK2 sync
  assign rxpllclksel_in[5: 4] = cfg_phy_mem_map_control_b0[`RXPLLCLKSEL]; 
  assign rxsysclksel_in[5: 4] = cfg_phy_mem_map_control_b0[`RXSYSCLKSEL];  
  assign txpllclksel_in[5: 4] = cfg_phy_mem_map_control_b0[`TXPLLCLKSEL]; 
  assign txprecursor_in[14: 10] = cfg_phy_mem_map_control_b0[`CH3_TXPRECURSOR]; 
  assign txsysclksel_in[5: 4] = cfg_phy_mem_map_control_b0[`TXSYSCLKSEL]; 
  assign drpclk_in[2] = drpclk_i;


  assign gtrefclk0_in_int[0]        = mgtrefclk0_i;
  assign gtrefclk1_in_int[0]        = mgtrefclk1_i;
  assign gtgrefclk_in_int[0]        = 1'b0;//gtgrefclk_in;     
  assign gtnorthrefclk0_in_int[0]   = gtnorthrefclk0_in;
  assign gtnorthrefclk1_in_int[0]   = gtnorthrefclk1_in;
  assign gtsouthrefclk0_in_int[0]   = gtsouthrefclk0_in;
  assign gtsouthrefclk1_in_int[0]   = gtsouthrefclk1_in;
  assign qpll0outclk_out_int[0]     = qpll0outclk_out;
  assign qpll1outclk_out_int[0]     = qpll1outclk_out;
  assign qpll0outrefclk_out_int[0]  = qpll0outrefclk_out;
  assign qpll1outrefclk_out_int[0]  = qpll1outrefclk_out;
  assign gtrefclk0_in_int[1]        = mgtrefclk0_i;
  assign gtrefclk1_in_int[1]        = mgtrefclk1_i;
  assign gtgrefclk_in_int[1]        = 1'b0;//gtgrefclk_in;     
  assign gtnorthrefclk0_in_int[1]   = gtnorthrefclk0_in;
  assign gtnorthrefclk1_in_int[1]   = gtnorthrefclk1_in;
  assign gtsouthrefclk0_in_int[1]   = gtsouthrefclk0_in;
  assign gtsouthrefclk1_in_int[1]   = gtsouthrefclk1_in;
  assign qpll0outclk_out_int[1]     = qpll0outclk_out;
  assign qpll1outclk_out_int[1]     = qpll1outclk_out;
  assign qpll0outrefclk_out_int[1]  = qpll0outrefclk_out;
  assign qpll1outrefclk_out_int[1]  = qpll1outrefclk_out;
  assign gtrefclk0_in_int[2]        = mgtrefclk0_i;
  assign gtrefclk1_in_int[2]        = mgtrefclk1_i;
  assign gtgrefclk_in_int[2]        = 1'b0;//gtgrefclk_in;     
  assign gtnorthrefclk0_in_int[2]   = gtnorthrefclk0_in;
  assign gtnorthrefclk1_in_int[2]   = gtnorthrefclk1_in;
  assign gtsouthrefclk0_in_int[2]   = gtsouthrefclk0_in;
  assign gtsouthrefclk1_in_int[2]   = gtsouthrefclk1_in;
  assign qpll0outclk_out_int[2]     = qpll0outclk_out;
  assign qpll1outclk_out_int[2]     = qpll1outclk_out;
  assign qpll0outrefclk_out_int[2]  = qpll0outrefclk_out;
  assign qpll1outrefclk_out_int[2]  = qpll1outrefclk_out;

    // Sync GT Wizard Resets
    xpm_cdc_array_single #(
      .VERSION        (`XPM_CDC_VERSION       ),
      .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
      .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
      .WIDTH          (4                      ),
      .SRC_INPUT_REG  (0                      )
    ) xpm_array_gtwiz_reset_sync_inst (
      .src_clk         (vid_phy_axi4lite_aclk        ),
      .src_in          ({
                         gtwiz_reset_tx_pll_and_datapath_in,
                         gtwiz_reset_tx_datapath_in,
                         gtwiz_reset_rx_pll_and_datapath_in,
                         gtwiz_reset_rx_datapath_in
                        }),
      .dest_clk        (drpclk_i       ),
      .dest_out        ({
                         gtwiz_reset_tx_pll_and_datapath_in_sync_drpclk,
                         gtwiz_reset_tx_datapath_in_sync_drpclk,
                         gtwiz_reset_rx_pll_and_datapath_in_sync_drpclk,
                         gtwiz_reset_rx_datapath_in_sync_drpclk
                        })
    );

    // ---------------------------------- GTHE3/4 Wrapper Instance  ------------------------------
    exdes_vid_phy_controller_0_gtwrapper
    gt_wrapper_inst
    (
       .gtwiz_userclk_tx_reset_in                  (gtwiz_userclk_tx_reset_in             ),
       .gtwiz_userclk_tx_active_in                 (gtwiz_userclk_tx_active_in            ),
       .gtwiz_userclk_rx_reset_in                  (gtwiz_userclk_rx_reset_in             ),
       .gtwiz_userclk_rx_active_in                 (gtwiz_userclk_rx_active_in            ),
       .gtwiz_buffbypass_tx_reset_in               (gtwiz_buffbypass_tx_reset_in          ),
       .gtwiz_buffbypass_tx_start_user_in          (gtwiz_buffbypass_tx_start_user_in     ),
       .gtwiz_buffbypass_tx_done_out               (gtwiz_buffbypass_tx_done_out          ),
       .gtwiz_buffbypass_tx_error_out              (gtwiz_buffbypass_tx_error_out         ),
       .gtwiz_reset_clk_freerun_in                 (gtwiz_reset_clk_freerun_in            ),
       .gtwiz_reset_all_in                         (1'b1                                  ),
       .gtwiz_reset_tx_pll_and_datapath_in         (gtwiz_reset_tx_pll_and_datapath_in_sync_drpclk),
       .gtwiz_reset_tx_datapath_in                 (gtwiz_reset_tx_datapath_in_sync_drpclk),
       .gtwiz_reset_rx_pll_and_datapath_in         (gtwiz_reset_rx_pll_and_datapath_in_sync_drpclk),
       .gtwiz_reset_rx_datapath_in                 (gtwiz_reset_rx_datapath_in_sync_drpclk),
       .gtwiz_reset_qpll0lock_in                   (gtwiz_reset_qpll_lock_in              ),
       .gtwiz_reset_qpll0reset_out                 (gtwiz_reset_qpll_reset_out            ),
       .gtwiz_reset_rx_cdr_stable_out              (gtwiz_reset_rx_cdr_stable_out         ),
       .gtwiz_reset_tx_done_out                    (gtwiz_reset_tx_done_out               ),
       .gtwiz_reset_rx_done_out                    (gtwiz_reset_rx_done_out               ),
       .gtwiz_gthe4_cpll_cal_txoutclk_period_in    (gtwiz_gte4_cpll_cal_txoutclk_period_in),
       .gtwiz_gthe4_cpll_cal_cnt_tol_in            (gtwiz_gte4_cpll_cal_cnt_tol_in       ),
       .gtwiz_gthe4_cpll_cal_bufg_ce_in            (gtwiz_gte4_cpll_cal_bufg_ce_in       ),
       .gtwiz_userdata_tx_in                       (gtwiz_userdata_tx_in                  ),
       .gtwiz_userdata_rx_out                      (gtwiz_userdata_rx_out_i               ),
       .gtrefclk0_in                               (gtrefclk0_in_int                      ),
       .gtrefclk1_in                               (gtrefclk1_in_int                      ),
       .gtgrefclk_in                               (gtgrefclk_in_int                      ),
       .gtnorthrefclk0_in                          (gtnorthrefclk0_in_int                 ),
       .gtnorthrefclk1_in                          (gtnorthrefclk1_in_int                 ),
       .gtsouthrefclk0_in                          (gtsouthrefclk0_in_int                 ),
       .gtsouthrefclk1_in                          (gtsouthrefclk1_in_int                 ),
       .cplllock_out                               (cplllock_out                          ),
       .cpllrefclksel_in                           (cpllrefclksel_in                      ),
       .drpaddr_in                                 (drpaddr_in                            ),
       .drpclk_in                                  (drpclk_in                             ),
       .drpdi_in                                   (drpdi_in                              ),
       .drpen_in                                   (drpen_in                              ),
       .drpwe_in                                   (drpwe_in                              ),
       .gthrxn_in                                  (phy_rxn_in                            ),
       .gthrxp_in                                  (phy_rxp_in                            ),
       .loopback_in                                (loopback_in                           ),
       .qpll0clk_in                                (qpll0outclk_out_int                   ),
       .qpll0refclk_in                             (qpll0outrefclk_out_int                ),
       .qpll1clk_in                                (qpll1outclk_out_int                   ),
       .qpll1refclk_in                             (qpll1outrefclk_out_int                ),
       .rxlpmhfovrden_in                           (rxlpmhfovrden_in                      ),
       .rxlpmlfklovrden_in                         (rxlpmlfklovrden_in                    ),
       .rxosovrden_in                              (rxosovrden_in                         ),
       .rxcdrhold_in                               (rxcdrhold_in                          ),
       .rxcdrlock_out                              (rxcdrlock_out                         ),
       .rxpolarity_in                              (rxpolarity_in                         ),
       .rxlpmen_in                                 (rxlpmen_in                            ),
       .rxpllclksel_in                             (rxpllclksel_in                        ),
       .rxprbscntreset_in                          (rxprbscntreset_in                     ),
       .rxprbssel_in                               (rxprbssel_in                          ),
       .rxsysclksel_in                             (rxsysclksel_in                        ),
       .rxusrclk_in                                (rxusrclk_in                           ),
       .rxusrclk2_in                               (rxusrclk2_in                          ),
       .txelecidle_in                              (txelecidle_in                         ),
       .txdiffctrl_in                              (txdiffctrl_in                         ),
       .txpolarity_in                              (txpolarity_in                         ),
       .txinhibit_in                               (txinhibit_in                          ),
       .txpostcursor_in                            (txpostcursor_in                       ),
       .txpllclksel_in                             (txpllclksel_in                        ),
       .txprbsforceerr_in                          (txprbsforceerr_in                     ),
       .txprbssel_in                               (txprbssel_in                          ),
       .txprecursor_in                             (txprecursor_in                        ),
       .txsysclksel_in                             (txsysclksel_in                        ),
       .txusrclk_in                                (txusrclk_in                           ),
       .txusrclk2_in                               (txusrclk2_in                          ),
       .cpllfbclklost_out                          (cpllfbclklost_out                     ),
       .cpllrefclklost_out                         (cpllrefclklost_out                    ),
       .drpdo_out                                  (drpdo_out                             ),
       .drprdy_out                                 (drprdy_out                            ),
       .gthtxn_out                                 (phy_txn_out                           ),
       .gthtxp_out                                 (phy_txp_out                           ),
       .gtpowergood_out                            (gtpowergood_out                       ),
       .gtrefclkmonitor_out                        (gtrefclkmonitor_out                   ),
       .rxbufstatus_out                            (rxbufstatus_out                       ),
       .txprgdivresetdone_out                      (txprgdivresetdone_out                 ),
       .rxoutclk_out                               (rxoutclk_out                          ),
       .rxpmaresetdone_out                         (rxpmaresetdone_out                    ),
       .rxprbserr_out                              (rxprbserr_out                         ),
       .rxprbslocked_out                           (rxprbslocked_out                      ),
       .rxresetdone_out                            (rxresetdone_out                       ),
       .txbufstatus_out                            (txbufstatus_out                       ),
       .txoutclk_out                               (txoutclk_out                          ),
       .txphaligndone_out                          (txphaligndone_out                     ),
       .txpmaresetdone_out                         (txpmaresetdone_out                    ),
       .txresetdone_out                            (txresetdone_out                       )
    );
    // ------------------------------------------------------------------------------------------------------------

   wire       b0_MMCM_TX_DRP_LOCKED;
   reg        b0_MMCM_TX_DRP_LOCKED_DLY;
   wire       b0_MMCM_TX_DRP_RESET;
   wire       b0_MMCM_TX_PWRDN;
   wire       b0_OBUFTDS_TX_EN;

   assign b0_MMCM_TX_DRP_RESET      = cfg_phy_mem_map_control_b0[`MMCM_TXUSRCLK_CONFIG_RESET];
   assign b0_MMCM_TX_PWRDN          = cfg_phy_mem_map_control_b0[`MMCM_TXUSRCLK_POWER_DOWN];
   assign b0_OBUFTDS_TX_EN          = cfg_phy_mem_map_control_b0[`OBUFTDS_TXUSRCLK_CLKOUT1_EN];
   assign cfg_phy_mem_map_status_b0[`MMCM_TXUSRCLK_LOCKED]       =  b0_MMCM_TX_DRP_LOCKED_DLY;

   wire       b0_MMCM_RX_DRP_LOCKED;
   reg        b0_MMCM_RX_DRP_LOCKED_DLY;
   wire       b0_MMCM_RX_DRP_RESET;
   wire       b0_MMCM_RX_PWRDN;
   wire       b0_OBUFTDS_RX_EN;

   assign b0_MMCM_RX_DRP_RESET      = cfg_phy_mem_map_control_b0[`MMCM_RXUSRCLK_CONFIG_RESET];
   assign b0_MMCM_RX_PWRDN          = cfg_phy_mem_map_control_b0[`MMCM_RXUSRCLK_POWER_DOWN];
   assign b0_OBUFTDS_RX_EN          = cfg_phy_mem_map_control_b0[`OBUFTDS_RXUSRCLK_CLKOUT1_EN];
   assign cfg_phy_mem_map_status_b0[`MMCM_RXUSRCLK_LOCKED]       =  b0_MMCM_RX_DRP_LOCKED_DLY;	

  //------------------------------------------------------------------------
  // User Clock Source
  //------------------------------------------------------------------------

  assign txoutclk = txusrclk2_in[0]; //Buffer version of txout clk
  assign rxoutclk = rxusrclk2_in[0]; //Buffer version of rxout clk

  wire txusrclk_in_ch0;
  wire txusrclk2_in_ch0;
  wire rxusrclk_in_ch0;
  wire rxusrclk2_in_ch0;

  assign txusrclk_in[0]  = txusrclk_in_ch0;
  assign txusrclk2_in[0] = txusrclk2_in_ch0;
  assign rxusrclk_in[0]  = rxusrclk_in_ch0;
  assign rxusrclk2_in[0] = rxusrclk2_in_ch0;
  assign txusrclk_in[1]  = txusrclk_in_ch0;
  assign txusrclk2_in[1] = txusrclk2_in_ch0;
  assign rxusrclk_in[1]  = rxusrclk_in_ch0;
  assign rxusrclk2_in[1] = rxusrclk2_in_ch0;
  assign txusrclk_in[2]  = txusrclk_in_ch0;
  assign txusrclk2_in[2] = txusrclk2_in_ch0;
  assign rxusrclk_in[2]  = rxusrclk_in_ch0;
  assign rxusrclk2_in[2] = rxusrclk2_in_ch0;

   exdes_vid_phy_controller_0_gt_usrclk_source_8series  #
   (
     .C_TX_REFCLK       (C_TX_REFCLK_SEL), 
     .C_RX_REFCLK       (C_RX_REFCLK_SEL), 
     .C_DRU_REFCLK      (C_NIDRU_REFCLK_SEL), 
     .C_Tx_Protocol     (C_Tx_Protocol), 
     .C_Rx_Protocol     (C_Rx_Protocol), 
     .C_NIDRU           (C_NIDRU), 
     .TX_USE_MMCM       (1),
     .RX_USE_MMCM       (1),
     .TX_MMCM_CLKIN_SRC (1),
     .RX_MMCM_CLKIN_SRC (1),
     .C_INPUT_PIXELS_PER_CLOCK(C_INPUT_PIXELS_PER_CLOCK),
     .ADV_CLOCK_MODE    (0),
     .GTH_TYPE          (4)
   )
   gt_usrclk_source_inst
   (
    .MMCM_TX_DRP_SCLK           (vid_phy_axi4lite_aclk),
    .MMCM_TX_DRP_RST            (vid_phy_axi4lite_areset),
    .MMCM_TX_DRP_TXN_AVAILABLE  (drp_txn_available[5]),
    .MMCM_TX_DRP_RSP_READ       (drp_rsp_read[5]),
    .MMCM_TX_DRPADDR            (cfg_phy_mem_map_control_b0[`MMCM_TXUSRCLK_DRPADDR]),
    .MMCM_TX_DRPEN              (cfg_phy_mem_map_control_b0[`MMCM_TXUSRCLK_DRPEN]),
    .MMCM_TX_DRPWE              (cfg_phy_mem_map_control_b0[`MMCM_TXUSRCLK_DRPWE]),
    .MMCM_TX_DRPDI              (cfg_phy_mem_map_control_b0[`MMCM_TXUSRCLK_DRPDI]),
    .MMCM_TX_DRPBUSY            (cfg_phy_mem_map_status_b0[`MMCM_TXUSRCLK_DRPBUSY]),
    .MMCM_TX_DRPRDY             (cfg_phy_mem_map_status_b0[`MMCM_TXUSRCLK_DRPRDY]),
    .MMCM_TX_DRPDO              (cfg_phy_mem_map_status_b0[`MMCM_TXUSRCLK_DRPDO]),
    .OBUFTDS_TX_EN              (b0_OBUFTDS_TX_EN),

    .MMCM_RX_DRP_SCLK           (vid_phy_axi4lite_aclk),
    .MMCM_RX_DRP_RST            (vid_phy_axi4lite_areset),
    .MMCM_RX_DRP_TXN_AVAILABLE  (drp_txn_available[6]),
    .MMCM_RX_DRP_RSP_READ       (drp_rsp_read[6]),
    .MMCM_RX_DRPADDR            (cfg_phy_mem_map_control_b0[`MMCM_RXUSRCLK_DRPADDR]),
    .MMCM_RX_DRPEN              (cfg_phy_mem_map_control_b0[`MMCM_RXUSRCLK_DRPEN]),
    .MMCM_RX_DRPWE              (cfg_phy_mem_map_control_b0[`MMCM_RXUSRCLK_DRPWE]),
    .MMCM_RX_DRPDI              (cfg_phy_mem_map_control_b0[`MMCM_RXUSRCLK_DRPDI]),
    .MMCM_RX_DRPBUSY            (cfg_phy_mem_map_status_b0[`MMCM_RXUSRCLK_DRPBUSY]),
    .MMCM_RX_DRPRDY             (cfg_phy_mem_map_status_b0[`MMCM_RXUSRCLK_DRPRDY]),
    .MMCM_RX_DRPDO              (cfg_phy_mem_map_status_b0[`MMCM_RXUSRCLK_DRPDO]),
    .OBUFTDS_RX_EN              (b0_OBUFTDS_RX_EN),
    .mgtrefclk0_odiv2_in        (mgtrefclk0_odiv2_in), //used in advanced clock mode
    .mgtrefclk1_odiv2_in        (mgtrefclk1_odiv2_in),  
    .gtnorthrefclk0_odiv2_in    (gtnorthrefclk0_odiv2_in),
    .gtnorthrefclk1_odiv2_in    (gtnorthrefclk1_odiv2_in),
    .gtsouthrefclk0_odiv2_in    (gtsouthrefclk0_odiv2_in),
    .gtsouthrefclk1_odiv2_in    (gtsouthrefclk1_odiv2_in),

    .GT0_TXUSRCLK_OUT           (txusrclk_in_ch0),
    .GT0_TXUSRCLK2_OUT          (txusrclk2_in_ch0),
    .GT0_TXOUTCLK_IN            (txoutclk_out[0]),
    .GT0_RXUSRCLK_OUT           (rxusrclk_in_ch0),
    .GT0_RXUSRCLK2_OUT          (rxusrclk2_in_ch0),
    .GT0_RXOUTCLK_IN            (rxoutclk_out[0]),
    .GT0_TXCLK_LOCK_OUT         (b0_MMCM_TX_DRP_LOCKED),
    .GT0_TX_MMCM_RESET_IN       (b0_MMCM_TX_DRP_RESET),
    .GT0_TX_MMCM_PWRDN_IN       (b0_MMCM_TX_PWRDN),
    .GT0_RXCLK_LOCK_OUT         (b0_MMCM_RX_DRP_LOCKED),
    .GT0_RX_MMCM_RESET_IN       (b0_MMCM_RX_DRP_RESET),
    .GT0_RX_MMCM_PWRDN_IN       (b0_MMCM_RX_PWRDN),
    .GT0_TX_MMCM_CLKOUT1_OUT    (tx_tmds_clk),
    .GT0_TX_MMCM_CLKOUT2_OUT    (tx_video_clk),
    .GT0_RX_MMCM_CLKOUT1_OUT    (rx_tmds_clk),
    .GT0_RX_MMCM_CLKOUT2_OUT    (rx_video_clk),
    .GT0_TX_MMCM_CLKOUT1_P_OUT  (tx_tmds_clk_p),
    .GT0_TX_MMCM_CLKOUT1_N_OUT  (tx_tmds_clk_n),
    .GT0_RX_MMCM_CLKOUT1_P_OUT  (rx_tmds_clk_p),
    .GT0_RX_MMCM_CLKOUT1_N_OUT  (rx_tmds_clk_n),
    .Q0_CLK0_GTREFCLK_ODIV2_OUT (mgtrefclk0_odiv2_i),
    .Q0_CLK1_GTREFCLK_ODIV2_OUT (mgtrefclk1_odiv2_i),
    .BUFGT_TXUSRCLK_CLEAR       (gtwiz_userclk_tx_reset_in),
    .BUFGT_TXUSRCLK_DIV         (cfg_phy_mem_map_control_b0[`BUFGT_TXUSRCLK_DIV]),
    .BUFGT_RXUSRCLK_CLEAR       (gtwiz_userclk_rx_reset_in),
    .BUFGT_RXUSRCLK_DIV         (cfg_phy_mem_map_control_b0[`BUFGT_RXUSRCLK_DIV]),
    .TXUSRCLK_ACTIVE_OUT        (gtwiz_userclk_tx_active_in),
    .RXUSRCLK_ACTIVE_OUT        (gtwiz_userclk_rx_active_in),

    .mgtrefclk0_in              (mgtrefclk0_in), //used in advanced clock mode
    .mgtrefclk1_in              (mgtrefclk1_in),
    .Q0_CLK0_GTREFCLK_PAD_N_IN  (mgtrefclk0_pad_n_in),
    .Q0_CLK0_GTREFCLK_PAD_P_IN  (mgtrefclk0_pad_p_in),
    .Q0_CLK0_GTREFCLK_IBUF_EN_IN(cfg_phy_mem_map_control_b0[`GTREFCLK0_CEB]),
    .Q0_CLK0_GTREFCLK_OUT       (mgtrefclk0_i),
    .Q0_CLK1_GTREFCLK_PAD_N_IN  (mgtrefclk1_pad_n_in),
    .Q0_CLK1_GTREFCLK_PAD_P_IN  (mgtrefclk1_pad_p_in),
    .Q0_CLK1_GTREFCLK_IBUF_EN_IN(cfg_phy_mem_map_control_b0[`GTREFCLK1_CEB]),
    .Q0_CLK1_GTREFCLK_OUT       (mgtrefclk1_i)

  );

generate
if (~((C_TX_REFCLK_SEL == GTREFCLK0) || (C_TX_REFCLK_SEL == GTREFCLK1)))
begin 
    assign txrefclk_ceb  = cfg_phy_mem_map_control_b0[`TX_REFCLK_CEB];
end
else 
begin
    assign txrefclk_ceb  = 1'b0;
end

if (~((C_RX_REFCLK_SEL == GTREFCLK0) || (C_RX_REFCLK_SEL == GTREFCLK1)))
begin 
    assign rxrefclk_ceb  = cfg_phy_mem_map_control_b0[`RX_REFCLK_CEB];
end
else 
begin
    assign rxrefclk_ceb  = 1'b0;
end
endgenerate



  //------------------------------------------------------------------------
  // GT Common
  //------------------------------------------------------------------------  
  exdes_vid_phy_controller_0_gtwrapper_gthe4_common_wrapper gt_common_inst (
      .GTHE4_COMMON_QPLL0PD                    (qpll0pd_in),
      .GTHE4_COMMON_QPLL0RESET                 (gtwiz_reset_qpll_reset_out),
      .GTHE4_COMMON_QPLL0REFCLKSEL             (qpll0refclksel_in),                   
      .GTHE4_COMMON_QPLL0LOCK                  (qpll0lock_out),
      .GTHE4_COMMON_QPLL0OUTCLK                (qpll0outclk_out),
      .GTHE4_COMMON_QPLL0OUTREFCLK             (qpll0outrefclk_out),
  
      .GTHE4_COMMON_QPLL1PD                    (qpll1pd_in),
      .GTHE4_COMMON_QPLL1RESET                 (gtwiz_reset_qpll_reset_out),
      .GTHE4_COMMON_QPLL1REFCLKSEL             (qpll1refclksel_in),                   
      .GTHE4_COMMON_QPLL1LOCK                  (qpll1lock_out),
      .GTHE4_COMMON_QPLL1OUTCLK                (qpll1outclk_out),
      .GTHE4_COMMON_QPLL1OUTREFCLK             (qpll1outrefclk_out),
  
      .GTHE4_COMMON_DRPADDR                    (drpaddr_common_in),      
      .GTHE4_COMMON_DRPCLK                     (drpclk_common_in),            
      .GTHE4_COMMON_DRPDI                      (drpdi_common_in),      
      .GTHE4_COMMON_DRPEN                      (drpen_common_in),    
      .GTHE4_COMMON_DRPWE                      (drpwe_common_in),    
      .GTHE4_COMMON_DRPDO                      (drpdo_common_out),
      .GTHE4_COMMON_DRPRDY                     (drprdy_common_out),    
    
      .GTHE4_COMMON_GTGREFCLK0                 (gtgrefclk0_in),
      .GTHE4_COMMON_GTREFCLK00                 (mgtrefclk0_i),
      .GTHE4_COMMON_GTREFCLK10                 (mgtrefclk1_i),
      .GTHE4_COMMON_GTNORTHREFCLK00            (gtnorthrefclk00_in),
      .GTHE4_COMMON_GTNORTHREFCLK10            (gtnorthrefclk10_in),
      .GTHE4_COMMON_GTSOUTHREFCLK00            (gtsouthrefclk00_in),
      .GTHE4_COMMON_GTSOUTHREFCLK10            (gtsouthrefclk10_in),
    
      .GTHE4_COMMON_GTGREFCLK1                 (gtgrefclk1_in),
      .GTHE4_COMMON_GTREFCLK01                 (mgtrefclk0_i),
      .GTHE4_COMMON_GTREFCLK11                 (mgtrefclk1_i),
      .GTHE4_COMMON_GTNORTHREFCLK01            (gtnorthrefclk01_in),
      .GTHE4_COMMON_GTNORTHREFCLK11            (gtnorthrefclk11_in),
      .GTHE4_COMMON_GTSOUTHREFCLK01            (gtsouthrefclk01_in),
      .GTHE4_COMMON_GTSOUTHREFCLK11            (gtsouthrefclk11_in),
  
      .GTHE4_COMMON_BGBYPASSB                  (1'b1),
      .GTHE4_COMMON_BGMONITORENB               (1'b1),
      .GTHE4_COMMON_BGPDB                      (1'b1),
      .GTHE4_COMMON_BGRCALOVRD                 (5'b11111),
      .GTHE4_COMMON_BGRCALOVRDENB              (1'b1),
      .GTHE4_COMMON_PMARSVD0                   (8'b00000000),
      .GTHE4_COMMON_PMARSVD1                   (8'b00000000),
      .GTHE4_COMMON_QPLL0CLKRSVD0              (1'b0),
      .GTHE4_COMMON_QPLL0CLKRSVD1              (1'b0),
      .GTHE4_COMMON_QPLL0LOCKDETCLK            (1'b0),
      .GTHE4_COMMON_QPLL0LOCKEN                (1'b1),
      .GTHE4_COMMON_QPLL1CLKRSVD0              (1'b0),
      .GTHE4_COMMON_QPLL1CLKRSVD1              (1'b0),
      .GTHE4_COMMON_QPLL1LOCKDETCLK            (1'b0),
      .GTHE4_COMMON_QPLL1LOCKEN                (1'b1),
      .GTHE4_COMMON_QPLLRSVD1                  (8'b00000000),
      .GTHE4_COMMON_QPLLRSVD2                  (5'b00000),
      .GTHE4_COMMON_QPLLRSVD3                  (5'b00000),
      .GTHE4_COMMON_QPLLRSVD4                  (8'b00000000),
      .GTHE4_COMMON_RCALENB                    (1'b1),
      .GTHE4_COMMON_PMARSVDOUT0                (),
      .GTHE4_COMMON_PMARSVDOUT1                (),
      .GTHE4_COMMON_QPLL0FBCLKLOST             (),
      .GTHE4_COMMON_QPLL0REFCLKLOST            (),
      .GTHE4_COMMON_QPLL1FBCLKLOST             (),
      .GTHE4_COMMON_QPLL1REFCLKLOST            (),
      .GTHE4_COMMON_QPLLDMONITOR0              (),
      .GTHE4_COMMON_QPLLDMONITOR1              (),
      .GTHE4_COMMON_REFCLKOUTMONITOR0          (refclkoutmonitor0_out),
      .GTHE4_COMMON_REFCLKOUTMONITOR1          (refclkoutmonitor1_out),
      .GTHE4_COMMON_RXRECCLK0_SEL              (),
      .GTHE4_COMMON_RXRECCLK1_SEL              ()
  );

    // Sync PLL clock selection to DRPCLK to avoid CDC warnings
    wire txpllclksel_in0_sync;
    xpm_cdc_single #(
      .VERSION        (`XPM_CDC_VERSION       ),
      .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
      .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
      .SRC_INPUT_REG  (0                      )
    ) xpm_single_txpllclksel_in0_sync_inst (
      .src_clk         ( vid_phy_axi4lite_aclk ),
      .src_in          ( txpllclksel_in[0] ),
      .dest_clk        ( drpclk_i ),
      .dest_out        ( txpllclksel_in0_sync )
    );
    assign gtwiz_reset_qpll_lock_in = (txpllclksel_in0_sync ? qpll0lock_out : qpll1lock_out);

    //------------------------------------------------------------------------
    // Instantiation of Axi Bus Interface vid_phy_axi4lite
    //------------------------------------------------------------------------

    vid_phy_controller_v2_2_1_axi4lite # ( 
        .C_S_AXI_DATA_WIDTH(C_vid_phy_axi4lite_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH(C_vid_phy_axi4lite_ADDR_WIDTH),
        .C_Tx_No_Of_Channels(C_Tx_No_Of_Channels),
        .C_Rx_No_Of_Channels(C_Rx_No_Of_Channels),
        .C_TX_PLL_SELECTION(C_TX_PLL_SELECTION),
        .C_RX_PLL_SELECTION(C_RX_PLL_SELECTION),
        .C_Err_Irq_En(0),
        .C_Use_GT_CH4_HDMI(0)
    ) vid_phy_controller_v2_2_1_vid_phy_axi4lite_inst (
        .S_AXI_ACLK(vid_phy_axi4lite_aclk),
        .S_AXI_ARESETN(vid_phy_axi4lite_aresetn),
        .S_AXI_AWADDR(vid_phy_axi4lite_awaddr),
        .S_AXI_AWPROT(vid_phy_axi4lite_awprot),
        .S_AXI_AWVALID(vid_phy_axi4lite_awvalid),
        .S_AXI_AWREADY(vid_phy_axi4lite_awready),
        .S_AXI_WDATA(vid_phy_axi4lite_wdata),
        .S_AXI_WSTRB(vid_phy_axi4lite_wstrb),
        .S_AXI_WVALID(vid_phy_axi4lite_wvalid),
        .S_AXI_WREADY(vid_phy_axi4lite_wready),
        .S_AXI_BRESP(vid_phy_axi4lite_bresp),
        .S_AXI_BVALID(vid_phy_axi4lite_bvalid),
        .S_AXI_BREADY(vid_phy_axi4lite_bready),
        .S_AXI_ARADDR(vid_phy_axi4lite_araddr),
        .S_AXI_ARPROT(vid_phy_axi4lite_arprot),
        .S_AXI_ARVALID(vid_phy_axi4lite_arvalid),
        .S_AXI_ARREADY(vid_phy_axi4lite_arready),
        .S_AXI_RDATA(vid_phy_axi4lite_rdata),
        .S_AXI_RRESP(vid_phy_axi4lite_rresp),
        .S_AXI_RVALID(vid_phy_axi4lite_rvalid),
        .S_AXI_RREADY(vid_phy_axi4lite_rready),
        .irq(irq),
        .err_irq(err_irq),
        .drp_txn_available(drp_txn_available),
        .drp_rsp_read(drp_rsp_read),
        .rx_sym_err_cntr_read(rx_sym_err_cntr_read),
        .cfg_phy_mem_map_control(cfg_phy_mem_map_control),
        .cfg_phy_mem_map_status(cfg_phy_mem_map_status) 
    );

        assign cfg_phy_mem_map_control_b0 = cfg_phy_mem_map_control;
        assign cfg_phy_mem_map_status = cfg_phy_mem_map_status_b0;  



  //----------------- DRP Control, Bank 0, GT 0 ----------------

  wire [31:0] DRP_Config_b0gt0; 
  wire [31:0] DRP_Status_b0gt0; 

  assign DRP_Config_b0gt0[11:0] = {cfg_phy_mem_map_control_b0[`CH1_DRPADDR_US_MSB], cfg_phy_mem_map_control_b0[`CH1_DRPADDR]};
  assign DRP_Config_b0gt0[12]   = cfg_phy_mem_map_control_b0[`CH1_DRPEN];
  assign DRP_Config_b0gt0[13]   = cfg_phy_mem_map_control_b0[`CH1_DRPWE];
  assign DRP_Config_b0gt0[31:16]= cfg_phy_mem_map_control_b0[`CH1_DRPDI];

   vid_phy_controller_v2_2_1_drp_control_hdmi #  
   (
    .DRP_ADDR_WIDTH (10)
   )
   drp_control_b0gt0_inst
   (
     .Config_Clk          (vid_phy_axi4lite_aclk),
     .Config_Rst          (vid_phy_axi4lite_areset),
     .DRP_Config          (DRP_Config_b0gt0),
     .DRP_Status          (DRP_Status_b0gt0),
     .drp_txn_available   (drp_txn_available[0]),
     .drp_rsp_read        (drp_rsp_read[0]),
     .DRPCLK              (drpclk_in[0]),
     .DRPBUSY             (1'b0),
     .DRPEN               (drpen_in[0]),
     .DRPWE               (drpwe_in[0]),
     .DRPADDR             (drpaddr_in[9: 0]),
     .DRPDI               (drpdi_in[15: 0]),
     .DRPDO               (drpdo_out[15: 0]),
     .DRPRDY              (drprdy_out[0])  
   );

   wire DRP_Status_b0gt0_16_sync;
   xpm_cdc_single #(
     .VERSION        (`XPM_CDC_VERSION       ),
     .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
     .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
     .SRC_INPUT_REG  (0                      )
   ) xpm_single_drp_rdy_b0gt0_inst (
     .src_clk         ( drpclk_in[0]    ),
     .src_in          ( DRP_Status_b0gt0[16] ),
     .dest_clk        ( vid_phy_axi4lite_aclk ),
     .dest_out        ( DRP_Status_b0gt0_16_sync )
   );

    assign cfg_phy_mem_map_status_b0[`CH1_DRPDO]   =  DRP_Status_b0gt0[15:0];
    assign cfg_phy_mem_map_status_b0[`CH1_DRPRDY]  =  DRP_Status_b0gt0_16_sync;
    assign cfg_phy_mem_map_status_b0[`CH1_DRPBUSY] =  DRP_Status_b0gt0[17];

  //----------------- DRP Control, Bank 0, GT 1 ----------------

  wire [31:0] DRP_Config_b0gt1; 
  wire [31:0] DRP_Status_b0gt1; 

  assign DRP_Config_b0gt1[11:0] = {cfg_phy_mem_map_control_b0[`CH2_DRPADDR_US_MSB], cfg_phy_mem_map_control_b0[`CH2_DRPADDR]};
  assign DRP_Config_b0gt1[12]   = cfg_phy_mem_map_control_b0[`CH2_DRPEN];
  assign DRP_Config_b0gt1[13]   = cfg_phy_mem_map_control_b0[`CH2_DRPWE];
  assign DRP_Config_b0gt1[31:16]= cfg_phy_mem_map_control_b0[`CH2_DRPDI];

   vid_phy_controller_v2_2_1_drp_control_hdmi #  
   (
    .DRP_ADDR_WIDTH (10)
   )
   drp_control_b0gt1_inst
   (
     .Config_Clk          (vid_phy_axi4lite_aclk),
     .Config_Rst          (vid_phy_axi4lite_areset),
     .DRP_Config          (DRP_Config_b0gt1),
     .DRP_Status          (DRP_Status_b0gt1),
     .drp_txn_available   (drp_txn_available[1]),
     .drp_rsp_read        (drp_rsp_read[1]),
     .DRPCLK              (drpclk_in[1]),
     .DRPBUSY             (1'b0),
     .DRPEN               (drpen_in[1]),
     .DRPWE               (drpwe_in[1]),
     .DRPADDR             (drpaddr_in[19: 10]),
     .DRPDI               (drpdi_in[31: 16]),
     .DRPDO               (drpdo_out[31: 16]),
     .DRPRDY              (drprdy_out[1])  
   );

   wire DRP_Status_b0gt1_16_sync;
   xpm_cdc_single #(
     .VERSION        (`XPM_CDC_VERSION       ),
     .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
     .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
     .SRC_INPUT_REG  (0                      )
   ) xpm_single_drp_rdy_b0gt1_inst (
     .src_clk         ( drpclk_in[1]    ),
     .src_in          ( DRP_Status_b0gt1[16] ),
     .dest_clk        ( vid_phy_axi4lite_aclk ),
     .dest_out        ( DRP_Status_b0gt1_16_sync )
   );

    assign cfg_phy_mem_map_status_b0[`CH2_DRPDO]   =  DRP_Status_b0gt1[15:0];
    assign cfg_phy_mem_map_status_b0[`CH2_DRPRDY]  =  DRP_Status_b0gt1_16_sync;
    assign cfg_phy_mem_map_status_b0[`CH2_DRPBUSY] =  DRP_Status_b0gt1[17];

  //----------------- DRP Control, Bank 0, GT 2 ----------------

  wire [31:0] DRP_Config_b0gt2; 
  wire [31:0] DRP_Status_b0gt2; 

  assign DRP_Config_b0gt2[11:0] = {cfg_phy_mem_map_control_b0[`CH3_DRPADDR_US_MSB], cfg_phy_mem_map_control_b0[`CH3_DRPADDR]};
  assign DRP_Config_b0gt2[12]   = cfg_phy_mem_map_control_b0[`CH3_DRPEN];
  assign DRP_Config_b0gt2[13]   = cfg_phy_mem_map_control_b0[`CH3_DRPWE];
  assign DRP_Config_b0gt2[31:16]= cfg_phy_mem_map_control_b0[`CH3_DRPDI];

   vid_phy_controller_v2_2_1_drp_control_hdmi #  
   (
    .DRP_ADDR_WIDTH (10)
   )
   drp_control_b0gt2_inst
   (
     .Config_Clk          (vid_phy_axi4lite_aclk),
     .Config_Rst          (vid_phy_axi4lite_areset),
     .DRP_Config          (DRP_Config_b0gt2),
     .DRP_Status          (DRP_Status_b0gt2),
     .drp_txn_available   (drp_txn_available[2]),
     .drp_rsp_read        (drp_rsp_read[2]),
     .DRPCLK              (drpclk_in[2]),
     .DRPBUSY             (1'b0),
     .DRPEN               (drpen_in[2]),
     .DRPWE               (drpwe_in[2]),
     .DRPADDR             (drpaddr_in[29: 20]),
     .DRPDI               (drpdi_in[47: 32]),
     .DRPDO               (drpdo_out[47: 32]),
     .DRPRDY              (drprdy_out[2])  
   );

   wire DRP_Status_b0gt2_16_sync;
   xpm_cdc_single #(
     .VERSION        (`XPM_CDC_VERSION       ),
     .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
     .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
     .SRC_INPUT_REG  (0                      )
   ) xpm_single_drp_rdy_b0gt2_inst (
     .src_clk         ( drpclk_in[2]    ),
     .src_in          ( DRP_Status_b0gt2[16] ),
     .dest_clk        ( vid_phy_axi4lite_aclk ),
     .dest_out        ( DRP_Status_b0gt2_16_sync )
   );

    assign cfg_phy_mem_map_status_b0[`CH3_DRPDO]   =  DRP_Status_b0gt2[15:0];
    assign cfg_phy_mem_map_status_b0[`CH3_DRPRDY]  =  DRP_Status_b0gt2_16_sync;
    assign cfg_phy_mem_map_status_b0[`CH3_DRPBUSY] =  DRP_Status_b0gt2[17];

  //--------------------------- DRP Control, Common ----------------------------

  wire [31:0] DRP_Config_common; 
  wire [31:0] DRP_Status_common; 

  assign DRP_Config_common[11:0] = cfg_phy_mem_map_control[`COMMON_DRPADDR];
  assign DRP_Config_common[12]   = cfg_phy_mem_map_control[`COMMON_DRPEN];
  assign DRP_Config_common[13]   = cfg_phy_mem_map_control[`COMMON_DRPWE];
  assign DRP_Config_common[31:16]= cfg_phy_mem_map_control[`COMMON_DRPDI];
 
  wire [10-1 : 0] drpaddr_common_int;
   vid_phy_controller_v2_2_1_drp_control_hdmi #  
   (
    .DRP_ADDR_WIDTH (10)
   )
   drp_control_b0gtcommon_inst
   (
     .Config_Clk          (vid_phy_axi4lite_aclk),
     .Config_Rst          (vid_phy_axi4lite_areset),
     .DRP_Config          (DRP_Config_common),
     .DRP_Status          (DRP_Status_common),
     .drp_txn_available   (drp_txn_available[4]),
     .drp_rsp_read        (drp_rsp_read[4]),
     .DRPCLK              (drpclk_common_in),
     .DRPBUSY             (1'b0),
     .DRPEN               (drpen_common_in),
     .DRPWE               (drpwe_common_in),
     .DRPADDR             (drpaddr_common_int),
     .DRPDI               (drpdi_common_in),
     .DRPDO               (drpdo_common_out),
     .DRPRDY              (drprdy_common_out)  
   );

   wire DRP_Status_common_16_sync;
   xpm_cdc_single #(
     .VERSION        (`XPM_CDC_VERSION       ),
     .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
     .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
     .SRC_INPUT_REG  (0                      )
   ) xpm_single_drp_rdy_b0_common_inst (
     .src_clk         ( drpclk_common_in   ),
     .src_in          ( DRP_Status_common[16] ),
     .dest_clk        ( vid_phy_axi4lite_aclk ),
     .dest_out        ( DRP_Status_common_16_sync )
   );

    assign cfg_phy_mem_map_status_b0[`COMMON_DRPBUSY] =  DRP_Status_common[17];
    assign cfg_phy_mem_map_status_b0[`COMMON_DRPRDY]  =  DRP_Status_common_16_sync;
    assign cfg_phy_mem_map_status_b0[`COMMON_DRPDO]   =  DRP_Status_common[15:0];
    assign drpaddr_common_in   =  {6'b0, drpaddr_common_int};


  //------------------------------------------------------------------------
  // Clock Detector
  //------------------------------------------------------------------------  
    (* dont_touch = "true" *) wire        b0_clkdet_dru_refclk;
    wire        b0_rx_refclk_sel;
    wire        b0_tx_refclk_sel;
    
    wire        b0_clkdet_ctrl_run;
    wire        b0_clkdet_ctrl_tx_tmr_clr;
    wire        b0_clkdet_ctrl_rx_tmr_clr;
    wire        b0_clkdet_ctrl_tx_freq_rst;
    wire        b0_clkdet_ctrl_rx_freq_rst;
    wire  [7:0] b0_clkdet_ctrl_lock_cntr_threshold;
    wire [31:0] b0_clkdet_freq_cntr_timeout;
    wire [31:0] b0_clkdet_tx_tmr;
    wire [31:0] b0_clkdet_rx_tmr;
    wire        b0_clkdet_tx_tmr_ld;
    wire        b0_clkdet_rx_tmr_ld;
    wire        b0_clkdet_tx_tmr_evt_clr;
    wire        b0_clkdet_tx_freq_evt_clr;
    wire        b0_clkdet_rx_tmr_evt_clr;
    wire        b0_clkdet_rx_freq_evt_clr;
    wire        b0_clkdet_ctrl_tx_en;
    wire        b0_clkdet_ctrl_rx_en;   

    if      (C_NIDRU_REFCLK_SEL == GTREFCLK0)      assign b0_clkdet_dru_refclk = mgtrefclk0_odiv2_i;
    else if (C_NIDRU_REFCLK_SEL == GTREFCLK1)      assign b0_clkdet_dru_refclk = mgtrefclk1_odiv2_i;
    else if (C_NIDRU_REFCLK_SEL == GTNORTHREFCLK0) assign b0_clkdet_dru_refclk = gtnorthrefclk0_odiv2_in;
    else if (C_NIDRU_REFCLK_SEL == GTNORTHREFCLK1) assign b0_clkdet_dru_refclk = gtnorthrefclk1_odiv2_in; 
    else if (C_NIDRU_REFCLK_SEL == GTSOUTHREFCLK0) assign b0_clkdet_dru_refclk = gtsouthrefclk0_odiv2_in;
    else if (C_NIDRU_REFCLK_SEL == GTSOUTHREFCLK1) assign b0_clkdet_dru_refclk = gtsouthrefclk1_odiv2_in;
    else assign b0_clkdet_dru_refclk = 1'b0;

    if      (C_RX_REFCLK_SEL == GTREFCLK0)      assign b0_rx_refclk_sel = mgtrefclk0_odiv2_i;
    else if (C_RX_REFCLK_SEL == GTREFCLK1)      assign b0_rx_refclk_sel = mgtrefclk1_odiv2_i;
    else if (C_RX_REFCLK_SEL == GTNORTHREFCLK0) assign b0_rx_refclk_sel = gtnorthrefclk0_odiv2_in;
    else if (C_RX_REFCLK_SEL == GTNORTHREFCLK1) assign b0_rx_refclk_sel = gtnorthrefclk1_odiv2_in; 
    else if (C_RX_REFCLK_SEL == GTSOUTHREFCLK0) assign b0_rx_refclk_sel = gtsouthrefclk0_odiv2_in;
    else if (C_RX_REFCLK_SEL == GTSOUTHREFCLK1) assign b0_rx_refclk_sel = gtsouthrefclk1_odiv2_in;
    else assign b0_rx_refclk_sel = 1'b0;
    
    if      (C_TX_REFCLK_SEL == GTREFCLK0)      assign b0_tx_refclk_sel = mgtrefclk0_odiv2_i;
    else if (C_TX_REFCLK_SEL == GTREFCLK1)      assign b0_tx_refclk_sel = mgtrefclk1_odiv2_i;
    else if (C_TX_REFCLK_SEL == GTNORTHREFCLK0) assign b0_tx_refclk_sel = gtnorthrefclk0_odiv2_in;
    else if (C_TX_REFCLK_SEL == GTNORTHREFCLK1) assign b0_tx_refclk_sel = gtnorthrefclk1_odiv2_in; 
    else if (C_TX_REFCLK_SEL == GTSOUTHREFCLK0) assign b0_tx_refclk_sel = gtsouthrefclk0_odiv2_in;
    else if (C_TX_REFCLK_SEL == GTSOUTHREFCLK1) assign b0_tx_refclk_sel = gtsouthrefclk1_odiv2_in;
    else assign b0_tx_refclk_sel = 1'b0;

    assign b0_clkdet_ctrl_run                  = cfg_phy_mem_map_control[`CLKDET_RUN];
    assign b0_clkdet_ctrl_tx_tmr_clr           = cfg_phy_mem_map_control[`CLKDET_TX_TMR_CLR];
    assign b0_clkdet_ctrl_rx_tmr_clr           = cfg_phy_mem_map_control[`CLKDET_RX_TMR_CLR];
    assign b0_clkdet_ctrl_tx_freq_rst          = cfg_phy_mem_map_control[`CLKDET_TX_FREQ_RST];
    assign b0_clkdet_ctrl_rx_freq_rst          = cfg_phy_mem_map_control[`CLKDET_RX_FREQ_RST];
    assign b0_clkdet_ctrl_lock_cntr_threshold  = cfg_phy_mem_map_control[`CLKDET_FREQ_LOCK_CNTR_TRSHLD];
    assign b0_clkdet_freq_cntr_timeout         = cfg_phy_mem_map_control[`CLKDET_FREQ_CNTR_TMOUT];
    assign b0_clkdet_tx_tmr                    = cfg_phy_mem_map_control[`CLKDET_TX_TMR_TMOUT_CNT];
    assign b0_clkdet_rx_tmr                    = cfg_phy_mem_map_control[`CLKDET_RX_TMR_TMOUT_CNT];
    assign b0_clkdet_tx_tmr_ld                 = cfg_phy_mem_map_control[`CLKDET_TX_TMR_LOAD];
    assign b0_clkdet_rx_tmr_ld                 = cfg_phy_mem_map_control[`CLKDET_RX_TMR_LOAD];
    assign b0_clkdet_tx_tmr_evt_clr            = cfg_phy_mem_map_control[`CLKDET_TX_TMR_EVENT_CLR];
    assign b0_clkdet_tx_freq_evt_clr           = cfg_phy_mem_map_control[`CLKDET_TX_FREQ_EVENT_CLR];
    assign b0_clkdet_rx_tmr_evt_clr            = cfg_phy_mem_map_control[`CLKDET_RX_TMR_EVENT_CLR];
    assign b0_clkdet_rx_freq_evt_clr           = cfg_phy_mem_map_control[`CLKDET_RX_FREQ_EVENT_CLR];
    
    // Clock detector TX enable
    if      (C_TX_REFCLK_SEL == GTREFCLK0)      
        assign b0_clkdet_ctrl_tx_en  = ~cfg_phy_mem_map_control_b0[`GTREFCLK0_CEB];
    else if (C_TX_REFCLK_SEL == GTREFCLK1)      
        assign b0_clkdet_ctrl_tx_en  = ~cfg_phy_mem_map_control_b0[`GTREFCLK1_CEB];
    else
        assign b0_clkdet_ctrl_tx_en  = ~cfg_phy_mem_map_control_b0[`TX_REFCLK_CEB];

    // Clock detector RX enable
    if      (C_RX_REFCLK_SEL == GTREFCLK0)      
        assign b0_clkdet_ctrl_rx_en  = ~cfg_phy_mem_map_control_b0[`GTREFCLK0_CEB];
    else if (C_RX_REFCLK_SEL == GTREFCLK1)      
        assign b0_clkdet_ctrl_rx_en  = ~cfg_phy_mem_map_control_b0[`GTREFCLK1_CEB];
    else
        assign b0_clkdet_ctrl_rx_en  = ~cfg_phy_mem_map_control_b0[`RX_REFCLK_CEB];
    exdes_vid_phy_controller_0_clkdet
    clock_detector_inst
    (
      .CLK_IN                           (vid_phy_axi4lite_aclk),
      .TX_REFCLK_IN                     (b0_tx_refclk_sel),
      .TX_REFCLK_LOCK_IN                (tx_refclk_rdy),
      .RX_REFCLK_IN                     (b0_rx_refclk_sel),
      .DRU_REFCLK_IN                    (b0_clkdet_dru_refclk),

      .clkdet_ctrl_run                  (b0_clkdet_ctrl_run),
      .clkdet_ctrl_tx_tmr_clr           (b0_clkdet_ctrl_tx_tmr_clr),
      .clkdet_ctrl_rx_tmr_clr           (b0_clkdet_ctrl_rx_tmr_clr),
      .clkdet_ctrl_tx_freq_rst          (b0_clkdet_ctrl_tx_freq_rst),
      .clkdet_ctrl_rx_freq_rst          (b0_clkdet_ctrl_rx_freq_rst),
      .clkdet_ctrl_lock_cntr_threshold  (b0_clkdet_ctrl_lock_cntr_threshold),
      .clkdet_ctrl_tx_en                (b0_clkdet_ctrl_tx_en),
      .clkdet_ctrl_rx_en                (b0_clkdet_ctrl_rx_en),

      .clkdet_stat_tx_freq_zero         (cfg_phy_mem_map_status_b0[`CLKDET_TX_FREQ_ZERO]),      
      .clkdet_stat_rx_freq_zero         (cfg_phy_mem_map_status_b0[`CLKDET_RX_FREQ_ZERO]),      
      .clkdet_stat_tx_refclk_locked     (cfg_phy_mem_map_status_b0[`CLKDET_TX_REFCLK_LOCK]),  
      .clkdet_stat_tx_refclk_lock_cap   (cfg_phy_mem_map_status_b0[`CLKDET_TX_REFCLK_LOCK_CAP]),

      .clkdet_freq_cntr_timeout         (b0_clkdet_freq_cntr_timeout),
      .clkdet_tx_freq                   (cfg_phy_mem_map_status_b0[`CLKDET_TX_FREQ]), 
      .clkdet_rx_freq                   (cfg_phy_mem_map_status_b0[`CLKDET_RX_FREQ]), 
      .clkdet_dru_freq                  (cfg_phy_mem_map_status_b0[`CLKDET_DRU_FREQ]),
      .clkdet_tx_tmr                    (b0_clkdet_tx_tmr),
      .clkdet_tx_tmr_ld                 (b0_clkdet_tx_tmr_ld),
      .clkdet_rx_tmr                    (b0_clkdet_rx_tmr),
      .clkdet_rx_tmr_ld                 (b0_clkdet_rx_tmr_ld),

      .clkdet_tx_tmr_evt                (cfg_phy_mem_map_status_b0[`CLKDET_TX_TMR_EVENT]),
      .clkdet_tx_freq_evt               (cfg_phy_mem_map_status_b0[`CLKDET_TX_FREQ_EVENT]),
      .clkdet_rx_tmr_evt                (cfg_phy_mem_map_status_b0[`CLKDET_RX_TMR_EVENT]), 
      .clkdet_rx_freq_evt               (cfg_phy_mem_map_status_b0[`CLKDET_RX_FREQ_EVENT]),

      .clkdet_tx_tmr_evt_clr            (b0_clkdet_tx_tmr_evt_clr), 
      .clkdet_tx_freq_evt_clr           (b0_clkdet_tx_freq_evt_clr),
      .clkdet_rx_tmr_evt_clr            (b0_clkdet_rx_tmr_evt_clr), 
      .clkdet_rx_freq_evt_clr           (b0_clkdet_rx_freq_evt_clr)
    );  

    wire [36:0] dru_ctrl_center_freq_i;
    wire        dru_ctrl_enable_i;
    wire        dru_ctrl_reset_i;

    xpm_cdc_array_single #(
      .VERSION        (`XPM_CDC_VERSION       ),
      .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
      .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
      .WIDTH          (39                      ),
      .SRC_INPUT_REG  (0                      )
    ) xpm_array_single_DRU_CTRL_in_sync_inst (
      .src_clk         (vid_phy_axi4lite_aclk        ),
      .src_in          ({
                         cfg_phy_mem_map_control[`DRU_CENTER_FREQ],
                         cfg_phy_mem_map_control[`DRU_ENABLE],
                         cfg_phy_mem_map_control[`DRU_RESET]
                        }),
      .dest_clk        (rxusrclk2_in_ch0       ),
      .dest_out        ({
                         dru_ctrl_center_freq_i,
                         dru_ctrl_enable_i,
                         dru_ctrl_reset_i
                        })
    );

	// with NIDRU
    //----------------- DRU, Bank 0, GT 0 ----------------
	
    wire        b0gt0_dru_stat_act; 
    wire  [7:0] b0gt0_dru_stat_version; 
    

    vid_phy_controller_v2_2_1_dru #(
      .WIDTH_OUT            (40)
    ) dru_b0gt0_inst (
      .DRU_CLK_IN           (rxusrclk2_in_ch0),
      .DRU_ACT_OUT          (b0gt0_dru_stat_act),
      .DRU_DATA_IN          (gtwiz_userdata_rx_out_i[39 : 0]),
      .DRU_DATA_OUT         (gtwiz_userdata_rx_out[39 : 0]),
      .DRU_DATA_EN_OUT      (vid_phy_rx_axi4s_tvalid[0]),
	  
      .dru_ctrl_rst         (dru_ctrl_reset_i),
      .dru_ctrl_enable      (dru_ctrl_enable_i),
      .dru_ctrl_ph_est_dis  (1'b0),
      
      .dru_center_freq      (dru_ctrl_center_freq_i),
      .dru_gain_g1          (5'd9),
      .dru_gain_g1_p        (5'd16),
      .dru_gain_g2          (5'd4),
      
      .dru_version          (b0gt0_dru_stat_version)
    );
    
    assign cfg_phy_mem_map_status_b0[`CH1_DRU_ACTIVE] = cfg_phy_mem_map_control[`DRU_ENABLE];
    
    //----------------- DRU, Bank 0, GT 1 ----------------
	
    wire        b0gt1_dru_stat_act; 
    wire  [7:0] b0gt1_dru_stat_version; 
    

    vid_phy_controller_v2_2_1_dru #(
      .WIDTH_OUT            (40)
    ) dru_b0gt1_inst (
      .DRU_CLK_IN           (rxusrclk2_in_ch0),
      .DRU_ACT_OUT          (b0gt1_dru_stat_act),
      .DRU_DATA_IN          (gtwiz_userdata_rx_out_i[79 : 40]),
      .DRU_DATA_OUT         (gtwiz_userdata_rx_out[79 : 40]),
      .DRU_DATA_EN_OUT      (vid_phy_rx_axi4s_tvalid[1]),
	  
      .dru_ctrl_rst         (dru_ctrl_reset_i),
      .dru_ctrl_enable      (dru_ctrl_enable_i),
      .dru_ctrl_ph_est_dis  (1'b0),
      
      .dru_center_freq      (dru_ctrl_center_freq_i),
      .dru_gain_g1          (5'd9),
      .dru_gain_g1_p        (5'd16),
      .dru_gain_g2          (5'd4),
      
      .dru_version          (b0gt1_dru_stat_version)
    );
    
    assign cfg_phy_mem_map_status_b0[`CH2_DRU_ACTIVE] = cfg_phy_mem_map_control[`DRU_ENABLE];
    
    //----------------- DRU, Bank 0, GT 2 ----------------
	
    wire        b0gt2_dru_stat_act; 
    wire  [7:0] b0gt2_dru_stat_version; 
    

    vid_phy_controller_v2_2_1_dru #(
      .WIDTH_OUT            (40)
    ) dru_b0gt2_inst (
      .DRU_CLK_IN           (rxusrclk2_in_ch0),
      .DRU_ACT_OUT          (b0gt2_dru_stat_act),
      .DRU_DATA_IN          (gtwiz_userdata_rx_out_i[119 : 80]),
      .DRU_DATA_OUT         (gtwiz_userdata_rx_out[119 : 80]),
      .DRU_DATA_EN_OUT      (vid_phy_rx_axi4s_tvalid[2]),
	  
      .dru_ctrl_rst         (dru_ctrl_reset_i),
      .dru_ctrl_enable      (dru_ctrl_enable_i),
      .dru_ctrl_ph_est_dis  (1'b0),
      
      .dru_center_freq      (dru_ctrl_center_freq_i),
      .dru_gain_g1          (5'd9),
      .dru_gain_g1_p        (5'd16),
      .dru_gain_g2          (5'd4),
      
      .dru_version          (b0gt2_dru_stat_version)
    );
    
    assign cfg_phy_mem_map_status_b0[`CH3_DRU_ACTIVE] = cfg_phy_mem_map_control[`DRU_ENABLE];
    

    xpm_cdc_array_single #(
      .VERSION        (`XPM_CDC_VERSION       ),
      .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
      .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
      .WIDTH          (8                      ),
      .SRC_INPUT_REG  (0                      )
    ) xpm_array_single_DRU_VERSION_in_sync_b0gt0inst (
      .src_clk         (rxusrclk2_in_ch0        ),
      .src_in          (b0gt0_dru_stat_version),
      .dest_clk        (vid_phy_axi4lite_aclk       ),
      .dest_out        (cfg_phy_mem_map_status_b0[`DRU_VERSION])
    );
    
    assign cfg_phy_mem_map_status_b0[`DRU_GAIN_G1]   = 5'd9;
    assign cfg_phy_mem_map_status_b0[`DRU_GAIN_G1_P] = 5'd16;
    assign cfg_phy_mem_map_status_b0[`DRU_GAIN_G2]   = 5'd4;
    

// baoshan://
  
    assign cfg_phy_mem_map_status_b0[`CH1_TXGTPOWERGOOD]      =  gtpowergood_out[0];
    assign cfg_phy_mem_map_status_b0[`CH1_RXGTPOWERGOOD]      =  gtpowergood_out[0];
    assign cfg_phy_mem_map_status_b0[`CH2_TXGTPOWERGOOD]      =  gtpowergood_out[1];
    assign cfg_phy_mem_map_status_b0[`CH2_RXGTPOWERGOOD]      =  gtpowergood_out[1];
    assign cfg_phy_mem_map_status_b0[`CH3_TXGTPOWERGOOD]      =  gtpowergood_out[2];
    assign cfg_phy_mem_map_status_b0[`CH3_RXGTPOWERGOOD]      =  gtpowergood_out[2];
  //Unused Status Bits
    assign cfg_phy_mem_map_status_b0[`CH1_TXPHINITDONE]       =  1'b0; // Not Available
    assign cfg_phy_mem_map_status_b0[`CH1_TXDLYRESETDONE]     =  1'b0; // Not Available
    assign cfg_phy_mem_map_status_b0[`CH2_TXPHINITDONE]       =  1'b0; // Not Available
    assign cfg_phy_mem_map_status_b0[`CH2_TXDLYRESETDONE]     =  1'b0; // Not Available
    assign cfg_phy_mem_map_status_b0[`CH3_TXPHINITDONE]       =  1'b0; // Not Available
    assign cfg_phy_mem_map_status_b0[`CH3_TXDLYRESETDONE]     =  1'b0; // Not Available

  // ------------------------------------------- Synchronizers ------------------------------------------

  // ---------------------- Synchronizer: CPLL Calibration ----------------------------
  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 18                    ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_cpll_cal_txoutclk_period_b0_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CPLL_CAL_CLK_PERIOD]),
    .dest_clk        (drpclk_i       ),
    .dest_out        (gtwiz_gte4_cpll_cal_txoutclk_period_sync)
  );
  assign gtwiz_gte4_cpll_cal_txoutclk_period_in = {3 {gtwiz_gte4_cpll_cal_txoutclk_period_sync}};
  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 18                    ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_cpll_cal_cnt_tol_b0_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CPLL_CAL_CLK_CNT_TOL]),
    .dest_clk        (drpclk_i       ),
    .dest_out        (gtwiz_gte4_cpll_cal_cnt_tol_in_sync)
  );
  assign gtwiz_gte4_cpll_cal_cnt_tol_in = {3 {gtwiz_gte4_cpll_cal_cnt_tol_in_sync}};
  // ---------------------- Synchronizer: User Clocking ----------------------------
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_tx_mmcm_drp_locked_b0_inst (
    .src_clk         ( txusrclk2_in[0]    ),
    .src_in          ( b0_MMCM_DRP_LOCKED ),
    .dest_clk        ( vid_phy_axi4lite_aclk ),
    .dest_out        ( b0_MMCM_DRP_LOCKED_sync )
  );
  
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_gtwiz_reset_tx_done_out_b0_inst (
    .src_clk         ( txusrclk2_in[0]    ),
    .src_in          ( gtwiz_reset_tx_done_out ),
    .dest_clk        ( vid_phy_axi4lite_aclk ),
    .dest_out        ( gtwiz_reset_tx_done_out_sync )
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_gtwiz_reset_rx_done_out_b0_inst (
    .src_clk         ( rxusrclk2_in[0]    ),
    .src_in          ( gtwiz_reset_rx_done_out ),
    .dest_clk        ( vid_phy_axi4lite_aclk ),
    .dest_out        ( gtwiz_reset_rx_done_out_sync )
  );
  
  // ---------------------- Synchronizer: Tx Buffer Bypass Path ----------------------------
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_buffbypass_tx_done_b0_inst (
    .src_clk         ( txusrclk2_in[0]    ),
    .src_in          ( gtwiz_buffbypass_tx_done_out ),
    .dest_clk        ( vid_phy_axi4lite_aclk ),
    .dest_out        ( gtwiz_buffbypass_tx_done_out_sync )
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_buffbypass_tx_reset_b0_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH1_TXPHDLYRESET] ),
    .dest_clk        ( txusrclk2_in[0] ),
    .dest_out        ( gtwiz_buffbypass_tx_reset_in )
  );


  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_buffbypass_tx_start_b0_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH1_TXPHALIGN] ),
    .dest_clk        ( txusrclk2_in[0] ),
    .dest_out        ( gtwiz_buffbypass_tx_start_user_in )
  );

  wire gtwiz_buffbypass_tx_error_out_sync;
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_buffbypass_tx_error_b0_inst (
    .src_clk         ( txusrclk2_in[0]    ),
    .src_in          ( gtwiz_buffbypass_tx_error_out ),
    .dest_clk        ( vid_phy_axi4lite_aclk ),
    .dest_out        ( gtwiz_buffbypass_tx_error_out_sync )
  );
  //Buffer Bypass error comes as single status from helper block. Connected to all channels for SW accesses
  assign cfg_phy_mem_map_status_b0[`CH1_BUFF_BYPASS_TX_ERR] = gtwiz_buffbypass_tx_error_out_sync; 
  assign cfg_phy_mem_map_status_b0[`CH2_BUFF_BYPASS_TX_ERR] = gtwiz_buffbypass_tx_error_out_sync; 
  assign cfg_phy_mem_map_status_b0[`CH3_BUFF_BYPASS_TX_ERR] = gtwiz_buffbypass_tx_error_out_sync; 
  assign cfg_phy_mem_map_status_b0[`CH4_BUFF_BYPASS_TX_ERR] = gtwiz_buffbypass_tx_error_out_sync; 



  // ---------------------- Synchronizer: GT Channel 0 :: Control Path ----------------------------
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_rxcdrlock_b00_inst (
    .src_clk         (rxusrclk2_in[0]       ),
    .src_in          (rxcdrlock_out[0]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH1_RXCDRLOCK])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_rxpolarity_b00_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH1_RXPOLARITY] ),
    .dest_clk        ( rxusrclk2_in[0] ),
    .dest_out        ( rxpolarity_in[0] )
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_rxprbscntreset_b00_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH1_RXPRBSCNTRESET] ),
    .dest_clk        ( rxusrclk2_in[0] ),
    .dest_out        ( rxprbscntreset_in[0] )
  );
  
  //Latch the PRBS error after tolerance window is lapsed
  //User has to read PRBS Error Counter value using DRP access from GT (through SW)
  reg [3:0] b0gt0_rxprbserr_out_cntr;
  reg       b0gt0_rxprbserr_out_latch;
  always@(posedge rxusrclk2_in[0]) begin
    if(rxprbscntreset_in[0]) begin
      b0gt0_rxprbserr_out_latch <= 1'b0;
      b0gt0_rxprbserr_out_cntr  <= 'h0;
    end else begin
      if(rxprbserr_out[0]) begin
        b0gt0_rxprbserr_out_cntr <= b0gt0_rxprbserr_out_cntr + 1'b1;  
      end
      if(&b0gt0_rxprbserr_out_cntr) begin
        b0gt0_rxprbserr_out_latch <= 1'b1;
      end
    end
  end

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_prbserr_out_sync_b0gt0inst (
    .src_clk         (rxusrclk2_in_ch0        ),
    .src_in          (b0gt0_rxprbserr_out_latch),
    .dest_clk        (vid_phy_axi4lite_aclk       ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH1_RXPRBSERR])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 4                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_rxprbssel_b00_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH1_RXPRBSSEL_US_MSB], cfg_phy_mem_map_control_b0[`CH1_RXPRBSSEL]}),
    .dest_clk        (rxusrclk2_in[0]       ),
    .dest_out        (rxprbssel_in[3 : 0])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 5                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_txdiffctrl_b00_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH1_TXDIFFCTRL],1'b0}), //As per UG576, TXDIFFCTRL[0] is unused
    .dest_clk        (txusrclk2_in[0]       ),
    .dest_out        (txdiffctrl_in[4 : 0])
  );


  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txinhibit_b00_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH1_TXINHIBIT]),
    .dest_clk        (txusrclk2_in[0]       ),
    .dest_out        (txinhibit_in[0])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txpolarity_b00_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH1_TXPOLARITY]),
    .dest_clk        (txusrclk2_in[0]       ),
    .dest_out        (txpolarity_in[0])
  );
  
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txprbsforceerr_b00_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH1_TXPRBSFORCEERR]),
    .dest_clk        (txusrclk2_in[0]       ),
    .dest_out        (txprbsforceerr_in[0])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          (4                      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txprbssel_b00_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH1_TXPRBSSEL_US_MSB],cfg_phy_mem_map_control_b0[`CH1_TXPRBSSEL]}),
    .dest_clk        (txusrclk2_in[0]       ),
    .dest_out        (txprbssel_in[3 : 0])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txelecidle_b00_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH1_TXELECIDLE]),
    .dest_clk        (txusrclk2_in[0]       ),
    .dest_out        (txelecidle_in[0])
  );

  // ---------------------- Synchronizer: GT Channel 0 :: Status Path ----------------------------

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_rxpmaresetdone_b00_inst (
    .src_clk         (rxusrclk2_in[0]       ),
    .src_in          (rxpmaresetdone_out[0]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH1_RXPMARESETDONE])
  );

  assign cfg_phy_mem_map_status_b0[`CH1_RXRESETDONE] = gtwiz_reset_rx_done_out_sync;

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 3                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_rxbufstatus_b00_inst (
    .src_clk         (rxusrclk2_in[0]        ),
    .src_in          (rxbufstatus_out[2 : 0]),
    .dest_clk        (vid_phy_axi4lite_aclk   ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH1_RXBUFSTATUS])
  );

  assign cfg_phy_mem_map_status_b0[`CH1_TXRESETDONE] = gtwiz_reset_tx_done_out_sync;

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 2                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_txbufstatus_b00_inst (
    .src_clk         (txusrclk2_in[0]        ),
    .src_in          (txbufstatus_out[1 : 0]),
    .dest_clk        (vid_phy_axi4lite_aclk   ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH1_TXBUFSTATUS])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txpmaresetdone_b00_inst (
    .src_clk         (txusrclk2_in[0]       ),
    .src_in          (txpmaresetdone_out[0]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH1_TXPMARESETDONE])
  );

  assign cfg_phy_mem_map_status_b0[`CH1_TXPHALIGNDONE] = gtwiz_buffbypass_tx_done_out_sync;

    assign cfg_phy_mem_map_status_b0[`CH1_CPLLLOCK] = b0_CPLL_LOCK_DLY_SYNC_AXICLK;

  

  // ---------------------- Synchronizer: GT Channel 1 :: Control Path ----------------------------
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_rxcdrlock_b01_inst (
    .src_clk         (rxusrclk2_in[1]       ),
    .src_in          (rxcdrlock_out[1]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH2_RXCDRLOCK])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_rxpolarity_b01_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH2_RXPOLARITY] ),
    .dest_clk        ( rxusrclk2_in[1] ),
    .dest_out        ( rxpolarity_in[1] )
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_rxprbscntreset_b01_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH2_RXPRBSCNTRESET] ),
    .dest_clk        ( rxusrclk2_in[1] ),
    .dest_out        ( rxprbscntreset_in[1] )
  );
  
  //Latch the PRBS error after tolerance window is lapsed
  //User has to read PRBS Error Counter value using DRP access from GT (through SW)
  reg [3:0] b0gt1_rxprbserr_out_cntr;
  reg       b0gt1_rxprbserr_out_latch;
  always@(posedge rxusrclk2_in[1]) begin
    if(rxprbscntreset_in[1]) begin
      b0gt1_rxprbserr_out_latch <= 1'b0;
      b0gt1_rxprbserr_out_cntr  <= 'h0;
    end else begin
      if(rxprbserr_out[1]) begin
        b0gt1_rxprbserr_out_cntr <= b0gt1_rxprbserr_out_cntr + 1'b1;  
      end
      if(&b0gt1_rxprbserr_out_cntr) begin
        b0gt1_rxprbserr_out_latch <= 1'b1;
      end
    end
  end

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_prbserr_out_sync_b0gt1inst (
    .src_clk         (rxusrclk2_in_ch0        ),
    .src_in          (b0gt1_rxprbserr_out_latch),
    .dest_clk        (vid_phy_axi4lite_aclk       ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH2_RXPRBSERR])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 4                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_rxprbssel_b01_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH2_RXPRBSSEL_US_MSB], cfg_phy_mem_map_control_b0[`CH2_RXPRBSSEL]}),
    .dest_clk        (rxusrclk2_in[1]       ),
    .dest_out        (rxprbssel_in[7 : 4])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 5                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_txdiffctrl_b01_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH2_TXDIFFCTRL],1'b0}), //As per UG576, TXDIFFCTRL[0] is unused
    .dest_clk        (txusrclk2_in[1]       ),
    .dest_out        (txdiffctrl_in[9 : 5])
  );


  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txinhibit_b01_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH2_TXINHIBIT]),
    .dest_clk        (txusrclk2_in[1]       ),
    .dest_out        (txinhibit_in[1])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txpolarity_b01_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH2_TXPOLARITY]),
    .dest_clk        (txusrclk2_in[1]       ),
    .dest_out        (txpolarity_in[1])
  );
  
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txprbsforceerr_b01_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH2_TXPRBSFORCEERR]),
    .dest_clk        (txusrclk2_in[1]       ),
    .dest_out        (txprbsforceerr_in[1])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          (4                      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txprbssel_b01_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH2_TXPRBSSEL_US_MSB],cfg_phy_mem_map_control_b0[`CH2_TXPRBSSEL]}),
    .dest_clk        (txusrclk2_in[1]       ),
    .dest_out        (txprbssel_in[7 : 4])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txelecidle_b01_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH2_TXELECIDLE]),
    .dest_clk        (txusrclk2_in[1]       ),
    .dest_out        (txelecidle_in[1])
  );

  // ---------------------- Synchronizer: GT Channel 1 :: Status Path ----------------------------

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_rxpmaresetdone_b01_inst (
    .src_clk         (rxusrclk2_in[1]       ),
    .src_in          (rxpmaresetdone_out[1]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH2_RXPMARESETDONE])
  );

  assign cfg_phy_mem_map_status_b0[`CH2_RXRESETDONE] = gtwiz_reset_rx_done_out_sync;

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 3                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_rxbufstatus_b01_inst (
    .src_clk         (rxusrclk2_in[1]        ),
    .src_in          (rxbufstatus_out[5 : 3]),
    .dest_clk        (vid_phy_axi4lite_aclk   ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH2_RXBUFSTATUS])
  );

  assign cfg_phy_mem_map_status_b0[`CH2_TXRESETDONE] = gtwiz_reset_tx_done_out_sync;

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 2                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_txbufstatus_b01_inst (
    .src_clk         (txusrclk2_in[1]        ),
    .src_in          (txbufstatus_out[3 : 2]),
    .dest_clk        (vid_phy_axi4lite_aclk   ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH2_TXBUFSTATUS])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txpmaresetdone_b01_inst (
    .src_clk         (txusrclk2_in[1]       ),
    .src_in          (txpmaresetdone_out[1]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH2_TXPMARESETDONE])
  );

  assign cfg_phy_mem_map_status_b0[`CH2_TXPHALIGNDONE] = gtwiz_buffbypass_tx_done_out_sync;

    assign cfg_phy_mem_map_status_b0[`CH2_CPLLLOCK] = b0_CPLL_LOCK_DLY_SYNC_AXICLK;

  

  // ---------------------- Synchronizer: GT Channel 2 :: Control Path ----------------------------
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_rxcdrlock_b02_inst (
    .src_clk         (rxusrclk2_in[2]       ),
    .src_in          (rxcdrlock_out[2]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH3_RXCDRLOCK])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_rxpolarity_b02_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH3_RXPOLARITY] ),
    .dest_clk        ( rxusrclk2_in[2] ),
    .dest_out        ( rxpolarity_in[2] )
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_rxprbscntreset_b02_inst (
    .src_clk         ( vid_phy_axi4lite_aclk    ),
    .src_in          ( cfg_phy_mem_map_control_b0[`CH3_RXPRBSCNTRESET] ),
    .dest_clk        ( rxusrclk2_in[2] ),
    .dest_out        ( rxprbscntreset_in[2] )
  );
  
  //Latch the PRBS error after tolerance window is lapsed
  //User has to read PRBS Error Counter value using DRP access from GT (through SW)
  reg [3:0] b0gt2_rxprbserr_out_cntr;
  reg       b0gt2_rxprbserr_out_latch;
  always@(posedge rxusrclk2_in[2]) begin
    if(rxprbscntreset_in[2]) begin
      b0gt2_rxprbserr_out_latch <= 1'b0;
      b0gt2_rxprbserr_out_cntr  <= 'h0;
    end else begin
      if(rxprbserr_out[2]) begin
        b0gt2_rxprbserr_out_cntr <= b0gt2_rxprbserr_out_cntr + 1'b1;  
      end
      if(&b0gt2_rxprbserr_out_cntr) begin
        b0gt2_rxprbserr_out_latch <= 1'b1;
      end
    end
  end

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_single_prbserr_out_sync_b0gt2inst (
    .src_clk         (rxusrclk2_in_ch0        ),
    .src_in          (b0gt2_rxprbserr_out_latch),
    .dest_clk        (vid_phy_axi4lite_aclk       ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH3_RXPRBSERR])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 4                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_rxprbssel_b02_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH3_RXPRBSSEL_US_MSB], cfg_phy_mem_map_control_b0[`CH3_RXPRBSSEL]}),
    .dest_clk        (rxusrclk2_in[2]       ),
    .dest_out        (rxprbssel_in[11 : 8])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 5                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_txdiffctrl_b02_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH3_TXDIFFCTRL],1'b0}), //As per UG576, TXDIFFCTRL[0] is unused
    .dest_clk        (txusrclk2_in[2]       ),
    .dest_out        (txdiffctrl_in[14 : 10])
  );


  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txinhibit_b02_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH3_TXINHIBIT]),
    .dest_clk        (txusrclk2_in[2]       ),
    .dest_out        (txinhibit_in[2])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txpolarity_b02_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH3_TXPOLARITY]),
    .dest_clk        (txusrclk2_in[2]       ),
    .dest_out        (txpolarity_in[2])
  );
  
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txprbsforceerr_b02_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH3_TXPRBSFORCEERR]),
    .dest_clk        (txusrclk2_in[2]       ),
    .dest_out        (txprbsforceerr_in[2])
  );

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          (4                      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txprbssel_b02_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          ({cfg_phy_mem_map_control_b0[`CH3_TXPRBSSEL_US_MSB],cfg_phy_mem_map_control_b0[`CH3_TXPRBSSEL]}),
    .dest_clk        (txusrclk2_in[2]       ),
    .dest_out        (txprbssel_in[11 : 8])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txelecidle_b02_inst (
    .src_clk         (vid_phy_axi4lite_aclk        ),
    .src_in          (cfg_phy_mem_map_control_b0[`CH3_TXELECIDLE]),
    .dest_clk        (txusrclk2_in[2]       ),
    .dest_out        (txelecidle_in[2])
  );

  // ---------------------- Synchronizer: GT Channel 2 :: Status Path ----------------------------

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_rxpmaresetdone_b02_inst (
    .src_clk         (rxusrclk2_in[2]       ),
    .src_in          (rxpmaresetdone_out[2]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH3_RXPMARESETDONE])
  );

  assign cfg_phy_mem_map_status_b0[`CH3_RXRESETDONE] = gtwiz_reset_rx_done_out_sync;

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 3                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_rxbufstatus_b02_inst (
    .src_clk         (rxusrclk2_in[2]        ),
    .src_in          (rxbufstatus_out[8 : 6]),
    .dest_clk        (vid_phy_axi4lite_aclk   ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH3_RXBUFSTATUS])
  );

  assign cfg_phy_mem_map_status_b0[`CH3_TXRESETDONE] = gtwiz_reset_tx_done_out_sync;

  xpm_cdc_array_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .WIDTH          ( 2                     ),
    .SRC_INPUT_REG  ( 0                     )
  ) xpm_array_single_txbufstatus_b02_inst (
    .src_clk         (txusrclk2_in[2]        ),
    .src_in          (txbufstatus_out[5 : 4]),
    .dest_clk        (vid_phy_axi4lite_aclk   ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH3_TXBUFSTATUS])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_txpmaresetdone_b02_inst (
    .src_clk         (txusrclk2_in[2]       ),
    .src_in          (txpmaresetdone_out[2]),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`CH3_TXPMARESETDONE])
  );

  assign cfg_phy_mem_map_status_b0[`CH3_TXPHALIGNDONE] = gtwiz_buffbypass_tx_done_out_sync;

    assign cfg_phy_mem_map_status_b0[`CH3_CPLLLOCK] = b0_CPLL_LOCK_DLY_SYNC_AXICLK;

  

  // ---------------------- Synchronizer: GT Common 3 :: Status Path ----------------------------
  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_qpll0lock_b0_inst (
    .src_clk         (vid_phy_axi4lite_aclk  ),
    .src_in          (qpll0lock_out_dly),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`QPLLLOCK])
  );

  xpm_cdc_single #(
    .VERSION        (`XPM_CDC_VERSION       ),
    .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
    .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
    .SRC_INPUT_REG  (0                      )
  ) xpm_array_single_qpll1lock_b0_inst (
    .src_clk         (vid_phy_axi4lite_aclk  ),
    .src_in          (qpll1lock_out_dly),
    .dest_clk        (vid_phy_axi4lite_aclk  ),
    .dest_out        (cfg_phy_mem_map_status_b0[`QPLL1LOCK])
  );


 // --------------------------------- HDMI Lock Delay Connections (Uses AXI4Lite Clock) ----------------------------
 
 // QPLL lock counter
    always @ (negedge vid_phy_axi4lite_aresetn, posedge drpclk_i)
    begin
        // AXI reset
        if (!vid_phy_axi4lite_aresetn)
        begin
            b0_QPLL_LOCK_DLY_CNT <= 0;
            b0_QPLL_LOCK_DLY     <= 0;
        end

        else
        begin
            // QPLL Reset
            if (gtwiz_reset_qpll_reset_out)
            begin
                b0_QPLL_LOCK_DLY_CNT <= 0;
                b0_QPLL_LOCK_DLY     <= 0;
            end

            else
            begin
                if (gtwiz_reset_qpll_lock_in)
                begin
                    if (b0_QPLL_LOCK_DLY_CNT == 24'd100_000) // 1 ms @ 100 MHz clock
                        b0_QPLL_LOCK_DLY <= 1;
                    else
                    begin
                        b0_QPLL_LOCK_DLY     <= 0;
                        b0_QPLL_LOCK_DLY_CNT <= b0_QPLL_LOCK_DLY_CNT + 1;
                    end
                end
                else
                begin
                    b0_QPLL_LOCK_DLY_CNT <= 0;
                    b0_QPLL_LOCK_DLY     <= 0;
                end
            end
        end
    end
    
    //Sync to vid_phy_axi4lite_aclk the b0_QPLL_LOCK_DLY
    xpm_cdc_single #(
        .VERSION        (`XPM_CDC_VERSION       ),
        .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
        .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
        .SRC_INPUT_REG  (0                      )
    ) xpm_array_single_qpll0lock_out_dly_sync_inst (
        .src_clk         (drpclk_i),
        .src_in          (b0_QPLL_LOCK_DLY),
        .dest_clk        (vid_phy_axi4lite_aclk),
        .dest_out        (b0_QPLL_LOCK_DLY_SYNC_AXICLK)
    );
    
    //QPLL0 DLY
    if      (C_TX_PLL_SELECTION!=0) assign qpll0lock_out_dly = (txpllclksel_in[0] ? b0_QPLL_LOCK_DLY_SYNC_AXICLK : 1'b0);
    else if (C_RX_PLL_SELECTION!=0) assign qpll0lock_out_dly = (rxpllclksel_in[0] ? b0_QPLL_LOCK_DLY_SYNC_AXICLK : 1'b0);  
    //QPLL1 DLY
    if      (C_TX_PLL_SELECTION!=0) assign qpll1lock_out_dly = (txpllclksel_in[0] ? 1'b0 : b0_QPLL_LOCK_DLY_SYNC_AXICLK);
    else if (C_RX_PLL_SELECTION!=0) assign qpll1lock_out_dly = (rxpllclksel_in[0] ? 1'b0 : b0_QPLL_LOCK_DLY_SYNC_AXICLK);  

 // CPLL lock counter
    always @ (negedge vid_phy_axi4lite_aresetn, posedge drpclk_i)
    begin
        // AXI reset
        if (!vid_phy_axi4lite_aresetn)
        begin
            b0_CPLL_LOCK_DLY_CNT <= 0;
            b0_CPLL_LOCK_DLY     <= 0;
        end

        else
        begin
            // CPLL Reset
            if (b0_CPLL_RESET)
            begin
                b0_CPLL_LOCK_DLY_CNT <= 0;
                b0_CPLL_LOCK_DLY     <= 0;
            end

            else
            begin
                if (&cplllock_out)
                begin
                    if (b0_CPLL_LOCK_DLY_CNT == 24'd100_000) // 1 ms @ 100 MHz clock
                        b0_CPLL_LOCK_DLY <= 1;
                    else
                    begin
                        b0_CPLL_LOCK_DLY     <= 0;
                        b0_CPLL_LOCK_DLY_CNT <= b0_CPLL_LOCK_DLY_CNT + 1;
                    end
                end
                else
                begin
                    b0_CPLL_LOCK_DLY_CNT <= 0;
                    b0_CPLL_LOCK_DLY     <= 0;
                end
            end
        end
    end
    
    //CPLL RESET
    if      (C_TX_PLL_SELECTION==0) assign b0_CPLL_RESET = gtwiz_reset_tx_pll_and_datapath_in_sync_drpclk;
    else if (C_RX_PLL_SELECTION==0) assign b0_CPLL_RESET = gtwiz_reset_rx_pll_and_datapath_in_sync_drpclk;  
    
    //Sync to vid_phy_axi4lite_aclk the b0_CPLL_LOCK_DLY
    xpm_cdc_single #(
      .VERSION        (`XPM_CDC_VERSION       ),
      .SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
      .DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
      .SRC_INPUT_REG  (0                      )
    ) xpm_single_tx_pll_lock_sync_inst (
      .src_clk         ( drpclk_i ),
      .src_in          ( b0_CPLL_LOCK_DLY ),
      .dest_clk        ( vid_phy_axi4lite_aclk ),
      .dest_out        ( b0_CPLL_LOCK_DLY_SYNC_AXICLK )
    );

 //tx_link_rdy capture
 //   keep the tx_link_rdy low until txresetdone and txalndone has asserted after 
 //   TX PLL lock rising edge
    always @ (posedge vid_phy_axi4lite_aclk)
    begin
        b0_TX_LINK_RDY_SYNC[0] <= gtwiz_reset_tx_done_out_sync & gtwiz_buffbypass_tx_done_out_sync;
        b0_TX_LINK_RDY_SYNC[1] <= b0_TX_LINK_RDY_SYNC[0];
        b0_TX_LINK_RDY_SYNC[2] <= b0_TX_LINK_RDY_SYNC[1];
    end

    assign b0_TX_LINK_RDY_RE = (b0_TX_LINK_RDY_SYNC[1] && !b0_TX_LINK_RDY_SYNC[2]) ? 1'b1 : 1'b0;
    assign b0_TX_PLL_LOCK = (C_TX_PLL_SELECTION==0 ? b0_CPLL_LOCK_DLY_SYNC_AXICLK : b0_QPLL_LOCK_DLY_SYNC_AXICLK);

    always @ (posedge vid_phy_axi4lite_aclk, negedge b0_TX_PLL_LOCK)
    begin
        if(!b0_TX_PLL_LOCK)
            b0_TX_LINK_RDY <= 1'b0;
        else if(b0_TX_LINK_RDY_RE)
            b0_TX_LINK_RDY <= 1'b1;
        else
            b0_TX_LINK_RDY <= b0_TX_LINK_RDY;
    end


 // TXPLL lock counter
    always @ (negedge vid_phy_axi4lite_aresetn, posedge vid_phy_axi4lite_aclk)
    begin
        // AXI reset
        if (!vid_phy_axi4lite_aresetn)
        begin
            b0_MMCM_TX_DRP_LOCKED_DLY_CNT <= 0;
            b0_MMCM_TX_DRP_LOCKED_DLY     <= 0;
        end

        else
        begin
            // TXPLL Reset
            if (b0_MMCM_TX_DRP_RESET)
            begin
                b0_MMCM_TX_DRP_LOCKED_DLY_CNT <= 0;
                b0_MMCM_TX_DRP_LOCKED_DLY     <= 0;
            end

            else
            begin
                if (b0_MMCM_TX_DRP_LOCKED)
                begin
                    if (b0_MMCM_TX_DRP_LOCKED_DLY_CNT == 24'd100_000) // 1 ms @ 100 MHz clock
                        b0_MMCM_TX_DRP_LOCKED_DLY     <= 1 & ~cfg_phy_mem_map_control_b0[`MMCM_TXUSRCLK_LOCK_MASK];
                    else
                    begin
                        b0_MMCM_TX_DRP_LOCKED_DLY     <= 0;
                        b0_MMCM_TX_DRP_LOCKED_DLY_CNT <= b0_MMCM_TX_DRP_LOCKED_DLY_CNT + 1;
                    end
                end
                else
                begin
                    b0_MMCM_TX_DRP_LOCKED_DLY_CNT <= 0;
                    b0_MMCM_TX_DRP_LOCKED_DLY     <= 0;
                end
            end
        end
    end

 // RXPLL lock counter
    always @ (negedge vid_phy_axi4lite_aresetn, posedge vid_phy_axi4lite_aclk)
    begin
        // AXI reset
        if (!vid_phy_axi4lite_aresetn)
        begin
            b0_MMCM_RX_DRP_LOCKED_DLY_CNT <= 0;
            b0_MMCM_RX_DRP_LOCKED_DLY     <= 0;
        end

        else
        begin
            // RXPLL Reset
            if (b0_MMCM_RX_DRP_RESET)
            begin
                b0_MMCM_RX_DRP_LOCKED_DLY_CNT <= 0;
                b0_MMCM_RX_DRP_LOCKED_DLY     <= 0;
            end

            else
            begin
                if (b0_MMCM_RX_DRP_LOCKED)
                begin
                    if (b0_MMCM_RX_DRP_LOCKED_DLY_CNT == 24'd100_000) // 1 ms @ 100 MHz clock
                        b0_MMCM_RX_DRP_LOCKED_DLY     <= 1 & ~cfg_phy_mem_map_control_b0[`MMCM_RXUSRCLK_LOCK_MASK];
                    else
                    begin
                        b0_MMCM_RX_DRP_LOCKED_DLY     <= 0;
                        b0_MMCM_RX_DRP_LOCKED_DLY_CNT <= b0_MMCM_RX_DRP_LOCKED_DLY_CNT + 1;
                    end
                end
                else
                begin
                    b0_MMCM_RX_DRP_LOCKED_DLY_CNT <= 0;
                    b0_MMCM_RX_DRP_LOCKED_DLY     <= 0;
                end
            end
        end
    end

  // ----------------------------------- Tx Sideband Connections (Uses AXI4Lite Clock) -----------------------------


  // HDMI
  assign vid_phy_control_sb_tx_tready  = 1'b1;
  assign vid_phy_status_sb_tx_tvalid   = 1'b1;
  assign vid_phy_status_sb_tx_tdata[0] = b0_TX_LINK_RDY;
  assign vid_phy_status_sb_tx_tdata[1] = b0_MMCM_TX_DRP_LOCKED_DLY;  
  

 

  // ----------------------------------- Rx Sideband Connections (Uses AXI4Lite Clock) -----------------------------

  // Control Inputs - Driven from Link Layer to add protocol specific control
  assign vid_phy_control_sb_rx_tready   = 1'b1;

  // Status Outputs - Will be used by link layer
  assign vid_phy_status_sb_rx_tvalid    = 1'b1;

  assign vid_phy_status_sb_rx_tdata[0]  = gtwiz_reset_rx_done_out_sync & (C_RX_PLL_SELECTION==0 ? b0_CPLL_LOCK_DLY_SYNC_AXICLK : b0_QPLL_LOCK_DLY_SYNC_AXICLK);
  assign vid_phy_status_sb_rx_tdata[1]  = b0_MMCM_RX_DRP_LOCKED_DLY;  



endmodule

