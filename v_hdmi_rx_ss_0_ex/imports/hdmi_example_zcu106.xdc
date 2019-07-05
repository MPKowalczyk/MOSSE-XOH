#####
## Constraints for HDMI 2.0 on ZCU106 
## Version 1.0
#####


#####
## Pins
#####

##
## Video Clock SI570
##
#set_property PACKAGE_PIN U10 [get_ports DRU_CLK_IN_clk_p]; # USER_MGT_SI570_CLOCK1_C_P
set_property PACKAGE_PIN W10 [get_ports DRU_CLK_IN_clk_p]; # From Bob

##
## External Reset (CPU_RESET)
##
set_property PACKAGE_PIN G13 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]

##
## HDMI RX
##
set_property PACKAGE_PIN AC10 [get_ports HDMI_RX_CLK_P_IN]; #revB

set_property PACKAGE_PIN M10 [get_ports RX_HPD_OUT];
set_property IOSTANDARD LVCMOS33 [get_ports RX_HPD_OUT];

set_property PACKAGE_PIN M9 [get_ports RX_DDC_OUT_scl_io]; #HDMI_RX_SNK_SCL
set_property IOSTANDARD LVCMOS33 [get_ports RX_DDC_OUT_scl_io]; 
set_property PACKAGE_PIN M11 [get_ports RX_DDC_OUT_sda_io]; #HDMI_RX_SNK_SDA
set_property IOSTANDARD LVCMOS33 [get_ports RX_DDC_OUT_sda_io]; 

set_property PACKAGE_PIN G14 [get_ports RX_REFCLK_P_OUT]; # HDMI_REC_CLOCK_C_P
set_property IOSTANDARD LVDS [get_ports RX_REFCLK_P_OUT]; 

set_property PACKAGE_PIN M8 [get_ports RX_DET_IN]; # HDMI_RX_PWR_DET         
set_property IOSTANDARD LVCMOS33 [get_ports RX_DET_IN]

##
## HDMI TX
##
set_property PACKAGE_PIN AD8 [get_ports TX_REFCLK_P_IN]; #HDMI_SI5324_OUT_C_P

set_property PACKAGE_PIN G21 [get_ports HDMI_TX_CLK_P_OUT] ; #HDMI_TX_LVDS_OUT_P
set_property IOSTANDARD LVDS [get_ports HDMI_TX_CLK_P_OUT]

set_property PACKAGE_PIN N13 [get_ports TX_HPD_IN]; #HDMI_TX_HPD
set_property IOSTANDARD LVCMOS33 [get_ports TX_HPD_IN]

set_property PACKAGE_PIN N8 [get_ports TX_DDC_OUT_scl_io]; #HDMI_TX_SRC_SCL     
set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_scl_io]
set_property PACKAGE_PIN N9 [get_ports TX_DDC_OUT_sda_io]; #HDMI_TX_SRC_SDA       
set_property IOSTANDARD LVCMOS33 [get_ports TX_DDC_OUT_sda_io]


##
## HDMI TX
##
set_property PACKAGE_PIN N12 [get_ports fmch_iic_scl_io]; #HDMI_CTL_SCL      
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_scl_io]
set_property PACKAGE_PIN P12 [get_ports fmch_iic_sda_io]; #HDMI_CTL_SDA          
set_property IOSTANDARD LVCMOS33 [get_ports fmch_iic_sda_io]

##
## Misc
##
#GPIO_LED_0_LS
set_property PACKAGE_PIN AL11 [get_ports {LED0}]           
#Only LED 0 is used at the moment     
##GPIO_LED_1_LS
#set_property PACKAGE_PIN AL13 [get_ports {LED1}]           
##GPIO_LED_2_LS
#set_property PACKAGE_PIN AK13 [get_ports {LED2}]           
##GPIO_LED_3_LS
#set_property PACKAGE_PIN AE15 [get_ports {LED3}]           
##GPIO_LED_4_LS
#set_property PACKAGE_PIN AM8  [get_ports {LED4}]           
##GPIO_LED_5_LS
#set_property PACKAGE_PIN AM9  [get_ports {LED5}]           
##GPIO_LED_6_LS
#set_property PACKAGE_PIN AM10 [get_ports {LED6}]           
##GPIO_LED_7_LS
#set_property PACKAGE_PIN AM11 [get_ports {LED7}]           

set_property IOSTANDARD LVCMOS12 [get_ports {LED0}]
#set_property IOSTANDARD LVCMOS12 [get_ports {LED1}]
#set_property IOSTANDARD LVCMOS12 [get_ports {LED2}]
#set_property IOSTANDARD LVCMOS12 [get_ports {LED3}]
#set_property IOSTANDARD LVCMOS12 [get_ports {LED4}]
#set_property IOSTANDARD LVCMOS12 [get_ports {LED5}]
#set_property IOSTANDARD LVCMOS12 [get_ports {LED6}]
#set_property IOSTANDARD LVCMOS12 [get_ports {LED7}]

set_property PACKAGE_PIN H8 [get_ports SI5324_RST_OUT]; #HDMI_SI5324_RST
set_property IOSTANDARD LVCMOS33 [get_ports SI5324_RST_OUT]

set_property PACKAGE_PIN G8 [get_ports SI5324_LOL_IN]; #HDMI_SI5324_LOL
set_property IOSTANDARD LVCMOS33 [get_ports SI5324_LOL_IN]

set_property PACKAGE_PIN N11 [get_ports TX_EN_OUT]; #HDMI_TX_EN
set_property IOSTANDARD LVCMOS33 [get_ports TX_EN_OUT]

#####
## End
#####cd ..



#set_property PACKAGE_PIN E4 [get_ports {HDMI_RX_DAT_P_IN[0]}]
#set_property PACKAGE_PIN D6 [get_ports {HDMI_RX_DAT_P_IN[1]}]   
#set_property PACKAGE_PIN B6 [get_ports {HDMI_RX_DAT_P_IN[2]}]   

##USER_SMA_GPIO_P
#set_property PACKAGE_PIN H27 [get_ports {SMA0}]           
##USER_SMA_GPIO_N
#set_property PACKAGE_PIN G27 [get_ports {SMA1}]           
##USER_SMA_CLOCK_P
#set_property PACKAGE_PIN D23 [get_ports {SMA2}]           
##USER_SMA_CLOCK_N
#set_property PACKAGE_PIN C23 [get_ports {SMA3}]           
#set_property IOSTANDARD LVCMOS33 [get_ports {SMA0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SMA1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SMA2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SMA3}]

#set_property IOSTANDARD LVCMOS18 [get_ports TX_CLKSEL_OUT]
#set_property PACKAGE_PIN E22 [get_ports TX_CLKSEL_OUT]          

#set_property IOSTANDARD LVCMOS18 [get_ports RX_I2C_EN_N_OUT]
#set_property PACKAGE_PIN G24 [get_ports RX_I2C_EN_N_OUT]        
