
#
# Copyright (c) 2014 Xilinx, Inc.  All rights reserved.
#
# Xilinx, Inc.
# XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
# COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
# ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
# STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
# IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
# FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
# XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
# THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
# ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
# FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS FOR A PARTICULAR PURPOSE.
#
#
# This file contains the clock domain crossing false paths for the 
# audio generator.
#
# MODIFICATION HISTORY:
#
# Ver   Who Date         Changes
# ----- --- ----------   -----------------------------------------------
# 1.00  hf  2014/10/21   First release
# 1.02  RHe 2014/12/08   Updated constraints for the added clock domain
#                        crossing logic.
# 1.04  RHe 2015/01/15   Added missing constraints AXI lite to AXI streaming
# 1.07  RHe 2015/04/16   Added timing exception for audio drop signal
################################################################################

################################################################################
# From the AXI lite clock to the Audio clock
################################################################################
set_false_path -from [get_cells -hier -filter {name=~*AUD_RST_CLK_CROSS_INST/rIn_Toggle_reg}] \
               -to   [get_cells -hier -filter {name=~*AUD_RST_CLK_CROSS_INST/rOut_Sync_reg[0]}]

set_false_path -from [get_cells -hier -filter {name=~*AUD_CFGUPD_CLK_CROSS_INST/rIn_Toggle_reg}] \
               -to   [get_cells -hier -filter {name=~*AUD_CFGUPD_CLK_CROSS_INST/rOut_Sync_reg[0]}]
               
set_false_path -from [get_cells -hier -filter {name=~*aud_pat_gen_regs_inst/aud_start_reg}] \
               -to   [get_cells -hier -filter {name=~*aud_start_sync_reg[0]}]
     
set_false_path -from [get_cells -hier -filter {name=~*aud_pat_gen_regs_inst/aud_drop_reg}] \
               -to   [get_cells -hier -filter {name=~*axis_drop_sync_reg[0]}]
     
################################################################################                                
# From the Audio clock to the AXI streaming clock
################################################################################
# set_false_path -from [get_pins {dport_aud_pat_gen_inst/pulse_toggle_reg/C}] \
#                -to   [get_pins {dport_aud_pat_gen_inst/pulse_toggle_q_reg[0]/D}]
# 
# set_false_path -from [get_pins {dport_aud_pat_gen_inst/aud_config_update_toggle_reg/C}] \
#                -to   [get_pins {dport_aud_pat_gen_inst/aud_config_update_q_reg[0]/D}]

################################################################################               
# From the AXI lite clock to the AXI streaming clock
################################################################################
set_false_path -from [get_cells -hier -filter {name=~*aud_pat_gen_regs_inst/aud_start_reg}] \
               -to   [get_cells -hier -filter {name=~*axis_start_sync_reg[0]}]

set_false_path -from [get_cells -hier -filter {name=~*aud_pat_gen_regs_inst/aud_sample_rate_reg[*]}] \
               -to   [get_cells -hier -filter {name=~*dport_aud_pat_gen_inst/sine_pattern_reg[*]}]               
 
set_false_path -from [get_cells -hier -filter {name=~*aud_pat_gen_regs_inst/aud_sample_rate_reg[*]}] \
               -to   [get_cells -hier -filter {name=~*dport_aud_pat_gen_inst/ping_sine_sample_ch_reg[*]}]               
               
#set_false_path -from [get_cells {aud_pat_gen_regs_inst/aud_pattern*_reg[*] \
#                                aud_pat_gen_regs_inst/aud_period*_reg[*]}] \
#               -to   [get_cells {dport_aud_pat_gen_inst/audio_sample*_reg[*]}]
#
#set_false_path -from [get_cells {aud_pat_gen_regs_inst/aud_channel_status_reg[*]}] \
#               -to   [get_cells {dport_aud_pat_gen_inst/aud_spdif_channel_status_latched_reg[*]}]
#
#set_false_path -from [get_pins {aud_pat_gen_regs_inst/aud_channel_count_reg[*]/C}] \
#               -to   [get_pins {dport_aud_pat_gen_inst/ch_en_reg[*]/D}]
#
#set_false_path -from [get_pins {aud_pat_gen_regs_inst/offset_addr_cntr_reg[*]/C}] \
#               -to   [get_pins {dport_aud_pat_gen_inst/ping_pattern_ch*_reg[*]/CE \
#                                dport_aud_pat_gen_inst/cntr_250ms_ch*_reg[*]/R}]

