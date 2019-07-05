
	# subsystem local structure to store available config: format [odd==Config even==value] \
	# e.g ss_router param list is 		   [list CONFIG.NUM_SI <> CONFIG.NUM_MI <>]
	variable ss_xgui_varlist [list]
	
	# GLOBAL VAR DECLARATION AND ASSIGNMENT
	variable var_c_max_bits_per_component   [list]
	variable var_c_input_pixels_per_clock   [list]	
		
	# CONSOLE DEBUG MESSAGE PRINTING ENABLEMENT
	variable var_debug_en [list]
	set var_debug_en      0
	
	# EXDES PORTS INFORMATION CONTAINER
	variable vary_attr_pinlist [list]
	variable pin_cmd
	array set pin_cmd {
		ap_clk               {-dir I -type CLK}
		m_axi_aresetn        {-dir I -type RST}
		S_AXI_TPG            {-mode slave -vlnv xilinx.com:interface:aximm_rtl:1.0}
		s_axis_video         {-mode slave -vlnv xilinx.com:interface:axis_rtl:1.0}
		S_AXI_GPIO           {-mode slave -vlnv xilinx.com:interface:aximm_rtl:1.0}
		m_axis_video         {-mode master -vlnv xilinx.com:interface:axis_rtl:1.0}
	}

	# FOR PORT CONFIGURABILITY 
	# example declaration
	# variable config_port_s_axi_cpu_aclk
	# array set config_port_s_axi_cpu_aclk {
	# 	CONFIG.ASSOCIATED_BUSIF			{S_AXI_CPU_IN}
	# 	CONFIG.ASSOCIATED_RESET			{s_axi_cpu_aresetn}
	# }
	# ** not applicable for hier 
	

	## VAR TO KEEP BLOCK NAME WITH GENERATION CMD \
		new (HIP): when define block_cmd's block name, do exclude any numbering for permutated blocks \
		example: for xlslice_<1/2/3/...>, define it as xlslice_
		
	## bmak: rtl ref module gen flow is required for rtl - NEW
	## bmak: hier gen flow is required for wrapper - NEW
	
	variable block_cmd 
	array set block_cmd {
		v_tpg                           {-type ip -vlnv xilinx.com:ip:v_tpg:7.0}
		axi_gpio                        {-type ip -vlnv xilinx.com:ip:axi_gpio:2.0}
	}                                   
	
	# FOR BLOCK CONFIGURABILITY 
	# example coding 
	# variable config_util_vector_logic	
	# array set config_util_vector_logic {
	# 	CONFIG.C_SIZE		{1}
	# 	CONFIG.C_OPERATION	{$C_OPERATION}
	# }
	
	variable config_v_tpg
	variable config_axi_gpio

	if {[array exist config_v_tpg]} {
		array unset config_v_tpg
	}
	array set config_v_tpg {
		CONFIG.SAMPLES_PER_CLOCK        {$C_INPUT_PIXELS_PER_CLOCK}
		CONFIG.MAX_DATA_WIDTH           {$C_MAX_BITS_PER_COMPONENT}
		CONFIG.HAS_AXI4S_SLAVE          {1}
        CONFIG.SOLID_COLOR              {0} 
        CONFIG.RAMP                     {0} 
        CONFIG.DISPLAY_PORT             {0} 
        CONFIG.COLOR_SWEEP              {0} 
        CONFIG.ZONE_PLATE               {0} 
        CONFIG.FOREGROUND               {0}
	}

	if {[array exist config_axi_gpio]} {
		array unset config_axi_gpio
	}
	array set config_axi_gpio {
		CONFIG.C_GPIO_WIDTH             {1}
		CONFIG.C_ALL_OUTPUTS            {1}
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
		
