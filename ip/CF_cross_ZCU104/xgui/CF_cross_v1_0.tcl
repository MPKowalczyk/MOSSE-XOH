# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FFT_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HEIGHT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NPPC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POSITION_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.FFT_LENGTH { PARAM_VALUE.FFT_LENGTH } {
	# Procedure called to update FFT_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FFT_LENGTH { PARAM_VALUE.FFT_LENGTH } {
	# Procedure called to validate FFT_LENGTH
	return true
}

proc update_PARAM_VALUE.HEIGHT { PARAM_VALUE.HEIGHT } {
	# Procedure called to update HEIGHT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HEIGHT { PARAM_VALUE.HEIGHT } {
	# Procedure called to validate HEIGHT
	return true
}

proc update_PARAM_VALUE.NPPC { PARAM_VALUE.NPPC } {
	# Procedure called to update NPPC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NPPC { PARAM_VALUE.NPPC } {
	# Procedure called to validate NPPC
	return true
}

proc update_PARAM_VALUE.POSITION_WIDTH { PARAM_VALUE.POSITION_WIDTH } {
	# Procedure called to update POSITION_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POSITION_WIDTH { PARAM_VALUE.POSITION_WIDTH } {
	# Procedure called to validate POSITION_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.NPPC { MODELPARAM_VALUE.NPPC PARAM_VALUE.NPPC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NPPC}] ${MODELPARAM_VALUE.NPPC}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.POSITION_WIDTH { MODELPARAM_VALUE.POSITION_WIDTH PARAM_VALUE.POSITION_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POSITION_WIDTH}] ${MODELPARAM_VALUE.POSITION_WIDTH}
}

proc update_MODELPARAM_VALUE.FFT_LENGTH { MODELPARAM_VALUE.FFT_LENGTH PARAM_VALUE.FFT_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FFT_LENGTH}] ${MODELPARAM_VALUE.FFT_LENGTH}
}

proc update_MODELPARAM_VALUE.HEIGHT { MODELPARAM_VALUE.HEIGHT PARAM_VALUE.HEIGHT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HEIGHT}] ${MODELPARAM_VALUE.HEIGHT}
}

