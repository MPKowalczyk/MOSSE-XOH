
    # subsystem local structure to store available config: format [odd==Config even==value] \
    # e.g ss_router param list is          [list CONFIG.NUM_SI <> CONFIG.NUM_MI <>]
    variable ss_xgui_varlist [list] 
    
    # GLOBAL VAR DECLARATION AND ASSIGNMENT
    variable var_c_include_hdcp_1_4         [list]
    variable var_c_include_hdcp_2_2         [list]
    variable var_c_max_bits_per_component   [list]
    variable var_c_input_pixels_per_clock   [list]
    variable var_c_addr_width               [list]
    variable var_c_hysteresis_level         [list]
    variable var_c_vid_interface            [list]
    variable var_c_include_low_reso_vid     [list]
    variable var_c_include_yuv420_sup       [list]
    variable var_c_edid_ram_size            [list]
    variable var_c_hpd_invert               [list]
    variable var_c_hpd_invert_rx            [list]
    variable var_c_hdmi_version             [list]
    variable var_c_add_mark_dbg             [list]
    
    # Board Related Parameters
    variable var_PROCESSOR_TYPE             [list]
    variable var_GT_TYPE                    [list]
    
    variable var_C_TX_PLL_SELECTION         [list]  
    variable var_C_TX_REFCLK_SEL            [list]
    variable var_C_RX_PLL_SELECTION         [list]
    variable var_C_RX_REFCLK_SEL            [list]
    variable var_C_NIDRU_REFCLK_SEL         [list]
    variable var_GT_CHANNEL_SITE            [list]
    
    variable var_exdes_topology             [list]  
    variable var_c_nidru                    [list]
    variable var_c_exdes_axilite_freq       [list]
    variable var_tx_en                      [list]
    variable var_tx_protocol                [list]
    variable var_rx_protocol                [list]
    variable var_has_frame_crc              [list]
    variable var_board_name                 [list]
    
    # CONSOLE DEBUG MESSAGE PRINTING ENABLEMENT
    variable var_debug_en [list]
    set var_debug_en      0
    
    # EXDES PORTS INFORMATION CONTAINER
    variable vary_attr_pinlist [list]
    variable pin_cmd
    array set pin_cmd {
        sys_diff_clock       {-mode slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0}
        reset                {-dir I -type RST}
        RX_DET_IN            {-dir I}
        TX_HPD_IN            {-dir I}
        SI_LOL_IN            {-dir I}
        IDT_TN_LOL_IN        {-dir I}
        HDMI_RX_CLK_P_IN     {-dir I}
        HDMI_RX_CLK_N_IN     {-dir I}
        TX_REFCLK_P_IN       {-dir I}
        TX_REFCLK_N_IN       {-dir I}
        DRU_CLK_IN           {-mode slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0}        
        DRU_CLK_P_IN         {-dir I}       
        DRU_CLK_N_IN         {-dir I}
        DRU_CLK_IN_clk_p     {-dir I -type CLK}
        DRU_CLK_IN_clk_n     {-dir I -type CLK}
        HDMI_RX_DAT_P_IN     {-dir I -from 2 -to 0}
        HDMI_RX_DAT_N_IN     {-dir I -from 2 -to 0}
        RX_DDC_OUT           {-mode master -vlnv xilinx.com:interface:iic_rtl:1.0}
        RX_HPD_OUT           {-dir O}
        ONBRD_SI_RST_OUT     {-dir O}
        SI_RST_OUT           {-dir O}
        IDT_TN_RST_OUT       {-dir O}
        TX_DDC_OUT           {-mode master -vlnv xilinx.com:interface:iic_rtl:1.0}
        LED                  {-dir O}
        HDMI_TX_CLK_P_OUT    {-dir O}
        HDMI_TX_CLK_N_OUT    {-dir O}
        RX_REFCLK_P_OUT      {-dir O}
        RX_REFCLK_N_OUT      {-dir O}
        HDMI_TX_DAT_P_OUT    {-dir O -from 2 -to 0}
        HDMI_TX_DAT_N_OUT    {-dir O -from 2 -to 0}
        iic_main             {-mode master -vlnv xilinx.com:interface:iic_rtl:1.0}
        fmch_iic             {-mode master -vlnv xilinx.com:interface:iic_rtl:1.0}      
        rs_uart              {-mode master -vlnv xilinx.com:interface:uart_rtl:1.0}
        RX_IC_EN_N_OUT       {-dir O}
        TX_CLKSEL_OUT        {-dir O}
        TX_EN_OUT            {-dir O}
        DDR                  {-mode master -vlnv xilinx.com:interface:ddrx_rtl:1.0}
        FIXED_IO             {-mode master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0}     
    }

    # FOR PORT CONFIGURABILITY 
    # example declaration
    # variable config_port_s_axi_cpu_aclk
    # array set config_port_s_axi_cpu_aclk {
    #   CONFIG.ASSOCIATED_BUSIF         {S_AXI_CPU_IN}
    #   CONFIG.ASSOCIATED_RESET         {s_axi_cpu_aresetn}
    # }
    
    variable config_port_sys_diff_clock
    variable config_port_DRU_CLK_IN
    variable config_port_reset
    
    array set config_port_DRU_CLK_IN {
        CONFIG.FREQ_HZ                {100000000}
    }
    array set config_port_reset {
        CONFIG.POLARITY  {ACTIVE_HIGH}
    }
    

    ## VAR TO KEEP BLOCK NAME WITH GENERATION CMD \
        new (HIP): when define block_cmd's block name, do exclude any numbering for permutated blocks \
        example: for xlslice_<1/2/3/...>, define it as xlslice_
        
    ## bmak: rtl ref module gen flow is required for rtl - NEW
    ## bmak: hier gen flow is required for wrapper - NEW
    
    variable block_cmd 
    array set block_cmd {
        rx_video_axis_reg_slice {-type ip -vlnv xilinx.com:ip:axis_register_slice:1.1}
        tx_video_axis_reg_slice {-type ip -vlnv xilinx.com:ip:axis_register_slice:1.1}
        v_hdmi_tx_ss            {-type ip -vlnv xilinx.com:ip:v_hdmi_tx_ss:3.1}
        v_hdmi_rx_ss            {-type ip -vlnv xilinx.com:ip:v_hdmi_rx_ss:3.1}
        tx_refclk_lol_n         {-type ip -vlnv xilinx.com:ip:util_vector_logic:2.0}
        gt_refclk_buf           {-type ip -vlnv xilinx.com:ip:util_ds_buf:2.1}
        dru_ibufds_gt_odiv      {-type ip -vlnv xilinx.com:ip:util_ds_buf:2.1}
        vid_phy_controller      {-type ip -vlnv xilinx.com:ip:vid_phy_controller:2.2}
        vcc_const               {-type ip -vlnv xilinx.com:ip:xlconstant:1.1}
        gnd_const               {-type ip -vlnv xilinx.com:ip:xlconstant:1.1}
        gnd_array               {-type ip -vlnv xilinx.com:ip:xlconstant:1.1}
        hdcp_keymngmt_blk_      {-type module -reference hdcp_keymngmt_blk_top}
        const_crc               {-type ip -vlnv xilinx.com:ip:xlconstant:1.1}
        concat_crc              {-type ip -vlnv xilinx.com:ip:xlconcat:2.1}
        slice_crc               {-type ip -vlnv xilinx.com:ip:xlslice:1.0}
        video_frame_crc         {-type ip -vlnv xilinx.com:ip:video_frame_crc:1.0}
        ila_video               {-type ip -vlnv xilinx.com:ip:ila:6.2}
        ila_audio               {-type ip -vlnv xilinx.com:ip:ila:6.2}
    }
    
    # FOR BLOCK CONFIGURABILITY 
    # example coding 
    # variable config_util_vector_logic 
    # array set config_util_vector_logic {
    #   CONFIG.C_SIZE       {1}
    #   CONFIG.C_OPERATION  {$C_OPERATION}
    # }
    
        # auto configure 
    variable config_rx_video_axis_reg_slice
    variable config_tx_video_axis_reg_slice
    
    variable config_v_hdmi_tx_ss
    variable config_v_hdmi_rx_ss
    variable config_tx_refclk_lol_n
    variable config_gt_refclk_buf
    variable config_dru_ibufds_gt_odiv
    variable config_vid_phy_controller
    variable config_vcc_const
    variable config_gnd_const
    variable config_gnd_array
    variable config_const_crc
    # variable config_concat_crc - auto config
    variable config_slice_crc
    variable config_video_frame_crc
    variable config_ila_video
    variable config_ila_audio
    
    if {[array exist config_v_hdmi_tx_ss]} {
        array unset config_v_hdmi_tx_ss
    }
    array set config_v_hdmi_tx_ss {
        CONFIG.C_INCLUDE_HDCP_1_4       {$C_INCLUDE_HDCP_1_4}
        CONFIG.C_INCLUDE_HDCP_2_2       {$C_INCLUDE_HDCP_2_2}
        CONFIG.C_MAX_BITS_PER_COMPONENT {$C_MAX_BITS_PER_COMPONENT}
        CONFIG.C_INPUT_PIXELS_PER_CLOCK {$C_INPUT_PIXELS_PER_CLOCK}
        CONFIG.C_ADDR_WIDTH             {$C_ADDR_WIDTH}
        CONFIG.C_INCLUDE_LOW_RESO_VID   {$C_INCLUDE_LOW_RESO_VID}
        CONFIG.C_VID_INTERFACE          {$C_VID_INTERFACE}
        CONFIG.C_INCLUDE_YUV420_SUP     {$C_INCLUDE_YUV420_SUP}
        CONFIG.C_HYSTERESIS_LEVEL       {$C_HYSTERESIS_LEVEL}
        CONFIG.C_HPD_INVERT             {false}
        CONFIG.C_VALIDATION_ENABLE      {$C_VALIDATION_ENABLE} 
        CONFIG.C_HDMI_FAST_SWITCH       {true}
        CONFIG.C_HDMI_VERSION           {$C_HDMI_VERSION}
    }

    if {[array exist config_v_hdmi_rx_ss]} {
        array unset config_v_hdmi_rx_ss
    }   
    array set config_v_hdmi_rx_ss {
        CONFIG.C_INCLUDE_HDCP_1_4       {$C_INCLUDE_HDCP_1_4}
        CONFIG.C_INCLUDE_HDCP_2_2       {$C_INCLUDE_HDCP_2_2}
        CONFIG.C_MAX_BITS_PER_COMPONENT {$C_MAX_BITS_PER_COMPONENT}
        CONFIG.C_INPUT_PIXELS_PER_CLOCK {$C_INPUT_PIXELS_PER_CLOCK}
        CONFIG.C_ADDR_WIDTH             {$C_ADDR_WIDTH}
        CONFIG.C_INCLUDE_LOW_RESO_VID   {$C_INCLUDE_LOW_RESO_VID}
        CONFIG.C_VID_INTERFACE          {$C_VID_INTERFACE}
        CONFIG.C_INCLUDE_YUV420_SUP     {$C_INCLUDE_YUV420_SUP}
        CONFIG.C_EDID_RAM_SIZE          {256}
        CONFIG.C_HPD_INVERT             {$var_c_hpd_invert_rx}
        CONFIG.C_CD_INVERT              {true}
        CONFIG.C_VALIDATION_ENABLE      {$C_VALIDATION_ENABLE} 
        CONFIG.C_HDMI_FAST_SWITCH       {true}
        CONFIG.C_HDMI_VERSION           {$C_HDMI_VERSION}
        CONFIG.C_EXDES_TOPOLOGY         {$C_EXDES_TOPOLOGY}
        CONFIG.C_EXDES_NIDRU            {$C_EXDES_NIDRU}
        CONFIG.C_EXDES_TX_PLL_SELECTION {$C_EXDES_TX_PLL_SELECTION}
        CONFIG.C_EXDES_RX_PLL_SELECTION {$C_EXDES_RX_PLL_SELECTION}
    }

    if {[array exist config_tx_refclk_lol_n]} {
        array unset config_tx_refclk_lol_n
    }   
    array set config_tx_refclk_lol_n {
        CONFIG.C_SIZE                   {1}
        CONFIG.C_OPERATION              {not}
    }

    if {[array exist config_gt_refclk_buf]} {
        array unset config_gt_refclk_buf
    }   
    array set config_gt_refclk_buf {
        CONFIG.C_BUF_TYPE               {IBUFDSGTE}
    }
    
    if {[array exist config_dru_ibufds_gt_odiv]} {
        array unset config_dru_ibufds_gt_odiv
    }   
    array set config_dru_ibufds_gt_odiv {
        CONFIG.C_BUF_TYPE               {BUFG_GT}
    }
    
    if {[array exist config_vid_phy_controller]} {
        array unset config_vid_phy_controller
    }
    array set config_vid_phy_controller {   
        CONFIG.C_Tx_Protocol            {HDMI} 
        CONFIG.C_TX_PLL_SELECTION       {0} 
        CONFIG.C_TX_REFCLK_SEL          {1} 
        CONFIG.C_Rx_Protocol            {HDMI} 
        CONFIG.C_RX_PLL_SELECTION       {3} 
        CONFIG.C_RX_REFCLK_SEL          {0} 
        CONFIG.C_NIDRU                  {true} 
        CONFIG.C_NIDRU_REFCLK_SEL       {2} 
        CONFIG.C_INPUT_PIXELS_PER_CLOCK {$C_INPUT_PIXELS_PER_CLOCK} 
        CONFIG.CHANNEL_SITE             {X0Y0}
        CONFIG.Transceiver_Width        {4}
        CONFIG.C_INT_HDMI_VER_CMPTBLE   {$C_INT_HDMI_VER_CMPTBLE}
    }

    if {[array exist config_vcc_const]} {
        array unset config_vcc_const
    }
    array set config_vcc_const {
        CONFIG.CONST_VAL               {1}
    }

    if {[array exist config_gnd_const]} {
        array unset config_gnd_const
    }
    array set config_gnd_const {
        CONFIG.CONST_VAL               {0}
    }   
    if {[array exist config_gnd_array]} {
        array unset config_gnd_array
    }
    array set config_gnd_array {
        CONFIG.CONST_VAL               {0}
        CONFIG.CONST_WIDTH             {20}
    }
    if {[array exist config_const_crc]} {
        array unset config_const_crc
    }
    array set config_const_crc {
        CONFIG.CONST_WIDTH             {$CONST_WIDTH}
        CONFIG.CONST_VAL               {0}
    }   
    if {[array exist config_slice_crc]} {
        array unset config_slice_crc
    }
    array set config_slice_crc {
        CONFIG.DIN_WIDTH               {$DIN_WIDTH}
        CONFIG.DIN_FROM                {$DIN_FROM}
        CONFIG.DIN_TO                  {$DIN_TO}
    }   
    if {[array exist config_tx_video_axis_reg_slice]} {
        array unset config_tx_video_axis_reg_slice
    }
    array set config_tx_video_axis_reg_slice {
        CONFIG.TUSER_WIDTH              {1}
        CONFIG.HAS_TLAST                {1}
    }   
    if {[array exist config_video_frame_crc]} {
        array unset config_video_frame_crc
    }
    array set config_video_frame_crc {
        CONFIG.BPC                       {$BPC}
        CONFIG.Pixel_Per_Clock           {$Pixel_Per_Clock}
    }   
    if {[array exist config_ila_video]} {
        array unset config_ila_video
    }
    array set config_ila_video {
        CONFIG.C_PROBE0_WIDTH            {$PROBE0_WIDTH} 
        CONFIG.C_NUM_OF_PROBES           {5} 
        CONFIG.C_MONITOR_TYPE            {Native} 
        CONFIG.C_ENABLE_ILA_AXI_MON      {false}
    }
    if {[array exist config_ila_audio]} {
        array unset config_ila_audio
    }
    array set config_ila_audio {
        CONFIG.C_PROBE0_WIDTH            {$PROBE0_WIDTH} 
        CONFIG.C_NUM_OF_PROBES           {4} 
        CONFIG.C_MONITOR_TYPE            {Native} 
        CONFIG.C_ENABLE_ILA_AXI_MON      {false}
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
        
