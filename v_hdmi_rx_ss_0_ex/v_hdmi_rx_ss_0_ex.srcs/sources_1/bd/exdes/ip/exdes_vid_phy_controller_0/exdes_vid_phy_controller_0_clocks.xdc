
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# Xilinx, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) Xilinx shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the
# possibility of the same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of Xilinx products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.



 #xpm_cdc sync paths
# set_false_path -to [get_pins -hier {*syncstages_ff_reg[0]/D}]
# set_false_path -to [get_cells -hierarchical *syncstages_ff_reg[0]*]
# set_false_path -to [get_pins -hierarchical {*syncstages_ff_reg[*]/CLR}]
set_false_path -to [get_pins -hierarchical {*arststages_ff_reg[*]/CLR || *arststages_ff_reg[*]/PRE}]

set_false_path -to [get_cells -hierarchical -filter {NAME =~ *gt_usrclk_source_inst/*gtwiz_userclk_tx_active_*_reg}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *gt_usrclk_source_inst/*GT0_TX_MMCM_CLKOUT1_ODDR_INST/D*}]
set_false_path -to [get_cells -hierarchical -filter {NAME =~ *gt_usrclk_source_inst/*gtwiz_userclk_rx_active_*_reg}]
set_false_path -to [get_pins -hierarchical -filter {NAME =~ *gt_usrclk_source_inst/*GT0_RX_MMCM_CLKOUT1_ODDR_INST/D*}]

#set_false_path -from [get_cells -hierarchical -filter {NAME =~*DRP_Config_Reg_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*DRPDI_reg[*]}]
#set_false_path -from [get_cells -hierarchical -filter {NAME =~*DRP_Config_Reg_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*DRPADDR_reg[*]}]
#set_false_path -from [get_cells -hierarchical -filter {NAME =~*DRP_Config_Reg_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*DRPEN_reg}]
#set_false_path -from [get_cells -hierarchical -filter {NAME =~*DRP_Config_Reg_reg[*]}] -to [get_cells -hierarchical -filter {NAME =~*DRPWE_reg}]


set_false_path -from [get_cells -hierarchical -filter {name=~*/clock_detector_inst/clk_tx_freq_rst_reg && IS_SEQUENTIAL}]
set_false_path -from [get_cells -hierarchical -filter {name=~*/clock_detector_inst/clk_rx_freq_rst_reg && IS_SEQUENTIAL}]

#NI-DRU

#GTHE4_COMMOM DRP Holdtime correction
set_min_delay 0.300 \
     -from [get_pins -hierarchical -filter {name=~*/drp_control_b0gtcommon_inst/DRPADDR_reg[*]/C}] \
     -to [get_pins -hierarchical -filter {name=~*/gt_common_inst/common_inst/gthe4_common_gen.GTHE4_COMMON_PRIM_INST/DRPADDR[*]}]
set_min_delay 0.300 \
     -from [get_pins -hierarchical -filter {name=~*/drp_control_b0gtcommon_inst/DRPDI_reg[*]/C}] \
     -to [get_pins -hierarchical -filter {name=~*/gt_common_inst/common_inst/gthe4_common_gen.GTHE4_COMMON_PRIM_INST/DRPDI[*]}]
set_min_delay 0.300 \
     -from [get_pins -hierarchical -filter {name=~*/drp_control_b0gtcommon_inst/DRPEN_reg/C}] \
     -to [get_pins -hierarchical -filter {name=~*/gt_common_inst/common_inst/gthe4_common_gen.GTHE4_COMMON_PRIM_INST/DRPEN}]
set_min_delay 0.300 \
     -from [get_pins -hierarchical -filter {name=~*/drp_control_b0gtcommon_inst/DRPWE_reg/C}] \
     -to [get_pins -hierarchical -filter {name=~*/gt_common_inst/common_inst/gthe4_common_gen.GTHE4_COMMON_PRIM_INST/DRPWE}]
