
#####
## Constraints for KCU105 FMC HDMI 2.0
## Version 1.0
#####

#####
## Clocks
#####
#create_clock -period 3.367 -name mgtclk0 [get_ports HDMI_RX_CLK_P_IN]
#create_clock -period 3.367 -name mgtclk1 [get_ports TX_REFCLK_P_IN]
#create_clock -period 6.400 -name druclk [get_ports DRU_CLK_IN_clk_p]


#####
## Pins
#####

# HDMI RX
#FMC_HPC_GBTCLK0_M2C_C_P
set_property PACKAGE_PIN K6 [get_ports HDMI_RX_CLK_P_IN]
#SGMIICLK_Q0_P #PCIE_CLK_QO_P
set_property PACKAGE_PIN P6 [get_ports DRU_CLK_IN_clk_p]     
#FMC_HPC_DP0_M2C_P      
#set_property PACKAGE_PIN E4 [get_ports {HDMI_RX_DAT_P_IN[0]}]   
#FMC_HPC_DP1_M2C_P
#set_property PACKAGE_PIN D6 [get_ports {HDMI_RX_DAT_P_IN[1]}]   
#FMC_HPC_DP2_M2C_P
#set_property PACKAGE_PIN B6 [get_ports {HDMI_RX_DAT_P_IN[2]}]   

#FMC_HPC_LA20_N
set_property PACKAGE_PIN A24 [get_ports RX_HPD_OUT]             
set_property IOSTANDARD LVCMOS18 [get_ports RX_HPD_OUT]

set_property IOSTANDARD LVCMOS18 [get_ports RX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS18 [get_ports RX_DDC_OUT_sda_io]
#FMC_HPC_LA16_P
set_property PACKAGE_PIN B9 [get_ports RX_DDC_OUT_scl_io]      
#FMC_HPC_LA16_N  
set_property PACKAGE_PIN A9 [get_ports RX_DDC_OUT_sda_io]        

set_property IOSTANDARD LVDS [get_ports RX_REFCLK_P_OUT]
#FMC_HPC_LA00_CC_P
set_property PACKAGE_PIN H11 [get_ports RX_REFCLK_P_OUT]        

set_property IOSTANDARD LVCMOS18 [get_ports RX_DET_IN]
#FMC_HPC_LA03_P
set_property PACKAGE_PIN A13 [get_ports RX_DET_IN]              


# HDMI TX
#FMC_HPC_GBTCLK1_M2C_C_P
set_property PACKAGE_PIN H6 [get_ports TX_REFCLK_P_IN]  

set_property IOSTANDARD LVDS [get_ports HDMI_TX_CLK_P_OUT]
#FMC_HPC_LA27_P
set_property PACKAGE_PIN H21 [get_ports HDMI_TX_CLK_P_OUT]      

set_property IOSTANDARD LVCMOS18 [get_ports TX_HPD_IN]
#FMC_HPC_LA31_N
set_property PACKAGE_PIN A25 [get_ports TX_HPD_IN]              

set_property IOSTANDARD LVCMOS18 [get_ports TX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS18 [get_ports TX_DDC_OUT_sda_io]
#FMC_HPC_LA29_P
set_property PACKAGE_PIN B20 [get_ports TX_DDC_OUT_scl_io]       
#FMC_HPC_LA29_N
set_property PACKAGE_PIN A20 [get_ports TX_DDC_OUT_sda_io]       


## UART
#set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_rxd]
##USB_TX
#set_property PACKAGE_PIN K26 [get_ports rs232_uart_rxd]             
#set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_txd]
##USB_RX
#set_property PACKAGE_PIN G25 [get_ports rs232_uart_txd]           


# I2C
set_property IOSTANDARD LVCMOS18 [get_ports fmch_iic_scl_io]
#FMC_HPC_LA06_P
set_property PACKAGE_PIN D13 [get_ports fmch_iic_scl_io]          
set_property IOSTANDARD LVCMOS18 [get_ports fmch_iic_sda_io]
#FMC_HPC_LA06_N
set_property PACKAGE_PIN C13 [get_ports fmch_iic_sda_io]          


# Misc
#GPIO_LED_0_LS
set_property PACKAGE_PIN AP8 [get_ports {LED0}]           
#Only LED 0 is used at the moment
##GPIO_LED_1_LS
#set_property PACKAGE_PIN H23 [get_ports {LED1}]           
##GPIO_LED_2_LS
#set_property PACKAGE_PIN P20 [get_ports {LED2}]           
##GPIO_LED_3_LS
#set_property PACKAGE_PIN P21 [get_ports {LED3}]           
##GPIO_LED_4_LS
#set_property PACKAGE_PIN N22 [get_ports {LED4}]           
##GPIO_LED_5_LS
#set_property PACKAGE_PIN M22 [get_ports {LED5}]           
##GPIO_LED_6_LS
#set_property PACKAGE_PIN R23 [get_ports {LED6}]           
##GPIO_LED_7_LS
#set_property PACKAGE_PIN P23 [get_ports {LED7}]           
###USER_SMA_GPIO_P
##set_property PACKAGE_PIN H27 [get_ports {SMA0}]           
##USER_SMA_GPIO_N
#set_property PACKAGE_PIN G27 [get_ports {SMA1}]           
##USER_SMA_CLOCK_P
#set_property PACKAGE_PIN D23 [get_ports {SMA2}]           
##USER_SMA_CLOCK_N
#set_property PACKAGE_PIN C23 [get_ports {SMA3}]           

set_property IOSTANDARD LVCMOS18 [get_ports {LED0}]
#set_property IOSTANDARD LVCMOS18 [get_ports {LED1}]
#set_property IOSTANDARD LVCMOS18 [get_ports {LED2}]
#set_property IOSTANDARD LVCMOS18 [get_ports {LED3}]
#set_property IOSTANDARD LVCMOS18 [get_ports {LED4}]
#set_property IOSTANDARD LVCMOS18 [get_ports {LED5}]
#set_property IOSTANDARD LVCMOS18 [get_ports {LED6}]
#set_property IOSTANDARD LVCMOS18 [get_ports {LED7}]

#set_property IOSTANDARD LVCMOS18 [get_ports {SMA0}]
#set_property IOSTANDARD LVCMOS18 [get_ports {SMA1}]
#set_property IOSTANDARD LVCMOS18 [get_ports {SMA2}]
#set_property IOSTANDARD LVCMOS18 [get_ports {SMA3}]

set_property IOSTANDARD LVCMOS18 [get_ports SI5324_RST_OUT]
#FMC_HPC_LA10_P
set_property PACKAGE_PIN L8 [get_ports SI5324_RST_OUT]          

set_property IOSTANDARD LVCMOS18 [get_ports SI5324_LOL_IN]
#FMC_HPC_LA02_N
set_property PACKAGE_PIN J10 [get_ports SI5324_LOL_IN]          

set_property IOSTANDARD LVCMOS18 [get_ports TX_EN_OUT]
#FMC_HPC_LA26_P
set_property PACKAGE_PIN G20 [get_ports TX_EN_OUT]              

set_property IOSTANDARD LVCMOS18 [get_ports TX_CLKSEL_OUT]
#FMC_HPC_LA18_CC_P
set_property PACKAGE_PIN E22 [get_ports TX_CLKSEL_OUT]          

set_property IOSTANDARD LVCMOS18 [get_ports RX_I2C_EN_N_OUT]
#FMC_HPC_LA22_P
set_property PACKAGE_PIN G24 [get_ports RX_I2C_EN_N_OUT]        

#####
## End
#####

