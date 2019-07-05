
/*
 * Copyright (c) 2014 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 *
 * This file contains the audio generation part of the audio generator.
 *
 * MODIFICATION HISTORY:
 *
 * Ver   Who Date         Changes
 * ----- --- ----------   -----------------------------------------------
 * 1.00  hf  2014/10/21   First release
 * 1.03  hf  2015/01/06   Updated with new version from Vamsi Krishna
 * 1.04  RHe 2015/01/15   Fixed bug where channel status bit 0 is output twice
 * 1.07  RHe 2015/04/16   Added ramp pattern support.
 * 1.08  YH  2016/10/20   Updated comments for audio frequency calculation
 * 1.09  RHe 2017/05/02   Merged fix for startup behaviour after aud_config_update
 *****************************************************************************/

//////////////////////////////////////////////////////////////////////////
//
// Programmable Audio Pattern Generator
// 
//
// Author: Vamsi Krishna
//
//////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps
`define FLOP_DELAY #100

module dport_aud_pat_gen

(
  input wire         aud_clk,
  input wire         aud_reset,
  input wire         aud_start,
  input wire [3:0]   aud_sample_rate,
  input wire [3:0]   aud_channel_count,
  input wire [41:0]  aud_spdif_channel_status,
  input wire [1:0]   aud_pattern1,
  input wire [1:0]   aud_pattern2,
  input wire [1:0]   aud_pattern3,
  input wire [1:0]   aud_pattern4,
  input wire [1:0]   aud_pattern5,
  input wire [1:0]   aud_pattern6,
  input wire [1:0]   aud_pattern7,
  input wire [1:0]   aud_pattern8,
  input wire [3:0]   aud_period_ch1,
  input wire [3:0]   aud_period_ch2,
  input wire [3:0]   aud_period_ch3,
  input wire [3:0]   aud_period_ch4,
  input wire [3:0]   aud_period_ch5,
  input wire [3:0]   aud_period_ch6,
  input wire [3:0]   aud_period_ch7,
  input wire [3:0]   aud_period_ch8,
  input wire         aud_config_update,//pulse to update the config
  input wire [23:0]  offset_addr_cntr,// to count 250ms in aud clock


  // AXI Streaming Signals
  input  wire        axis_clk, 
  input  wire        axis_resetn, 
  output reg  [31:0] axis_data_egress,
  output reg  [2:0]  axis_id_egress,
  output reg         axis_tvalid,   
  input  wire        axis_tready,
  output wire [198:0]     debug_port
);

localparam OFFSET_48KHZ_CNTR = 24'h002EE0; //Calculated from 512*48 KHz rate

wire [15:0] aud_sample_preloaded;
reg [7:0] aud_blk_count;
reg [41:0] aud_spdif_channel_status_latched;

//-------------------------------------- Sine 2 KHz Samples ----------------------------------



// sine values to get a 2kHz wave
// for 44.1kHz we need 22 samples
// for 48kHz we need 24 sample
reg [15:0] Sine_new_48k [0:23];
reg [15:0] Sine_new_44k [0:21];

always @(posedge axis_clk)
begin
   Sine_new_48k[0] <= 8481; //0x2121
   Sine_new_48k[1] <= 16383; // 3FFF
   Sine_new_48k[2] <= 23170; // 5A82 
   Sine_new_48k[3] <= 28377; // 6ED9
   Sine_new_48k[4] <= 31650; // 7Ba2
   Sine_new_48k[5] <= 32767; // 7FFF
   Sine_new_48k[6] <= 31650; // 7ba2
   Sine_new_48k[7] <= 28377; // 6ed9
   Sine_new_48k[8] <= 23170; // 5a82
   Sine_new_48k[9] <= 16384; // 4000
   Sine_new_48k[10] <= 8481; // 2121 
   Sine_new_48k[11] <= 0;    // 0 
   Sine_new_48k[12] <= -8481; // DEDF
   Sine_new_48k[13] <= -16383; // C001 
   Sine_new_48k[14] <= -23170; // A57E
   Sine_new_48k[15] <= -28377; // 9127
   Sine_new_48k[16] <= -31650; // 845E
   Sine_new_48k[17] <= -32767; // 8001
   Sine_new_48k[18] <= -31650; // 845E
   Sine_new_48k[19] <= -28377; // 9127
   Sine_new_48k[20] <= -23170; // A57E
   Sine_new_48k[21] <= -16384; // C001
   Sine_new_48k[22] <= -8481;  // DEDF
   Sine_new_48k[23] <= 0;   // 00 
   
   Sine_new_44k[0] <= 9211; // 23Fb 1 
   Sine_new_44k[1] <= 17679; // 450F 1
   Sine_new_44k[2] <= 24722; // 6092 1
   Sine_new_44k[3] <= 29771; // 744B 1
   Sine_new_44k[4] <= 32418; // 7EA2 1
   Sine_new_44k[5] <= 32451; // 7EC3 1
   Sine_new_44k[6] <= 29867; // 74AB 1
   Sine_new_44k[7] <= 24874; // 612A 1
   Sine_new_44k[8] <= 17876; // 45D4 1 
   Sine_new_44k[9] <= 9435;  // 24DB
   Sine_new_44k[10] <= 233;  // 00E9
   Sine_new_44k[11] <= -8987;  // 0xDCE5
   Sine_new_44k[12] <= -17482; // BBB6
   Sine_new_44k[13] <= -24568; // A008
   Sine_new_44k[14] <= -29672; // 8C18
   Sine_new_44k[15] <= -32383; // 8181
   Sine_new_44k[16] <= -32483; // 811D  1 
   Sine_new_44k[17] <= -29963; // 8AF5  1 
   Sine_new_44k[18] <= -25026; // 9E3E 1 
   Sine_new_44k[19] <= -18071; // B969 1 
   Sine_new_44k[20] <= -9658;  // DA461 
   Sine_new_44k[21] <= -467;   // FE2D1 
end 

//----------------------------------- Sawtooth Peak-Peak Values -------------------------------
reg [39:0] SppLUT [0:15];

//Address = {CH_freq[2:0], Samples_Count[2:0]}

//[0]  =>    3 Samples => Spp = -65532/2, diff=32766 
//[1]  =>    6 Samples => Spp = -65530/2, diff=13106    
//[2]  =>   12 Samples => Spp = -65516/2, diff= 5956    
//[3]  =>   24 Samples => Spp = -65504/2, diff= 2848    
//[4]  =>   48 Samples => Spp = -65518/2, diff= 1394    
//[5]  =>   96 Samples => Spp = -65360/2, diff=  688    
//[6]  =>  192 Samples => Spp = -65322/2, diff=  342    
//[7]  =>  384 Samples => Spp = -65110/2, diff=  170    
//[8]  =>  768 Samples => Spp = -64428/2, diff=   84    
//[9]  => 1536 Samples => Spp = -64512/2, diff=   42    
always@(posedge axis_clk) begin
  SppLUT[0]  <= 'h0;
  SppLUT[1]  <= {24'h800200, 16'h7FFE};
  SppLUT[2]  <= {24'h800300, 16'h3332};
  SppLUT[3]  <= {24'h800A00, 16'h1744};
  SppLUT[4]  <= {24'h801000, 16'h0B20};
  SppLUT[5]  <= {24'h800900, 16'h0572};
  SppLUT[6]  <= {24'h805800, 16'h02B0};
  SppLUT[7]  <= {24'h806B00, 16'h0156};
  SppLUT[8]  <= {24'h80D500, 16'h00AA};
  SppLUT[9]  <= {24'h822A00, 16'h0054};
  SppLUT[10] <= {24'h820000, 16'h002A};
  SppLUT[11] <= 'h0;
  SppLUT[12] <= 'h0;
  SppLUT[13] <= 'h0;
  SppLUT[14] <= 'h0;
  SppLUT[15] <= 'h0;
end

//----------------------------------- Generate 192 sample pulse -------------------------------
reg [8:0] pulse_cntr;

// For 192   KHz, Audio Clock = 98.305  MHz, Count = 512
// For 176.4 KHz, Audio Clock = 90.3168 MHz, Count = 512
// For 96    KHz, Audio Clock = 49.152  MHz, Count = 512
// For 88.2  KHz, Audio Clock = 45.1584 MHz, Count = 512
// For 48    KHz, Audio Clock = 24.576  MHz, Count = 512 
// For 44.1  KHz, Audio Clock = 22.5792 MHz, Count = 512 
// For 32    KHz, Audio Clock = 16.384  MHz, Count = 512 
reg       pulse;
reg       pulse_toggle;
reg       aud_config_update_toggle;

reg [2:0] aud_config_update_sync;

//The origin of the signal is from HOST i/f. Hence assumed to be stable for more than 3-5 clocks.
always@(posedge aud_clk) begin
  if(aud_reset) begin
    aud_config_update_sync <= `FLOP_DELAY 'h0;
  end else begin
    aud_config_update_sync <= `FLOP_DELAY {aud_config_update_sync[1:0], aud_config_update};
  end
end

wire aud_config_update_pedge = (aud_config_update_sync[2]==1'b0 && aud_config_update_sync[1]==1'b1);

always@(posedge aud_clk) begin
  if(aud_reset || ~aud_start) begin
    pulse_cntr               <= 'h0;
    pulse_toggle             <= 1'b0;
    aud_config_update_toggle <= 1'b0;
    pulse                    <= 1'b0; 
  end else begin
    pulse_cntr  <= pulse_cntr + 1'b1;

    pulse <= `FLOP_DELAY &pulse_cntr;

    if(pulse) begin        
      pulse_toggle  <= `FLOP_DELAY ~pulse_toggle;
    end
    
    if(aud_config_update_pedge) begin
      aud_config_update_toggle <= `FLOP_DELAY ~aud_config_update_toggle;
    end
  end
