
# Sourcing helper functions
# set srcFile [get_files ss_plugin_util.tcl]
# source $srcFile 

# source ./ss_plugin_util.tcl
source ${srcIpDir}/exdes/bd/framework/ss_plugin_util.tcl

# BELOW ARE ALL SD SPECIFIC FUNCTIONS

    # NOT APPLICABLE FOR EXDES. Just for HIP generation
    # proc to remap params, manipulate params and return post generation param [optional] list that required for data structures generation
    proc ss_param_assignment {varlist} {
    
        # fix and do not change
        variable ss_xgui_varlist
        set ss_xgui_varlist $varlist
        
        ############################## Developer define start here ############################
        
        # internal use variable 
        variable var_c_placeholder  
        variable var_debug_en   
        
        # remapping the ss_xgui_varlist into usable variable within this proc 
        set var_c_include_hdcp_1_4 [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_INCLUDE_HDCP_1_4] + 1]]
        set var_c_include_hdcp_2_2 [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_INCLUDE_HDCP_2_2] + 1]]
        set var_c_max_bits_per_component [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_MAX_BITS_PER_COMPONENT] + 1]]
        set var_c_input_pixels_per_clock [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_INPUT_PIXELS_PER_CLOCK] + 1]]
        set var_c_addr_width [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_ADDR_WIDTH] + 1]]
        set var_c_hysteresis [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_HYSTERESIS_LEVEL] + 1]]
        set var_c_vid_interface [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_VID_INTERFACE] + 1]]
        set var_c_include_low_reso_vid [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_INCLUDE_LOW_RESO_VID] + 1]]
        set var_c_include_yuv420_sup [lindex $ss_xgui_varlist [expr [lsearch $ss_xgui_varlist CONFIG.C_INCLUDE_YUV420_SUP] + 1]]

        # enable debug mode (Developer define required value: 0 - disable; 1 - enable)
        set var_debug_en 0
    
        # initialize and assign internal use variables - NA

        # print debug msg -  variable with its value
        if {$var_debug_en == 1} {
            puts "DBG_MSG - data structure - ss_param_assignment:"
            puts "include_hdcp_1_4           =  $var_c_include_hdcp_1_4"
            puts "include_hdcp_2_2           =  $var_c_include_hdcp_2_2"
            puts "max_bits_per_component     =  $var_c_max_bits_per_component"
            puts "input_pixels_per_clock     =  $var_c_input_pixels_per_clock"
            puts "addr_width                 =  $var_c_addr_width"
            puts "hysteresis                 =  $var_c_hysteresis"
            puts "vid_interface              =  $var_c_vid_interface"
            puts "include_low_reso_vid       =  $var_c_include_low_reso_vid"
            puts "include_yuv420_sup         =  $var_c_include_yuv420_sup"
            puts ""
        }
        
        ############################## Developer define end here ############################
                
    }

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

        variable var_include_val
        variable var_has_frame_crc
        
        variable var_debug_en
        
        variable pin_cmd
        
        # reset the data structure and assign topology
        rst_data_struc ss_connect 1
        set ss_topology mb_ss_topo
        
        # ss_connect(<topology>,bdry,pinlist) [<all boundary pins for one topology>]
        if {$var_debug_en == 1} {
            puts "include_hdcp_1_4           =  $var_c_include_hdcp_1_4"
            puts "include_hdcp_2_2           =  $var_c_include_hdcp_2_2"
        }
                                     
        set ss_connect($ss_topology,bdry,pinlist) [list CLK_IN1_D ext_reset_in hdmi_rx_irq hdmi_tx_irq vphy_irq \
                                                        IIC UART clk_out2 dcm_locked peripheral_aresetn s_axi_aclk]                                  

        #===================================
        set var_axi_intercon_num_mi 9
        
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+2]
        }
        
        if {[string match -nocase $var_include_val true]} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+4]
        }
        if {$var_has_frame_crc == 1} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+1]
        }

        #===================================
        set var_num_irq_ports 3
        
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            set var_num_irq_ports [expr $var_num_irq_ports+4]
        }
        
        if {[string match -nocase $var_c_include_hdcp_2_2 true]} {
            set var_num_irq_ports [expr $var_num_irq_ports+4]
        }
        

        for {set i 0} {$i < $var_axi_intercon_num_mi} {incr i} {
            if {$i < 10 && $i != 3 && $i != 4 && $i != 7} {
                set ss_connect($ss_topology,bdry,pinlist)    [concat [set ss_connect($ss_topology,bdry,pinlist)] \
                                                                     M0${i}_AXI]
            } elseif {$i > 9} {
                set ss_connect($ss_topology,bdry,pinlist)    [concat [set ss_connect($ss_topology,bdry,pinlist)] \
                                                                     M${i}_AXI]
            }
        }
            
        for {set i 0} {$i < $var_num_irq_ports} {incr i} {
            if {$i >= 3} {
                set ss_connect($ss_topology,bdry,pinlist)    [concat [set ss_connect($ss_topology,bdry,pinlist)] \
                                                                     In${i}]
            } 
        }                               
        
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
        variable var_c_placeholder      
        variable var_debug_en
        
        ## ** not applicable for hier 
    
    }

    # FOR UPDATE_BD USAGE
    # proc to generate the leaf objs data struc that will be used for subsystem generation 
    proc get_leaf_blocks {var_connect var_topology {upvar_num 1} {shadow_copy 1}} {
        upvar $upvar_num $var_connect var_con
        upvar $upvar_num $var_topology var_topo
        
        ############################## Developer define start here ############################
        # only define variables that needed in this proc
        variable var_c_placeholder      
        variable var_debug_en
        
        # reset the data structure and assign topology
        # rst_data_struc ss_connect 1
        set ss_topology mb_ss_topo
        
        # ss_connect(<topology>,leaf) [<all the needed leaf object per topology>]   -- bug, cannot use common word
        set ss_connect($ss_topology,leaf) [list axi_interconnect xlconcat axi_intc \
                                                rst_processor_1_100M rst_processor_1_300M mdm mblaze \
                                                clk_wiz fmch_axi_iic axi_uartlite dlmb_v10 ilmb_v10 \
                                                dlmb_bram_if_cntlr ilmb_bram_if_cntlr lmb_bram]
        
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
        variable var_include_val
        variable var_has_frame_crc
        
        variable var_debug_en
        
        #===================================
        variable var_axi_intercon_num_mi
        variable var_num_irq_ports      
        
        set var_axi_intercon_num_mi 9
        
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+2]
        }
        
        if {[string match -nocase $var_include_val true]} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+4]
        }
        if {$var_has_frame_crc == 1} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+1]
        }
        
        #===================================
        set var_num_irq_ports 3
        
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            set var_num_irq_ports [expr $var_num_irq_ports+4]
        }
        
        if {[string match -nocase $var_c_include_hdcp_2_2 true]} {
            set var_num_irq_ports [expr $var_num_irq_ports+4]
        }
                
        
        # reset the data structure and assign topology
        # rst_data_struc ss_connect 1
        set ss_topology mb_ss_topo
        set source_objs [list]
        set ss_connect($ss_topology,sourceIsInterfacePin) [list]
    
        lappend source_objs bdry_in
        set ss_connect($ss_topology,source2target,bdry_in,CLK_IN1_D)        [list clk_wiz                CLK_IN1_D]
        set ss_connect($ss_topology,source2target,bdry_in,ext_reset_in)     [list rst_processor_1_100M   ext_reset_in \
                                                                                  rst_processor_1_300M   ext_reset_in \
                                                                                  clk_wiz                reset]
        set ss_connect($ss_topology,source2target,bdry_in,vphy_irq)         [list xlconcat               In0]
        set ss_connect($ss_topology,source2target,bdry_in,hdmi_rx_irq)      [list xlconcat               In1]
        set ss_connect($ss_topology,source2target,bdry_in,hdmi_tx_irq)      [list xlconcat               In2]
        for {set i 3} {$i < $var_num_irq_ports} {incr i} {                                                               
            set ss_connect($ss_topology,source2target,bdry_in,In${i})       [list xlconcat               In${i}]
        }
        
        lappend source_objs xlconcat
        set ss_connect($ss_topology,source2target,xlconcat,dout)            [list axi_intc   intr]  
        
        lappend source_objs axi_intc
        set ss_connect($ss_topology,source2target,axi_intc,interrupt)       [list mblaze   INTERRUPT]
        
        lappend source_objs mdm
        set ss_connect($ss_topology,source2target,mdm,MBDEBUG_0)            [list mblaze           DEBUG]
        set ss_connect($ss_topology,source2target,mdm,Debug_SYS_Rst)        [list rst_processor_1_100M   mb_debug_sys_rst]

        lappend source_objs rst_processor_1_100M
        set ss_connect($ss_topology,source2target,rst_processor_1_100M,mb_reset)              [list mblaze           Reset] 
        set ss_connect($ss_topology,source2target,rst_processor_1_100M,bus_struct_reset)      [list dlmb_v10             SYS_Rst \
                                                                                                  ilmb_v10             SYS_Rst \
                                                                                                  dlmb_bram_if_cntlr   LMB_Rst \
                                                                                                  ilmb_bram_if_cntlr   LMB_Rst]
        set ss_connect($ss_topology,source2target,rst_processor_1_100M,interconnect_aresetn)  [list axi_interconnect     ARESETN]
        set ss_connect($ss_topology,source2target,rst_processor_1_100M,peripheral_aresetn)    [list axi_intc             s_axi_aresetn \
                                                                                                  fmch_axi_iic         s_axi_aresetn \
                                                                                                  axi_uartlite         s_axi_aresetn \
                                                                                                  axi_interconnect     S00_ARESETN \
                                                                                                  bdry_out             peripheral_aresetn]

        for {set i 0} {$i < $var_axi_intercon_num_mi} {incr i} {
            if {$i < 10 && $i != 5 && $i != 8} {
            set ss_connect($ss_topology,source2target,rst_processor_1_100M,peripheral_aresetn)    [concat [set ss_connect($ss_topology,source2target,rst_processor_1_100M,peripheral_aresetn)] \
                                                                                                             axi_interconnect    M0${i}_ARESETN]
            } elseif {$i > 9 && $i != 5 && $i != 8} {
            set ss_connect($ss_topology,source2target,rst_processor_1_100M,peripheral_aresetn)    [concat [set ss_connect($ss_topology,source2target,rst_processor_1_100M,peripheral_aresetn)] \
                                                                                                             axi_interconnect    M${i}_ARESETN]
            }
        }
        
        lappend source_objs mblaze
        set ss_connect($ss_topology,source2target,mblaze,DLMB)        [list dlmb_v10              LMB_M]
        set ss_connect($ss_topology,source2target,mblaze,ILMB)        [list ilmb_v10              LMB_M]
        set ss_connect($ss_topology,source2target,mblaze,M_AXI_DP)    [list axi_interconnect      S00_AXI]

        lappend source_objs clk_wiz
        set ss_connect($ss_topology,source2target,clk_wiz,clk_out1)        [list axi_intc              s_axi_aclk \
                                                                                 rst_processor_1_100M    slowest_sync_clk \
                                                                                 mblaze            Clk \
                                                                                 dlmb_v10              LMB_Clk \
                                                                                 ilmb_v10              LMB_Clk \
                                                                                 dlmb_bram_if_cntlr    LMB_Clk \
                                                                                 ilmb_bram_if_cntlr    LMB_Clk \
                                                                                 fmch_axi_iic          s_axi_aclk \
                                                                                 axi_uartlite          s_axi_aclk \
                                                                                 axi_interconnect      ACLK \
                                                                                 axi_interconnect      S00_ACLK \
                                                                                 bdry_out              s_axi_aclk]
                                                                                 
        for {set i 0} {$i < $var_axi_intercon_num_mi} {incr i} {
            if {$i < 10 && $i != 5 && $i != 8} {
            set ss_connect($ss_topology,source2target,clk_wiz,clk_out1)    [concat [set ss_connect($ss_topology,source2target,clk_wiz,clk_out1)] \
                                                                                        axi_interconnect     M0${i}_ACLK]
            } elseif {$i > 9 && $i != 5 && $i != 8} {
            set ss_connect($ss_topology,source2target,clk_wiz,clk_out1)    [concat [set ss_connect($ss_topology,source2target,clk_wiz,clk_out1)] \
                                                                                        axi_interconnect     M${i}_ACLK]
            }
        }       
                                                                                 
        set ss_connect($ss_topology,source2target,clk_wiz,clk_out2)        [list axi_interconnect      M05_ACLK \
                                                                                 axi_interconnect      M08_ACLK \
                                                                                 rst_processor_1_300M  slowest_sync_clk \
                                                                                 bdry_out              clk_out2]
        set ss_connect($ss_topology,source2target,clk_wiz,locked)          [list rst_processor_1_100M  aux_reset_in \
                                                                                 rst_processor_1_100M  dcm_locked \
                                                                                 rst_processor_1_300M  aux_reset_in \
                                                                                 rst_processor_1_300M  dcm_locked]                                                                                   
                                                                                
        lappend source_objs rst_processor_1_300M    
        set ss_connect($ss_topology,source2target,rst_processor_1_300M,interconnect_aresetn)  [list axi_interconnect      M05_ARESETN \
                                                                                                    axi_interconnect      M08_ARESETN]
        set ss_connect($ss_topology,source2target,rst_processor_1_300M,peripheral_aresetn)    [list bdry_out              dcm_locked]
        

        lappend source_objs fmch_axi_iic
        set ss_connect($ss_topology,source2target,fmch_axi_iic,IIC)    [list bdry_out     IIC]
        lappend source_objs axi_uartlite
        set ss_connect($ss_topology,source2target,axi_uartlite,UART)    [list bdry_out     UART]

        lappend source_objs axi_interconnect
        set ss_connect($ss_topology,source2target,axi_interconnect,M03_AXI)    [list axi_uartlite     S_AXI]
        set ss_connect($ss_topology,source2target,axi_interconnect,M04_AXI)    [list fmch_axi_iic     S_AXI]
        set ss_connect($ss_topology,source2target,axi_interconnect,M07_AXI)    [list axi_intc         s_axi]
        for {set i 0} {$i < $var_axi_intercon_num_mi} {incr i} {
            if {$i < 10 && $i != 3 && $i != 4 && $i != 7} {
            set ss_connect($ss_topology,source2target,axi_interconnect,M0${i}_AXI)    [list bdry_out     M0${i}_AXI]
            } elseif {$i > 9 && $i != 3 && $i != 4 && $i != 7} {
            set ss_connect($ss_topology,source2target,axi_interconnect,M${i}_AXI)     [list bdry_out     M${i}_AXI]
            }       
        }
        
        lappend source_objs dlmb_v10
        set ss_connect($ss_topology,source2target,dlmb_v10,LMB_Sl_0)    [list dlmb_bram_if_cntlr     SLMB]
        lappend source_objs ilmb_v10
        set ss_connect($ss_topology,source2target,ilmb_v10,LMB_Sl_0)    [list ilmb_bram_if_cntlr     SLMB]
        lappend source_objs dlmb_bram_if_cntlr
        set ss_connect($ss_topology,source2target,dlmb_bram_if_cntlr,BRAM_PORT)    [list lmb_bram     BRAM_PORTA]
        lappend source_objs ilmb_bram_if_cntlr
        set ss_connect($ss_topology,source2target,ilmb_bram_if_cntlr,BRAM_PORT)    [list lmb_bram     BRAM_PORTB]   
    

        ## remove any numbering exist in the interface signal name for the source list e,g S01_AXI, S02_AXI,...S0*_AXI will be tagged as S_AXI
        set ss_connect($ss_topology,sourceIsInterfacePin) [list CLK_IN_D interrupt MBDEBUG_ DLMB ILMB M_AXI_DP IIC UART M_AXI LMB_Sl_ BRAM_PORT]    
            
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
        variable var_BOARD_SYS_CLK_NAME         
        variable var_BOARD_SYS_CLK_FREQ        
        variable var_BOARD_AXILITE_FREQ
        variable var_BOARD_SYS_RESET_NAME   
        
        variable var_include_val        
        variable var_has_frame_crc      
        variable var_debug_en
        
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
        
        #===================================
        variable var_axi_intercon_num_mi
        variable var_num_irq_ports      
        
        set var_axi_intercon_num_mi 9
        
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+2]
        }
        
        if {[string match -nocase $var_include_val true]} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+4]
        }
        if {$var_has_frame_crc == 1} {
            set var_axi_intercon_num_mi [expr $var_axi_intercon_num_mi+1]
        }
        
        #===================================
        set var_num_irq_ports 3
        
        if {[string match -nocase $var_c_include_hdcp_1_4 true]} {
            set var_num_irq_ports [expr $var_num_irq_ports+4]
        }
        
        if {[string match -nocase $var_c_include_hdcp_2_2 true]} {
            set var_num_irq_ports [expr $var_num_irq_ports+4]
        }       
        
        switch -regexp -matchvar varlist -- $tobe_config_obj {
                ^axi_uartlite       {
                                      ::ss_common::go_config $tobe_config_obj_path config_axi_uartlite
                                    }
                ^clk_wiz            {
                                      set config_clk_wiz(CONFIG.CLK_IN1_BOARD_INTERFACE)     $var_BOARD_SYS_CLK_NAME
                                      set config_clk_wiz(CONFIG.RESET_BOARD_INTERFACE)       $var_BOARD_SYS_RESET_NAME
                                      set config_clk_wiz(CONFIG.CLKOUT2_USED)                true
                                      set config_clk_wiz(CONFIG.CLKOUT2_REQUESTED_OUT_FREQ)  $var_BOARD_SYS_CLK_FREQ
                                      set config_clk_wiz(CONFIG.CLKOUT1_REQUESTED_OUT_FREQ)  $var_BOARD_AXILITE_FREQ
                                      set config_clk_wiz(CONFIG.PRIM_SOURCE)                 Differential_clock_capable_pin
                                      set config_clk_wiz(CONFIG.NUM_OUT_CLKS)                2
                                      ::ss_common::go_config $tobe_config_obj_path config_clk_wiz
                                    }
                ^fmch_axi_iic       {
                                      ::ss_common::go_config $tobe_config_obj_path config_fmch_axi_iic
                                    }
                ^mblaze             {
                                      ::ss_common::go_config $tobe_config_obj_path config_mblaze
                                    }
                ^axi_interconnect   {
                                        set config_axi_interconnect(CONFIG.NUM_MI) $var_axi_intercon_num_mi
                                        ::ss_common::go_config $tobe_config_obj_path config_axi_interconnect
                                    }
                ^xlconcat           {
                                        set config_xlconcat(CONFIG.NUM_PORTS) $var_num_irq_ports
                                        ::ss_common::go_config $tobe_config_obj_path config_xlconcat
                                    }                                               
                ^rst_processor_1_100M {
                                      ::ss_common::go_config $tobe_config_obj_path config_rst_processor_1_100M
                                    }
                ^rst_processor_1_300M {
                                      ::ss_common::go_config $tobe_config_obj_path config_rst_processor_1_300M
                                    }
                ^dlmb_v10           {
                                      ::ss_common::go_config $tobe_config_obj_path config_dlmb_v10
                                    }
                ^ilmb_v10           {
                                      ::ss_common::go_config $tobe_config_obj_path config_ilmb_v10
                                    }
                ^dlmb_bram_if_cntlr {
                                      ::ss_common::go_config $tobe_config_obj_path config_dlmb_bram_if_cntlr
                                    }
                ^ilmb_bram_if_cntlr {
                                      ::ss_common::go_config $tobe_config_obj_path config_ilmb_bram_if_cntlr
                                    }
                ^lmb_bram           {
                                      ::ss_common::go_config $tobe_config_obj_path config_lmb_bram
                                    }
        }
    
        ############################## Developer define end here ############################
        
    }

    # NOT APPLICABLE FOR EXDES. Just for HIP generation
    proc config_pin_property {ss_pin_name} {
    
        # placeholder
    
    }   

    # TBD for EXDEES
    # new for HIP - 25Nov2014 - proc to configure the axi-lite address mapping 
    # 16 Dec 2015 - Obsolete and use tool auto address assignment
    proc assign_address_properties {} {
    
        ############################## Developer define start here ############################
        variable var_c_placeholder  
        variable var_debug_en   
        
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

