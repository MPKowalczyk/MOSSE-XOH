
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
		variable var_c_placeholder		
		variable var_debug_en
		
		variable pin_cmd
		
		# reset the data structure and assign topology
		rst_data_struc ss_connect 1
		set ss_topology audio_ss_topo
		
		# ss_connect(<topology>,bdry,pinlist) [<all boundary pins for one topology>]
		set ss_connect($ss_topology,bdry,pinlist) [list ACLK S00_AXI axis_audio_in ARESETN hdmi_clk \
		                                                aud_acr_cts_in aud_acr_n_in aud_acr_valid_in \
		                                                aud_acr_cts_out aud_acr_n_out aud_acr_valid_out \
		                                                axis_audio_out aud_rstn audio_clk]
		
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
		set ss_topology audio_ss_topo
		
		# ss_connect(<topology>,leaf) [<all the needed leaf object per topology>]	-- bug, cannot use common word
		set ss_connect($ss_topology,leaf) [list axi_interconnect clk_wiz aud_pat_gen hdmi_acr_ctrl]
		
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
		variable var_c_placeholder		
		variable var_debug_en

		# reset the data structure and assign topology
		# rst_data_struc ss_connect 1
		set ss_topology audio_ss_topo
		set source_objs [list]
		set ss_connect($ss_topology,sourceIsInterfacePin) [list]
	
		lappend source_objs bdry_in
		set ss_connect($ss_topology,source2target,bdry_in,S00_AXI)           [list axi_interconnect   S00_AXI]
		set ss_connect($ss_topology,source2target,bdry_in,ACLK)              [list axi_interconnect   ACLK \
		                                                                           aud_pat_gen        axi_aclk \
																				   hdmi_acr_ctrl      axi_aclk \
																				   clk_wiz            s_axi_aclk \
																				   clk_wiz            clk_in1]
		set ss_connect($ss_topology,source2target,bdry_in,ARESETN)           [list axi_interconnect   ARESETN \
		                                                                           aud_pat_gen        axi_aresetn \
																				   hdmi_acr_ctrl      axi_aresetn \
																				   clk_wiz            s_axi_aresetn]
		set ss_connect($ss_topology,source2target,bdry_in,axis_audio_in)     [list aud_pat_gen        axis_audio_in]
		set ss_connect($ss_topology,source2target,bdry_in,aud_acr_cts_in)    [list hdmi_acr_ctrl      aud_acr_cts_in]
		set ss_connect($ss_topology,source2target,bdry_in,aud_acr_n_in)      [list hdmi_acr_ctrl      aud_acr_n_in]
		set ss_connect($ss_topology,source2target,bdry_in,aud_acr_valid_in)  [list hdmi_acr_ctrl      aud_acr_valid_in]
		set ss_connect($ss_topology,source2target,bdry_in,hdmi_clk)          [list hdmi_acr_ctrl      hdmi_clk]

		for {set i 0} {$i < 3} {incr i} {
		    if {$i == 0} {
		        set ss_connect($ss_topology,source2target,bdry_in,ACLK)    [concat [set ss_connect($ss_topology,source2target,bdry_in,ACLK)] \
				                                                                        axi_interconnect   S0${i}_ACLK \
				                                                                        axi_interconnect   M0${i}_ACLK]
		        set ss_connect($ss_topology,source2target,bdry_in,ARESETN) [concat [set ss_connect($ss_topology,source2target,bdry_in,ARESETN)] \
				                                                                        axi_interconnect   S0${i}_ARESETN \
				                                                                        axi_interconnect   M0${i}_ARESETN]  
		    }
			if {$i != 0} {
		        set ss_connect($ss_topology,source2target,bdry_in,ACLK)     [concat [set ss_connect($ss_topology,source2target,bdry_in,ACLK)] \
				                                                                         axi_interconnect   M0${i}_ACLK]
		        set ss_connect($ss_topology,source2target,bdry_in,ARESETN)  [concat [set ss_connect($ss_topology,source2target,bdry_in,ARESETN)] \
				                                                                         axi_interconnect   M0${i}_ARESETN]
			}
		}
		
		lappend source_objs axi_interconnect
		set ss_connect($ss_topology,source2target,axi_interconnect,M00_AXI)   [list aud_pat_gen     axi]
		set ss_connect($ss_topology,source2target,axi_interconnect,M01_AXI)   [list hdmi_acr_ctrl   axi]
		set ss_connect($ss_topology,source2target,axi_interconnect,M02_AXI)   [list clk_wiz         s_axi_lite]

		lappend source_objs aud_pat_gen
		set ss_connect($ss_topology,source2target,aud_pat_gen,axis_audio_out)  [list bdry_out  axis_audio_out]

		lappend source_objs hdmi_acr_ctrl
		set ss_connect($ss_topology,source2target,hdmi_acr_ctrl,aud_resetn_out)      [list bdry_out      aud_rstn \
		                                                                                   aud_pat_gen   axis_resetn]
		set ss_connect($ss_topology,source2target,hdmi_acr_ctrl,aud_acr_valid_out)   [list bdry_out      aud_acr_valid_out]
		set ss_connect($ss_topology,source2target,hdmi_acr_ctrl,aud_acr_cts_out)     [list bdry_out      aud_acr_cts_out]
		set ss_connect($ss_topology,source2target,hdmi_acr_ctrl,aud_acr_n_out)       [list bdry_out      aud_acr_n_out]

		lappend source_objs clk_wiz
		set ss_connect($ss_topology,source2target,clk_wiz,clk_out1)    [list bdry_out        audio_clk \
		                                                                     aud_pat_gen     axis_clk \
																			 aud_pat_gen     aud_clk \
																			 hdmi_acr_ctrl   aud_clk]
		set ss_connect($ss_topology,source2target,clk_wiz,locked)      [list hdmi_acr_ctrl   pll_lock_in]
		
		## remove any numbering exist in the interface signal name for the source list e,g S01_AXI, S02_AXI,...S0*_AXI will be tagged as S_AXI
		set ss_connect($ss_topology,sourceIsInterfacePin) [list S_AXI axis_audio_in M_AXI axis_audio_out]	
			
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
		variable var_c_placeholder		
		variable var_debug_en
		
	variable config_axi_interconnect
	variable config_clk_wiz
		
		switch -regexp -matchvar varlist -- $tobe_config_obj {
				axi_interconnect    {
				                      ::ss_common::go_config $tobe_config_obj_path config_axi_interconnect
				                    }
				clk_wiz             {
				                      ::ss_common::go_config $tobe_config_obj_path config_clk_wiz
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
		set config_addr_mapping_axi_lite [list	v_hdmi_tx	S_AXI	64k	0x10000 \
												v_tc		ctrl	64k	0x20000]

			
			# set config_addr_mapping_axi_mm [list \
			# 	axi_vdma	Data_S2MM		1G	0x80000000 \
			# 	axi_vdma	Data_MM2S		1G	0x80000000 \
			# 	v_deinterlacer	Data_m_axi_gmem 	1G	0x80000000 \
			# ]
	
			## axi-mm address mapping - only needed in full-fledged
			## ::ss_common::get_top_addr_space_axi_mm top_addr_axi_mm_space cur_addr_space
			## ::ss_common::go_assign_address_axi_mm top_addr_axi_mm_space cur_addr_space config_addr_mapping_axi_mm addr_reg_index_axi_mm
		
		## axi-lite address space mapping - needed in both topologies
		::ss_common::get_top_addr_space top_addr_axi_lite_space cur_addr_space
		::ss_common::go_assign_address top_addr_axi_lite_space cur_addr_space config_addr_mapping_axi_lite addr_reg_index
		
		############################## Developer define end here ############################
		
	}	