end

// Synchronizer
reg [2:0] pulse_toggle_q;
reg [2:0] aud_config_update_q;
reg load_value_toggle;

always@(posedge axis_clk) begin
  if(~axis_resetn) begin
    pulse_toggle_q <= 3'b000;
    aud_config_update_q   <= 3'b000;
    load_value_toggle     <= 1'b0;
  end else begin
    pulse_toggle_q        <= {pulse_toggle_q[1:0],pulse_toggle};
    aud_config_update_q   <= {aud_config_update_q[1:0],aud_config_update_toggle}; 
    
    if(load_value) begin 
      load_value_toggle   <= 1'b1;
    end 
    else begin
      if (load_value_toggle && (i_axis_id_egress_q==0)) begin
        load_value_toggle <= 1'b0;
      end
    end
  end
end

wire pulse_sync_axis = (pulse_toggle_q[2] != pulse_toggle_q[1]);
wire load_value      = (aud_config_update_q[2] != aud_config_update_q[1]);

//----------------------------------- Generate Sawtooth Pattern -------------------------------
// aud_pattern = 2'b01

reg  [15:0] pattern_frequency_ch1;
reg  [15:0] pattern_frequency_ch2;
reg  [15:0] pattern_frequency_ch3;
reg  [15:0] pattern_frequency_ch4;
reg  [15:0] pattern_frequency_ch5;
reg  [15:0] pattern_frequency_ch6;
reg  [15:0] pattern_frequency_ch7;
reg  [15:0] pattern_frequency_ch8;

wire [15:0] value_16K = 16'h3E80; //16000
wire [15:0] value_14K = 16'h396C; //14700
wire [15:0] value_10K = 16'h29AB; //10667

wire [3:0] aud_period_shift_1_ch1 = aud_period_ch1 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch1 = aud_period_ch1 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch1 = aud_period_ch1 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

wire [3:0] aud_period_shift_1_ch2 = aud_period_ch2 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch2 = aud_period_ch2 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch2 = aud_period_ch2 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

wire [3:0] aud_period_shift_1_ch3 = aud_period_ch3 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch3 = aud_period_ch3 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch3 = aud_period_ch3 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

wire [3:0] aud_period_shift_1_ch4 = aud_period_ch4 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch4 = aud_period_ch4 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch4 = aud_period_ch4 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

wire [3:0] aud_period_shift_1_ch5 = aud_period_ch5 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch5 = aud_period_ch5 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch5 = aud_period_ch5 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

wire [3:0] aud_period_shift_1_ch6 = aud_period_ch6 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch6 = aud_period_ch6 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch6 = aud_period_ch6 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

wire [3:0] aud_period_shift_1_ch7 = aud_period_ch7 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch7 = aud_period_ch7 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch7 = aud_period_ch7 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

wire [3:0] aud_period_shift_1_ch8 = aud_period_ch8 - 3; //For 192 KHz & 176.4 KHz
wire [3:0] aud_period_shift_2_ch8 = aud_period_ch8 - 2; //For 96 KHz & 88.2 KHz
wire [3:0] aud_period_shift_3_ch8 = aud_period_ch8 - 1; //For 48 KHz & 44.1 KHz & 32 KHz

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch1
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch1 = value_16K>>aud_period_shift_1_ch1;  //192   KHz
    4'h5:    pattern_frequency_ch1 = value_14K>>aud_period_shift_1_ch1;  //176.4 KHz 
    4'h4:    pattern_frequency_ch1 = value_16K>>aud_period_shift_2_ch1;  //96    KHz 
    4'h3:    pattern_frequency_ch1 = value_14K>>aud_period_shift_2_ch1;  //88.2  KHz 
    4'h2:    pattern_frequency_ch1 = value_16K>>aud_period_shift_3_ch1;  //48    KHz 
    4'h1:    pattern_frequency_ch1 = value_14K>>aud_period_shift_3_ch1;  //44.1  KHz 
    default: pattern_frequency_ch1 = value_10K>>aud_period_shift_3_ch1;  //32    KHz 
  endcase

