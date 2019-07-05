 

###
# HDMI TX constraints
###

###
# FIFO DPRAM
###
set_max_delay 15 -from [get_pins -of [get_cells -hier -filter {NAME=~*aclk_dpram_reg*}] -filter {REF_PIN_NAME==CLK}] -to [get_pins -of [get_cells -hier -filter {NAME=~*bclk_dout_reg*}] -filter {REF_PIN_NAME==D}] -datapath_only

## 
# False paths
##

# PIO
set_false_path -from [get_cells -hierarchical -filter name=~*/PIO_INST/clk_pio_out_reg*]

#FOR EVAL LIC TIMING VIOLATION
set_false_path -to [get_cells  -hierarchical -filter name=~*/VRST_INST/XPM_RST_INST/syncstages_ff_reg*]

#only when C_GT_LANES=2 and HDCP is enabled
