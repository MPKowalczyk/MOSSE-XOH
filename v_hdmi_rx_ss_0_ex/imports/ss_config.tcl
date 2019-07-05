
set ss_top     exdes_top

namespace eval exdes_top {

	source ${srcIpDir}/exdes/bd/exdes_top/exdes_top_plugin_var.tcl
	source ${srcIpDir}/exdes/bd/exdes_top/exdes_top_plugin_func.tcl
		
	# source ./v_hdmi_tx_ss_plugin_var.tcl
	# source ./v_hdmi_tx_ss_plugin_func.tcl

}

namespace eval zynq_us_ss {
 	
 	source ${srcIpDir}/exdes/bd/zynq_us_ss/zynq_us_ss_plugin_var.tcl
 	source ${srcIpDir}/exdes/bd/zynq_us_ss/zynq_us_ss_plugin_func.tcl
 	#source ./zynq_us_ss_plugin_var.tcl
 	#source ./zynq_us_ss_plugin_func.tcl
}

namespace eval zynq_ss {
 	
 	source ${srcIpDir}/exdes/bd/zynq_ss/zynq_ss_plugin_var.tcl
 	source ${srcIpDir}/exdes/bd/zynq_ss/zynq_ss_plugin_func.tcl
	# source ./zynq_ss_plugin_var.tcl
	# source ./zynq_ss_plugin_func.tcl 
}
 
namespace eval mb_ss {
 	
 	source ${srcIpDir}/exdes/bd/mb_ss/mb_ss_plugin_var.tcl
 	source ${srcIpDir}/exdes/bd/mb_ss/mb_ss_plugin_func.tcl
	# source ./mb_ss_plugin_var.tcl
	# source ./mb_ss_plugin_func.tcl
 
}

namespace eval v_tpg_ss {
	
	source ${srcIpDir}/exdes/bd/v_tpg_ss/v_tpg_ss_plugin_var.tcl
	source ${srcIpDir}/exdes/bd/v_tpg_ss/v_tpg_ss_plugin_func.tcl
	# source ./v_tpg_ss_plugin_var.tcl
	# source ./v_tpg_ss_plugin_func.tcl

}

namespace eval audio_ss {
	
	source ${srcIpDir}/exdes/bd/audio_ss/audio_ss_plugin_var.tcl
	source ${srcIpDir}/exdes/bd/audio_ss/audio_ss_plugin_func.tcl
	# source ./audio_ss_plugin_var.tcl
	# source ./audio_ss_plugin_func.tcl

}