end

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch2
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch2 = value_16K>>aud_period_shift_1_ch2;  //192   KHz 
    4'h5:    pattern_frequency_ch2 = value_14K>>aud_period_shift_1_ch2;  //176.4 KHz 
    4'h4:    pattern_frequency_ch2 = value_16K>>aud_period_shift_2_ch2;  //96    KHz 
    4'h3:    pattern_frequency_ch2 = value_14K>>aud_period_shift_2_ch2;  //88.2  KHz 
    4'h2:    pattern_frequency_ch2 = value_16K>>aud_period_shift_3_ch2;  //48    KHz 
    4'h1:    pattern_frequency_ch2 = value_14K>>aud_period_shift_3_ch2;  //44.1  KHz 
    default: pattern_frequency_ch2 = value_10K>>aud_period_shift_3_ch2;  //32    KHz 
  endcase
end

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch3
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch3 = value_16K>>aud_period_shift_1_ch3;  //192   KHz 
    4'h5:    pattern_frequency_ch3 = value_14K>>aud_period_shift_1_ch3;  //176.4 KHz 
    4'h4:    pattern_frequency_ch3 = value_16K>>aud_period_shift_2_ch3;  //96    KHz 
    4'h3:    pattern_frequency_ch3 = value_14K>>aud_period_shift_2_ch3;  //88.2  KHz 
    4'h2:    pattern_frequency_ch3 = value_16K>>aud_period_shift_3_ch3;  //48    KHz 
    4'h1:    pattern_frequency_ch3 = value_14K>>aud_period_shift_3_ch3;  //44.1  KHz 
    default: pattern_frequency_ch3 = value_10K>>aud_period_shift_3_ch3;  //32    KHz 
  endcase
end

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch4
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch4 = value_16K>>aud_period_shift_1_ch4;  //192   KHz 
    4'h5:    pattern_frequency_ch4 = value_14K>>aud_period_shift_1_ch4;  //176.4 KHz 
    4'h4:    pattern_frequency_ch4 = value_16K>>aud_period_shift_2_ch4;  //96    KHz 
    4'h3:    pattern_frequency_ch4 = value_14K>>aud_period_shift_2_ch4;  //88.2  KHz 
    4'h2:    pattern_frequency_ch4 = value_16K>>aud_period_shift_3_ch4;  //48    KHz 
    4'h1:    pattern_frequency_ch4 = value_14K>>aud_period_shift_3_ch4;  //44.1  KHz 
    default: pattern_frequency_ch4 = value_10K>>aud_period_shift_3_ch4;  //32    KHz 
  endcase
end

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch5
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch5 = value_16K>>aud_period_shift_1_ch5;  //192   KHz 
    4'h5:    pattern_frequency_ch5 = value_14K>>aud_period_shift_1_ch5;  //176.4 KHz 
    4'h4:    pattern_frequency_ch5 = value_16K>>aud_period_shift_2_ch5;  //96    KHz 
    4'h3:    pattern_frequency_ch5 = value_14K>>aud_period_shift_2_ch5;  //88.2  KHz 
    4'h2:    pattern_frequency_ch5 = value_16K>>aud_period_shift_3_ch5;  //48    KHz 
    4'h1:    pattern_frequency_ch5 = value_14K>>aud_period_shift_3_ch5;  //44.1  KHz 
    default: pattern_frequency_ch5 = value_10K>>aud_period_shift_3_ch5;  //32    KHz 
  endcase
end

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch6
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch6 = value_16K>>aud_period_shift_1_ch6;  //192   KHz 
    4'h5:    pattern_frequency_ch6 = value_14K>>aud_period_shift_1_ch6;  //176.4 KHz 
    4'h4:    pattern_frequency_ch6 = value_16K>>aud_period_shift_2_ch6;  //96    KHz 
    4'h3:    pattern_frequency_ch6 = value_14K>>aud_period_shift_2_ch6;  //88.2  KHz 
    4'h2:    pattern_frequency_ch6 = value_16K>>aud_period_shift_3_ch6;  //48    KHz 
    4'h1:    pattern_frequency_ch6 = value_14K>>aud_period_shift_3_ch6;  //44.1  KHz 
    default: pattern_frequency_ch6 = value_10K>>aud_period_shift_3_ch6;  //32    KHz 
  endcase
end

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch7
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch7 = value_16K>>aud_period_shift_1_ch7;  //192   KHz 
    4'h5:    pattern_frequency_ch7 = value_14K>>aud_period_shift_1_ch7;  //176.4 KHz 
    4'h4:    pattern_frequency_ch7 = value_16K>>aud_period_shift_2_ch7;  //96    KHz 
    4'h3:    pattern_frequency_ch7 = value_14K>>aud_period_shift_2_ch7;  //88.2  KHz 
    4'h2:    pattern_frequency_ch7 = value_16K>>aud_period_shift_3_ch7;  //48    KHz 
    4'h1:    pattern_frequency_ch7 = value_14K>>aud_period_shift_3_ch7;  //44.1  KHz 
    default: pattern_frequency_ch7 = value_10K>>aud_period_shift_3_ch7;  //32    KHz 
  endcase
end

//see Table 3-10 in LLC
always@(*) begin: Pattern_Frequency_Ch8
  case(aud_sample_rate) 
    4'h6:    pattern_frequency_ch8 = value_16K>>aud_period_shift_1_ch8;  //192   KHz 
    4'h5:    pattern_frequency_ch8 = value_14K>>aud_period_shift_1_ch8;  //176.4 KHz 
    4'h4:    pattern_frequency_ch8 = value_16K>>aud_period_shift_2_ch8;  //96    KHz 
    4'h3:    pattern_frequency_ch8 = value_14K>>aud_period_shift_2_ch8;  //88.2  KHz 
    4'h2:    pattern_frequency_ch8 = value_16K>>aud_period_shift_3_ch8;  //48    KHz 
    4'h1:    pattern_frequency_ch8 = value_14K>>aud_period_shift_3_ch8;  //44.1  KHz 
    default: pattern_frequency_ch8 = value_10K>>aud_period_shift_3_ch8;  //32    KHz 
  endcase
end


reg [13:0] sample_cntr_ch1;
reg [13:0] sample_cntr_ch2;
reg [13:0] sample_cntr_ch3;
reg [13:0] sample_cntr_ch4;
reg [13:0] sample_cntr_ch5;
reg [13:0] sample_cntr_ch6;
reg [13:0] sample_cntr_ch7;
reg [13:0] sample_cntr_ch8;

reg        gen_sample_ch1,gen_sample_ch1_q; 
reg        gen_sample_ch2,gen_sample_ch2_q;
reg        gen_sample_ch3,gen_sample_ch3_q;
reg        gen_sample_ch4,gen_sample_ch4_q;
reg        gen_sample_ch5,gen_sample_ch5_q;
reg        gen_sample_ch6,gen_sample_ch6_q;
reg        gen_sample_ch7,gen_sample_ch7_q;
reg       gen_sample_ch8,gen_sample_ch8_q;

reg [2:0] pulse_sync_axis_q;

