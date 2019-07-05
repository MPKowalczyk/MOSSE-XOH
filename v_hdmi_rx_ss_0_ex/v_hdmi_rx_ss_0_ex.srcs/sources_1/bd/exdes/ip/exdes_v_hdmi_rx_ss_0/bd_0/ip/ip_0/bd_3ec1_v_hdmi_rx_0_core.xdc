 

###
# FIFO DPRAM
###
set_max_delay 15 -from [get_pins -of [get_cells -hier -filter {NAME=~*aclk_dpram_reg*}] -filter {REF_PIN_NAME==CLK}] -to [get_pins -of [get_cells -hier -filter {NAME=~*bclk_dout_reg*}] -filter {REF_PIN_NAME==D}] -datapath_only

###
## Groups
###
#group_path -to [get_pins -hier -filter name=~*/CH0_INST/VID_INST/gen_dcs_reg.vclk_dcs_8bpc_reg_reg*/D] -name group_dcs8
#group_path -to [get_pins -hier -filter name=~*/CH0_INST/VID_INST/gen_dcs_reg.vclk_dcs_10bpc_reg_reg*/D] -name group_dcs10
#group_path -to [get_pins -hier -filter name=~*/CH0_INST/VID_INST/gen_dcs_reg.vclk_dcs_12bpc_reg_reg*/D] -name group_dcs12
#group_path -to [get_pins -hier -filter name=~*/CH0_INST/VID_INST/gen_dcs_reg.vclk_dcs_16bpc_reg_reg*/D] -name group_dcs16

##
# False paths
##

# PIO
set_false_path -from [get_cells -hierarchical -filter name=~*/PIO_INST/clk_pio_out_reg*]

# AUX
set_false_path -from [get_cells -hierarchical -filter name=~*/AUX_INST/lclk_avi_cs_reg*]

# EVAL Lic Timing Violation false path
set_false_path -to [get_cells -hierarchical -filter name=~*/VRST_INST/XPM_RST_INST/syncstages_ff_reg*]

#only when C_GT_LANES=2 and HDCP is enabled
