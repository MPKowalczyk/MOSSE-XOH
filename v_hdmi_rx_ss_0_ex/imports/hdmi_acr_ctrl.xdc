
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
# the audio clock rate regenerator used in the HDMI Audio Clock Regeneration model.
#
# MODIFICATION HISTORY:
#
# Ver   Who Date         Changes
# ----- --- ----------   -----------------------------------------------
# 1.00  RHe 2014/12/09   First release
# 1.02  RHe 2015/04/14   Added timing exception for audio reset
# 1.03  RHe 2015/07/31   Added timing exception for tmds clock ratio indication
################################################################################

set_false_path -from [get_cells -hier -filter {name=~*HDMI_ACR_CTRL_AXI_INST/rEnab_ACR_reg}] \
               -to   [get_cells -hier -filter {name=~*aud_enab_acr_sync_reg[0]}]

set_false_path -from [get_cells -hier -filter {name=~*HDMI_ACR_CTRL_AXI_INST/rACR_Sel_reg}] \
               -to   [get_cells -hier -filter {name=~*aud_acr_sel_sync_reg[0]}]               
set_false_path -from [get_cells -hier -filter {name=~*HDMI_ACR_CTRL_AXI_INST/rTMDSClkRatio_reg}] \
               -to   [get_cells -hier -filter {name=~*aud_tmdsclkratio_sync_reg[0]}]
               
set_false_path -from [get_cells -hier -filter {name=~*PULSE_CLKCROSS_INST/rIn_Toggle_reg}] \
               -to   [get_cells -hier -filter {name=~*PULSE_CLKCROSS_INST/rOut_Sync_reg[0]}]

set_false_path -from [get_cells -hier -filter {name=~*HDMI_ACR_CTRL_AXI_INST/rAud_Reset_reg}] \
               -to   [get_cells -hier -filter {name=~*aud_rst_chain_reg[*]}]
               
# Clock crossing of the N value from the AXI clock to the Audio clock               
set_false_path -from [get_cells -hier -filter {name=~*NVAL_CLKCROSS_INST/rIn_Data_reg[*]}] \
               -to   [get_cells -hier -filter {name=~*NVAL_CLKCROSS_INST/rOut_Data_reg[*]}]

set_false_path -from [get_cells -hier -filter {name=~*NVAL_CLKCROSS_INST/rIn_DValid_reg}] \
               -to   [get_cells -hier -filter {name=~*NVAL_CLKCROSS_INST/rOut_DValid_Sync_reg[0]}]

set_false_path -from [get_cells -hier -filter {name=~*NVAL_CLKCROSS_INST/rOut_ACK_reg}] \
               -to   [get_cells -hier -filter {name=~*NVAL_CLKCROSS_INST/rIn_ACK_Sync_reg[0]}]
               
# Clock crossing of the CTS value from the HDMI clock to the AXI clock               
set_false_path -from [get_cells -hier -filter {name=~*CTS_CLKCROSS_ACLK_INST/rIn_Data_reg[*]}] \
               -to   [get_cells -hier -filter {name=~*CTS_CLKCROSS_ACLK_INST/rOut_Data_reg[*]}]

set_false_path -from [get_cells -hier -filter {name=~*CTS_CLKCROSS_ACLK_INST/rIn_DValid_reg}] \
               -to   [get_cells -hier -filter {name=~*CTS_CLKCROSS_ACLK_INST/rOut_DValid_Sync_reg[0]}]
  
set_false_path -from [get_cells -hier -filter {name=~*CTS_CLKCROSS_ACLK_INST/rOut_ACK_reg}] \
               -to   [get_cells -hier -filter {name=~*CTS_CLKCROSS_ACLK_INST/rIn_ACK_Sync_reg[0]}]  
               
# Clock crossing of the CTS value from the HDMI clock to the Audio clock               
set_false_path -from [get_cells -hier -filter {name=~*CTS_CLKCROSS_AUD_INST/rIn_Data_reg[*]}] \
               -to   [get_cells -hier -filter {name=~*CTS_CLKCROSS_AUD_INST/rOut_Data_reg[*]}]

set_false_path -from [get_cells -hier -filter {name=~*CTS_CLKCROSS_AUD_INST/rIn_DValid_reg}] \
               -to   [get_cells -hier -filter {name=~*CTS_CLKCROSS_AUD_INST/rOut_DValid_Sync_reg[0]}]

set_false_path -from [get_cells -hier -filter {name=~*CTS_CLKCROSS_AUD_INST/rOut_ACK_reg}] \
               -to   [get_cells -hier -filter {name=~*CTS_CLKCROSS_AUD_INST/rIn_ACK_Sync_reg[0]}]               
