
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
 * This file contains the register map of the audio generator.
 *
 * MODIFICATION HISTORY:
 *
 * Ver   Who Date         Changes
 * ----- --- ----------   -----------------------------------------------
 * 1.00  hf  2014/10/21   First release
 * 1.01  hf  2014/10/22   Changed channel status mapping
 * 1.07  RHe 2015/04/16   Added config update bit to the ctrl register
 *                        Added ramp pattern support.
 *                        Added support for dropping audio input data.
 *
 *****************************************************************************/

`timescale 1 ps / 1 ps

module aud_pat_gen_regs
  (
   // AXI4-Lite bus   
   input              axi_aclk,
   input              axi_aresetn,
   // - Write address
   input              axi_awvalid,
   output reg         axi_awready,
   input      [ 31:0] axi_awaddr,
   input      [  2:0] axi_awprot,         // Ignored
   // - Write data
   input              axi_wvalid,
   output reg         axi_wready,
   input      [ 31:0] axi_wdata,
   input      [  3:0] axi_wstrb,
   // - Write response
   output reg         axi_bvalid,
   input              axi_bready,
   output reg [  1:0] axi_bresp,
   // - Read address   
   input              axi_arvalid,
   output reg         axi_arready,
   input      [ 31:0] axi_araddr,
   input      [  2:0] axi_arprot,         // Ignored
   // - Read data/response
   output reg         axi_rvalid,
   input              axi_rready, 
   output reg [ 31:0] axi_rdata,
   output reg [  1:0] axi_rresp,

   // Register control outputs
   output reg         aud_reset,          // Reset audio generator
   output reg         aud_start,          // Audio starts after set to 1; will
                                          //   not stop until reset
   output reg         aud_config_update,  // Updata audio configuration (sample
                                          //   rate or number of channels)
   output reg [  3:0] aud_sample_rate,    // Audio sample rate. Actual audio
                                          //   clock must be 512 time the sample
                                          //   rate.
   output reg [  3:0] aud_channel_count,  // Number of active audio channels
   output reg [191:0] aud_channel_status, // Channel status to sent. Each bit
                                          //   will be sent twice. The upper
                                          //   bits [191:84] will be sent as 0.
   output reg [  1:0] aud_pattern1,       // Audio pattern on channel 1:
                                          //   00: silence, 10: ping
   output reg [  1:0] aud_pattern2,       // Audio pattern on channel 2
   output reg [  1:0] aud_pattern3,       // Audio pattern on channel 3
   output reg [  1:0] aud_pattern4,       // Audio pattern on channel 4
   output reg [  1:0] aud_pattern5,       // Audio pattern on channel 5
   output reg [  1:0] aud_pattern6,       // Audio pattern on channel 6
   output reg [  1:0] aud_pattern7,       // Audio pattern on channel 7
   output reg [  1:0] aud_pattern8,       // Audio pattern on channel 8
   output reg [  3:0] aud_period1,        // Not used
   output reg [  3:0] aud_period2,        // Not used
   output reg [  3:0] aud_period3,        // Not used
   output reg [  3:0] aud_period4,        // Not used
   output reg [  3:0] aud_period5,        // Not used
   output reg [  3:0] aud_period6,        // Not used
   output reg [  3:0] aud_period7,        // Not used
   output reg [  3:0] aud_period8,        // Not used
   output reg [ 23:0] offset_addr_cntr,    // Number of audio samples in 250ms
   output reg         aud_drop
   );

  // AXI4 response encoding
  localparam cAXI4_RESP_OKAY   = 2'b00;
  localparam cAXI4_RESP_EXOKAY = 2'b01;
  localparam cAXI4_RESP_SLVERR = 2'b10;
  localparam cAXI4_RESP_DECERR = 2'b11;

  
  localparam cAUD_PAT_SILENCE  = 2'b00;
  localparam cAUD_PAT_PING     = 2'b10;
  
  localparam cAUD_RATE_32K     = 4'h0;
  localparam cAUD_RATE_44K1    = 4'h1;
  localparam cAUD_RATE_48K     = 4'h2;
  localparam cAUD_RATE_88K2    = 4'h3;
  localparam cAUD_RATE_96K     = 4'h4;
  localparam cAUD_RATE_176K4   = 4'h5;
  localparam cAUD_RATE_192K    = 4'h6;
  localparam cAUD_RATE_32KDUP  = 4'h7;

  localparam [23:0] cOFFSET_CNTR [0:7] = '{
                                           24'd08000, //  32k
                                           24'd11025, //  44k1
                                           24'd12000, //  48k
                                           24'd22050, //  88k2
                                           24'd24000, //  96k
                                           24'd44100, // 176k4
                                           24'd48000, // 192k
                                           24'd08000  //  32k (duplicate)
                                           };
                               
  localparam cADDR_AUD_CONTROL = 6'b0000_00; // 00
  localparam cADDR_AUD_CONFIG  = 6'b0000_01; // 04
  localparam cADDR_CH1_CONTROL = 6'b0001_00; // 10
  localparam cADDR_CH2_CONTROL = 6'b0010_00; // 20
  localparam cADDR_CH3_CONTROL = 6'b0011_00; // 30
  localparam cADDR_CH4_CONTROL = 6'b0100_00; // 40
  localparam cADDR_CH5_CONTROL = 6'b0101_00; // 50
  localparam cADDR_CH6_CONTROL = 6'b0110_00; // 60
  localparam cADDR_CH7_CONTROL = 6'b0111_00; // 70
  localparam cADDR_CH8_CONTROL = 6'b1000_00; // 80
  localparam cADDR_CHANSTAT0   = 6'b1010_00; // A0
  localparam cADDR_CHANSTAT1   = 6'b1010_01; // A4
  localparam cADDR_CHANSTAT2   = 6'b1010_10; // A8
  localparam cADDR_CHANSTAT3   = 6'b1010_11; // AC
  localparam cADDR_CHANSTAT4   = 6'b1011_00; // B0
  localparam cADDR_CHANSTAT5   = 6'b1011_01; // B4
  
  
  // State machines
  typedef enum { sWrIdle,
                 sWrAddrValid,
                 sWrResp,
                 sWrRespValid
               } tStmAxi4LiteWrite;
  tStmAxi4LiteWrite stmAxi4LiteWrite;
  reg [7:0]    rawaddr;

  typedef enum { sRdIdle,
                 sRdAddrValid,
                 sRdDataValid
               } tStmAxi4LiteRead;
  tStmAxi4LiteRead stmAxi4LiteRead;
  reg [7:0]    raraddr;

  always @(posedge axi_aclk)
    begin : regwrites
      if (axi_aresetn == 1'b0)
        begin
          axi_awready              <=   1'b0;
          axi_wready               <=   1'b0;
          axi_bvalid               <=   1'b0;
          axi_bresp                <= cAXI4_RESP_OKAY;
          stmAxi4LiteWrite         <= sWrIdle;
          rawaddr                  <=   8'b0;
          aud_reset                <=   1'b1;
          aud_start                <=   1'b0;
          aud_drop                 <=   1'b0;
          aud_config_update        <=   1'b0;
          aud_sample_rate          <= cAUD_RATE_32K;
          aud_channel_count        <=   4'b0;
          aud_channel_status       <= 191'b0;
          aud_pattern1             <= cAUD_PAT_SILENCE;
          aud_pattern2             <= cAUD_PAT_SILENCE;
          aud_pattern3             <= cAUD_PAT_SILENCE;
          aud_pattern4             <= cAUD_PAT_SILENCE;
          aud_pattern5             <= cAUD_PAT_SILENCE;
          aud_pattern6             <= cAUD_PAT_SILENCE;
          aud_pattern7             <= cAUD_PAT_SILENCE;
          aud_pattern8             <= cAUD_PAT_SILENCE;
          aud_period1              <=   4'b0;
          aud_period2              <=   4'b0;
          aud_period3              <=   4'b0;
          aud_period4              <=   4'b0;
          aud_period5              <=   4'b0;
          aud_period6              <=   4'b0;
          aud_period7              <=   4'b0;
          aud_period8              <=   4'b0;
          offset_addr_cntr         <= cOFFSET_CNTR[cAUD_RATE_32K];
        end // if (axi_aresetn == 1'b0)
      else
        begin
          axi_awready                           <=  1'b0;
          axi_wready                            <=  1'b0;
          axi_bvalid                            <=  1'b0;
          
          case (stmAxi4LiteWrite)
            sWrIdle      :
              begin
                // Deassert reset (auto clear of register write, 
                // at least 3 clock cycles high)
                aud_reset                       <=  1'b0;
                // Deassert configuration update (auto clear of register write, 
                // at least 3 clock cycles high)
                aud_config_update               <=  1'b0;
                if (axi_awvalid == 1'b1)
                  begin
                    axi_awready                 <=  1'b1;
                    rawaddr                     <= axi_awaddr;
                    stmAxi4LiteWrite            <= sWrAddrValid;
                  end
              end // case: sWrIdle
            
            sWrAddrValid :
              begin
                axi_bresp                       <= cAXI4_RESP_OKAY;
                if (axi_wvalid == 1'b1)
                  begin
                    axi_wready                  <=  1'b1;
                    stmAxi4LiteWrite            <= sWrResp;
                    case (rawaddr[7:2])
                      cADDR_AUD_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_reset         <= axi_wdata[0]; // auto clear
                              aud_start         <= axi_wdata[1];
                              aud_config_update <= axi_wdata[2]; // auto clear
                              aud_drop          <= axi_wdata[3];
                            end
                        end
                      cADDR_AUD_CONFIG  :
                        begin
                          aud_config_update     <= 1'b1;  // Pulse; auto clear
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_sample_rate   <= axi_wdata[3:0];
                              offset_addr_cntr  <= cOFFSET_CNTR[axi_wdata[2:0]];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_channel_count <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH1_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern1      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period1       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH2_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern2      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period2       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH3_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern3      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period3       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH4_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern4      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period4       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH5_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern5      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period5       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH6_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern6      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period6       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH7_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern7      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period7       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CH8_CONTROL :
                        begin
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_pattern8      <= axi_wdata[1:0];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_period8       <= axi_wdata[11:8];
                            end
                        end
                      cADDR_CHANSTAT0   :
                        begin
                          if (axi_wstrb[3] == 1'b1)
                            begin
                              aud_channel_status[191:184] <= axi_wdata[31:24];
                            end
                          if (axi_wstrb[2] == 1'b1)
                            begin
                              aud_channel_status[183:176] <= axi_wdata[23:16];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_channel_status[175:168] <= axi_wdata[15: 8];
                            end
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_channel_status[167:160] <= axi_wdata[ 7: 0];
                            end
                        end
                      cADDR_CHANSTAT1   :
                        begin
                          if (axi_wstrb[3] == 1'b1)
                            begin
                              aud_channel_status[159:152] <= axi_wdata[31:24];
                            end
                          if (axi_wstrb[2] == 1'b1)
                            begin
                              aud_channel_status[151:144] <= axi_wdata[23:16];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_channel_status[143:136] <= axi_wdata[15: 8];
                            end
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_channel_status[135:128] <= axi_wdata[ 7: 0];
                            end
                        end
                      cADDR_CHANSTAT2   :
                        begin
                          if (axi_wstrb[3] == 1'b1)
                            begin
                              aud_channel_status[127:120] <= axi_wdata[31:24];
                            end
                          if (axi_wstrb[2] == 1'b1)
                            begin
                              aud_channel_status[119:112] <= axi_wdata[23:16];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_channel_status[111:104] <= axi_wdata[15: 8];
                            end
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_channel_status[103: 96] <= axi_wdata[ 7: 0];
                            end
                        end
                      cADDR_CHANSTAT3   :
                        begin
                          if (axi_wstrb[3] == 1'b1)
                            begin
                              aud_channel_status[ 95: 88] <= axi_wdata[31:24];
                            end
                          if (axi_wstrb[2] == 1'b1)
                            begin
                              aud_channel_status[ 87: 80] <= axi_wdata[23:16];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_channel_status[ 79: 72] <= axi_wdata[15: 8];
                            end
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_channel_status[ 71: 64] <= axi_wdata[ 7: 0];
                            end
                        end
                      cADDR_CHANSTAT4   :
                        begin
                          if (axi_wstrb[3] == 1'b1)
                            begin
                              aud_channel_status[ 63: 56] <= axi_wdata[31:24];
                            end
                          if (axi_wstrb[2] == 1'b1)
                            begin
                              aud_channel_status[ 55: 48] <= axi_wdata[23:16];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_channel_status[ 47: 40] <= axi_wdata[15: 8];
                            end
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_channel_status[ 39: 32] <= axi_wdata[ 7: 0];
                            end
                        end
                      cADDR_CHANSTAT5   :
                        begin
                          if (axi_wstrb[3] == 1'b1)
                            begin
                              aud_channel_status[ 31: 24] <= axi_wdata[31:24];
                            end
                          if (axi_wstrb[2] == 1'b1)
                            begin
                              aud_channel_status[ 23: 16] <= axi_wdata[23:16];
                            end
                          if (axi_wstrb[1] == 1'b1)
                            begin
                              aud_channel_status[ 15:  8] <= axi_wdata[15: 8];
                            end
                          if (axi_wstrb[0] == 1'b1)
                            begin
                              aud_channel_status[  7:  0] <= axi_wdata[ 7: 0];
                            end
                        end
                      default           :
                        begin
                          // Don't send decode error for illegal registers. The
                          // software debugger may crash when it has a memory
                          // window open on the register map.
                          //axi_bresp             <= cAXI4_RESP_SLVERR;
                        end
                    endcase; // case (rawaddr)
                  end // if (axi_wvalid = '1')
              end // case: sWrAddrValid
            
            sWrResp      :
              begin
                axi_bvalid                      <=  1'b1;
                stmAxi4LiteWrite                <= sWrRespValid;
              end
            
            sWrRespValid :
              begin
                axi_bvalid                      <=  1'b1;
                if (axi_bready == 1'b1)
                  begin
                    axi_bvalid                  <=  1'b0;
                    stmAxi4LiteWrite            <= sWrIdle;
                  end
              end

            default      :
              // Unreachable; just present to remove a warning in Vivado
              stmAxi4LiteWrite                  <= sWrIdle;
          endcase // case (stmAxi4LiteWrite)
        end // else: !if(axi_aresetn == 1'b0)
    end // block: regwrites

  
  always @(posedge axi_aclk)
    begin : regreads
      if (axi_aresetn == 1'b0)
        begin
          axi_arready                           <=  1'b0;
          axi_rvalid                            <=  1'b0;
          axi_rdata                             <= 32'b0;
          axi_rresp                             <= cAXI4_RESP_OKAY;
          stmAxi4LiteRead                       <= sRdIdle;
          raraddr                               <=  8'b0;
        end
      else
        begin
          axi_arready                           <=  1'b0;
          axi_rvalid                            <=  1'b0;

          case (stmAxi4LiteRead)
            sRdIdle      :
              if (axi_arvalid == 1'b1)
                begin
                  axi_arready                   <=  1'b1;
                  raraddr                       <= axi_araddr;
                  stmAxi4LiteRead               <= sRdAddrValid;
                end

            sRdAddrValid :
              begin
                axi_rdata                       <= 32'b0;
                axi_rresp                       <= cAXI4_RESP_OKAY;
                axi_rvalid                      <=  1'b1;
                stmAxi4LiteRead                 <= sRdDataValid;
                case (raraddr[7:2])
                  cADDR_AUD_CONTROL :
                    begin
                      axi_rdata[    0]          <= aud_reset;
                      axi_rdata[    1]          <= aud_start;
                      axi_rdata[    3]          <= aud_drop;
                    end
                  cADDR_AUD_CONFIG  :
                    begin
                      axi_rdata[ 3: 0]          <= aud_sample_rate;
                      axi_rdata[11: 8]          <= aud_channel_count;
                    end
                  cADDR_CH1_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern1;
                      axi_rdata[11: 8]          <= aud_period1;
                    end
                  cADDR_CH2_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern2;
                      axi_rdata[11: 8]          <= aud_period2;
                    end
                  cADDR_CH3_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern3;
                      axi_rdata[11: 8]          <= aud_period3;
                    end
                  cADDR_CH4_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern4;
                      axi_rdata[11: 8]          <= aud_period4;
                    end
                  cADDR_CH5_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern5;
                      axi_rdata[11: 8]          <= aud_period5;
                    end
                  cADDR_CH6_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern6;
                      axi_rdata[11: 8]          <= aud_period6;
                    end
                  cADDR_CH7_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern7;
                      axi_rdata[11: 8]          <= aud_period7;
                    end
                  cADDR_CH8_CONTROL :
                    begin
                      axi_rdata[ 1: 0]          <= aud_pattern8;
                      axi_rdata[11: 8]          <= aud_period8;
                    end
                  cADDR_CHANSTAT0   :
                    begin
                      axi_rdata[31: 0]          <= aud_channel_status[191:160];
                    end
                  cADDR_CHANSTAT1   :
                    begin
                      axi_rdata[31: 0]          <= aud_channel_status[159:128];
                    end
                  cADDR_CHANSTAT2   :
                    begin
                      axi_rdata[31: 0]          <= aud_channel_status[127: 96];
                    end
                  cADDR_CHANSTAT3   :
                    begin
                      axi_rdata[31: 0]          <= aud_channel_status[ 95: 64];
                    end
                  cADDR_CHANSTAT4   :
                    begin
                      axi_rdata[31: 0]          <= aud_channel_status[ 63: 32];
                    end
                  cADDR_CHANSTAT5   :
                    begin
                      axi_rdata[31: 0]          <= aud_channel_status[ 31:  0];
                    end
                  default           :
                    begin
                      // Don't send decode error for illegal registers. The
                      // software debugger may crash when it has a memory
                      // window open on the register map.
                      //axi_rresp                 <= cAXI4_RESP_SLVERR;
                    end
                endcase // case (raraddr)
              end // case: sRdAddrValid

            sRdDataValid :
              begin
                axi_rvalid                      <=  1'b1;
                if (axi_rready == 1'b1)
                  begin
                    axi_rvalid                  <=  1'b0;
                    stmAxi4LiteRead             <= sRdIdle;
                  end
              end

            default      :
              // Unreachable; just present to remove a warning in Vivado
              stmAxi4LiteRead                   <= sRdIdle;
          endcase // case (stmAxi4LiteRead)
        end // else: !if(axi_aresetn == 1'b0)
    end // block: regreads
  
  
endmodule // aud_pat_gen_regs