always@(posedge axis_clk) begin
  if(~axis_resetn || ~aud_start) begin
    sample_cntr_ch1 <= `FLOP_DELAY 'h0;
    sample_cntr_ch2 <= `FLOP_DELAY 'h0;
    sample_cntr_ch3 <= `FLOP_DELAY 'h0;
    sample_cntr_ch4 <= `FLOP_DELAY 'h0;
    sample_cntr_ch5 <= `FLOP_DELAY 'h0;
    sample_cntr_ch6 <= `FLOP_DELAY 'h0;
    sample_cntr_ch7 <= `FLOP_DELAY 'h0;
    sample_cntr_ch8 <= `FLOP_DELAY 'h0;

    gen_sample_ch1  <= `FLOP_DELAY 1'b0;
    gen_sample_ch2  <= `FLOP_DELAY 1'b0;
    gen_sample_ch3  <= `FLOP_DELAY 1'b0;
    gen_sample_ch4  <= `FLOP_DELAY 1'b0;
    gen_sample_ch5  <= `FLOP_DELAY 1'b0;
    gen_sample_ch6  <= `FLOP_DELAY 1'b0;
    gen_sample_ch7  <= `FLOP_DELAY 1'b0;
    gen_sample_ch8  <= `FLOP_DELAY 1'b0;
    
    gen_sample_ch1_q <= `FLOP_DELAY 1'b0; 
    gen_sample_ch2_q <= `FLOP_DELAY 1'b0;
    gen_sample_ch3_q <= `FLOP_DELAY 1'b0;
    gen_sample_ch4_q <= `FLOP_DELAY 1'b0;
    gen_sample_ch5_q <= `FLOP_DELAY 1'b0;
    gen_sample_ch6_q <= `FLOP_DELAY 1'b0;
    gen_sample_ch7_q <= `FLOP_DELAY 1'b0;
    gen_sample_ch8_q <= `FLOP_DELAY 1'b0;

    pulse_sync_axis_q <= `FLOP_DELAY 'h0;
  end else begin

    pulse_sync_axis_q <= `FLOP_DELAY {pulse_sync_axis, pulse_sync_axis_q[2:1]};

  end //axis_resetn
end

// Sawtooth peak-peak pulse
// [23:0] = {16 bit sample , 8'h00}
wire [39:0] Spp_diff_Ch1 = SppLUT[aud_period_ch1]; 
wire [39:0] Spp_diff_Ch2 = SppLUT[aud_period_ch2]; 
wire [39:0] Spp_diff_Ch3 = SppLUT[aud_period_ch3]; 
wire [39:0] Spp_diff_Ch4 = SppLUT[aud_period_ch4]; 
wire [39:0] Spp_diff_Ch5 = SppLUT[aud_period_ch5]; 
wire [39:0] Spp_diff_Ch6 = SppLUT[aud_period_ch6]; 
wire [39:0] Spp_diff_Ch7 = SppLUT[aud_period_ch7]; 
wire [39:0] Spp_diff_Ch8 = SppLUT[aud_period_ch8]; 

wire [23:0] Spp_Value_Ch1 = Spp_diff_Ch1[39:16]; wire [15:0] Diff_Ch1 = Spp_diff_Ch1[15:0];
wire [23:0] Spp_Value_Ch2 = Spp_diff_Ch2[39:16]; wire [15:0] Diff_Ch2 = Spp_diff_Ch2[15:0];
wire [23:0] Spp_Value_Ch3 = Spp_diff_Ch3[39:16]; wire [15:0] Diff_Ch3 = Spp_diff_Ch3[15:0];
wire [23:0] Spp_Value_Ch4 = Spp_diff_Ch4[39:16]; wire [15:0] Diff_Ch4 = Spp_diff_Ch4[15:0];
wire [23:0] Spp_Value_Ch5 = Spp_diff_Ch5[39:16]; wire [15:0] Diff_Ch5 = Spp_diff_Ch5[15:0];
wire [23:0] Spp_Value_Ch6 = Spp_diff_Ch6[39:16]; wire [15:0] Diff_Ch6 = Spp_diff_Ch6[15:0];
wire [23:0] Spp_Value_Ch7 = Spp_diff_Ch7[39:16]; wire [15:0] Diff_Ch7 = Spp_diff_Ch7[15:0];
wire [23:0] Spp_Value_Ch8 = Spp_diff_Ch8[39:16]; wire [15:0] Diff_Ch8 = Spp_diff_Ch8[15:0];

reg [23:0] ping_sine_sample_ch;

reg [23:0] audio_sample_ch1;
reg [23:0] audio_sample_ch2;
reg [23:0] audio_sample_ch3;
reg [23:0] audio_sample_ch4;
reg [23:0] audio_sample_ch5;
reg [23:0] audio_sample_ch6;
reg [23:0] audio_sample_ch7;
reg [23:0] audio_sample_ch8;

reg [11:0] addr_cntr_ch1;
reg [11:0] addr_cntr_ch2;

reg [23:0] cntr_250ms_ch1;
reg [23:0] cntr_250ms_ch2;
reg [8:0] ping_pattern_ch1;
reg [8:0] ping_pattern_ch2;

reg       toggle_pat_read; 
reg [4:0]    sine_addr_cntr_44;
reg [4:0]    sine_addr_cntr_48;
reg [23:0]    sine_pattern;

