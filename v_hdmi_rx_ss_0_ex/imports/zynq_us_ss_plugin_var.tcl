
    # subsystem local structure to store available config: format [odd==Config even==value] \
    # e.g ss_router param list is          [list CONFIG.NUM_SI <> CONFIG.NUM_MI <>]
    variable ss_xgui_varlist [list]
    
    # GLOBAL VAR DECLARATION AND ASSIGNMENT
    variable var_c_include_hdcp_1_4   [list]
    variable var_c_include_hdcp_2_2   [list]    
    variable var_BOARD_SYS_CLK_NAME   [list]       
    variable var_BOARD_SYS_CLK_FREQ   [list]
    variable var_BOARD_AXILITE_FREQ   [list]    
    variable var_BOARD_SYS_RESET_NAME [list]    
    
    variable var_include_val          [list]
    variable var_has_frame_crc        [list]
    variable var_board_name           [list]
        
    # CONSOLE DEBUG MESSAGE PRINTING ENABLEMENT
    variable var_debug_en [list]
    set var_debug_en      0
    
    # EXDES PORTS INFORMATION CONTAINER
    variable vary_attr_pinlist [list]
    variable pin_cmd
    array set pin_cmd {
        CLK_IN_D             {-mode slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0}
        ext_reset_in         {-dir I -type RST}
        hdmi_rx_irq          {-dir I}
        hdmi_tx_irq          {-dir I}
        vphy_irq             {-dir I}
        In                   {-dir I}       
        IIC                  {-mode master -vlnv xilinx.com:interface:iic_rtl:1.0}
        clk_out              {-dir O -type CLK}
        dcm_locked           {-dir O}
        peripheral_aresetn   {-dir O -type RST}
        s_axi_aclk           {-dir O -type CLK}
        M_AXI                {-mode master -vlnv xilinx.com:interface:aximm_rtl:1.0}
    }

    # FOR PORT CONFIGURABILITY 
    # example declaration
    # variable config_port_s_axi_cpu_aclk
    # array set config_port_s_axi_cpu_aclk {
    #   CONFIG.ASSOCIATED_BUSIF         {S_AXI_CPU_IN}
    #   CONFIG.ASSOCIATED_RESET         {s_axi_cpu_aresetn}
    # }
    # ** not applicable for hier 
    

    ## VAR TO KEEP BLOCK NAME WITH GENERATION CMD \
        new (HIP): when define block_cmd's block name, do exclude any numbering for permutated blocks \
        example: for xlslice_<1/2/3/...>, define it as xlslice_
        
    ## bmak: rtl ref module gen flow is required for rtl - NEW
    ## bmak: hier gen flow is required for wrapper - NEW
    ## bmak: use latest core version 

    variable block_cmd 
    array set block_cmd {
        axi_interconnect        {-type ip -vlnv xilinx.com:ip:axi_interconnect}
        xlconcat                {-type ip -vlnv xilinx.com:ip:xlconcat}
        rst_processor__M        {-type ip -vlnv xilinx.com:ip:proc_sys_reset}
        fmch_axi_iic            {-type ip -vlnv xilinx.com:ip:axi_iic}
        zynq_us                 {-type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e}
    }                                   

    # FOR BLOCK CONFIGURABILITY 
    # example coding 
    # variable config_util_vector_logic 
    # array set config_util_vector_logic {
    #   CONFIG.C_SIZE       {1}
    #   CONFIG.C_OPERATION  {$C_OPERATION}
    # }
    
    variable config_fmch_axi_iic
    variable config_axi_interconnect
    variable config_rst_processor_1_100M
    variable config_rst_processor_1_300M    
    variable config_xlconcat0
    variable config_xlconcat1
    variable config_zynq_us 
    
    if {[array exist config_fmch_axi_iic]} {
        array unset config_fmch_axi_iic
    }
    array set config_fmch_axi_iic {
        CONFIG.IIC_BOARD_INTERFACE       {Custom}
        CONFIG.USE_BOARD_FLOW            {true}
    }   

    if {[array exist config_axi_interconnect]} {
        array unset config_axi_interconnect
    }
    array set config_axi_interconnect {
        CONFIG.NUM_MI         {11}
    }   

    if {[array exist config_rst_processor_1_100M]} {
        array unset config_rst_processor_1_100M
    }
    array set config_rst_processor_1_100M {
        CONFIG.RESET_BOARD_INTERFACE     {reset}
        CONFIG.USE_BOARD_FLOW            {true}
    }   

    if {[array exist config_rst_processor_1_300M]} {
        array unset config_rst_processor_1_300M
    }
    array set config_rst_processor_1_300M {
        CONFIG.RESET_BOARD_INTERFACE     {reset}
        CONFIG.USE_BOARD_FLOW            {true}
    }   
    if {[array exist config_xlconcat0]} {
        array unset config_xlconcat0
    }
    array set config_xlconcat0 {
        CONFIG.NUM_PORTS       {3}
    }
    if {[array exist config_xlconcat1]} {
        array unset config_xlconcat1
    }
    array set config_xlconcat1 {
        CONFIG.NUM_PORTS       {8}
    }
    
    if {[array exist config_zynq_us]} {
        array unset config_zynq_us
    }
    array set config_zynq_us {
        CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} 
        CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} 
        CONFIG.PSU__I2C0__PERIPHERAL__ENABLE      {1} 
        CONFIG.PSU__I2C0__PERIPHERAL__IO          {{MIO 14 .. 15}}
        CONFIG.PSU__I2C1__PERIPHERAL__ENABLE      {1} 
        CONFIG.PSU__I2C1__PERIPHERAL__IO          {{MIO 16 .. 17}}
        CONFIG.PSU__USE__IRQ0                     {1}
        CONFIG.PSU__USE__IRQ1                     {1}
        CONFIG.PSU__UART0__PERIPHERAL__ENABLE     {1}
        CONFIG.PSU__UART0__PERIPHERAL__IO         {{MIO 18 .. 19}}
        CONFIG.PSU__UART1__PERIPHERAL__ENABLE     {1} 
        CONFIG.PSU__UART1__PERIPHERAL__IO         {{MIO 20 .. 21}}
        CONFIG.PSU__DDRC__ROW_ADDR_COUNT          {15}
        CONFIG.PSU__DDRC__DEVICE_CAPACITY         {{4096 MBits}}
        CONFIG.PSU__DDRC__MEMORY_TYPE             {{DDR 4}} 
        CONFIG.PSU__PL_CLK0_BUF                   {TRUE}
        CONFIG.PSU__PL_CLK1_BUF                   {TRUE}
        CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {$NULL}
        CONFIG.PSU__FPGA_PL1_ENABLE                {1}
        CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL   {RPLL}
        CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {300}
        CONFIG.PSU__CRL_APB__CPU_R5_CTRL__FREQMHZ  {500}
        CONFIG.PSU__PSS_REF_CLK__FREQMHZ           {33.330}
        CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL  {RPLL}
        CONFIG.PSU__USE__M_AXI_GP0                 {0} 
        CONFIG.PSU__USE__M_AXI_GP1                 {0} 
        CONFIG.PSU__USE__M_AXI_GP2                 {1}
    }

    ## UPDATE_BD - NEW 25Nov2014 - needed for HIP 
    ## VARS TO CONFIGURE THE AXI-LITE ADDR MAPPING 
    ## assumption: top has only 1 axi-lite interconnect to control all the axi-lite traffic within the HIP  
    ## pending development: multilevel HIP use case that involve child HIP
    variable top_addr_axi_lite_space NA
    variable top_addr_axi_mm_space NA
    variable cur_addr_space NA
    variable addr_reg_index 0
    variable addr_reg_index_axi_mm 20
    variable config_addr_mapping_axi_lite
    variable config_addr_mapping_axi_mm
        
