
#####
## Constraints for ZC706 FMC HDMI 2.0
## Version 1.0
#####


#####
## Pins
#####

# HDMI RX
#FMC_HPC_GBTCLK0_M2C_C_P
set_property PACKAGE_PIN AD10 [get_ports HDMI_RX_CLK_P_IN]
#SI5324 on board
set_property PACKAGE_PIN AC8 [get_ports DRU_CLK_P_IN]
#FMC_HPC_DP0_M2C_P
set_property PACKAGE_PIN AH10 [get_ports {HDMI_RX_DAT_P_IN[0]}]
#FMC_HPC_DP1_M2C_P
set_property PACKAGE_PIN AJ8 [get_ports {HDMI_RX_DAT_P_IN[1]}]
#FMC_HPC_DP2_M2C_P
set_property PACKAGE_PIN AG8 [get_ports {HDMI_RX_DAT_P_IN[2]}]

#FMC_HPC_LA20_N
set_property PACKAGE_PIN V26 [get_ports RX_HPD_OUT]
set_property IOSTANDARD LVCMOS25 [get_ports RX_HPD_OUT]

#FMC_HPC_LA16_P
set_property PACKAGE_PIN AA24 [get_ports RX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports RX_DDC_OUT_scl_io]
#FMC_HPC_LA16_N
set_property PACKAGE_PIN AB24 [get_ports RX_DDC_OUT_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports RX_DDC_OUT_sda_io]

#FMC_HPC_LA00_CC_P
set_property PACKAGE_PIN AF20 [get_ports RX_REFCLK_P_OUT]
set_property IOSTANDARD LVDS_25 [get_ports RX_REFCLK_P_OUT]

#FMC_HPC_LA03_P
set_property PACKAGE_PIN AH19 [get_ports RX_DET_IN]
set_property IOSTANDARD LVCMOS25 [get_ports RX_DET_IN]

# HDMI TX
#FMC_HPC_GBTCLK1_M2C_C_P
set_property PACKAGE_PIN AA8 [get_ports TX_REFCLK_P_IN]

#FMC_HPC_LA27_P
set_property PACKAGE_PIN V28 [get_ports HDMI_TX_CLK_P_OUT]
set_property IOSTANDARD LVDS_25 [get_ports HDMI_TX_CLK_P_OUT]
#FMC_HPC_DP0_C2M_P
set_property PACKAGE_PIN AK10 [get_ports {HDMI_TX_DAT_P_OUT[0]}]
#FMC_HPC_DP1_C2M_P
set_property PACKAGE_PIN AK6 [get_ports {HDMI_TX_DAT_P_OUT[1]}]
#FMC_HPC_DP2_C2M_P
set_property PACKAGE_PIN AJ4 [get_ports {HDMI_TX_DAT_P_OUT[2]}]

#FMC_HPC_LA31_N
set_property PACKAGE_PIN P29 [get_ports TX_HPD_IN]
set_property IOSTANDARD LVCMOS25 [get_ports TX_HPD_IN]

#FMC_HPC_LA29_P
set_property PACKAGE_PIN R25 [get_ports TX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports TX_DDC_OUT_scl_io]
#FMC_HPC_LA29_N
set_property PACKAGE_PIN R26 [get_ports TX_DDC_OUT_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports TX_DDC_OUT_sda_io]

# I2C
#FMC_HPC_LA06_P
set_property PACKAGE_PIN AG22 [get_ports fmch_iic_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports fmch_iic_scl_io]
#FMC_HPC_LA06_N
set_property PACKAGE_PIN AH22 [get_ports fmch_iic_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports fmch_iic_sda_io]

# Misc
#GPIO_LED_0_LS
set_property PACKAGE_PIN W21 [get_ports LED0]
#Only LED 0 is used at the moment
##GPIO_LED_1_
#set_property PACKAGE_PIN G2 [get_ports LED1]
##GPIO_LED_2_
#set_property PACKAGE_PIN Y21 [get_ports LED2]



set_property IOSTANDARD LVCMOS25 [get_ports LED0]
#set_property IOSTANDARD LVCMOS15 [get_ports LED1]
#set_property IOSTANDARD LVCMOS25 [get_ports LED2]


#FMC_HPC_LA10_P
set_property PACKAGE_PIN AG24 [get_ports {SI5324_RST_OUT[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SI5324_RST_OUT[0]}]

#FMC_HPC_LA02_N
set_property PACKAGE_PIN AK18 [get_ports SI5324_LOL_IN]
set_property IOSTANDARD LVCMOS25 [get_ports SI5324_LOL_IN]

#FMC_HPC_LA26_P
set_property PACKAGE_PIN R28 [get_ports {TX_EN_OUT[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TX_EN_OUT[0]}]

#FMC_HPC_LA18_CC_P
set_property PACKAGE_PIN W25 [get_ports {TX_CLKSEL_OUT[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {TX_CLKSEL_OUT[0]}]

#FMC_HPC_LA22_P
set_property PACKAGE_PIN V27 [get_ports {RX_I2C_EN_N_OUT[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {RX_I2C_EN_N_OUT[0]}]

#ON_BOARD IIC
set_property PACKAGE_PIN AJ14 [get_ports iic_main_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports iic_main_scl_io]
set_property PACKAGE_PIN AJ18 [get_ports iic_main_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports iic_main_sda_io]
set_property PACKAGE_PIN W23 [get_ports ONBRD_SI5324_RST_OUT]
set_property IOSTANDARD LVCMOS25 [get_ports ONBRD_SI5324_RST_OUT ]

#####
## End
#####