always@(posedge axis_clk) begin
  if(~axis_resetn || ~aud_start) begin
    audio_sample_ch1 <= `FLOP_DELAY 'h0; 
    audio_sample_ch2 <= `FLOP_DELAY 'h0; 
    audio_sample_ch3 <= `FLOP_DELAY 'h0; 
    audio_sample_ch4 <= `FLOP_DELAY 'h0; 
    audio_sample_ch5 <= `FLOP_DELAY 'h0; 
    audio_sample_ch6 <= `FLOP_DELAY 'h0; 
    audio_sample_ch7 <= `FLOP_DELAY 'h0; 
    audio_sample_ch8 <= `FLOP_DELAY 'h0;
    addr_cntr_ch1 <= `FLOP_DELAY 'h0; 
    sine_addr_cntr_44<= `FLOP_DELAY 'h0; 
    sine_addr_cntr_48<= `FLOP_DELAY 'h0; 
    addr_cntr_ch2 <= `FLOP_DELAY 'h0; 
    cntr_250ms_ch1<= `FLOP_DELAY 'h0;
    cntr_250ms_ch2<= `FLOP_DELAY 'h0;
    ping_sine_sample_ch <= `FLOP_DELAY 'h0;
    ping_pattern_ch1 <= `FLOP_DELAY 9'b1010_1010_1;
    ping_pattern_ch2 <= `FLOP_DELAY 9'b1010_1010_1;
    toggle_pat_read <= `FLOP_DELAY 1'b1;
    sine_pattern<= `FLOP_DELAY 24'd31245; 
  end else if(load_value) begin 
    audio_sample_ch1 <= `FLOP_DELAY Spp_Value_Ch1; 
    audio_sample_ch2 <= `FLOP_DELAY Spp_Value_Ch2; 
    audio_sample_ch3 <= `FLOP_DELAY Spp_Value_Ch3; 
    audio_sample_ch4 <= `FLOP_DELAY Spp_Value_Ch4; 
    audio_sample_ch5 <= `FLOP_DELAY Spp_Value_Ch5; 
    audio_sample_ch6 <= `FLOP_DELAY Spp_Value_Ch6; 
    audio_sample_ch7 <= `FLOP_DELAY Spp_Value_Ch7; 
    audio_sample_ch8 <= `FLOP_DELAY Spp_Value_Ch8; 
    addr_cntr_ch1 <= `FLOP_DELAY 'h0; 
    sine_addr_cntr_44<= `FLOP_DELAY 'h0; 
    sine_addr_cntr_48<= `FLOP_DELAY 'h0; 
    addr_cntr_ch2 <= `FLOP_DELAY 'h0; 
    cntr_250ms_ch1<= `FLOP_DELAY 'h0;
    cntr_250ms_ch2<= `FLOP_DELAY 'h0;
    ping_pattern_ch1 <= `FLOP_DELAY 9'b1010_1010_1;
    ping_pattern_ch2 <= `FLOP_DELAY 9'b1010_1010_1;
    toggle_pat_read <= `FLOP_DELAY 1'b1;
    sine_pattern<= `FLOP_DELAY 24'd31245; 
  end else begin
 
   //Ping Test Pattern
    if(pulse_sync_axis) begin
          addr_cntr_ch1 <= `FLOP_DELAY (addr_cntr_ch1==16) ?'h0 : addr_cntr_ch1 + 1'b1;
          ping_sine_sample_ch[23:8] <= `FLOP_DELAY (ping_pattern_ch1[0])? 
												(	(aud_sample_rate == 1) ? Sine_new_44k[sine_addr_cntr_44] :Sine_new_48k[sine_addr_cntr_48] )
												 :'h00;
          ping_sine_sample_ch[7:0]  <= `FLOP_DELAY 8'h00;
          cntr_250ms_ch1       <= `FLOP_DELAY cntr_250ms_ch1 + 1'b1;
          //~250ms: shift the pattern. Insert silence when ping_pattern_chx[8]=0
          if(cntr_250ms_ch1==offset_addr_cntr)  begin
            cntr_250ms_ch1   <= `FLOP_DELAY 'h0;
            ping_pattern_ch1 <= `FLOP_DELAY {ping_pattern_ch1[0], ping_pattern_ch1[7:1]};
          end

          sine_addr_cntr_44 <= `FLOP_DELAY (sine_addr_cntr_44 == 21) ? 'h0 : sine_addr_cntr_44+1;
          sine_addr_cntr_48 <= `FLOP_DELAY (sine_addr_cntr_48 == 23) ? 'h0 : sine_addr_cntr_48+1;
          sine_pattern      <=  (aud_sample_rate == 1) ? {Sine_new_44k[sine_addr_cntr_44],8'b00} : {Sine_new_48k[sine_addr_cntr_48],8'b00};
    end
    if(pulse_sync_axis) begin
          case(aud_pattern1) 
             2'b10 : audio_sample_ch1 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch1 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch1 <= `FLOP_DELAY audio_sample_ch1 + 1;
             2'b00 : audio_sample_ch1 <= `FLOP_DELAY 'b0;
          endcase 
          case(aud_pattern2) 
             2'b10 : audio_sample_ch2 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch2 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch2 <= `FLOP_DELAY audio_sample_ch2 + 1;
             2'b00 : audio_sample_ch2 <= `FLOP_DELAY 'b0;
          endcase 

          case(aud_pattern3) 
             2'b10 : audio_sample_ch3 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch3 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch3 <= `FLOP_DELAY audio_sample_ch3 + 1;
             2'b00 : audio_sample_ch3 <= `FLOP_DELAY 'b0;
          endcase 

          case(aud_pattern4) 
             2'b10 : audio_sample_ch4 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch4 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch4 <= `FLOP_DELAY audio_sample_ch4 + 1;
             2'b00 : audio_sample_ch4 <= `FLOP_DELAY 'b0;
          endcase 

          case(aud_pattern5) 
             2'b10 : audio_sample_ch5 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch5 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch5 <= `FLOP_DELAY audio_sample_ch5 + 1;
             2'b00 : audio_sample_ch5 <= `FLOP_DELAY 'b0;
          endcase 

          case(aud_pattern6) 
             2'b10 : audio_sample_ch6 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch6 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch6 <= `FLOP_DELAY audio_sample_ch6 + 1;
             2'b00 : audio_sample_ch6 <= `FLOP_DELAY 'b0;
          endcase 

          case(aud_pattern7) 
             2'b10 : audio_sample_ch7 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch7 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch7 <= `FLOP_DELAY audio_sample_ch7 + 1;
             2'b00 : audio_sample_ch7 <= `FLOP_DELAY 'b0;
          endcase 

          case(aud_pattern8) 
             2'b10 : audio_sample_ch8 <= `FLOP_DELAY ping_sine_sample_ch;
             2'b01 : audio_sample_ch8 <= `FLOP_DELAY sine_pattern;
             2'b11 : audio_sample_ch8 <= `FLOP_DELAY audio_sample_ch8 + 1;
             2'b00 : audio_sample_ch8 <= `FLOP_DELAY 'b0;
          endcase 
    end

