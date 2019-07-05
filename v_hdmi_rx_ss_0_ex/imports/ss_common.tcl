
# developed based on 2013.1 vivado IPI canvas

set comment {
THIS IS COMMON PACKAGE CONTAINS ALL THE COMMON PROCS AND SS_CORE NAMESPACE
}

package provide ss_common_package 1.0

namespace eval ::ss_common {

	## common variable - top
	variable ss_top              [list]
	variable ss_topology         [list]
	variable ss_hier_lvl         0
	variable obj_name_path       [list]
	variable ss_connect
	# stack storage (FirtIn-LastOut) - for hier subsystem
	variable ss_top_stack_FILO   [list]
	variable ss_topology_FILO    [list]
	variable ss_hier_lvl_FILO    [list]
	
	# new 24Oct
	# pending - all common variable should define in ss_common_variable.tcl - looks more organize
	variable ss_xgui_config_list [list]
	
	## source all the required namespace files
	## ss_top value defined under this tcl
	# set srcFile [get_files ss_config.tcl]
	# source $srcFile 
	
	# source ./ss_config.tcl
	source ${srcIpDir}/exdes/bd/framework/ss_config.tcl
	
	# FOR COMMON USE
	namespace export rst_bd_struc
	namespace export get_xgui_param_list
	namespace export get_xgui_param_value
	namespace export get_obj_hier
	namespace export set_absolute_path
	namespace export ss_param_assignment	
	namespace export get_bdry_pinlist
	namespace export get_pinCmd_list
	namespace export remove_permutate_obj_numbering
	namespace export generate_bdry_pin
	namespace export config_obj_port_property
	namespace export go_config
	namespace export get_leaf_blocks
	namespace export get_blockCmd_list
	namespace export generate_obj_block
	namespace export config_obj_property
	namespace export get_ss_connectivity
	namespace export get_source_list
	namespace export get_source_net_list
	namespace export go_connect

	# for hier ss
	namespace export get_leaf_ss_namespace
	namespace export stack_top_n_topology
	namespace export update_hier_subsystem
	namespace export unstack_top_n_topology	
	
	# refined
	namespace export remove_suffix
	namespace export remove_all_pins
	namespace export remove_all_blocks
	namespace export remove_obj_block
	namespace export nets_remove
	namespace export get_obj_name
	namespace export tag_list
	namespace export remove_bdry_pin

	
	# required cross function call to specific susbsystem function \
		- must 1st call proc set_ss_param_varlist prior using the remaining procs
#	namespace export set_ss_param_varlist
	namespace export temp_address_map
#	namespace export wrap_gen_3main_Data_Struc
#	namespace export display_xgui_param_value
	namespace export get_hier_ss_param_list
	namespace export display_pin_cmd

# END TESTING PROC	
	
# START NEW FOR HIP - 2Dec2014

