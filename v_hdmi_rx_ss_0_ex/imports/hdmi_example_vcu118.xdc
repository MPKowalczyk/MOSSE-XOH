
#####
## Constraints for VCU118 FMC HDMI 2.0
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
#FMCP_HSPC_GBT0_0_P BANK 121
set_property PACKAGE_PIN AK38 [get_ports HDMI_RX_CLK_P_IN]
# MGT_SI570_CLOCK1_C_P 
# set_property PACKAGE_PIN AJ9 [get_ports DRU_CLK_IN_clk_p]     
# FMCP_HSPC_GBT1_0_P BANK 121
set_property PACKAGE_PIN AH38 [get_ports DRU_CLK_IN_clk_p]
#FMCP_HSPC_DP0_M2C_P      
#set_property PACKAGE_PIN AR45 [get_ports {HDMI_RX_DAT_P_IN[0]}]   
#FMCP_HSPC_DP1_M2C_P
#set_property PACKAGE_PIN AN45 [get_ports {HDMI_RX_DAT_P_IN[1]}]   
#FMCP_HSPC_DP2_M2C_P
#set_property PACKAGE_PIN AL45 [get_ports {HDMI_RX_DAT_P_IN[2]}]   

#FMCP_HSPC_LA20_N
set_property PACKAGE_PIN M32 [get_ports RX_HPD_OUT]             
set_property IOSTANDARD LVCMOS18 [get_ports RX_HPD_OUT]

set_property IOSTANDARD LVCMOS18 [get_ports RX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS18 [get_ports RX_DDC_OUT_sda_io]
#FMCP_HSPC_LA16_P
set_property PACKAGE_PIN AG34 [get_ports RX_DDC_OUT_scl_io]      
#FMCP_HSPC_LA16_N  
set_property PACKAGE_PIN AH35 [get_ports RX_DDC_OUT_sda_io]        

set_property IOSTANDARD LVDS [get_ports RX_REFCLK_P_OUT]
#FMCP_HSPC_LA00_CC_P
set_property PACKAGE_PIN AL35 [get_ports RX_REFCLK_P_OUT]        

set_property IOSTANDARD LVCMOS18 [get_ports RX_DET_IN]
#FMCP_HSPC_LA03_P
set_property PACKAGE_PIN AT39 [get_ports RX_DET_IN]              

# HDMI TX
#FMCP_HSPC_GBT1_0_P BANK 121
set_property PACKAGE_PIN AH38 [get_ports TX_REFCLK_P_IN]  

set_property IOSTANDARD LVDS [get_ports HDMI_TX_CLK_P_OUT]
#FMCP_HSPC_LA27_P
set_property PACKAGE_PIN V33 [get_ports HDMI_TX_CLK_P_OUT]      

set_property IOSTANDARD LVCMOS18 [get_ports TX_HPD_IN]
#FMCP_HSPC_LA31_N
set_property PACKAGE_PIN N37 [get_ports TX_HPD_IN]              

set_property IOSTANDARD LVCMOS18 [get_ports TX_DDC_OUT_scl_io]
set_property IOSTANDARD LVCMOS18 [get_ports TX_DDC_OUT_sda_io]
#FMCP_HSPC_LA29_P
set_property PACKAGE_PIN U35 [get_ports TX_DDC_OUT_scl_io]       
#FMCP_HSPC_LA29_N
set_property PACKAGE_PIN T36 [get_ports TX_DDC_OUT_sda_io]       

## UART
#set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_rxd]
##USB_TX
#set_property PACKAGE_PIN K26 [get_ports rs232_uart_rxd]             
#set_property IOSTANDARD LVCMOS18 [get_ports rs232_uart_txd]
##USB_RX
#set_property PACKAGE_PIN G25 [get_ports rs232_uart_txd]           

# I2C
set_property IOSTANDARD LVCMOS18 [get_ports fmch_iic_scl_io]
#FMCP_HSPC_LA06_P
set_property PACKAGE_PIN AT35 [get_ports fmch_iic_scl_io]          
set_property IOSTANDARD LVCMOS18 [get_ports fmch_iic_sda_io]
#FMCP_HSPC_LA06_N
set_property PACKAGE_PIN AT36 [get_ports fmch_iic_sda_io]          

# Misc
#GPIO_LED0
set_property PACKAGE_PIN AT32 [get_ports {LED0}]           
#Only LED 0 is used at the moment
##GPIO_LED1
#set_property PACKAGE_PIN AV34 [get_ports {LED1}]           
##GPIO_LED2
#set_property PACKAGE_PIN AY30 [get_ports {LED2}]           
##GPIO_LED3
#set_property PACKAGE_PIN BB32 [get_ports {LED3}]           
##GPIO_LED4
#set_property PACKAGE_PIN BF32 [get_ports {LED4}]           
##GPIO_LED5
#set_property PACKAGE_PIN AU37 [get_ports {LED5}]           
##GPIO_LED6
#set_property PACKAGE_PIN AV36 [get_ports {LED6}]           
##GPIO_LED7
#set_property PACKAGE_PIN BA37 [get_ports {LED7}]           
##USER_SMA_CLOCK_P
#set_property PACKAGE_PIN R32 [get_ports {SMA0}]           
##USER_SMA_CLOCK_N
#set_property PACKAGE_PIN P32 [get_ports {SMA1}]           

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

set_property IOSTANDARD LVCMOS18 [get_ports SI5324_RST_OUT]
#FMCP_HSPC_LA10_P
set_property PACKAGE_PIN AP35 [get_ports SI5324_RST_OUT]          

set_property IOSTANDARD LVCMOS18 [get_ports SI5324_LOL_IN]
#FMCP_HSPC_LA02_N
set_property PACKAGE_PIN AK32 [get_ports SI5324_LOL_IN]          

set_property IOSTANDARD LVCMOS18 [get_ports TX_EN_OUT]
#FMCP_HSPC_LA26_P
set_property PACKAGE_PIN V32 [get_ports TX_EN_OUT]              

set_property IOSTANDARD LVCMOS18 [get_ports TX_CLKSEL_OUT]
#FMCP_HSPC_LA18_CC_P
set_property PACKAGE_PIN R31 [get_ports TX_CLKSEL_OUT]          

set_property IOSTANDARD LVCMOS18 [get_ports RX_I2C_EN_N_OUT]
#FMCP_HSPC_LA22_P
set_property PACKAGE_PIN N34 [get_ports RX_I2C_EN_N_OUT]        

#####
## End
#####