//    if(pulse_sync_axis) begin
//      case(aud_pattern1)
//        2'b00: begin//Silence                             
//          audio_sample_ch1 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin //sawtooth
//          if(gen_sample_ch1) begin
//            if(audio_sample_ch1[23:8] == -Diff_Ch1) begin
//              audio_sample_ch1[23:8] <= `FLOP_DELAY Diff_Ch1;
//              audio_sample_ch1[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch1[23:8] == -Spp_Value_Ch1[23:8]) begin
//              audio_sample_ch1[23:8] <= `FLOP_DELAY Spp_Value_Ch1[23:8];
//              audio_sample_ch1[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch1[23:8] <= audio_sample_ch1[23:8] + Diff_Ch1;
//            end
//          end
//        end
//
//        2'b10: begin //Sine
//          audio_sample_ch1 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch1 <= `FLOP_DELAY audio_sample_ch1 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//    end
//
//    if(pulse_sync_axis) begin
//      case(aud_pattern2)
//        2'b00: begin//Silence                             
//          audio_sample_ch2 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin
//          if(gen_sample_ch2) begin
//            if(audio_sample_ch2[23:8] == -Diff_Ch2) begin
//              audio_sample_ch2[23:8] <= `FLOP_DELAY Diff_Ch2;
//              audio_sample_ch2[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch2[23:8] == -Spp_Value_Ch2[23:8]) begin
//              audio_sample_ch2[23:8] <= `FLOP_DELAY Spp_Value_Ch2[23:8];
//              audio_sample_ch2[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch2[23:8] <= audio_sample_ch2[23:8] + Diff_Ch2;
//            end
//          end
//        end
//
//        2'b10: begin //Sine
//          audio_sample_ch2 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch2 <= `FLOP_DELAY audio_sample_ch2 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//    end
//
//    if(pulse_sync_axis) begin
//      case(aud_pattern3)
//        2'b00: begin//Silence                             
//          audio_sample_ch3 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin
//          if(gen_sample_ch3) begin
//            if(audio_sample_ch3[23:8] == -Diff_Ch3) begin
//              audio_sample_ch3[23:8] <= `FLOP_DELAY Diff_Ch3;
//              audio_sample_ch3[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch3[23:8] == -Spp_Value_Ch3[23:8]) begin
//              audio_sample_ch3[23:8] <= `FLOP_DELAY Spp_Value_Ch3[23:8];
//              audio_sample_ch3[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch3[23:8] <= audio_sample_ch3[23:8] + Diff_Ch3;
//            end
//          end
//        end
//
//        2'b10: begin 
//          audio_sample_ch3 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch3 <= `FLOP_DELAY audio_sample_ch3 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//    end
//
//    if(pulse_sync_axis) begin
//      case(aud_pattern4)
//        2'b00: begin//Silence                             
//          audio_sample_ch4 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin
//          if(gen_sample_ch4) begin
//            if(audio_sample_ch4[23:8] == -Diff_Ch4) begin
//              audio_sample_ch4[23:8] <= `FLOP_DELAY Diff_Ch4;
//              audio_sample_ch4[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch4[23:8] == -Spp_Value_Ch4[23:8]) begin
//              audio_sample_ch4[23:8] <= `FLOP_DELAY Spp_Value_Ch4[23:8];
//              audio_sample_ch4[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch4[23:8] <= audio_sample_ch4[23:8] + Diff_Ch4;
//            end
//          end
//        end
//
//
//        2'b10: begin //Sine wave only in 1 & 2 channels, Silence in other channels
//          audio_sample_ch4 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch4 <= `FLOP_DELAY audio_sample_ch4 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//
//    end
//
//    if(pulse_sync_axis) begin
//      case(aud_pattern5)
//        2'b00: begin//Silence                             
//          audio_sample_ch5 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin
//          if(gen_sample_ch5) begin
//            if(audio_sample_ch5[23:8] == -Diff_Ch5) begin
//              audio_sample_ch5[23:8] <= `FLOP_DELAY Diff_Ch5;
//              audio_sample_ch5[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch5[23:8] == -Spp_Value_Ch5[23:8]) begin
//              audio_sample_ch5[23:8] <= `FLOP_DELAY Spp_Value_Ch5[23:8];
//              audio_sample_ch5[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch5[23:8] <= audio_sample_ch5[23:8] + Diff_Ch5;
//            end
//          end
//        end
//
//
//        2'b10: begin //Sine wave only in 1 & 2 channels, Silence in other channels
//          audio_sample_ch5 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch5 <= `FLOP_DELAY audio_sample_ch5 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//    end
//
//    if(pulse_sync_axis) begin
//      case(aud_pattern6)
//        2'b00: begin//Silence                             
//          audio_sample_ch6 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin
//          if(gen_sample_ch6) begin
//            if(audio_sample_ch6[23:8] == -Diff_Ch6) begin
//              audio_sample_ch6[23:8] <= `FLOP_DELAY Diff_Ch6;
//              audio_sample_ch6[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch6[23:8] == -Spp_Value_Ch6[23:8]) begin
//              audio_sample_ch6[23:8] <= `FLOP_DELAY Spp_Value_Ch6[23:8];
//              audio_sample_ch6[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch6[23:8] <= audio_sample_ch6[23:8] + Diff_Ch6;
//            end
//          end
//        end
//
//
//        2'b10: begin //Sine wave only in 1 & 2 channels, Silence in other channels
//          audio_sample_ch6 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch6 <= `FLOP_DELAY audio_sample_ch6 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//    end
//
//    if(pulse_sync_axis) begin
//      case(aud_pattern7)
//        2'b00: begin//Silence                             
//          audio_sample_ch7 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin
//          if(gen_sample_ch7) begin
//            if(audio_sample_ch7[23:8] == -Diff_Ch7) begin
//              audio_sample_ch7[23:8] <= `FLOP_DELAY Diff_Ch7;
//              audio_sample_ch7[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch7[23:8] == -Spp_Value_Ch7[23:8]) begin
//              audio_sample_ch7[23:8] <= `FLOP_DELAY Spp_Value_Ch7[23:8];
//              audio_sample_ch7[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch7[23:8] <= audio_sample_ch7[23:8] + Diff_Ch7;
//            end
//          end
//        end
//
//        2'b10: begin //Sine wave only in 1 & 2 channels, Silence in other channels
//          audio_sample_ch7 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch7 <= `FLOP_DELAY audio_sample_ch7 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//    end
//
//    if(pulse_sync_axis) begin
//      case(aud_pattern8)
//        2'b00: begin//Silence                             
//          audio_sample_ch8 <= `FLOP_DELAY 'h0;
//        end 
//
//        2'b01: begin
//          if(gen_sample_ch8) begin
//            if(audio_sample_ch8[23:8] == -Diff_Ch8) begin
//              audio_sample_ch8[23:8] <= `FLOP_DELAY Diff_Ch8;
//              audio_sample_ch8[7:0]  <= `FLOP_DELAY 'h00;
//            end else if(audio_sample_ch8[23:8] == -Spp_Value_Ch8[23:8]) begin
//              audio_sample_ch8[23:8] <= `FLOP_DELAY Spp_Value_Ch8[23:8];
//              audio_sample_ch8[7:0]  <= `FLOP_DELAY 'h00;
//            end else begin
//              audio_sample_ch8[23:8] <= audio_sample_ch8[23:8] + Diff_Ch8;
//            end
//          end
//        end
//
//        2'b10: begin //Sine wave only in 1 & 2 channels, Silence in other channels
//          audio_sample_ch8 <= `FLOP_DELAY ping_sine_sample_ch;
//        end 
//
//        2'b11: begin //Incrementing Pattern
//          audio_sample_ch8 <= `FLOP_DELAY audio_sample_ch8 + 'h1;
//        end
//
//        default: begin
//        end
//      endcase 
//    end

  end
end


//------------------------------------------ Sample Holding Buffers -------------------------------------
reg [31:0] ch1_sample_queue [0:7];
reg [31:0] ch2_sample_queue [0:7];
reg [31:0] ch3_sample_queue [0:7];
reg [31:0] ch4_sample_queue [0:7];
reg [31:0] ch5_sample_queue [0:7];
reg [31:0] ch6_sample_queue [0:7];
reg [31:0] ch7_sample_queue [0:7];
reg [31:0] ch8_sample_queue [0:7];

reg [2:0] ch1_wr_index;
reg [2:0] ch2_wr_index;
reg [2:0] ch3_wr_index;
reg [2:0] ch4_wr_index;
reg [2:0] ch5_wr_index;
reg [2:0] ch6_wr_index;
reg [2:0] ch7_wr_index;
reg [2:0] ch8_wr_index;

reg [2:0] ch_rd_index;
reg [2:0] ch_rd_index_d;

reg [31:0] ch1_rd_data;
reg [31:0] ch2_rd_data;
reg [31:0] ch3_rd_data;
reg [31:0] ch4_rd_data;
reg [31:0] ch5_rd_data;
reg [31:0] ch6_rd_data;
reg [31:0] ch7_rd_data;
reg [31:0] ch8_rd_data;

