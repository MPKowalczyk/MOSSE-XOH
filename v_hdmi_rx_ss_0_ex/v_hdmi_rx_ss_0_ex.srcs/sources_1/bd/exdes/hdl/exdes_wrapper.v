//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Tue Mar 12 11:37:08 2019
//Host        : vision-desktop running 64-bit Ubuntu 18.04.2 LTS
//Command     : generate_target exdes_wrapper.bd
//Design      : exdes_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module exdes_wrapper
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
    RX_DDC_OUT_scl_io,
    RX_DDC_OUT_sda_io,
    RX_DET_IN,
    RX_HPD_OUT,
    RX_REFCLK_N_OUT,
    RX_REFCLK_P_OUT,
    TX_DDC_OUT_scl_io,
    TX_DDC_OUT_sda_io,
    TX_EN_OUT,
    TX_HPD_IN,
    TX_REFCLK_N_IN,
    TX_REFCLK_P_IN,
    fmch_iic_scl_io,
    fmch_iic_sda_io,
    reset);
  input [0:0]DRU_CLK_IN_clk_n;
  input [0:0]DRU_CLK_IN_clk_p;
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
  inout RX_DDC_OUT_scl_io;
  inout RX_DDC_OUT_sda_io;
  input RX_DET_IN;
  output RX_HPD_OUT;
  output RX_REFCLK_N_OUT;
  output RX_REFCLK_P_OUT;
  inout TX_DDC_OUT_scl_io;
  inout TX_DDC_OUT_sda_io;
  output [0:0]TX_EN_OUT;
  input TX_HPD_IN;
  input TX_REFCLK_N_IN;
  input TX_REFCLK_P_IN;
  inout fmch_iic_scl_io;
  inout fmch_iic_sda_io;
  input reset;

  wire [0:0]DRU_CLK_IN_clk_n;
  wire [0:0]DRU_CLK_IN_clk_p;
  wire HDMI_RX_CLK_N_IN;
  wire HDMI_RX_CLK_P_IN;
  wire [2:0]HDMI_RX_DAT_N_IN;
  wire [2:0]HDMI_RX_DAT_P_IN;
  wire HDMI_TX_CLK_N_OUT;
  wire HDMI_TX_CLK_P_OUT;
  wire [2:0]HDMI_TX_DAT_N_OUT;
  wire [2:0]HDMI_TX_DAT_P_OUT;
  wire IDT_8T49N241_LOL_IN;
  wire IDT_8T49N241_RST_OUT;
  wire LED0;
  wire RX_DDC_OUT_scl_i;
  wire RX_DDC_OUT_scl_io;
  wire RX_DDC_OUT_scl_o;
  wire RX_DDC_OUT_scl_t;
  wire RX_DDC_OUT_sda_i;
  wire RX_DDC_OUT_sda_io;
  wire RX_DDC_OUT_sda_o;
  wire RX_DDC_OUT_sda_t;
  wire RX_DET_IN;
  wire RX_HPD_OUT;
  wire RX_REFCLK_N_OUT;
  wire RX_REFCLK_P_OUT;
  wire TX_DDC_OUT_scl_i;
  wire TX_DDC_OUT_scl_io;
  wire TX_DDC_OUT_scl_o;
  wire TX_DDC_OUT_scl_t;
  wire TX_DDC_OUT_sda_i;
  wire TX_DDC_OUT_sda_io;
  wire TX_DDC_OUT_sda_o;
  wire TX_DDC_OUT_sda_t;
  wire [0:0]TX_EN_OUT;
  wire TX_HPD_IN;
  wire TX_REFCLK_N_IN;
  wire TX_REFCLK_P_IN;
  wire fmch_iic_scl_i;
  wire fmch_iic_scl_io;
  wire fmch_iic_scl_o;
  wire fmch_iic_scl_t;
  wire fmch_iic_sda_i;
  wire fmch_iic_sda_io;
  wire fmch_iic_sda_o;
  wire fmch_iic_sda_t;
  wire reset;

  IOBUF RX_DDC_OUT_scl_iobuf
       (.I(RX_DDC_OUT_scl_o),
        .IO(RX_DDC_OUT_scl_io),
        .O(RX_DDC_OUT_scl_i),
        .T(RX_DDC_OUT_scl_t));
  IOBUF RX_DDC_OUT_sda_iobuf
       (.I(RX_DDC_OUT_sda_o),
        .IO(RX_DDC_OUT_sda_io),
        .O(RX_DDC_OUT_sda_i),
        .T(RX_DDC_OUT_sda_t));
  IOBUF TX_DDC_OUT_scl_iobuf
       (.I(TX_DDC_OUT_scl_o),
        .IO(TX_DDC_OUT_scl_io),
        .O(TX_DDC_OUT_scl_i),
        .T(TX_DDC_OUT_scl_t));
  IOBUF TX_DDC_OUT_sda_iobuf
       (.I(TX_DDC_OUT_sda_o),
        .IO(TX_DDC_OUT_sda_io),
        .O(TX_DDC_OUT_sda_i),
        .T(TX_DDC_OUT_sda_t));
  exdes exdes_i
       (.DRU_CLK_IN_clk_n(DRU_CLK_IN_clk_n),
        .DRU_CLK_IN_clk_p(DRU_CLK_IN_clk_p),
        .HDMI_RX_CLK_N_IN(HDMI_RX_CLK_N_IN),
        .HDMI_RX_CLK_P_IN(HDMI_RX_CLK_P_IN),
        .HDMI_RX_DAT_N_IN(HDMI_RX_DAT_N_IN),
        .HDMI_RX_DAT_P_IN(HDMI_RX_DAT_P_IN),
        .HDMI_TX_CLK_N_OUT(HDMI_TX_CLK_N_OUT),
        .HDMI_TX_CLK_P_OUT(HDMI_TX_CLK_P_OUT),
        .HDMI_TX_DAT_N_OUT(HDMI_TX_DAT_N_OUT),
        .HDMI_TX_DAT_P_OUT(HDMI_TX_DAT_P_OUT),
        .IDT_8T49N241_LOL_IN(IDT_8T49N241_LOL_IN),
        .IDT_8T49N241_RST_OUT(IDT_8T49N241_RST_OUT),
        .LED0(LED0),
        .RX_DDC_OUT_scl_i(RX_DDC_OUT_scl_i),
        .RX_DDC_OUT_scl_o(RX_DDC_OUT_scl_o),
        .RX_DDC_OUT_scl_t(RX_DDC_OUT_scl_t),
        .RX_DDC_OUT_sda_i(RX_DDC_OUT_sda_i),
        .RX_DDC_OUT_sda_o(RX_DDC_OUT_sda_o),
        .RX_DDC_OUT_sda_t(RX_DDC_OUT_sda_t),
        .RX_DET_IN(RX_DET_IN),
        .RX_HPD_OUT(RX_HPD_OUT),
        .RX_REFCLK_N_OUT(RX_REFCLK_N_OUT),
        .RX_REFCLK_P_OUT(RX_REFCLK_P_OUT),
        .TX_DDC_OUT_scl_i(TX_DDC_OUT_scl_i),
        .TX_DDC_OUT_scl_o(TX_DDC_OUT_scl_o),
        .TX_DDC_OUT_scl_t(TX_DDC_OUT_scl_t),
        .TX_DDC_OUT_sda_i(TX_DDC_OUT_sda_i),
        .TX_DDC_OUT_sda_o(TX_DDC_OUT_sda_o),
        .TX_DDC_OUT_sda_t(TX_DDC_OUT_sda_t),
        .TX_EN_OUT(TX_EN_OUT),
        .TX_HPD_IN(TX_HPD_IN),
        .TX_REFCLK_N_IN(TX_REFCLK_N_IN),
        .TX_REFCLK_P_IN(TX_REFCLK_P_IN),
        .fmch_iic_scl_i(fmch_iic_scl_i),
        .fmch_iic_scl_o(fmch_iic_scl_o),
        .fmch_iic_scl_t(fmch_iic_scl_t),
        .fmch_iic_sda_i(fmch_iic_sda_i),
        .fmch_iic_sda_o(fmch_iic_sda_o),
        .fmch_iic_sda_t(fmch_iic_sda_t),
        .reset(reset));
  IOBUF fmch_iic_scl_iobuf
       (.I(fmch_iic_scl_o),
        .IO(fmch_iic_scl_io),
        .O(fmch_iic_scl_i),
        .T(fmch_iic_scl_t));
  IOBUF fmch_iic_sda_iobuf
       (.I(fmch_iic_sda_o),
        .IO(fmch_iic_sda_io),
        .O(fmch_iic_sda_i),
        .T(fmch_iic_sda_t));
endmodule