	namespace export assign_address_properties
	namespace export get_top_addr_space
	namespace export get_top_addr_space_axi_mm
	namespace export go_assign_address
	namespace export go_assign_address_axi_mm
	

# ################################# FOR COMMON USE - START	
	
# to reset the BD data struc contents and rebuild else just build
proc rst_bd_struc {arrayName} {
	upvar 1 $arrayName var
	if [array exists var] {
		array unset var
		array set var {}
	} else {
		array set var {}
	}
}

# to obtain the current xgui param list to KEY cur_param
proc get_xgui_param_list {obj_name arrayName {upvar_num 0}} {

	upvar [expr $upvar_num + 1] $arrayName var
	variable obj_name_path;
	
	if ![array exists var] {
		puts "ALERT! - PLEASE RESET BD DATA STRUC BEFORE USING THIS PROC"
		##break
        return
	} 
	
    ## this method may be called for the hierarchical IP itself (i.e., current_inst)
    ## or for sub-cores within the hierarchical IP.  we need to handle these 2 
    ## cases differently
    set xgui_list ""
    set hip_name [::ipxit::current_instname]
    if { $obj_name == $hip_name } {
      ## called for the HIP itself.  get the params directly from XIT
      set current_bd_instance [::ipxit::current_inst]
      set props [list_property $current_bd_instance]
	  set xgui_list [regexp -inline -all {CONFIG.\S+} $props]
    } else {
	  set obj_name_path [get_bd_cells $obj_name_path]	
	  set xgui_list [regexp -inline -all {CONFIG.\S+} [list_property $obj_name_path]]  
	
	  # below line is for testing
	  # set xgui_list [list CONFIG.Component_Name CONFIG.VFC_OPT CONFIG.VFC_NUM TEST1.ABC TEST2.ABC ]
    }

    if { [llen $xgui_list] == 0 } {
	  puts "ALERT! - NO PARAMS FOUND FOR OBJ $obj_name"
    }

	set idx [lsearch $xgui_list "CONFIG.Component_Name"]
	set xgui_list [lreplace $xgui_list $idx $idx]
	set var($obj_name,cur_param) $xgui_list

}

# to obtain the current xgui param value to KEY of the respected item within the cur_param list
proc get_xgui_param_value {obj_name arrayName {upvar_num 0}} {

	upvar [expr $upvar_num + 1] $arrayName var
	variable obj_name_path;

	if [expr [llength $var($obj_name,cur_param)] == 0] {
		puts "ALERT! - EMPTY CURRENT XGUI PARAM LIST DETECTED IN BD DATA STRUC"
		##break
        return
	}

    ## this method may be called for the hierarchical IP itself (i.e., current_inst)
    ## or for sub-cores within the hierarchical IP.  we need to handle these 2 
    ## cases differently
    set xgui_list ""
    set hip_name [::ipxit::current_instname]
    if { $obj_name == $hip_name } {
      set current_bd_instance [::ipxit::current_inst]
	  foreach xgui_param [lsort $var($obj_name,cur_param)] {
	    set xgui_param_value [get_property $xgui_param $current_bd_instance]	
	    set var($obj_name,cur_param,$xgui_param) $xgui_param_value
	  }
    } else {
	  foreach xgui_param [lsort $var($obj_name,cur_param)] {
	    set xgui_param_value [get_property $xgui_param $obj_name_path]	
	    set var($obj_name,cur_param,$xgui_param) $xgui_param_value
	  }
	}
	
}

# to obtain the hierarchy level of an appcore \
	- return 1 if is top, subsequent 2,3 and onwards numbers are for hierarchical 2nd level, 3rd level and onwards level respectively
proc get_obj_hier {obj_name arrayName {upvar_num 0}} {
	upvar [expr $upvar_num + 1] $arrayName var
	variable obj_name_path;
	
	set var($obj_name,hier) [regexp -all / $obj_name_path]

}

# to obtain absoulte path of the obj
proc set_absolute_path {obj_name arrayName {upvar_num 0}} {
	upvar [expr $upvar_num + 1] $arrayName var
	set var($obj_name,abs_path) [current_bd_instance .]
}

# to remap/manipulate the param list into local namespace variables that will be used for data struc generation
proc ss_param_assignment {obj_name arrayName {upvar_num 0}} {
	upvar [expr $upvar_num + 1] $arrayName var
	variable ss_xgui_config_list
	variable ss_top
	
	set ss_xgui_config_list [list]
	set key_xgui_list $var($obj_name,cur_param)
	foreach key_xgui $key_xgui_list {
		set ss_xgui_config_list [concat $ss_xgui_config_list $key_xgui $var($obj_name,cur_param,${key_xgui})]
	}
	
	${ss_top}::ss_param_assignment $ss_xgui_config_list

}

# to get the bdry_pinlist data struc from a particular ss namespace
proc get_bdry_pinlist {} {
	variable ss_top
	variable ss_connect
	variable ss_topology
	
	${ss_top}::get_bdry_pinlist ss_connect ss_topology
	return $ss_connect(${ss_topology},bdry,pinlist)
	
}

# to return the pin command list by refer to a pin list  
# 27Oct (updated)
proc get_pinCmd_list {pinlist} {
	# variable pin_cmd
	variable ss_top
	global ::ss_common::${ss_top}::pin_cmd
	set cmd_list [list]
	
	## a pinlist must have minimun of 1 pin name
	if [expr [llength $pinlist] == 0] {
		puts "INFO - ss_common - EMPTY PINLIST DETECTED"
		return [list]
	}
	
	foreach item $pinlist {
		if ([regexp -all $item [array get pin_cmd]]) {
			# puts "INFO 1 - item is $item"
			set item_cmd $pin_cmd($item)
			lappend cmd_list $item_cmd
		} else {
			set item [remove_permutate_obj_numbering $item]
			# puts "INFO 2 - item is $item"
			set item_cmd $pin_cmd($item)
			lappend cmd_list $item_cmd
		}
	}
	
	return $cmd_list
}

# to generate the boundary pins
proc generate_bdry_pin {obj_name arrayName {upvar_num 0} pinlist cmdlist} {

	upvar [expr $upvar_num + 1] $arrayName var
	set pinlist_len [llength $pinlist]
	set cmdlist_len [llength $cmdlist]
	
	if {[expr $pinlist_len != $cmdlist_len]} {
		puts "ALERT! - PINLIST ($pinlist_len) AND CMDLIST ($cmdlist_len)LENGTH DOES NOT MATCHED"
        return
	}

    ## this method is called to create ports on the system top-level and
    ## pins on lower-level blocks.  need to differentiate
    set is_top [string match [current_bd_instance .] "/"]
	
	for {set i 0} {$i < $pinlist_len} {incr i} {
	
		set pin_item [lindex $pinlist $i]
		set cmd_item [lindex $cmdlist $i]
		set is_intf [regexp {mode} $cmd_item]
	
        if {$is_top} {
			## if TOP
		  if {[expr $is_intf == 1] && ([get_bd_intf_ports -quiet /${pin_item}] == "")} {
	        ## create interface pin
			set pIntf_${pin_item} [eval create_bd_intf_port $cmd_item $pin_item]
			
		  } elseif {[expr $is_intf == 0] && ([get_bd_ports -quiet /${pin_item}] == "")} {
			## create pin
			set p_${pin_item} [eval create_bd_port $cmd_item $pin_item]
			
		  }
        } else {
			## if Hier
		  if {[expr $is_intf == 1] && ([get_bd_intf_pins -quiet $var($obj_name,abs_path)/${pin_item}] == "")} {
			## create interface pin
			set pIntf_${pin_item} [eval create_bd_intf_pin $cmd_item $pin_item]

		  } elseif {[expr $is_intf == 0] && ([get_bd_pins -quiet $var($obj_name,abs_path)/${pin_item}] == "")} {
			## create pin
			set p_${pin_item} [eval create_bd_pin $cmd_item $pin_item]
		  }
        }
	}

}

proc config_obj_port_property {tobe_config_obj tobe_config_obj_path} {
	variable ss_top
	${ss_top}::config_obj_port_property $tobe_config_obj $tobe_config_obj_path
}

# to config the targeted lef object \
	- required args - target_object, target_config_table
proc go_config {target_obj target_obj_table {upvar_num 1}} {
	upvar $upvar_num $target_obj_table cfg_table

	set property_list [list]

	foreach {property_key property_value} [array get cfg_table] {
		set property_list [concat $property_list $property_key $property_value]
	}

	#puts "target_obj is $target_obj"
	#puts "property_list is $property_list"
	set_property -dict $property_list $target_obj
	
}

# to get the leaf_objects data struc from a particular ss namespace
proc get_leaf_blocks {} {

	variable ss_top
	variable ss_connect
	variable ss_topology
	
	${ss_top}::get_leaf_blocks ss_connect ss_topology
	return $ss_connect(${ss_topology},leaf)
	
}

# to return the block command list by refer to a block list  
proc get_blockCmd_list {blocklist} {
	variable ss_top
	global ::ss_common::${ss_top}::block_cmd
	set cmd_list [list]
	
	## a pinlist must have minimun of 1 pin name
	if [expr [llength $blocklist] == 0] {
		puts "INFO - ss_common - EMPTY GENERATE BLOCKLIST DETECTED"
		return
	}
	
	foreach item $blocklist {
		if ([regexp -all $item [array get block_cmd]]) {
			set item_cmd $block_cmd($item)
			lappend cmd_list $item_cmd
		} else {
			set item [remove_permutate_obj_numbering $item]
			## puts "item is $item after remove_permutate_obj_numbering"
			set item_cmd $block_cmd($item)
			lappend cmd_list $item_cmd
		}
	}
	
	return $cmd_list
}

# to generate object blocks base on given object list
proc generate_obj_block {obj_name arrayName {upvar_num 0} blocklist cmdlist} {

	upvar [expr $upvar_num + 1] $arrayName var
	set blocklist_len [llength $blocklist]
	set cmdlist_len [llength $cmdlist]
		
	for {set i 0} {$i < $blocklist_len} {incr i} {
		set block_name [lindex $blocklist $i]
		set block_cmd [lindex $cmdlist $i]
		#puts "block_name is $block_name"
		#puts "block_cmd is $block_cmd"
		#set temp_gen_block "create_bd_cell $block_cmd"
		#puts "temp_gen_block is $temp_gen_block"
		set blk_${block_name} [eval create_bd_cell $block_cmd $block_name]
	}		

}

# to config all leaf objects within a subsystem
proc config_obj_property {tobe_config_obj tobe_config_obj_path} {
	variable ss_top
	${ss_top}::config_obj_property $tobe_config_obj $tobe_config_obj_path
	
}

# to get the connectivity data struc from a particular ss namespace
proc get_ss_connectivity {} {
	variable ss_top
	variable ss_connect
	variable ss_topology
	
	${ss_top}::get_ss_connectivity ss_connect ss_topology
}

# to get the source point list
proc get_source_list {} {
	variable ss_connect
	variable ss_topology
	return $ss_connect(${ss_topology},source)
}

# to return all the nets that required in the subsystem build
proc get_source_net_list {} {
	variable ss_topology
	variable ss_connect
	return $ss_connect(${ss_topology},all_net_list)
}

# to generate connection by giving the required arguments \
	- required args - source_item, source_pin
proc go_connect {obj_name arrayName {upvar_num 0} source_item source_pin source_cmd} {
	upvar [expr $upvar_num + 1] $arrayName var
	variable ss_connect
	variable ss_topology
	
	set net_name "${source_cmd}_${source_item}_${source_pin}"
	
	## obtain target info
	set target_list $ss_connect(${ss_topology},source2target,${source_item},${source_pin})
	set target_len [expr [llength $target_list]/2]
	set index_target_item 0
	set index_target_pin 1
	
# source_item is bdry_in
# source_pin is HDMI_RX_DAT_N_IN
# source_cmd is net
	
	for {set i 0} {$i < $target_len} {incr i} {
	
		set target_item [lindex $ss_connect(${ss_topology},source2target,${source_item},${source_pin}) $index_target_item]
		set target_pin  [lindex $ss_connect(${ss_topology},source2target,${source_item},${source_pin}) $index_target_pin]
		[incr index_target_item 2]
		[incr index_target_pin 2]
	
		## consider boundary pin 
		## note: temporary not support bypass scenario which input pin direct connect to output pin
		if {[string match $source_cmd net]} {
			if {[string match $source_item bdry_in]} {
				## from input port connect to internal block
				##set source_path {[get_bd_pins $var($obj_name,abs_path)/${source_pin}]}
				set source_path {[get_bd_pins ${source_pin}]}
				##set target_path {[get_bd_pins $var($obj_name,abs_path)/${target_item}/${target_pin}]}
				set target_path {[get_bd_pins ${target_item}/${target_pin}]}
				[eval connect_bd_net -quiet -net $net_name $source_path $target_path]
			} elseif {[string match $target_item bdry_out]} {
				## from internal block connect to output pin
				##set source_path {[get_bd_pins $var($obj_name,abs_path)/${source_item}/${source_pin}]}
				set source_path {[get_bd_pins ${source_item}/${source_pin}]}
				##set target_path {[get_bd_pins $var($obj_name,abs_path)/${target_pin}]}
				set target_path {[get_bd_pins ${target_pin}]}
				[eval connect_bd_net -quiet -net $net_name $source_path $target_path]
			} else {
				## interconnect between blocks
				##set source_path {[get_bd_pins $var($obj_name,abs_path)/${source_item}/${source_pin}]}
				set source_path {[get_bd_pins ${source_item}/${source_pin}]}
				##set target_path {[get_bd_pins $var($obj_name,abs_path)/${target_item}/${target_pin}]}
				set target_path {[get_bd_pins ${target_item}/${target_pin}]}
				[eval connect_bd_net -quiet -net $net_name $source_path $target_path]
			}
		} elseif {[string match $source_cmd intf_net]} {
			if {[string match $source_item bdry_in]} {
				## from input port connect to internal block
				set source_path {[get_bd_intf_pins $var($obj_name,abs_path)/${source_pin}]}
				set target_path {[get_bd_intf_pins $var($obj_name,abs_path)/${target_item}/${target_pin}]}
				[eval connect_bd_intf_net -quiet -intf_net $net_name $source_path $target_path]
			} elseif {[string match $target_item bdry_out]} {
				## from internal block connect to output pin
				set source_path {[get_bd_intf_pins $var($obj_name,abs_path)/${source_item}/${source_pin}]}
				set target_path {[get_bd_intf_pins $var($obj_name,abs_path)/${target_pin}]}
				[eval connect_bd_intf_net -quiet -intf_net $net_name $source_path $target_path]
			} else {
				## interconnect between blocks
				set source_path {[get_bd_intf_pins $var($obj_name,abs_path)/${source_item}/${source_pin}]}
				set target_path {[get_bd_intf_pins $var($obj_name,abs_path)/${target_item}/${target_pin}]}
				[eval connect_bd_intf_net -quiet -intf_net $net_name $source_path $target_path]
			}
		}

	}

}


# ################################# FOR COMMON USE - END


# ################################# FOR HIER SS - START	

# to return the namespace of a leaf subsystem object
proc get_leaf_ss_namespace {w_suffix_leaf_ss} {

	switch -regexp -matchvar varlist -- $w_suffix_leaf_ss {
		v_tpg_ss_(.+)    {	
		                   return v_tpg_ss
		                 }
		audio_ss_(.+)    {
		                   return audio_ss
		                 }
		mb_ss_(.+)   	 {
		                   return mb_ss
		                 }
		zynq_ss_(.+)   	 {
		                   return zynq_ss
		                 }						 
		zynq_us_ss_(.+)   	 {
		                   return zynq_us_ss
		                 }						 						 
		default          {
		                   puts "ALERT! - NO HIER NAMESPACE FOUND"
		                   return unknown
					     }
	}

}

# stack the current info before release the variable "ss_top and ss_topology" for other usage
proc stack_top_n_topology {hier_obj_namespace} {
	variable ss_top
	variable ss_topology
	variable ss_hier_lvl
	variable ss_top_stack_FILO
	variable ss_topology_FILO
	variable ss_hier_lvl_FILO
	
	set ss_top_stack_FILO [concat $ss_top_stack_FILO $ss_top]
	set ss_topology_FILO [concat $ss_topology_FILO $ss_topology]
	set ss_hier_lvl_FILO [concat $ss_hier_lvl_FILO $ss_hier_lvl]
	set ss_top $hier_obj_namespace
	set ss_topology [list]
	set ss_hier_lvl [expr $ss_hier_lvl + 1]
	
}

# to generate the hier in exdes
proc update_hier_subsystem {obj_name arrayName {upvar_num 0} leaf_name} {

	# puts "###################### LEAF SUBSYSTEM - $leaf_name - STARTED ######################"
	
	# start update_hier_subsystem
	upvar [expr $upvar_num + 1] $arrayName var
	
	variable ss_top
	variable ss_topology
	variable ss_hier_lvl
	
	set upvar_ref_${ss_hier_lvl} [expr $upvar_num + 1]
	
	### PIN GENERATION START
	
	#1 	- initialize the local parameter of lower hier subsystem 
	# ${ss_top}::set_ss_param_varlist $ss_param_list
	# ${ss_top}::ss_param_assignment $ss_param_list -- not applicable for exdes
	
	#2 [optional] - for debug purpose
	# display_ss_param_config on
	
	#3 - get current bdry_pinlist + attr_vary_pinlist
	# set hier_${ss_hier_lvl}_cur_obj_pinlist [concat [get_bdry_pinlist] [get_attr_vary_pinlist]]
	set hier_${ss_hier_lvl}_cur_obj_pinlist [get_bdry_pinlist]
	
	#4 - generate hier object bdry pins (27Oct updated)
	# set hier_${ss_hier_lvl}_nosuffix_pinlist [remove_suffix [set hier_${ss_hier_lvl}_cur_obj_pinlist]]
	# set hier_${ss_hier_lvl}_cmdlist [get_pinCmd_list [set hier_${ss_hier_lvl}_nosuffix_pinlist]]
	set hier_${ss_hier_lvl}_cmdlist [get_pinCmd_list [set hier_${ss_hier_lvl}_cur_obj_pinlist]]
	generate_bdry_pin $obj_name $arrayName [set upvar_ref_${ss_hier_lvl}] [set hier_${ss_hier_lvl}_cur_obj_pinlist] [set hier_${ss_hier_lvl}_cmdlist]

	### PIN GENERATION END
	
	### INTERNAL BUILD START
	
	#6 - get current objs list
	set hier_${ss_hier_lvl}_cur_obj_list [get_leaf_blocks]
	
	#7 - sort all current leaf objectss for block generation
	set hier_${ss_hier_lvl}_tobe_generated_ss [list]
	set hier_${ss_hier_lvl}_tobe_generated_non_ss [list]
	# 26Nov2014 - prefix ss_* changed to suffix _ss_* (max support up to 10 instances start from index 0 till 9)
	foreach cur_obj_${ss_hier_lvl} [set hier_${ss_hier_lvl}_cur_obj_list] {
		if {[regexp -all _ss_[0-9]$ [set cur_obj_${ss_hier_lvl}]]} {
			#7.1 - enter here if the leaf object is a lower hier subsystem block
			set hier_${ss_hier_lvl}_tobe_generated_ss [concat [set hier_${ss_hier_lvl}_tobe_generated_ss] [set cur_obj_${ss_hier_lvl}]]
		
		} else {
			#7.2 - enter here if the_tobe_generated_non_ss leaf object is not a lower hier subsystem block
			set hier_${ss_hier_lvl}_tobe_generated_non_ss [concat [set hier_${ss_hier_lvl}_tobe_generated_non_ss] [set cur_obj_${ss_hier_lvl}]]
			
		}
	}	

	#8 - block generation for non lower hier subsystem leaf object (27Oct updated)
	# set hier_${ss_hier_lvl}_nosuffix_tobe_generated_non_ss [remove_suffix [set hier_${ss_hier_lvl}_tobe_generated_non_ss]]
	# set hier_${ss_hier_lvl}_cmdlist [get_blockCmd_list [set hier_${ss_hier_lvl}_nosuffix_tobe_generated_non_ss]]
	set hier_${ss_hier_lvl}_cmdlist [get_blockCmd_list [set hier_${ss_hier_lvl}_tobe_generated_non_ss]]
	generate_obj_block $obj_name $arrayName [set upvar_ref_${ss_hier_lvl}] [set hier_${ss_hier_lvl}_tobe_generated_non_ss] [set hier_${ss_hier_lvl}_cmdlist]

	#9 - configuration for non lower hier subsystem leaf object
	foreach hier_${ss_hier_lvl}_obj_config [set hier_${ss_hier_lvl}_tobe_generated_non_ss] {
		set temp_obj [set hier_${ss_hier_lvl}_obj_config]
		set hier_${ss_hier_lvl}_obj_config_target [get_bd_cells $var($obj_name,abs_path)/$temp_obj]
		config_obj_property [set hier_${ss_hier_lvl}_obj_config] [set hier_${ss_hier_lvl}_obj_config_target]
		set temp_obj [list]
	}

	#10 - block generation for lower hier subsystem leaf object (complex) - havnt tested yet (use display subsystem to test out)
	foreach leaf_ss_${ss_hier_lvl} [set hier_${ss_hier_lvl}_tobe_generated_ss] {
	
		# 10.1 - reassign for hier_obj_name and its namespace (without suffix)
		set ss_obj_name_${ss_hier_lvl} [set leaf_ss_${ss_hier_lvl}]
		set nosuffix_ss_obj_name_${ss_hier_lvl} [get_leaf_ss_namespace [set ss_obj_name_${ss_hier_lvl}]]
		
		#10.4 - create the cell for hier object 
		set hier_obj_${ss_hier_lvl} [create_bd_cell -type hier [set ss_obj_name_${ss_hier_lvl}]]	
		
		#10.2 - construct the config table for hier object at hier namespace
		# config_obj_property [set ss_obj_name_${ss_hier_lvl}] [set hier_obj_${ss_hier_lvl}] -- not applicable for exdes
		
		#10.3 - create the hier param list
		# set hier_${ss_hier_lvl}_ss_param_list [get_hier_ss_param_list [set nosuffix_ss_obj_name_${ss_hier_lvl}]] -- not applicable for exdes
		
		#10.5 - stack the current ss_top and ss_topology before parsing the variable for hier object to use
		stack_top_n_topology [set nosuffix_ss_obj_name_${ss_hier_lvl}]
		
		#10.6 - go to the hier object's hierarchy
		current_bd_instance [set hier_obj_${ss_hier_lvl}]
		set var($obj_name,abs_path) [set hier_obj_${ss_hier_lvl}]
		
		#10.7 - generate the internal of lower hier object
		update_hier_subsystem $obj_name $arrayName [set upvar_ref_${ss_hier_lvl}] [set ss_obj_name_${ss_hier_lvl}]
		
		#10.8 - return to 1 level hierarchy up from hier object
		current_bd_instance ..
		set var($obj_name,abs_path) [current_bd_instance .]
		
		#10.9 - unstack the info to current ss_top and ss_topology
		set ss_hier_lvl [unstack_top_n_topology]
		
	}	

	#11 - lower hier subsystem internal build up
	get_ss_connectivity
	#11.1 - get all the source points in one subsystem
	set source_block_list [get_source_list]
	#11.2 - get all the net objects name in one subsystem
	set source_net_list [get_source_net_list]

	#11.3 - internal connectivity generation
	foreach source_item $source_block_list {
		set index_cmd		1 
		set index_pin		2
		set search_list [regexp -inline -all "\(\\S\+\)_${source_item}_\(\\S\+\)" $source_net_list]
		set iter_num [expr [llength $search_list]/3]

		## sorting and build connect
		for {set i 0} {$i < $iter_num} {incr i} {
			set source_cmd [lindex  $search_list $index_cmd]
			set source_pin [lindex $search_list $index_pin]
			[incr index_cmd 3]
			[incr index_pin 3]
			go_connect $obj_name $arrayName [set upvar_ref_${ss_hier_lvl}] $source_item $source_pin $source_cmd
			
		}
	}	

	### INTERNAL BUILD END
	# puts "###################### LEAF SUBSYSTEM - $leaf_name - ENDED ######################"
}

# unstack the info into the variable "ss-top and ss_topology"
proc unstack_top_n_topology {} {
	variable ss_top
	variable ss_topology
	variable ss_hier_lvl
	variable ss_top_stack_FILO
	variable ss_topology_FILO
	variable ss_hier_lvl_FILO
	
	set ss_top 		[lindex $ss_top_stack_FILO end]
	set ss_topology	[lindex $ss_topology_FILO end]
	set ss_hier_lvl [lindex $ss_hier_lvl_FILO end]
	set ss_top_stack_FILO 	[lreplace $ss_top_stack_FILO end end]
	set ss_topology_FILO	[lreplace $ss_topology_FILO end end]
	set ss_hier_lvl_FILO	[lreplace $ss_hier_lvl_FILO end end]

	return $ss_hier_lvl
}















# ################################# FOR HIER SS - END




proc remove_permutate_obj_numbering {pin_or_block} {
	
	set removed_pin_or_block [regsub -all [0-9] $pin_or_block ""]
	return $removed_pin_or_block
	
}


	
proc assign_address_properties {} {
	variable ss_top
	
	${ss_top}::assign_address_properties
	
}

proc get_top_addr_space {top_addr_space current_addr_space {upvar_num 1}} {
	upvar $upvar_num $top_addr_space ss_top_address_space
	upvar $upvar_num $current_addr_space ss_current_addr_space
	
	set ss_current_addr_space [current_bd_instance .]
	current_bd_instance

        #In  tcl, a bd_addr_space is equivilent to both address spaces, which
        #are usually referenced by master interfaces, and memory maps, which are usually
	#referenced by slave interfaces. When interfaces are made external (i.e. get_bd_intf_port
	#then the relationship is reversed, (slave external interfaces on the inner 
	#scoped_bd surface of the hip generate address spaces while master interfaces 
	#generate memory maps containing slave address blocks). The line below is to obtain 
	#the external address space into  which to map the slave blocks to be presented 
	#on its surface
	
	set ss_top_address_space [get_bd_addr_space -of_objects [get_bd_intf_ports -filter {Mode == "Slave" && vlnv =~ *aximm_rtl*}]]

	current_bd_instance $ss_current_addr_space

}

proc get_top_addr_space_axi_mm {top_addr_space current_addr_space {upvar_num 1}} {
	upvar $upvar_num $top_addr_space ss_top_address_space
	upvar $upvar_num $current_addr_space ss_current_addr_space
	
	set ss_current_addr_space [current_bd_instance .]
	current_bd_instance

        #In  tcl, a bd_addr_space is equivilent to both address spaces, which
        #are usually referenced by master interfaces, and memory maps, which are usually
	#referenced by slave interfaces. When interfaces are made external (i.e. get_bd_intf_port
	#then the relationship is reversed, (slave external interfaces on the inner 
	#scoped_bd surface of the hip generate address spaces while master interfaces 
	#generate memory maps containing slave address blocks). The line below is to obtain 
	#the external address space into  which to map the slave blocks to be presented 
	#on its surface
	
	set intf_axi_mm [get_bd_intf_ports -filter {Mode == "Master" && vlnv =~ *aximm_rtl*}]/Reg
	puts "intf_axi_mm is $intf_axi_mm"
	set ss_top_address_space [get_bd_addr_segs $intf_axi_mm]

	current_bd_instance $ss_current_addr_space

}


proc go_assign_address {target_top_addr_space target_cur_addr_space target_config_addr_mapping target_reg_index {upvar_num 1}} {
	upvar $upvar_num $target_top_addr_space config_top_addr_space
	upvar $upvar_num $target_cur_addr_space config_cur_addr_space
	upvar $upvar_num $target_config_addr_mapping config_addr_table
	upvar $upvar_num $target_reg_index config_reg_index
	
	foreach {prop_obj prop_addr_pin prop_addr_range prop_addr_base} [split $config_addr_table " "] {
		
		create_bd_addr_seg -range $prop_addr_range -offset [format 0x%x [expr $prop_addr_base]] $config_top_addr_space \
			[get_bd_addr_segs -of_objects [get_bd_intf_pins ${config_cur_addr_space}/${prop_obj}/${prop_addr_pin}]] reg${config_reg_index}
		
		set config_reg_index [incr config_reg_index 1]

	}
	
}

proc go_assign_address_axi_mm {target_top_addr_space target_cur_addr_space target_config_addr_mapping target_reg_index {upvar_num 1}} {
	upvar $upvar_num $target_top_addr_space config_top_addr_space
	upvar $upvar_num $target_cur_addr_space config_cur_addr_space
	upvar $upvar_num $target_config_addr_mapping config_addr_table
	upvar $upvar_num $target_reg_index config_reg_index
	
	foreach {prop_obj prop_addr_pin prop_addr_range prop_addr_base} [split $config_addr_table " "] {
		
		create_bd_addr_seg -range $prop_addr_range -offset [format 0x%x [expr $prop_addr_base]] \
			[get_bd_addr_spaces /${prop_obj}/${prop_addr_pin}] \
			[get_bd_addr_segs ${config_top_addr_space}] reg${config_reg_index}
		
		set config_reg_index [incr config_reg_index 1]

	}
	
}


# to invoke specific wrapper function of one subsystem - top level
proc wrap_gen_3main_Data_Struc {} {
	variable ss_top
	variable ss_connect
	variable ss_topology
	# array set ss_connect [list]
	# we shadow copy the content ss_connect and ss_topology from SD namespace into common variable
	${ss_top}::wrap_gen_3main_Data_Struc ss_connect ss_topology
	
	# ${ss_top}::gen_3main_Data_Struc -- we cannot direct call this because :\
		- we need to keep independent ss_connect and ss_topology data struc between FW and SD namespace \
		- the SD namespace has reset the ss_connect for evey calling and this will cause issue for multiple hierarchy appcore because \
			multiple system has used one ss_connect from ss_common to store the history information. e.g when jumping from one system into another smaller system.\
			therefore common_namespace var must be held independent and should not interrupt by lower namespace function
	
}


# create the hier param list from the config table, e.g  [list CONFIG.XXX <value> CONFIG.YYY <value> and so on]
proc get_hier_ss_param_list {config_obj} {
	variable ss_top
	set config_obj_list [${ss_top}::get_hier_ss_param_list $config_obj]
	return $config_obj_list
}


# to remove suffix for every items within a pinlist if there is any. \
	- after remove, we can get the use tihs return pinlist to obtain the pincmd \
	- the return list should have same length as the proc argument list
proc remove_suffix {pinlist} {
	
	set pinlist_len [llength $pinlist]
	
	for {set i 0} {$i < $pinlist_len} {incr i} {
		set item [lindex $pinlist $i]
		set item_no_suffix [lindex [regexp -inline {(\S+)_[0-9]} $item] 1]
		if {[llength $item_no_suffix]} {
			set pinlist [lreplace $pinlist $i $i $item_no_suffix]
		} else {
			set pinlist [lreplace $pinlist $i $i $item]
		}
	}
	
	return $pinlist
}

# to remove all the pins. This proc must invoke at appcore hierarchy level
proc remove_all_pins {} {

	foreach item_cmd {intf_pins pins} {
		set remove_pin_list [get_bd_${item_cmd}]
		foreach remove_single_pin $remove_pin_list {
			delete_bd_objs $remove_single_pin
		}
	}
	
}

# to remove all the leaf objects. This proc must invoke at appcore hierarchy level
proc remove_all_blocks {} {

	foreach item_blocks [get_bd_cells -quiet] {
		delete_bd_objs $item_blocks
	}

}


# to remove object blocks base on given object list
proc remove_obj_block {obj_name arrayName {upvar_num 1} blocklist} {
	upvar $upvar_num $arrayName var
	set blocklist_len [llength $blocklist]
	
	if {[expr $blocklist_len == 0]} {
		puts "INFO - TO BE DELETED BLOCK LIST EMPTY"
		return
	}
	
	for {set i 0} {$i < $blocklist_len} {incr i} {
		set block_item [lindex $blocklist $i]
		
		if {[get_bd_cells $var($obj_name,abs_path)/${block_item}] != ""} {
			delete_bd_objs [get_bd_cells $var($obj_name,abs_path)/${block_item}]
		} else {
			puts "INFO - ss_common - TO BE DELETED BLOCK WAS NOT FOUND."
		}
	}
	
}

# proc to remove all nets
proc nets_remove {} {
	delete_bd_objs 	[get_bd_nets]
	delete_bd_objs	[get_bd_intf_nets]
}	


# return obj_name and keep the obj_name_path as local var. must consider multiple hierarchical achild appcore scenario
proc get_obj_name {obj_path} {
	variable obj_name_path;
	set obj_name_path $obj_path
	return [lindex [split $obj_path /] end]
}

# to add prefix and suffix of one pinlist \
	- mainly use by parent appcore bd.tcl \
	- recommend: prefix -> obj_name, suffix -> number of objs
proc tag_list {pinlist {suffix ""} {prefix ""}} {

	# a pinlist must have minimun of 1 pin name
	if [expr [llength $pinlist] == 0] {
		puts "INFO - ss_common - EMPTY PINLIST DETECTED"
		##break
        return
	}
	
	set pinlist_tagged [list]
	
	foreach item $pinlist {
		set item_tagged ${prefix}${item}${suffix}
		lappend pinlist_tagged $item_tagged
	}
	
	return $pinlist_tagged
	
}


# to remove the boundary pins
proc remove_bdry_pin {obj_name arrayName {upvar_num 0} pinlist} {
    send_dbg_msg 1 "***Enter remove_bdry_pin - $obj_name/$pinlist"
	upvar [expr $upvar_num + 1] $arrayName var
	set pinlist_len [llength $pinlist]
	
	if {[expr $pinlist_len == 0]} {
		return
	}
	

	for {set i 0} {$i < $pinlist_len} {incr i} {
		set pin_item [lindex $pinlist $i]
		
		## get from tobe_used.tcl codes for implementation
		if {[get_bd_ports -quiet /${pin_item}] != ""} {
			## detect pin_item is an pin and exists on bdry
			set delete_item [get_bd_ports /${pin_item}]
		} elseif {[get_bd_intf_ports -quiet /${pin_item}] != ""} {
			## detect pin_item is an interface pin and exists on the bdry
			set delete_item [get_bd_intf_ports /${pin_item}]
		} else {
			##puts "INFO - ss_common - TO BE DELETED PIN FOR PIN $pin_item IS NOT EXISTS"
			break
		}
		delete_bd_objs $delete_item
		unset delete_item
			
	}
 
    send_dbg_msg 1 "***Exit remove_bdry_pin"
}

# testing
proc display_pin_cmd {} {
	variable ss_top
	global ::ss_common::${ss_top}::pin_cmd
	
	puts "display_pin_cmd is [array get pin_cmd]"
}


# to genearte a xgui LIST that have key param with it's value 
proc set_ss_param_varlist {obj_name arrayName {upvar_num 0}} {
	upvar [expr $upvar_num + 1] $arrayName var
	variable ss_top
	variable ss_xgui_config_list
	
	set ss_xgui_config_list [list]
	set key_xgui_list $var($obj_name,cur_param)
	
	foreach key_xgui $key_xgui_list {
		set ss_xgui_config_list [concat $ss_xgui_config_list $key_xgui $var($obj_name,cur_param,${key_xgui})]
	}
	
	${ss_top}::set_ss_param_varlist $ss_xgui_config_list
	#puts "ss_xgui_config_list is $ss_xgui_config_list"
	
}


# bmak: temporary workaround for address mapping
proc temp_address_map {} {
	variable ss_top
	
	${ss_top}::temp_address_map 
	
}


} 
# END EVAL