reg [8:0] axis_ch_handshake;
reg       i_axis_tvalid_q;

// Samples data @ every audio sample rate
// generate SPDIF - preamble and other control bits here

reg [191:0] aud_blk_seq;
reg         gen_subframe_preamble;
reg        validity;
reg        userdata;
reg [191:0]channel_status;
wire       parity_sample1 = (^audio_sample_ch1)^validity^userdata^channel_status[191]; 
wire       parity_sample2 = (^audio_sample_ch2)^validity^userdata^channel_status[191]; 
wire       parity_sample3 = (^audio_sample_ch3)^validity^userdata^channel_status[191]; 
wire       parity_sample4 = (^audio_sample_ch4)^validity^userdata^channel_status[191]; 
wire       parity_sample5 = (^audio_sample_ch5)^validity^userdata^channel_status[191]; 
wire       parity_sample6 = (^audio_sample_ch6)^validity^userdata^channel_status[191]; 
wire       parity_sample7 = (^audio_sample_ch7)^validity^userdata^channel_status[191]; 
wire       parity_sample8 = (^audio_sample_ch8)^validity^userdata^channel_status[191]; 
wire [3:0] preamble_frame    = ((aud_blk_count==0) & ~gen_subframe_preamble) ?4'b0001 : 4'b0010;
wire [3:0] preamble_subframe = 4'b0011;
                                       
reg  [2:0]  i_axis_id_egress_q;

reg  [8:1] ch_en;

always@(posedge axis_clk) begin
  if (~axis_resetn)
    begin
      ch_en = 8'b0;
    end
  else
    begin
      if (load_value_toggle && (i_axis_id_egress_q==0)) begin
        if (aud_channel_count >= 1)
          ch_en[1] <= `FLOP_DELAY 1'b1;
        else
          ch_en[1] <= `FLOP_DELAY 1'b0;
        
        if (aud_channel_count >= 2)
          ch_en[2] <= `FLOP_DELAY 1'b1;
        else
          ch_en[2] <= `FLOP_DELAY 1'b0;
        
        if (aud_channel_count >= 3)
          ch_en[3] <= `FLOP_DELAY 1'b1;
        else
          ch_en[3] <= `FLOP_DELAY 1'b0;
        
        if (aud_channel_count >= 4)
          ch_en[4] <= `FLOP_DELAY 1'b1;
        else
          ch_en[4] <= `FLOP_DELAY 1'b0;
        
        if (aud_channel_count >= 5)
          ch_en[5] <= `FLOP_DELAY 1'b1;
        else
          ch_en[5] <= `FLOP_DELAY 1'b0;
        
        if (aud_channel_count >= 6)
          ch_en[6] <= `FLOP_DELAY 1'b1;
        else
          ch_en[6] <= `FLOP_DELAY 1'b0;
        
        if (aud_channel_count >= 7)
          ch_en[7] <= `FLOP_DELAY 1'b1;
        else
          ch_en[7] <= `FLOP_DELAY 1'b0;
        
        if (aud_channel_count >= 8)
          ch_en[8] <= `FLOP_DELAY 1'b1;
        else
          ch_en[8] <= `FLOP_DELAY 1'b0;
      end
    end
end
  

