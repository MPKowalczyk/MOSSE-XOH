
source ${srcIpDir}/exdes/bd/framework/ss_plugin_util.tcl

# BELOW ARE ALL SD SPECIFIC FUNCTIONS

    # FOR UPDATE_BOUNDARY USAGE
    # proc to generate the bdry pins data struc that will be used for subsystem generation 
    proc get_bdry_pinlist {var_connect var_topology {upvar_num 1}} {
        upvar $upvar_num $var_connect var_con
        upvar $upvar_num $var_topology var_topo
    
        # only define variables that needed in this proc
        variable ss_connect
        variable ss_topology
        

        ############################## Developer define start here ############################
                
        # insert required variable to be used in this proc
        variable var_c_include_hdcp_1_4
        variable var_c_include_hdcp_2_2
        variable var_c_max_bits_per_component
        variable var_c_input_pixels_per_clock
        variable var_c_addr_width
        variable var_c_hysteresis_level
        variable var_c_vid_interface
        variable var_c_include_low_reso_vid
        variable var_c_include_yuv420_sup
        variable var_c_edid_ram_size
        variable var_board_name
        
        variable var_PROCESSOR_TYPE
        variable var_GT_TYPE
        variable var_c_nidru
        variable var_tx_protocol
        variable var_rx_protocol
        
        variable var_debug_en
        variable pin_cmd
        
        # reset the data structure and assign topology
        rst_data_struc ss_connect 1
        set ss_topology exdes_top_topo
        
        #default
        set sys_bdry_pinlist  [list reset fmch_iic \
                                    TX_HPD_IN TX_REFCLK_P_IN TX_REFCLK_N_IN TX_DDC_OUT \
                                    HDMI_TX_CLK_P_OUT HDMI_TX_CLK_N_OUT HDMI_TX_DAT_P_OUT HDMI_TX_DAT_N_OUT TX_EN_OUT \
                                    RX_DET_IN HDMI_RX_CLK_P_IN HDMI_RX_CLK_N_IN HDMI_RX_DAT_P_IN HDMI_RX_DAT_N_IN RX_DDC_OUT \
                                    RX_HPD_OUT RX_REFCLK_P_OUT RX_REFCLK_N_OUT]
                                    
        if {[regexp xilinx.com:zcu104 $var_board_name match] == 1} {
            lappend sys_bdry_pinlist IDT_8T49N241_RST_OUT IDT_8T49N241_LOL_IN
        } else {
            lappend sys_bdry_pinlist SI5324_RST_OUT SI5324_LOL_IN
        }

        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {
            lappend sys_bdry_pinlist sys_diff_clock rs232_uart
            lappend sys_bdry_pinlist RX_I2C_EN_N_OUT
            if {[string match -nocase $var_c_nidru true]} { 
                lappend sys_bdry_pinlist DRU_CLK_IN
            }
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            lappend sys_bdry_pinlist DDR FIXED_IO
            lappend sys_bdry_pinlist sys_diff_clock ONBRD_SI5324_RST_OUT iic_main
            lappend sys_bdry_pinlist RX_I2C_EN_N_OUT
            if {[string match -nocase $var_c_nidru true]} { 
                lappend sys_bdry_pinlist DRU_CLK_P_IN DRU_CLK_N_IN
            }
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
            if {[string match -nocase $var_c_nidru true]} {
                lappend sys_bdry_pinlist DRU_CLK_IN
            }
        }

        if {[string equal -nocase $var_PROCESSOR_TYPE ARM64] != 1} {
            lappend sys_bdry_pinlist TX_CLKSEL_OUT
        }

        lappend sys_bdry_pinlist LED0

        set ss_connect($ss_topology,bdry,pinlist) $sys_bdry_pinlist                           

        # display debug msg
        if {$var_debug_en == 1} {
            puts "DBG_MSG - data structure - get_bdry_pinlist: [set ss_connect($ss_topology,bdry,pinlist)]"
            puts ""
        }

        ############################## Developer define end here #############################
    
        # transfer the result from local namespace var into common namespace var
        array set var_con  [array get ss_connect]
        set var_topo $ss_topology
        
    }

    # NOT APPLICABLE FOR EXDES. Just for HIP generation
    # proc to manipulate the config port table for all configurable boundary ports
    proc config_obj_port_property {tobe_config_obj_port tobe_config_obj_port_path} {
        
        variable ss_xgui_varlist
        
        ############################## Developer define start here ############################
        variable var_c_include_hdcp_1_4     
        variable var_c_include_hdcp_2_2     
        variable var_c_max_bits_per_component
        variable var_c_input_pixels_per_clock   
        variable var_c_addr_width
        variable var_c_hysteresis_level
        variable var_c_vid_interface    
        variable var_c_include_low_reso_vid 
        variable var_c_include_yuv420_sup
        variable var_c_edid_ram_size        
        variable var_debug_en
        variable var_tx_protocol    
        variable var_rx_protocol    
        
        variable config_port_sys_diff_clock
        variable config_port_DRU_CLK_IN
        variable config_port_reset
        variable var_DRU_CLK_FRQ
        variable var_GT_TYPE 
        # Assign DRU_CLK_IN Port Frequency per Transceiver Type
        if {[string equal -nocase $var_GT_TYPE GTX] == 1} {
            set var_DRU_CLK_FRQ 125000000
        } elseif {[string equal -nocase $var_GT_TYPE GTH] == 1} {
            set var_DRU_CLK_FRQ 156250000
        } elseif {[string equal -nocase $var_GT_TYPE GTY] == 1} {
            set var_DRU_CLK_FRQ 156250000
        } else {
            set var_DRU_CLK_FRQ 100000000
        }       
        
# baoshan: 12Aug - removed this as it configure the ports trigger CWs
        switch -regexp -matchvar varlist -- $tobe_config_obj_port {
            DRU_CLK_IN  {
                          set config_port_DRU_CLK_IN(CONFIG.FREQ_HZ)        $var_DRU_CLK_FRQ
                          ::ss_common::go_config $tobe_config_obj_port_path config_port_DRU_CLK_IN
                        }
            reset       {
                          ::ss_common::go_config $tobe_config_obj_port_path config_port_reset
                        }
        }
    
    }

    # FOR UPDATE_BD USAGE
    # proc to generate the leaf objs data struc that will be used for subsystem generation 
    proc get_leaf_blocks {var_connect var_topology {upvar_num 1} {shadow_copy 1}} {
        upvar $upvar_num $var_connect var_con
        upvar $upvar_num $var_topology var_topo
        
        ############################## Developer define start here ############################
        # only define variables that needed in this proc
        variable var_c_include_hdcp_1_4     
        variable var_c_include_hdcp_2_2     
        variable var_c_max_bits_per_component
        variable var_c_input_pixels_per_clock   
        variable var_c_addr_width
        variable var_c_hysteresis_level
        variable var_c_vid_interface    
        variable var_c_include_low_reso_vid 
        variable var_c_include_yuv420_sup
        variable var_c_edid_ram_size
        variable var_PROCESSOR_TYPE   
        variable var_GT_TYPE 
        variable var_c_nidru 
        variable var_tx_protocol    
        variable var_rx_protocol    
        variable var_debug_en

        # reset the data structure and assign topology
        # rst_data_struc ss_connect 1
        set ss_topology exdes_top_topo
        
        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {
            set processor_name mb_ss_0
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            set processor_name zynq_ss_0
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
            set processor_name zynq_us_ss_0
        }

        # ss_connect(<topology>,leaf) [<all the needed leaf object per topology>]   -- bug, cannot use common word
        set sys_block_list [list vid_phy_controller vcc_const \
                                 tx_video_axis_reg_slice v_hdmi_tx_ss v_tpg_ss_0 audio_ss_0 \
                                 v_hdmi_rx_ss rx_video_axis_reg_slice]
    
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            lappend sys_block_list  hdcp_keymngmt_blk_0
            lappend sys_block_list  hdcp_keymngmt_blk_1
        }

        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {       
            lappend sys_block_list  gnd_const 
            if {[string equal -nocase $var_GT_TYPE GTX] == 1} {
                if {[string match -nocase $var_c_nidru true]} { 
                    lappend sys_block_list  gt_refclk_buf 
                }
                lappend sys_block_list  $processor_name
            } elseif {[string equal -nocase $var_GT_TYPE GTH] == 1} {
                if {[string match -nocase $var_c_nidru true]} {
                    lappend sys_block_list  dru_ibufds_gt_odiv2
                    lappend sys_block_list  gt_refclk_buf
                    lappend sys_block_list  vcc_const0
                }
                lappend sys_block_list  $processor_name
            } elseif {[string equal -nocase $var_GT_TYPE GTY] == 1} {
                if {[string match -nocase $var_c_nidru true]} {
                    lappend sys_block_list  dru_ibufds_gt_odiv2
                    lappend sys_block_list  gt_refclk_buf
                    lappend sys_block_list  vcc_const0
                }
                lappend sys_block_list  $processor_name
            }       
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            lappend sys_block_list  gnd_const 
            if {[string equal -nocase $var_GT_TYPE GTX] == 1} {
                if {[string match -nocase $var_c_nidru true]} { 
                    lappend sys_block_list  gt_refclk_buf1
                }
                if {[string match -nocase $var_tx_protocol HDMI]} { 
                    lappend sys_block_list  gt_refclk_buf0
                }
                lappend sys_block_list  $processor_name
            }
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
            if {[string equal -nocase $var_GT_TYPE GTH] == 1} {
                if {[string match -nocase $var_c_nidru true]} { 
                    lappend sys_block_list  dru_ibufds_gt_odiv2
                    lappend sys_block_list  gt_refclk_buf
                    lappend sys_block_list  vcc_const0
                }
                lappend sys_block_list  $processor_name
            }
        }
        
        
        set ss_connect($ss_topology,leaf) $sys_block_list
        
