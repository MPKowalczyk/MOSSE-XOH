# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "Delay" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Width" -parent ${Page_0}


}

proc update_PARAM_VALUE.Delay { PARAM_VALUE.Delay } {
	# Procedure called to update Delay when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Delay { PARAM_VALUE.Delay } {
	# Procedure called to validate Delay
	return true
}

proc update_PARAM_VALUE.Width { PARAM_VALUE.Width } {
	# Procedure called to update Width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Width { PARAM_VALUE.Width } {
	# Procedure called to validate Width
	return true
}


proc update_MODELPARAM_VALUE.Width { MODELPARAM_VALUE.Width PARAM_VALUE.Width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Width}] ${MODELPARAM_VALUE.Width}
}

proc update_MODELPARAM_VALUE.Delay { MODELPARAM_VALUE.Delay PARAM_VALUE.Delay } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Delay}] ${MODELPARAM_VALUE.Delay}
}