always@(posedge axis_clk) begin
  if(~axis_resetn || ~aud_start) begin
    ch1_wr_index <= `FLOP_DELAY 'h0;
    ch2_wr_index <= `FLOP_DELAY 'h0;
    ch3_wr_index <= `FLOP_DELAY 'h0;
    ch4_wr_index <= `FLOP_DELAY 'h0;
    ch5_wr_index <= `FLOP_DELAY 'h0;
    ch6_wr_index <= `FLOP_DELAY 'h0;
    ch7_wr_index <= `FLOP_DELAY 'h0;
    ch8_wr_index <= `FLOP_DELAY 'h0;
    aud_spdif_channel_status_latched<= `FLOP_DELAY 'h0;

    ch_rd_index  <= `FLOP_DELAY 'h0;

 //   i_axis_tvalid_q <= `FLOP_DELAY 1'b0;

    axis_ch_handshake <= `FLOP_DELAY 9'b0_1111_1111;
    i_axis_id_egress_q <= `FLOP_DELAY 'h0;
    axis_data_egress <= `FLOP_DELAY 'h0;

    aud_blk_seq <= `FLOP_DELAY 'h1;
    aud_blk_count <= `FLOP_DELAY 8'b0; // counts from 0 to 191 on tvalid =1
    gen_subframe_preamble <= `FLOP_DELAY 1'b0;

    // Change these to required vector later...192 bit
    validity <= `FLOP_DELAY 1'b0; //0: Use the sample, 1: Discard the sample
    userdata <= `FLOP_DELAY 1'b0;
    channel_status <= `FLOP_DELAY 192'h0;  

  end else begin

    // Load when a new value is programmed 

    if(load_value) begin
      aud_spdif_channel_status_latched <=  `FLOP_DELAY aud_spdif_channel_status;
    end

    // when start of new audio block
    // if((aud_blk_seq[0] & ~gen_subframe_preamble) ) begin
      // channel_status[191:150] <= `FLOP_DELAY aud_spdif_channel_status_latched;
      // channel_status[149:  0] <= `FLOP_DELAY 'h0;           
      // //$display("Audio Block Generated...");          
    // //end else if(pulse_sync_axis_q[2] && gen_subframe_preamble) begin
    // end else if(pulse_sync_axis_q[2]) begin
      // channel_status <= `FLOP_DELAY {channel_status[190:0],channel_status[191]};
    // end
    
    if(pulse_sync_axis_q[2]) begin
      channel_status <= `FLOP_DELAY {channel_status[190:0],channel_status[191]};
      //$display("Audio Block Generated...");          
    //end else if(pulse_sync_axis_q[2] && gen_subframe_preamble) begin
    end else if((aud_blk_seq[0] & ~gen_subframe_preamble) ) begin
      channel_status[191:150] <= `FLOP_DELAY aud_spdif_channel_status_latched;
      channel_status[149:  0] <= `FLOP_DELAY 'h0;
    end

    if(pulse_sync_axis_q[2]) begin
      ch1_wr_index <= `FLOP_DELAY ch1_wr_index + 1'b1;
      ch2_wr_index <= `FLOP_DELAY ch2_wr_index + 1'b1;
      ch3_wr_index <= `FLOP_DELAY ch3_wr_index + 1'b1;
      ch4_wr_index <= `FLOP_DELAY ch4_wr_index + 1'b1;
      ch5_wr_index <= `FLOP_DELAY ch5_wr_index + 1'b1;
      ch6_wr_index <= `FLOP_DELAY ch6_wr_index + 1'b1;
      ch7_wr_index <= `FLOP_DELAY ch7_wr_index + 1'b1;
      ch8_wr_index <= `FLOP_DELAY ch8_wr_index + 1'b1;

      gen_subframe_preamble <= `FLOP_DELAY ~gen_subframe_preamble;

      //if(gen_subframe_preamble)
      aud_blk_seq <= `FLOP_DELAY {aud_blk_seq[0],aud_blk_seq[191:1]};
      if(aud_blk_count == 8'd191)
         aud_blk_count <= `FLOP_DELAY 8'b0; // counts from 0 to 191 on tvalid =1
      else
         aud_blk_count <= `FLOP_DELAY aud_blk_count +1; // counts from 0 to 191 on tvalid =1

      ch1_sample_queue[ch1_wr_index] <= `FLOP_DELAY {parity_sample1,channel_status[191],userdata,validity,audio_sample_ch1,preamble_frame};
      ch2_sample_queue[ch2_wr_index] <= `FLOP_DELAY {parity_sample2,channel_status[191],userdata,validity,audio_sample_ch2,preamble_subframe};
      ch3_sample_queue[ch3_wr_index] <= `FLOP_DELAY {parity_sample3,channel_status[191],userdata,validity,audio_sample_ch3,preamble_frame};
      ch4_sample_queue[ch4_wr_index] <= `FLOP_DELAY {parity_sample4,channel_status[191],userdata,validity,audio_sample_ch4,preamble_subframe};
      ch5_sample_queue[ch5_wr_index] <= `FLOP_DELAY {parity_sample5,channel_status[191],userdata,validity,audio_sample_ch5,preamble_frame};
      ch6_sample_queue[ch6_wr_index] <= `FLOP_DELAY {parity_sample6,channel_status[191],userdata,validity,audio_sample_ch6,preamble_subframe};
      ch7_sample_queue[ch7_wr_index] <= `FLOP_DELAY {parity_sample7,channel_status[191],userdata,validity,audio_sample_ch7,preamble_frame};
      ch8_sample_queue[ch8_wr_index] <= `FLOP_DELAY {parity_sample8,channel_status[191],userdata,validity,audio_sample_ch8,preamble_subframe};
    end

    if(pulse_sync_axis_q[1]) begin
      ch_rd_index <= `FLOP_DELAY ch_rd_index + 1'b1; 
      axis_ch_handshake <= `FLOP_DELAY 9'b0_1111_1111;
    end else if(axis_tready) begin
      axis_ch_handshake <= `FLOP_DELAY {axis_ch_handshake[7:0],1'b0};
    end

    if(axis_tready && axis_ch_handshake[8]) begin
      i_axis_id_egress_q <= `FLOP_DELAY i_axis_id_egress_q + 1'b1;
      case(i_axis_id_egress_q)
        0:  begin axis_data_egress <= `FLOP_DELAY ch1_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[1]; end
        1:  begin axis_data_egress <= `FLOP_DELAY ch2_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[2]; end
        2:  begin axis_data_egress <= `FLOP_DELAY ch3_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[3]; end
        3:  begin axis_data_egress <= `FLOP_DELAY ch4_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[4]; end
        4:  begin axis_data_egress <= `FLOP_DELAY ch5_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[5]; end
        5:  begin axis_data_egress <= `FLOP_DELAY ch6_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[6]; end
        6:  begin axis_data_egress <= `FLOP_DELAY ch7_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[7]; end
        7:  begin axis_data_egress <= `FLOP_DELAY ch8_rd_data; axis_tvalid <= `FLOP_DELAY ch_en[8]; end
      endcase    
    end else begin
      axis_tvalid <= `FLOP_DELAY 1'b0;
    end

      ch_rd_index_d <= `FLOP_DELAY ch_rd_index; 
  end
end

always@(posedge axis_clk) begin
  i_axis_tvalid_q <= `FLOP_DELAY (axis_tready & axis_ch_handshake[8]);// for hard IP TVALID has to be high for 2 ch 0 and ch1 only (RJ)
  axis_id_egress <= `FLOP_DELAY i_axis_id_egress_q;
end

always@(posedge axis_clk) begin
  if(~axis_resetn || ~aud_start)begin
    ch1_rd_data <= `FLOP_DELAY 'h0;
    ch2_rd_data <= `FLOP_DELAY 'h0;
    ch3_rd_data <= `FLOP_DELAY 'h0;
    ch4_rd_data <= `FLOP_DELAY 'h0;
    ch5_rd_data <= `FLOP_DELAY 'h0;
    ch6_rd_data <= `FLOP_DELAY 'h0;
    ch7_rd_data <= `FLOP_DELAY 'h0;
    ch8_rd_data <= `FLOP_DELAY 'h0;
  end else begin 
    if(pulse_sync_axis_q[1]) begin
      ch1_rd_data <= `FLOP_DELAY ch1_sample_queue[ch_rd_index];
      ch2_rd_data <= `FLOP_DELAY ch2_sample_queue[ch_rd_index];
      ch3_rd_data <= `FLOP_DELAY ch3_sample_queue[ch_rd_index];
      ch4_rd_data <= `FLOP_DELAY ch4_sample_queue[ch_rd_index];
      ch5_rd_data <= `FLOP_DELAY ch5_sample_queue[ch_rd_index];
      ch6_rd_data <= `FLOP_DELAY ch6_sample_queue[ch_rd_index];
      ch7_rd_data <= `FLOP_DELAY ch7_sample_queue[ch_rd_index];
      ch8_rd_data <= `FLOP_DELAY ch8_sample_queue[ch_rd_index];
    end
  end
end


assign debug_port = {
                     //Diff_Ch1,                // [198:183]
                      
                     addr_cntr_ch1, //5
                     addr_cntr_ch2, //5
                     ping_pattern_ch2[0],               // [182]
                     ping_pattern_ch1[0],             // [181]
                     load_value,              // [180]
                     pulse_sync_axis,                   // [179]
                     gen_sample_ch1,          // [178]   
                     gen_sample_ch2,          // [177]   
                     gen_sample_ch3,          // [176]   
                     gen_sample_ch4,          // [175]   
                     gen_sample_ch5,          // [174]   
                     gen_sample_ch6,          // [173]   
                     &cntr_250ms_ch1,//gen_sample_ch7,          // [172]   
                     &cntr_250ms_ch2,//gen_sample_ch8,          // [171]   
                     aud_config_update_pedge, // [170]   
                     audio_sample_ch1[23:8],  // [169:154]
                     audio_sample_ch2[23:8],  // [153:138]
                     audio_sample_ch3[23:8],  // [137:122]
                     audio_sample_ch4[23:8],  // [121:106]
                     audio_sample_ch5[23:8],  // [105:90]
                     audio_sample_ch6[23:8],  // [89:74]
                     audio_sample_ch7[23:8],  // [73:58]
                     audio_sample_ch8[23:8],  // [57:42]
                     aud_sample_rate,         // [41:38] 
                     aud_channel_count,       // [37:34]
                     aud_pattern1,             // [33:32]
                     aud_period_ch1,          // [31:28]
                     aud_period_ch2,          // [27:24]
                     aud_period_ch3,          // [23:20]
                     aud_period_ch4,          // [19:16]
                     aud_period_ch5,          // [15:12]
                     aud_period_ch6,          // [11:8]
                     aud_period_ch7,          // [7:4]
                     aud_period_ch8           // [3:0]  
                    }; 
                     

endmodule


