#####
## Constraints for KCU105 FMC HDMI 2.0
## Version 1.0
#####


#####
## Pins
#####

#set_property PACKAGE_PIN AL8 [get_ports sys_diff_clock_clk_p]
#set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_diff_clock_clk_p]

#set_property PACKAGE_PIN AF15 [get_ports reset]
#set_property IOSTANDARD LVCMOS33 [get_ports reset]
# HDMI RX
set_property PACKAGE_PIN N27 [get_ports HDMI_RX_CLK_P_IN]; #revB
#set_property PACKAGE_PIN J27 [get_ports HDMI_RX_CLK_P_IN]
#SGMIICLK_Q0_P #PCIE_CLK_QO_P
set_property PACKAGE_PIN L27 [get_ports DRU_CLK_IN_clk_p]
#set_property PACKAGE_PIN E4 [get_ports {HDMI_RX_DAT_P_IN[0]}]
#set_property PACKAGE_PIN D6 [get_ports {HDMI_RX_DAT_P_IN[1]}]   
#set_property PACKAGE_PIN B6 [get_ports {HDMI_RX_DAT_P_IN[2]}]   

set_property PACKAGE_PIN E14 [get_ports RX_HPD_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports RX_HPD_OUT]

set_property IOSTANDARD LVCMOS33 [get_ports RX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports RX_DDC_OUT_sda_io]
set_property PACKAGE_PIN E15 [get_ports RX_DDC_OUT_scl_io]
set_property PACKAGE_PIN A15 [get_ports RX_DDC_OUT_sda_io]

set_property IOSTANDARD LVDS [get_ports RX_REFCLK_P_OUT]
# Rev E and Rev 1.0
set_property PACKAGE_PIN AG5 [get_ports RX_REFCLK_P_OUT]
# Rev B/C/D
#set_property PACKAGE_PIN Y8 [get_ports RX_REFCLK_P_OUT]

set_property PACKAGE_PIN D14 [get_ports RX_DET_IN]              
set_property IOSTANDARD LVCMOS33 [get_ports RX_DET_IN]


# HDMI TX
set_property PACKAGE_PIN R27 [get_ports TX_REFCLK_P_IN]

set_property IOSTANDARD LVDS [get_ports HDMI_TX_CLK_P_OUT]
set_property PACKAGE_PIN AF6 [get_ports HDMI_TX_CLK_P_OUT]

set_property IOSTANDARD LVCMOS33 [get_ports TX_HPD_IN]
set_property PACKAGE_PIN B16 [get_ports TX_HPD_IN]

set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_sda_io]
set_property PACKAGE_PIN C16 [get_ports TX_DDC_OUT_scl_io]       
set_property PACKAGE_PIN D16 [get_ports TX_DDC_OUT_sda_io]       


## UART
#USB_TX
#set_property PACKAGE_PIN F13 [get_ports rs232_uart_txd]
#set_property IOSTANDARD LVCMOS33 [get_ports rs232_uart_txd]
#USB_RX
#set_property PACKAGE_PIN E13 [get_ports rs232_uart_rxd]
#set_property IOSTANDARD LVCMOS33 [get_ports rs232_uart_rxd]


# I2C
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_scl_io]
set_property PACKAGE_PIN F15 [get_ports fmch_iic_scl_io]          
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_sda_io]
set_property PACKAGE_PIN F16 [get_ports fmch_iic_sda_io]          


# Misc
#GPIO_LED_0_LS
set_property PACKAGE_PIN AG14 [get_ports {LED0}]           
#Only LED 0 is used at the moment
##GPIO_LED_1_LS
#set_property PACKAGE_PIN AF13 [get_ports {LED1}]
##GPIO_LED_2_LS
#set_property PACKAGE_PIN AE13 [get_ports {LED2}]
##GPIO_LED_3_LS
#set_property PACKAGE_PIN AJ14 [get_ports {LED3}]           
##GPIO_LED_4_LS
#set_property PACKAGE_PIN AJ15 [get_ports {LED4}]           
##GPIO_LED_5_LS
#set_property PACKAGE_PIN AH13 [get_ports {LED5}]           
##GPIO_LED_6_LS
#set_property PACKAGE_PIN AH14 [get_ports {LED6}]           
##GPIO_LED_7_LS
#set_property PACKAGE_PIN AL12 [get_ports {LED7}]           
##USER_SMA_GPIO_P
#set_property PACKAGE_PIN H27 [get_ports {SMA0}]           
##USER_SMA_GPIO_N
#set_property PACKAGE_PIN G27 [get_ports {SMA1}]           
##USER_SMA_CLOCK_P
#set_property PACKAGE_PIN D23 [get_ports {SMA2}]           
##USER_SMA_CLOCK_N
#set_property PACKAGE_PIN C23 [get_ports {SMA3}]           

set_property IOSTANDARD LVCMOS33 [get_ports {LED0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED3}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED4}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED5}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED6}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LED7}]

#set_property IOSTANDARD LVCMOS33 [get_ports {SMA0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SMA1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SMA2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SMA3}]

set_property PACKAGE_PIN J12 [get_ports SI5324_RST_OUT]          
set_property IOSTANDARD LVCMOS33 [get_ports SI5324_RST_OUT]

set_property PACKAGE_PIN H12 [get_ports SI5324_LOL_IN]          
set_property IOSTANDARD LVCMOS33 [get_ports SI5324_LOL_IN]

set_property PACKAGE_PIN B15 [get_ports TX_EN_OUT]
set_property IOSTANDARD LVCMOS33 [get_ports TX_EN_OUT]

#set_property IOSTANDARD LVCMOS18 [get_ports TX_CLKSEL_OUT]
#set_property PACKAGE_PIN E22 [get_ports TX_CLKSEL_OUT]          

#set_property IOSTANDARD LVCMOS18 [get_ports RX_I2C_EN_N_OUT]
#set_property PACKAGE_PIN G24 [get_ports RX_I2C_EN_N_OUT]        

#####
## End
#####

