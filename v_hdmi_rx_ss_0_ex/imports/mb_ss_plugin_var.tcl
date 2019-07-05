
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
        UART                 {-mode master -vlnv xilinx.com:interface:uart_rtl:1.0}
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
        axi_intc                {-type ip -vlnv xilinx.com:ip:axi_intc}
        rst_processor__M        {-type ip -vlnv xilinx.com:ip:proc_sys_reset}
        mdm                     {-type ip -vlnv xilinx.com:ip:mdm}
        mblaze                  {-type ip -vlnv xilinx.com:ip:microblaze}
        clk_wiz                 {-type ip -vlnv xilinx.com:ip:clk_wiz}
        fmch_axi_iic            {-type ip -vlnv xilinx.com:ip:axi_iic}
        axi_uartlite            {-type ip -vlnv xilinx.com:ip:axi_uartlite}
        dlmb_v                  {-type ip -vlnv xilinx.com:ip:lmb_v10}
        ilmb_v                  {-type ip -vlnv xilinx.com:ip:lmb_v10}
        dlmb_bram_if_cntlr      {-type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr}
        ilmb_bram_if_cntlr      {-type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr}
        lmb_bram                {-type ip -vlnv xilinx.com:ip:blk_mem_gen}
    }                                   
    
    # FOR BLOCK CONFIGURABILITY 
    # example coding 
    # variable config_util_vector_logic 
    # array set config_util_vector_logic {
    #   CONFIG.C_SIZE       {1}
    #   CONFIG.C_OPERATION  {$C_OPERATION}
    # }
    
    # variable config_axi_intc
    variable config_axi_uartlite
    variable config_clk_wiz
    variable config_fmch_axi_iic
    # variable config_mdm
    variable config_mblaze
    variable config_axi_interconnect
    variable config_rst_processor_1_100M
    variable config_rst_processor_1_300M
    variable config_xlconcat
    variable config_dlmb_v10
    variable config_ilmb_v10
    variable config_dlmb_bram_if_cntlr
    variable config_ilmb_bram_if_cntlr
    variable config_lmb_bram
    
    if {[array exist config_axi_uartlite]} {
        array unset config_axi_uartlite
    }
    array set config_axi_uartlite {
        CONFIG.C_BAUDRATE                       {115200}
        CONFIG.C_S_AXI_ACLK_FREQ_HZ             {100000000}
        CONFIG.UARTLITE_BOARD_INTERFACE         {rs232_uart}
        CONFIG.USE_BOARD_FLOW                   {true}
        CONFIG.C_S_AXI_ACLK_FREQ_HZ.VALUE_SRC   {DEFAULT}
    }   

    if {[array exist config_clk_wiz]} {
        array unset config_clk_wiz
    }
    array set config_clk_wiz {
        CONFIG.CLK_IN1_BOARD_INTERFACE     {sys_diff_clock}
        CONFIG.RESET_BOARD_INTERFACE       {reset}
        CONFIG.CLKOUT2_USED                {true}
        CONFIG.CLKOUT2_REQUESTED_OUT_FREQ  {300.000}
        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ  {$NULL}
        CONFIG.PRIM_SOURCE                 {Differential_clock_capable_pin}
        CONFIG.NUM_OUT_CLKS                {2}
    }

    if {[array exist config_fmch_axi_iic]} {
        array unset config_fmch_axi_iic
    }
    array set config_fmch_axi_iic {
        CONFIG.IIC_BOARD_INTERFACE       {Custom}
        CONFIG.USE_BOARD_FLOW            {true}
    }   

    if {[array exist config_mblaze]} {
        array unset config_mblaze
    }
    array set config_mblaze {
        CONFIG.C_DEBUG_ENABLED        {1}
        CONFIG.C_D_AXI                {1}
        CONFIG.C_D_LMB                {1}
        CONFIG.C_I_AXI                {0}
        CONFIG.C_I_LMB                {1}
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
    
    if {[array exist config_xlconcat]} {
        array unset config_xlconcat
    }
    array set config_xlconcat {
        CONFIG.NUM_PORTS       {11}
    }

    if {[array exist config_dlmb_v10]} {
        array unset config_dlmb_v10
    }
    array set config_dlmb_v10 {
        CONFIG.C_LMB_NUM_SLAVES {1}
    }

    if {[array exist config_ilmb_v10]} {
        array unset config_ilmb_v10
    }
    array set config_ilmb_v10 {
        CONFIG.C_LMB_NUM_SLAVES {1}
    }

    if {[array exist config_dlmb_bram_if_cntlr]} {
        array unset config_dlmb_bram_if_cntlr
    }
    array set config_dlmb_bram_if_cntlr {
        CONFIG.C_ECC {0}
    }

    if {[array exist config_ilmb_bram_if_cntlr]} {
        array unset config_ilmb_bram_if_cntlr
    }
    array set config_ilmb_bram_if_cntlr {
        CONFIG.C_ECC {0}
    }   

    if {[array exist config_lmb_bram]} {
        array unset config_lmb_bram
    }
    array set config_lmb_bram {
        CONFIG.Memory_Type    {True_Dual_Port_RAM}
        CONFIG.use_bram_block {BRAM_Controller}
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
        
