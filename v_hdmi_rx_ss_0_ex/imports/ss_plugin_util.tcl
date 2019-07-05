
# ALL HELPER PROCS DEFINED HERE

proc generate_net_list {{debug_en 0} source_objs} {

	# user need to edit below 4 lines only per different subsystem. <name>_topology and <name>__connect
	variable ss_connect
	variable ss_topology
	
	## required array variables
	# 1- set ss_connect(vfc_topo,source) 									[concat bdry_in [set ss_connect(vfc_topo,leaf)]]
	# 2- set ss_connect(vfc_topo,sourceIsInterfacePin)						[list video_in ctrl M00_AXI M01_AXI M_AXIS]
	# 3- set ss_connect(vfc_topo,source2target,$source_point,$source_pin)	[list ...]
	
	set ss_connect(${ss_topology},all_net_list)	[list]
	# set leaf_objs 			[set ss_connect(${ss_topology},source)]
	# set leaf_objs 			[concat bdry_in [set ss_connect(${ss_topology},leaf)]]
	set leaf_objs           $source_objs
	set isInterface         [set ss_connect(${ss_topology},sourceIsInterfacePin)]
	set key_source2target   [array names ss_connect]
	set all_nets_list       [list]
	
	# process run per leaf object
	 foreach net_obj	$leaf_objs {
	
		#puts "net_obj is $net_obj"
	 	set pattern_matched_key_list [list]
	 	set net_obj_pattern ${ss_topology},source2target,${net_obj}
		set net_obj_pattern "${net_obj_pattern},"
		
		#puts "net_obj_pattern is $net_obj_pattern \n"
		
	 	# get all the source2target list keys per leaf object
	 	foreach item $key_source2target {
			# puts "item is $item \n"
	 		if {[regexp $net_obj_pattern $item]} {
				# puts "item is $item"
	 			set pattern_matched_key_list [concat $pattern_matched_key_list $item]
	 		}
	 	}
	
		#puts "pattern_matched_key_list is $pattern_matched_key_list"
		
	 	set pattern_matched_pin_list [list]
	 	# get all the source_pin 
	 	foreach item $pattern_matched_key_list {
	 		set pattern_matched_pin_list [concat $pattern_matched_pin_list [lindex [split $item ,] 3]]
	 	}

		# puts "pattern_matched_pin_list is $pattern_matched_pin_list \n"
		
	 	# start net creation
		# 27Oct updated
	 	foreach item $pattern_matched_pin_list {
			set item_remove_permutate_num [regsub -all [0-9] $item ""]
	 		if {[expr [lsearch $isInterface $item_remove_permutate_num] == -1]} {
	 			# not Interface
				# puts "net_item is $item for object $net_obj"
	 			set all_nets_list [concat $all_nets_list net_${net_obj}_${item}]
	 		} else {
	 			# is Interface
				# puts "intf_net_item is $item for object $net_obj"
	 			set all_nets_list [concat $all_nets_list intf_net_${net_obj}_${item}]
	 		}
	 	}
	
	 }
	
	set ss_connect(${ss_topology},all_net_list) $all_nets_list
	
	# baoshan - permanent disable as this is for debug purpose only
	## set debug_en 2
 	if {[expr $debug_en >= 1]} {
 		puts "DBG_MSG - data structure - generate_net_list:"
 		puts "\t[join $all_nets_list \n\t]"
		puts ""
 	}
	
}

proc rst_data_struc {arrayName ref_level} {
		upvar $ref_level $arrayName var
		if [array exists var] {
			array unset var
			array set var {}
		} else {
			array set var {}
		}
}

proc display_ss_param_config {{state on} ss_name} {	
	variable ss_xgui_varlist

	if {[string match $state on]} {
		puts "##################################################"
		puts "$ss_name CONFIG PARAMS WITH VALUES SHOWN AS BELOW:"
		for {set display_i 0} {$display_i < [llength $ss_xgui_varlist]} {incr display_i 2} {
			puts "[lindex $ss_xgui_varlist $display_i] => [lindex $ss_xgui_varlist [expr $display_i + 1]]"
		}
		puts "##################################################"
	} 

}

proc get_attr_vary_pinlist {} {

	variable ss_connect
	variable ss_topology
	variable vary_attr_pinlist
	
	set return_vary_attr_pinlist [list]
	set cur_bdry_pinlist $ss_connect($ss_topology,bdry,pinlist)
	
	foreach item_attr_vary_pin $vary_attr_pinlist {
		if {!([lsearch -inline $cur_bdry_pinlist $item_attr_vary_pin] == "")} {
			# if vary_attr_pin is in the current bdry_pinlist
			config_pin_property $item_attr_vary_pin
			set return_vary_attr_pinlist [concat $return_vary_attr_pinlist $item_attr_vary_pin]
		}
	}
	
	# match bdry_pin then return else return nothing
	return $return_vary_attr_pinlist
}

proc get_hier_ss_param_list {config_ss_obj} {
	
	# only define subsystem leaf obj's config table
	variable config_${config_ss_obj}
	set return_config_list [list]
	# puts "get_hier_ss_param_list ss_display"
	# puts "[array get config_ss_vfc]"
	
	foreach {key value} [array get config_${config_ss_obj}] {
		set return_config_list [concat $return_config_list $key $value]
	}
	return $return_config_list
	

}


# HELPER PROC DESCRIPTION
# Input_args 	- input arguments that need to parse into the proc
# Local_vars 	- local variable that required for this proc to process
# Function 		- the usage of this function
# Output		- the generated result by the function
# Return		- the data/information that will be returned at the end of function
# 
# 1) generate_net_list
# 	Input_args	: debug_en (1 or 0)
# 					- to display output's content
# 	Local_vars	: ss_connect, ss_topology; 3 data structures must be defined before using this proc, they are
# 					- ss_connect($ss_topology,source)
# 					- ss_connect($ss_topology,sourceIsInterfacePin)
# 					- ss_connect($ss_topology,source2target,$source_point,$source_pin)
# 	Function	: To generate one of the main data structures for net object. This data struc will keep in local var
# 	Output		: ss_connect(${ss_topology},all_net_list)
# 	Return		: NA
# 	
# 2) rst_data_struc
# 	Input_args	: arrayName, ref_level
# 					- handle to the array that need to be reset
# 	Local_vars	: NA
# 	Function	: To clear the data structure contents
# 	Output		: empty data structure
# 	Return		: NA
# 	
# 3) display_ss_param_config
# 	Input_args	: state (on or any), ss_name
# 					- enable or disable display of ss_name subsystem param list
# 	Local_vars	: NA
# 	Function	: display the subsystem parameter configuration keys + values
# 	Output		: list of parameter keys + values
# 	Return		: NA
# 	
# 4) get_attr_vary_pinlist
# 	Input_args	: NA
# 	Local_vars	: ss_connect, ss_topology, vary_attr_pinlist
# 	Function	: compare the current genearetd bdry pinlist with attr_vary_pinlist item, if matched, configured the pin property and store for return list
# 	Output		: property pin get configured 
# 	Return		: matched pinlist
# 	Note		:
# 					we cant merge this with get_bdry_pin because in framework, we do comparison with previous bdry pin \
# 					and change of attr required that pin to be regenrating) as such, \
# 					attr_vary pin need to regularly get regenerated if matched (current situasion) 
# 					
# 5) get_hier_ss_param_list
# 	Input_args	: config_ss_obj
# 	Local_vars	: NA
# 	Function	: convert array type config table to list type config table
# 	Output		: list type config table
# 	Return		: list type config table