#       set ss_connect($ss_topology,leaf) [list audio_ss_0]
        
        # if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
        #   set ss_connect($ss_topology,leaf) [concat [set ss_connect($ss_topology,leaf)] hdcp_1_4 axi_timer util_vector_logic_2]
        # }
        
        # display debug msg
        if {$var_debug_en == 1} {
            puts "DBG_MSG - data structure - get_leaf_blocks: [set ss_connect($ss_topology,leaf)]"
            puts ""
        }       

        ############################## Developer define end here #############################
        
        # transfer the result from local namespace var into common namespace var
        array set var_con  [array get ss_connect]
        set var_topo $ss_topology
    
    }

    # proc to generate the source2target and net data strucs that will be used for subsystem generation
    proc get_ss_connectivity {var_connect var_topology {upvar_num 1}} {
        upvar $upvar_num $var_connect var_con
        upvar $upvar_num $var_topology var_topo
        variable ss_connect
        variable ss_topology
        
        ############################## Developer define start here ############################
        
        # only define variables that needed in this proc 
        variable var_c_include_hdcp_1_4
        variable var_c_include_hdcp_2_2
        variable var_c_max_bits_per_component
        variable var_c_input_pixels_per_clock
        variable var_c_addr_width
        variable var_c_hysteresis_level
        variable var_c_vid_interface
        variable var_c_include_low_reso_vid
        variable var_c_include_yuv420_sup
        variable var_c_edid_ram_size
        variable var_board_name

        variable var_PROCESSOR_TYPE   
        variable var_GT_TYPE 
        variable var_DRU_REFCLK 

        variable var_c_nidru 
        variable var_tx_protocol    
        variable var_rx_protocol    
        variable var_C_RX_PLL_SELECTION 
        variable var_debug_en

        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {
            set processor_name mb_ss_0
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            set processor_name zynq_ss_0
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
            set processor_name zynq_us_ss_0
        }       

        # reset the data structure and assign topology
        # rst_data_struc ss_connect 1
        set ss_topology exdes_top_topo
        set source_objs [list]
        set ss_connect($ss_topology,sourceIsInterfacePin) [list]

        lappend source_objs bdry_in
        if {[string equal -nocase $var_PROCESSOR_TYPE ARM64] != 1} {
        set ss_connect($ss_topology,source2target,bdry_in,sys_diff_clock)   [list $processor_name     CLK_IN1_D]
        }               
        set ss_connect($ss_topology,source2target,bdry_in,reset)            [list $processor_name     ext_reset_in]
        set ss_connect($ss_topology,source2target,bdry_in,RX_DET_IN)        [list v_hdmi_rx_ss        cable_detect]
        set ss_connect($ss_topology,source2target,bdry_in,TX_HPD_IN)        [list v_hdmi_tx_ss        hpd]
        
        if {[regexp xilinx.com:zcu104 $var_board_name match] == 1} {
            set ss_connect($ss_topology,source2target,bdry_in,IDT_8T49N241_LOL_IN)      [list vid_phy_controller  tx_refclk_rdy]
        } else {
            set ss_connect($ss_topology,source2target,bdry_in,SI5324_LOL_IN)            [list vid_phy_controller  tx_refclk_rdy]
        }

        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {
            set ss_connect($ss_topology,source2target,bdry_in,TX_REFCLK_P_IN)   [list vid_phy_controller  mgtrefclk1_pad_p_in]
            set ss_connect($ss_topology,source2target,bdry_in,TX_REFCLK_N_IN)   [list vid_phy_controller  mgtrefclk1_pad_n_in]
            set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_CLK_P_IN) [list vid_phy_controller  mgtrefclk0_pad_p_in]
            set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_CLK_N_IN) [list vid_phy_controller  mgtrefclk0_pad_n_in]
            if {[string match -nocase $var_c_nidru true]} { 
                if {[string equal -nocase $var_GT_TYPE GTX] == 1} {
                    set ss_connect($ss_topology,source2target,bdry_in,DRU_CLK_IN)       [list gt_refclk_buf   CLK_IN_D]
                } elseif {[string equal -nocase $var_GT_TYPE GTH] == 1} {
                    set ss_connect($ss_topology,source2target,bdry_in,DRU_CLK_IN)       [list gt_refclk_buf   CLK_IN_D]
                } elseif {[string equal -nocase $var_GT_TYPE GTY] == 1} {
                    set ss_connect($ss_topology,source2target,bdry_in,DRU_CLK_IN)       [list gt_refclk_buf   CLK_IN_D]
                }
            }
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_CLK_P_IN) [list vid_phy_controller  mgtrefclk0_pad_p_in]
            set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_CLK_N_IN) [list vid_phy_controller  mgtrefclk0_pad_n_in]
            if {[string equal -nocase $var_GT_TYPE GTX] == 1} {
            if {[string match -nocase $var_c_nidru true]} {
                    set ss_connect($ss_topology,source2target,bdry_in,DRU_CLK_P_IN)     [list gt_refclk_buf1   IBUF_DS_P]
                    set ss_connect($ss_topology,source2target,bdry_in,DRU_CLK_N_IN)     [list gt_refclk_buf1   IBUF_DS_N]
        }
                set ss_connect($ss_topology,source2target,bdry_in,TX_REFCLK_P_IN)   [list gt_refclk_buf0   IBUF_DS_P]
                set ss_connect($ss_topology,source2target,bdry_in,TX_REFCLK_N_IN)   [list gt_refclk_buf0   IBUF_DS_N]               
            }
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
            set ss_connect($ss_topology,source2target,bdry_in,TX_REFCLK_P_IN)   [list vid_phy_controller  mgtrefclk0_pad_p_in]
            set ss_connect($ss_topology,source2target,bdry_in,TX_REFCLK_N_IN)   [list vid_phy_controller  mgtrefclk0_pad_n_in]
            set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_CLK_P_IN) [list vid_phy_controller  mgtrefclk1_pad_p_in]
            set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_CLK_N_IN) [list vid_phy_controller  mgtrefclk1_pad_n_in]          
            if {[string match -nocase $var_c_nidru true]} { 
                if {[string equal -nocase $var_GT_TYPE GTH] == 1} {
                    set ss_connect($ss_topology,source2target,bdry_in,DRU_CLK_IN)       [list gt_refclk_buf   CLK_IN_D]
                }
            }
        }           

        set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_DAT_P_IN) [list vid_phy_controller  phy_rxp_in]
        set ss_connect($ss_topology,source2target,bdry_in,HDMI_RX_DAT_N_IN) [list vid_phy_controller  phy_rxn_in]

        lappend source_objs rx_video_axis_reg_slice
        set ss_connect($ss_topology,source2target,rx_video_axis_reg_slice,M_AXIS)        [list v_tpg_ss_0  s_axis_video]

        lappend source_objs $processor_name
        set ss_connect($ss_topology,source2target,$processor_name,IIC)            [list bdry_out             fmch_iic]
        if {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            set ss_connect($ss_topology,source2target,$processor_name,IIC1)       [list bdry_out             iic_main]      
        }
                
        set ss_connect($ss_topology,source2target,$processor_name,M00_AXI)        [list vid_phy_controller   vid_phy_axi4lite]
        set ss_connect($ss_topology,source2target,$processor_name,M01_AXI)        [list v_hdmi_rx_ss         S_AXI_CPU_IN]  
        set ss_connect($ss_topology,source2target,$processor_name,M02_AXI)        [list v_hdmi_tx_ss         S_AXI_CPU_IN]
        set ss_connect($ss_topology,source2target,$processor_name,M05_AXI)        [list v_tpg_ss_0           S_AXI_TPG]
        set ss_connect($ss_topology,source2target,$processor_name,M06_AXI)        [list audio_ss_0           S00_AXI]
        set ss_connect($ss_topology,source2target,$processor_name,M08_AXI)        [list v_tpg_ss_0           S_AXI_GPIO]

        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {      
            set ss_connect($ss_topology,source2target,$processor_name,M09_AXI)    [list hdcp_keymngmt_blk_0  s_axi]
            set ss_connect($ss_topology,source2target,$processor_name,M10_AXI)    [list hdcp_keymngmt_blk_1  s_axi]
        }
        

        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {
            set ss_connect($ss_topology,source2target,$processor_name,UART)       [list bdry_out             rs232_uart]
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            set ss_connect($ss_topology,source2target,$processor_name,DDR)        [list bdry_out             DDR]
            set ss_connect($ss_topology,source2target,$processor_name,FIXED_IO)   [list bdry_out             FIXED_IO]          
        }       
        
        set ss_connect($ss_topology,source2target,$processor_name,clk_out2)       [list rx_video_axis_reg_slice    aclk \
                                                                                v_tpg_ss_0                 ap_clk \
                                                                                tx_video_axis_reg_slice    aclk \
                                                                                v_hdmi_tx_ss               s_axis_video_aclk \
                                                                                v_hdmi_rx_ss               s_axis_video_aclk]
                                                                                
                                                                                
        set ss_connect($ss_topology,source2target,$processor_name,dcm_locked)     [list rx_video_axis_reg_slice    aresetn \
                                                                                v_tpg_ss_0                 m_axi_aresetn \
                                                                                tx_video_axis_reg_slice    aresetn \
                                                                                v_hdmi_tx_ss               s_axis_video_aresetn \
                                                                                v_hdmi_rx_ss               s_axis_video_aresetn]
        
        set s_axi_aresetn_list                                                      [list audio_ss_0           ARESETN \
                                                                                          v_hdmi_tx_ss         s_axi_cpu_aresetn \
                                                                                          v_hdmi_rx_ss         s_axi_cpu_aresetn \
                                                                                          vid_phy_controller   vid_phy_sb_aresetn \
                                                                                          vid_phy_controller   vid_phy_axi4lite_aresetn]
                                                                                          
        if {[regexp xilinx.com:zcu104 $var_board_name match] == 1} {
            lappend s_axi_aresetn_list                                                    bdry_out             IDT_8T49N241_LOL_IN
        } else {
            lappend s_axi_aresetn_list                                                    bdry_out             SI5324_RST_OUT
        }
                                                                                          
        if {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            lappend s_axi_aresetn_list                                                    bdry_out             ONBRD_SI5324_RST_OUT         
        }   
                                                                                          
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {                                                                                  
            lappend s_axi_aresetn_list                                                    hdcp_keymngmt_blk_0  s_axi_aresetn
            lappend s_axi_aresetn_list                                                    hdcp_keymngmt_blk_1  s_axi_aresetn
        } 
        
        
        set ss_connect($ss_topology,source2target,$processor_name,peripheral_aresetn)     $s_axi_aresetn_list

        set s_axi_aclk_list                                                         [list audio_ss_0           ACLK \
                                                                                          v_hdmi_tx_ss         s_axi_cpu_aclk \
                                                                                          v_hdmi_rx_ss         s_axi_cpu_aclk \
                                                                                          vid_phy_controller   vid_phy_sb_aclk \
                                                                                          vid_phy_controller   vid_phy_axi4lite_aclk]

        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {  
            lappend s_axi_aclk_list                                                       hdcp_keymngmt_blk_0  s_axi_aclk 
            lappend s_axi_aclk_list                                                       hdcp_keymngmt_blk_1  s_axi_aclk 
        
        }
        
        if {[string equal -nocase $var_GT_TYPE GTH] == 1} {
            lappend s_axi_aclk_list                                                       vid_phy_controller   drpclk
        } elseif {[string equal -nocase $var_GT_TYPE GTY] == 1} {
            lappend s_axi_aclk_list                                                       vid_phy_controller   drpclk
        }
        
        set ss_connect($ss_topology,source2target,$processor_name,s_axi_aclk)             $s_axi_aclk_list
        
        lappend source_objs v_tpg_ss_0
        set ss_connect($ss_topology,source2target,v_tpg_ss_0,m_axis_video)          [list tx_video_axis_reg_slice  S_AXIS]
        

        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            lappend source_objs hdcp_keymngmt_blk_0
            set ss_connect($ss_topology,source2target,hdcp_keymngmt_blk_0,m_axis_keys)      [list v_hdmi_tx_ss  HDCP14_KEY_IN]
            lappend source_objs hdcp_keymngmt_blk_1
            set ss_connect($ss_topology,source2target,hdcp_keymngmt_blk_1,m_axis_keys)      [list v_hdmi_rx_ss  HDCP14_KEY_IN]      
        }
        
        lappend source_objs tx_video_axis_reg_slice     
            set ss_connect($ss_topology,source2target,tx_video_axis_reg_slice,M_AXIS)    [list v_hdmi_tx_ss  VIDEO_IN]
        
        lappend source_objs audio_ss_0
            set ss_connect($ss_topology,source2target,audio_ss_0,axis_audio_out)    [list v_hdmi_tx_ss  AUDIO_IN]
        
        set ss_connect($ss_topology,source2target,audio_ss_0,aud_acr_cts_out)       [list v_hdmi_tx_ss  acr_cts]
        set ss_connect($ss_topology,source2target,audio_ss_0,aud_acr_n_out)         [list v_hdmi_tx_ss  acr_n]
        set ss_connect($ss_topology,source2target,audio_ss_0,aud_acr_valid_out)     [list v_hdmi_tx_ss  acr_valid]
        
            set ss_connect($ss_topology,source2target,audio_ss_0,aud_rstn)              [list v_hdmi_tx_ss  s_axis_audio_aresetn \
                                                                                          v_hdmi_rx_ss  s_axis_audio_aresetn]

            set ss_connect($ss_topology,source2target,audio_ss_0,audio_clk)             [list v_hdmi_tx_ss  s_axis_audio_aclk \
                                                                                          v_hdmi_rx_ss  s_axis_audio_aclk]
    
        lappend source_objs v_hdmi_tx_ss
        set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,LINK_DATA0_OUT)              [list vid_phy_controller    vid_phy_tx_axi4s_ch0]
        set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,LINK_DATA1_OUT)              [list vid_phy_controller    vid_phy_tx_axi4s_ch1]
        set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,LINK_DATA2_OUT)              [list vid_phy_controller    vid_phy_tx_axi4s_ch2]
        set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,DDC_OUT)                     [list bdry_out              TX_DDC_OUT]
        set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,irq)                         [list $processor_name       hdmi_tx_irq]
        set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,locked)                      [list bdry_out              LED0]

        if {[string match -nocase $var_c_include_hdcp_1_4 false] &&[string match -nocase $var_c_include_hdcp_2_2 false]} {
        } elseif {[string match -nocase $var_c_include_hdcp_1_4 false] &&[string match -nocase $var_c_include_hdcp_2_2 true]} {
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp22_irq)                  [list $processor_name               In5]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp22_timer_irq)            [list $processor_name               In6]        
        } elseif {[string match -nocase $var_c_include_hdcp_1_4 true] &&[string match -nocase $var_c_include_hdcp_2_2 false]} {
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_irq)                  [list $processor_name               In5]        
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_key_aresetn)          [list hdcp_keymngmt_blk_0   m_axis_aresetn]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_key_aclk)             [list hdcp_keymngmt_blk_0   m_axis_aclk]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_start_key_transmit)   [list hdcp_keymngmt_blk_0   start_key_transmit]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_reg_key_sel)          [list hdcp_keymngmt_blk_0   reg_key_sel]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_timer_irq)            [list $processor_name               In6]        
        } elseif {[string match -nocase $var_c_include_hdcp_1_4 true] &&[string match -nocase $var_c_include_hdcp_2_2 true]} {
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_irq)                  [list $processor_name               In5]        
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_key_aresetn)          [list hdcp_keymngmt_blk_0   m_axis_aresetn]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_key_aclk)             [list hdcp_keymngmt_blk_0   m_axis_aclk]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_start_key_transmit)   [list hdcp_keymngmt_blk_0   start_key_transmit]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_reg_key_sel)          [list hdcp_keymngmt_blk_0   reg_key_sel]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp14_timer_irq)            [list $processor_name               In6]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp22_irq)                  [list $processor_name               In9]
            set ss_connect($ss_topology,source2target,v_hdmi_tx_ss,hdcp22_timer_irq)            [list $processor_name               In10]       
        }               
                

        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {       
            if {[string equal -nocase $var_GT_TYPE GTX] == 1} {
                if {[string match -nocase $var_c_nidru true]} { 
                    lappend source_objs gt_refclk_buf
                    set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtnorthrefclk0_in]
                }
            } elseif {[string equal -nocase $var_GT_TYPE GTH] == 1} {           
                if {[string match -nocase $var_c_nidru true]} { 
                    lappend source_objs dru_ibufds_gt_odiv2
                    set ss_connect($ss_topology,source2target,dru_ibufds_gt_odiv2,BUFG_GT_O) [list vid_phy_controller  gtnorthrefclk0_odiv2_in]
                    lappend source_objs gt_refclk_buf
                    if {$var_C_RX_PLL_SELECTION == 6} { 
                        set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtnorthrefclk0_in \
                                                                                                vid_phy_controller  gtnorthrefclk00_in \
                                                                                                vid_phy_controller  gtnorthrefclk01_in]
                    } else {
                        set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtnorthrefclk0_in]
                    }
                    set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_DS_ODIV2) [list dru_ibufds_gt_odiv2  BUFG_GT_I]
                    lappend source_objs vcc_const0
                    set ss_connect($ss_topology,source2target,vcc_const0,dout) [list dru_ibufds_gt_odiv2  BUFG_GT_CE]
                }
            } elseif {[string equal -nocase $var_GT_TYPE GTY] == 1} {      
                if {[string match -nocase $var_c_nidru true]} { 
                    lappend source_objs dru_ibufds_gt_odiv2
                    set ss_connect($ss_topology,source2target,dru_ibufds_gt_odiv2,BUFG_GT_O) [list vid_phy_controller  gtnorthrefclk0_odiv2_in]
                    lappend source_objs gt_refclk_buf
                    if {$var_C_RX_PLL_SELECTION == 6} { 
                        set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtnorthrefclk0_in \
                                                                                                vid_phy_controller  gtnorthrefclk00_in \
                                                                                                vid_phy_controller  gtnorthrefclk01_in]
                    } else {
                        set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtnorthrefclk0_in]
                    }
                    set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_DS_ODIV2) [list dru_ibufds_gt_odiv2  BUFG_GT_I]
                    lappend source_objs vcc_const0
                    set ss_connect($ss_topology,source2target,vcc_const0,dout) [list dru_ibufds_gt_odiv2  BUFG_GT_CE]
                }
            }
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            if {[string equal -nocase $var_GT_TYPE GTX] == 1} {
                lappend source_objs gt_refclk_buf0
                set ss_connect($ss_topology,source2target,gt_refclk_buf0,IBUF_OUT) [list    vid_phy_controller  gtsouthrefclk0_in]
                if {[string match -nocase $var_c_nidru true]} { 
                    lappend source_objs gt_refclk_buf1
                    set ss_connect($ss_topology,source2target,gt_refclk_buf1,IBUF_OUT) [list    vid_phy_controller  gtsouthrefclk1_in]
                }
            } 
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
            if {[string equal -nocase $var_GT_TYPE GTH] == 1} {     
                if {[string match -nocase $var_c_nidru true]} {
                    lappend source_objs dru_ibufds_gt_odiv2
                    if {[string match -nocase $var_DRU_REFCLK gtsouthrefclk0]} {
                        set ss_connect($ss_topology,source2target,dru_ibufds_gt_odiv2,BUFG_GT_O) [list vid_phy_controller  gtsouthrefclk0_odiv2_in]
                        lappend source_objs gt_refclk_buf
                        if {$var_C_RX_PLL_SELECTION == 6} { 
                            set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtsouthrefclk0_in \
                                                                                                    vid_phy_controller  gtsouthrefclk00_in \
                                                                                                    vid_phy_controller  gtsouthrefclk01_in]
                        } else {
                            set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtsouthrefclk0_in]
                        }
                    } elseif {[string match -nocase $var_DRU_REFCLK gtnorthrefclk1]} {
                        set ss_connect($ss_topology,source2target,dru_ibufds_gt_odiv2,BUFG_GT_O) [list vid_phy_controller  gtnorthrefclk1_odiv2_in]
                        lappend source_objs gt_refclk_buf
                        if {$var_C_RX_PLL_SELECTION == 6} { 
                            set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtnorthrefclk1_in \
                                                                                                    vid_phy_controller  gtnorthrefclk10_in \
                                                                                                    vid_phy_controller  gtnorthrefclk11_in]
                        } else {
                            set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtnorthrefclk1_in]
                        }
                    } else {
                        set ss_connect($ss_topology,source2target,dru_ibufds_gt_odiv2,BUFG_GT_O) [list vid_phy_controller  gtsouthrefclk1_odiv2_in]
                        lappend source_objs gt_refclk_buf
                        if {$var_C_RX_PLL_SELECTION == 6} { 
                            set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtsouthrefclk1_in \
                                                                                                    vid_phy_controller  gtsouthrefclk10_in \
                                                                                                    vid_phy_controller  gtsouthrefclk11_in]
                        } else {
                            set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_OUT) [list vid_phy_controller  gtsouthrefclk1_in]
                        }
                    }
                    set ss_connect($ss_topology,source2target,gt_refclk_buf,IBUF_DS_ODIV2) [list dru_ibufds_gt_odiv2  BUFG_GT_I]
                    lappend source_objs vcc_const0
                    set ss_connect($ss_topology,source2target,vcc_const0,dout) [list dru_ibufds_gt_odiv2  BUFG_GT_CE]
                }
            }
        }
        
        lappend source_objs vid_phy_controller
        set ss_connect($ss_topology,source2target,vid_phy_controller,vid_phy_rx_axi4s_ch0)          [list v_hdmi_rx_ss  LINK_DATA0_IN]
        set ss_connect($ss_topology,source2target,vid_phy_controller,vid_phy_rx_axi4s_ch1)          [list v_hdmi_rx_ss  LINK_DATA1_IN]
        set ss_connect($ss_topology,source2target,vid_phy_controller,vid_phy_rx_axi4s_ch2)          [list v_hdmi_rx_ss  LINK_DATA2_IN]
        set ss_connect($ss_topology,source2target,vid_phy_controller,vid_phy_status_sb_tx)          [list v_hdmi_tx_ss  SB_STATUS_IN]
        set ss_connect($ss_topology,source2target,vid_phy_controller,vid_phy_status_sb_rx)          [list v_hdmi_rx_ss  SB_STATUS_IN]
        set ss_connect($ss_topology,source2target,vid_phy_controller,tx_tmds_clk)                   [list audio_ss_0    hdmi_clk]
        set ss_connect($ss_topology,source2target,vid_phy_controller,tx_video_clk)                  [list v_hdmi_tx_ss  video_clk]
        set ss_connect($ss_topology,source2target,vid_phy_controller,tx_tmds_clk_p)                 [list bdry_out      HDMI_TX_CLK_P_OUT]
        set ss_connect($ss_topology,source2target,vid_phy_controller,tx_tmds_clk_n)                 [list bdry_out      HDMI_TX_CLK_N_OUT]
        set ss_connect($ss_topology,source2target,vid_phy_controller,rx_video_clk)                  [list v_hdmi_rx_ss  video_clk]
        set ss_connect($ss_topology,source2target,vid_phy_controller,rx_tmds_clk_p)                 [list bdry_out      RX_REFCLK_P_OUT]
        set ss_connect($ss_topology,source2target,vid_phy_controller,rx_tmds_clk_n)                 [list bdry_out      RX_REFCLK_N_OUT]
        set ss_connect($ss_topology,source2target,vid_phy_controller,phy_txn_out)                   [list bdry_out      HDMI_TX_DAT_N_OUT]
        set ss_connect($ss_topology,source2target,vid_phy_controller,phy_txp_out)                   [list bdry_out      HDMI_TX_DAT_P_OUT]                                                                                                        
        set ss_connect($ss_topology,source2target,vid_phy_controller,rxoutclk)                      [list vid_phy_controller  vid_phy_rx_axi4s_aclk \
                                                                                                          v_hdmi_rx_ss        link_clk]
        set ss_connect($ss_topology,source2target,vid_phy_controller,txoutclk)                      [list vid_phy_controller  vid_phy_tx_axi4s_aclk \
                                                                                                          v_hdmi_tx_ss        link_clk]
        set ss_connect($ss_topology,source2target,vid_phy_controller,irq)                           [list $processor_name     vphy_irq]
                                                                                                       
                                                                                                       
        lappend source_objs v_hdmi_rx_ss        
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,AUDIO_OUT)              [list audio_ss_0               axis_audio_in]
            
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,DDC_OUT)                    [list bdry_out                 RX_DDC_OUT]
        
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,VIDEO_OUT)                  [list rx_video_axis_reg_slice  S_AXIS]
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,acr_cts)                    [list audio_ss_0               aud_acr_cts_in]
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,acr_n)                      [list audio_ss_0               aud_acr_n_in]
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,acr_valid)                  [list audio_ss_0               aud_acr_valid_in]
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hpd)                        [list bdry_out                 RX_HPD_OUT]
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,irq)                        [list $processor_name          hdmi_rx_irq]
        set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,fid)                        [list v_hdmi_tx_ss             fid]
        
        if {[string match -nocase $var_c_include_hdcp_1_4 false] &&[string match -nocase $var_c_include_hdcp_2_2 false]} {
        } elseif {[string match -nocase $var_c_include_hdcp_1_4 false] &&[string match -nocase $var_c_include_hdcp_2_2 true]} {
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp22_irq)                 [list $processor_name                  In3]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp22_timer_irq)           [list $processor_name                  In4]              
        } elseif {[string match -nocase $var_c_include_hdcp_1_4 true] &&[string match -nocase $var_c_include_hdcp_2_2 false]} {
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_irq)                 [list $processor_name                  In3]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_key_aresetn)         [list hdcp_keymngmt_blk_1      m_axis_aresetn]   
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_key_aclk)            [list hdcp_keymngmt_blk_1      m_axis_aclk]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_start_key_transmit)  [list hdcp_keymngmt_blk_1      start_key_transmit]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_reg_key_sel)         [list hdcp_keymngmt_blk_1      reg_key_sel]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_timer_irq)           [list $processor_name                  In4]      
        } elseif {[string match -nocase $var_c_include_hdcp_1_4 true] &&[string match -nocase $var_c_include_hdcp_2_2 true]} {
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_irq)                 [list $processor_name                  In3]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_key_aresetn)         [list hdcp_keymngmt_blk_1      m_axis_aresetn]   
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_key_aclk)            [list hdcp_keymngmt_blk_1      m_axis_aclk]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_start_key_transmit)  [list hdcp_keymngmt_blk_1      start_key_transmit]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_reg_key_sel)         [list hdcp_keymngmt_blk_1      reg_key_sel]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp14_timer_irq)           [list $processor_name                  In4]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp22_irq)                 [list $processor_name                  In7]
            set ss_connect($ss_topology,source2target,v_hdmi_rx_ss,hdcp22_timer_irq)           [list $processor_name                  In8]      
        }
        lappend source_objs gnd_const
        
        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {
            set ss_connect($ss_topology,source2target,gnd_const,dout)  [list bdry_out  RX_I2C_EN_N_OUT]
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            set ss_connect($ss_topology,source2target,gnd_const,dout)  [list bdry_out  RX_I2C_EN_N_OUT]
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
        }
        lappend source_objs vcc_const
        set ss_connect($ss_topology,source2target,vcc_const,dout)       [list bdry_out  TX_CLKSEL_OUT \
                                                                             bdry_out  TX_EN_OUT \
                                                                             vid_phy_controller vid_phy_tx_axi4s_aresetn \
                                                                             vid_phy_controller vid_phy_rx_axi4s_aresetn]
        
        ## remove any numbering exist in the interface signal name for the source list e,g S01_AXI, S02_AXI,...S0*_AXI will be tagged as S_AXI
        if {[string equal -nocase $var_PROCESSOR_TYPE MicroBlaze] == 1} {
            set ss_connect($ss_topology,sourceIsInterfacePin)    [list sys_diff_clock M_AXIS DRU_CLK_IN DDC_OUT IIC M_AXI UART m_axis_video m_axis_keys \
                                                                   axis_audio_out LINK_DATA_OUT vid_phy_rx_axis_ch vid_phy_status_sb_tx vid_phy_status_sb_rx \
                                                                   AUDIO_OUT VIDEO_OUT] 
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM] == 1} {
            set ss_connect($ss_topology,sourceIsInterfacePin)    [list sys_diff_clock M_AXIS DDC_OUT IIC M_AXI m_axis_video m_axis_keys \
                                                                   axis_audio_out LINK_DATA_OUT vid_phy_rx_axis_ch vid_phy_status_sb_tx vid_phy_status_sb_rx \
                                                                   AUDIO_OUT VIDEO_OUT DDR FIXED_IO]    
        } elseif {[string equal -nocase $var_PROCESSOR_TYPE ARM64] == 1} {
            set ss_connect($ss_topology,sourceIsInterfacePin)    [list sys_diff_clock M_AXIS DRU_CLK_IN DDC_OUT IIC M_AXI m_axis_video m_axis_keys \
                                                                   axis_audio_out LINK_DATA_OUT vid_phy_rx_axis_ch vid_phy_status_sb_tx vid_phy_status_sb_rx \
                                                                   AUDIO_OUT VIDEO_OUT] 
        } 

        
        # puts "set ss_connect($ss_topology,sourceIsInterfacePin) is [set ss_connect($ss_topology,sourceIsInterfacePin)]"
        # puts "source_objs IS \n"
        # puts "\t[join $source_objs \n\t]"
        
        set ss_connect($ss_topology,source) $source_objs
        generate_net_list $var_debug_en $source_objs    
        
        ############################## Developer define end here ############################
        
        # transfer the result from local namespace var into common namespace var
        array set var_con  [array get ss_connect]
        set var_topo $ss_topology
    
    }

    # proc to manipulate the config table for all leaf objects - DEFINE BY SUBSYSTEM DEVELOPER \
        - before going this proc, make sure the set_ss_param_varlist proc ocmpleted
    proc config_obj_property {tobe_config_obj tobe_config_obj_path} {
        
        variable ss_xgui_varlist
        
        ############################## Developer define start here ############################
        # only define variables that needed in this proc
        variable var_c_include_hdcp_1_4     
        variable var_c_include_hdcp_2_2     
        variable var_c_max_bits_per_component
        variable var_c_input_pixels_per_clock   
        variable var_c_addr_width
        variable var_c_hysteresis_level
        variable var_c_vid_interface    
        variable var_c_include_low_reso_vid 
        variable var_c_include_yuv420_sup
        variable var_c_edid_ram_size    
        variable var_c_hpd_invert_rx    

        variable var_C_TX_PLL_SELECTION           
        variable var_C_TX_REFCLK_SEL            
        variable var_C_RX_PLL_SELECTION         
        variable var_C_RX_REFCLK_SEL            
        variable var_C_NIDRU_REFCLK_SEL         
        variable var_GT_CHANNEL_SITE 
        
        variable var_PROCESSOR_TYPE   
        variable var_GT_TYPE 
        variable var_topology 
        variable var_c_nidru
        variable var_c_exdes_axilite_freq       
        variable var_tx_protocol    
        variable var_rx_protocol
        variable var_c_hdmi_version
        variable var_c_add_mark_dbg
        variable var_exdes_topology
        
        variable var_debug_en

        variable config_v_hdmi_tx_ss
        variable config_v_hdmi_rx_ss
        variable config_gt_refclk_buf
        variable config_dru_ibufds_gt_odiv
        variable config_vid_phy_controller
        variable config_vcc_const
        variable config_gnd_const
        variable config_gnd_array   
                                
        switch -regexp -matchvar varlist -- $tobe_config_obj {
                v_hdmi_tx_ss        {
                                      set config_v_hdmi_tx_ss(CONFIG.C_INCLUDE_HDCP_1_4)        $var_c_include_hdcp_1_4
                                      set config_v_hdmi_tx_ss(CONFIG.C_INCLUDE_HDCP_2_2)        $var_c_include_hdcp_2_2
                                      set config_v_hdmi_tx_ss(CONFIG.C_MAX_BITS_PER_COMPONENT)  $var_c_max_bits_per_component
                                      set config_v_hdmi_tx_ss(CONFIG.C_INPUT_PIXELS_PER_CLOCK)  $var_c_input_pixels_per_clock
                                      set config_v_hdmi_tx_ss(CONFIG.C_ADDR_WIDTH)              $var_c_addr_width
                                      set config_v_hdmi_tx_ss(CONFIG.C_INCLUDE_LOW_RESO_VID)    $var_c_include_low_reso_vid
                                      set config_v_hdmi_tx_ss(CONFIG.C_VID_INTERFACE)           $var_c_vid_interface
                                      set config_v_hdmi_tx_ss(CONFIG.C_INCLUDE_YUV420_SUP)      $var_c_include_yuv420_sup
                                      set config_v_hdmi_tx_ss(CONFIG.C_HYSTERESIS_LEVEL)        $var_c_hysteresis_level
                                      set config_v_hdmi_tx_ss(CONFIG.C_HPD_INVERT)              false
                                      set config_v_hdmi_tx_ss(CONFIG.C_VALIDATION_ENABLE)       false 
                                      set config_v_hdmi_tx_ss(CONFIG.C_HDMI_FAST_SWITCH)        true
                                      set config_v_hdmi_tx_ss(CONFIG.C_HDMI_VERSION)            $var_c_hdmi_version
                                      set config_v_hdmi_tx_ss(CONFIG.C_ADD_MARK_DBG)            $var_c_add_mark_dbg
                                      ::ss_common::go_config $tobe_config_obj_path config_v_hdmi_tx_ss
                                    }
                v_hdmi_rx_ss        {
                                      set config_v_hdmi_rx_ss(CONFIG.C_INCLUDE_HDCP_1_4)        $var_c_include_hdcp_1_4
                                      set config_v_hdmi_rx_ss(CONFIG.C_INCLUDE_HDCP_2_2)        $var_c_include_hdcp_2_2
                                      set config_v_hdmi_rx_ss(CONFIG.C_MAX_BITS_PER_COMPONENT)  $var_c_max_bits_per_component
                                      set config_v_hdmi_rx_ss(CONFIG.C_INPUT_PIXELS_PER_CLOCK)  $var_c_input_pixels_per_clock
                                      set config_v_hdmi_rx_ss(CONFIG.C_ADDR_WIDTH)              $var_c_addr_width
                                      set config_v_hdmi_rx_ss(CONFIG.C_INCLUDE_LOW_RESO_VID)    $var_c_include_low_reso_vid
                                      set config_v_hdmi_rx_ss(CONFIG.C_VID_INTERFACE)           $var_c_vid_interface
                                      set config_v_hdmi_rx_ss(CONFIG.C_INCLUDE_YUV420_SUP)      $var_c_include_yuv420_sup
                                      set config_v_hdmi_rx_ss(CONFIG.C_EDID_RAM_SIZE)           $var_c_edid_ram_size
                                      set config_v_hdmi_rx_ss(CONFIG.C_HPD_INVERT)              $var_c_hpd_invert_rx
                                      set config_v_hdmi_rx_ss(CONFIG.C_CD_INVERT)               true                                      
                                      set config_v_hdmi_rx_ss(CONFIG.C_VALIDATION_ENABLE)       false 
                                      set config_v_hdmi_rx_ss(CONFIG.C_HDMI_FAST_SWITCH)        true
                                      set config_v_hdmi_rx_ss(CONFIG.C_HDMI_VERSION)            $var_c_hdmi_version
                                      set config_v_hdmi_rx_ss(CONFIG.C_ADD_MARK_DBG)            $var_c_add_mark_dbg
                                      set config_v_hdmi_rx_ss(CONFIG.C_EXDES_TOPOLOGY)          $var_exdes_topology
                                      set config_v_hdmi_rx_ss(CONFIG.C_EXDES_NIDRU)             $var_c_nidru
                                      set config_v_hdmi_rx_ss(CONFIG.C_EXDES_AXILITE_FREQ)      $var_c_exdes_axilite_freq
                                      set config_v_hdmi_rx_ss(CONFIG.C_EXDES_TX_PLL_SELECTION)  $var_C_TX_PLL_SELECTION
                                      set config_v_hdmi_rx_ss(CONFIG.C_EXDES_RX_PLL_SELECTION)  $var_C_RX_PLL_SELECTION
                                      
                                      ::ss_common::go_config $tobe_config_obj_path config_v_hdmi_rx_ss
                                    }
                gt_refclk_buf       {
                                      ::ss_common::go_config $tobe_config_obj_path config_gt_refclk_buf
                                    }
                dru_ibufds_gt_odiv  {
                                      ::ss_common::go_config $tobe_config_obj_path config_dru_ibufds_gt_odiv
                                    }
                vid_phy_controller  {
                                      set config_vid_phy_controller(CONFIG.C_Tx_Protocol)            $var_tx_protocol               
                                      set config_vid_phy_controller(CONFIG.C_TX_PLL_SELECTION)       $var_C_TX_PLL_SELECTION 
                                      set config_vid_phy_controller(CONFIG.C_TX_REFCLK_SEL)          $var_C_TX_REFCLK_SEL
                                      set config_vid_phy_controller(CONFIG.C_Rx_Protocol)            $var_rx_protocol                                                     
                                      set config_vid_phy_controller(CONFIG.C_RX_PLL_SELECTION)       $var_C_RX_PLL_SELECTION 
                                      set config_vid_phy_controller(CONFIG.C_RX_REFCLK_SEL)          $var_C_RX_REFCLK_SEL 
                                      set config_vid_phy_controller(CONFIG.C_NIDRU)                  $var_c_nidru
                                      if {[string match -nocase $var_c_nidru true]} {
                                      set config_vid_phy_controller(CONFIG.C_NIDRU_REFCLK_SEL)       $var_C_NIDRU_REFCLK_SEL
                                      }
                                      set config_vid_phy_controller(CONFIG.C_INPUT_PIXELS_PER_CLOCK) $var_c_input_pixels_per_clock 
                                      set config_vid_phy_controller(CONFIG.CHANNEL_SITE)             $var_GT_CHANNEL_SITE
                                      set config_vid_phy_controller(CONFIG.Transceiver_Width)        $var_c_input_pixels_per_clock
                                      set config_vid_phy_controller(CONFIG.C_Txrefclk_Rdy_Invert)    1
                                      set config_vid_phy_controller(CONFIG.C_INT_HDMI_VER_CMPTBLE)   $var_c_hdmi_version
                                      ::ss_common::go_config $tobe_config_obj_path config_vid_phy_controller
                                    }                                   
                (.+)_const          {
                                      set var_const [lindex $varlist 1]
                                      if {[regexp $var_const vcc]} {
                                        ::ss_common::go_config $tobe_config_obj_path config_vcc_const
                                      } elseif {[regexp $var_const gnd]} {
                                        ::ss_common::go_config $tobe_config_obj_path config_gnd_const
                                      }
                                    }
                gnd_array           {
                                      ::ss_common::go_config $tobe_config_obj_path config_gnd_array
                                    }                                   
                                    
        }
    
        ############################## Developer define end here ############################
        
    }

    # NOT APPLICABLE FOR EXDES. Just for HIP generation 
    proc config_pin_property {ss_pin_name} {
    
        # placeholder
    
    }   

    # TBD for EXDES
    # new for HIP - 25Nov2014 - proc to configure the axi-lite address mapping 
    # 16 Dec 2015 - Obsolete and use tool auto address assignment
    proc assign_address_properties {} {
    
        ############################## Developer define start here ############################
        variable var_c_include_hdcp_1_4     
        variable var_c_include_hdcp_2_2     
        variable var_c_max_bits_per_component
        variable var_c_input_pixels_per_clock   
        variable var_c_addr_width
        variable var_c_hysteresis_level
        variable var_c_vid_interface    
        variable var_c_include_low_reso_vid
        variable var_c_include_yuv420_sup
        variable var_c_edid_ram_size        
        variable var_debug_en
        variable var_tx_protocol    
        variable var_rx_protocol    
        
        variable top_addr_axi_lite_space
        variable top_addr_axi_mm_space
        variable cur_addr_space
        variable addr_reg_index
        variable addr_reg_index_axi_mm
        
        variable config_addr_mapping_axi_lite
        variable config_addr_mapping_axi_mm
        
        
        ## format listing per line: leaf_object<space>AXILITE_PORT<space>addr_range<space>addr_base 
        set config_addr_mapping_axi_lite [list  v_hdmi_tx   S_AXI   64k 0x10000 \
                                                v_tc        ctrl    64k 0x20000]

            
            # set config_addr_mapping_axi_mm [list \
            #   axi_vdma    Data_S2MM       1G  0x80000000 \
            #   axi_vdma    Data_MM2S       1G  0x80000000 \
            #   v_deinterlacer  Data_m_axi_gmem     1G  0x80000000 \
            # ]
    
            ## axi-mm address mapping - only needed in full-fledged
            ## ::ss_common::get_top_addr_space_axi_mm top_addr_axi_mm_space cur_addr_space
            ## ::ss_common::go_assign_address_axi_mm top_addr_axi_mm_space cur_addr_space config_addr_mapping_axi_mm addr_reg_index_axi_mm
        
        ## axi-lite address space mapping - needed in both topologies
        ::ss_common::get_top_addr_space top_addr_axi_lite_space cur_addr_space
        ::ss_common::go_assign_address top_addr_axi_lite_space cur_addr_space config_addr_mapping_axi_lite addr_reg_index
        
        ############################## Developer define end here ############################
        
    }   

