
################################################################
# This is a generated script based on design: bd_3ec1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source bd_3ec1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu7ev-ffvc1156-2-e
   set_property BOARD_PART xilinx.com:zcu104:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name bd_3ec1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design -bdsource SBD $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set AUDIO_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AUDIO_OUT ]
  set DDC_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC_OUT ]
  set LINK_DATA0_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA0_IN ]
  set LINK_DATA1_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA1_IN ]
  set LINK_DATA2_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA2_IN ]
  set SB_STATUS_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 SB_STATUS_IN ]
  set S_AXI_CPU_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CPU_IN ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {16} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $S_AXI_CPU_IN
  set VIDEO_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 VIDEO_OUT ]
  set_property -dict [ list \
   CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value xilinx.com:video:G_B_R_444:1.0} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value rows} size {attribs {resolve_type generated dependency active_rows format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency active_rows_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} array_type {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value cols} size {attribs {resolve_type generated dependency active_cols format long minimum {} maximum {}} value 1} stride {attribs {resolve_type generated dependency active_cols_stride format long minimum {} maximum {}} value 24} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type automatic dependency {} format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} struct {field_G {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value G} enabled {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} field_B {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value B} enabled {attribs {resolve_type generated dependency video_comp1_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency video_comp1_offset format long minimum {} maximum {}} value 8} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} field_R {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value R} enabled {attribs {resolve_type generated dependency video_comp2_enabled format bool minimum {} maximum {}} value true} datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type generated dependency video_data_width format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type generated dependency video_comp2_offset format long minimum {} maximum {}} value 16} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}}}}}}} TDATA_WIDTH 24}} \
   CONFIG.TDATA_NUM_BYTES {12} \
   ] $VIDEO_OUT

  # Create ports
  set acr_cts [ create_bd_port -dir O -from 19 -to 0 acr_cts ]
  set acr_n [ create_bd_port -dir O -from 19 -to 0 acr_n ]
  set acr_valid [ create_bd_port -dir O acr_valid ]
  set cable_detect [ create_bd_port -dir I cable_detect ]
  set fid [ create_bd_port -dir O fid ]
  set hpd [ create_bd_port -dir O hpd ]
  set irq [ create_bd_port -dir O -type intr irq ]
  set link_clk [ create_bd_port -dir I -type clk link_clk ]
  set s_axi_cpu_aclk [ create_bd_port -dir I -type clk s_axi_cpu_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {SB_STATUS_IN:S_AXI_CPU_IN} \
   CONFIG.ASSOCIATED_RESET {s_axi_cpu_aresetn} \
 ] $s_axi_cpu_aclk
  set s_axi_cpu_aresetn [ create_bd_port -dir I -type rst s_axi_cpu_aresetn ]
  set s_axis_audio_aclk [ create_bd_port -dir I -type clk s_axis_audio_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {AUDIO_OUT} \
   CONFIG.ASSOCIATED_RESET {s_axis_audio_aresetn} \
 ] $s_axis_audio_aclk
  set s_axis_audio_aresetn [ create_bd_port -dir I -type rst s_axis_audio_aresetn ]
  set s_axis_video_aclk [ create_bd_port -dir I -type clk s_axis_video_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {VIDEO_OUT} \
   CONFIG.ASSOCIATED_RESET {s_axis_video_aresetn} \
 ] $s_axis_video_aclk
  set s_axis_video_aresetn [ create_bd_port -dir I -type rst s_axis_video_aresetn ]
  set video_clk [ create_bd_port -dir I -type clk video_clk ]

  # Create instance: inverter_1, and set properties
  set inverter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 inverter_1 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
 ] $inverter_1

  # Create instance: v_hdmi_rx, and set properties
  set v_hdmi_rx [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_hdmi_rx:3.0 v_hdmi_rx ]
  set_property -dict [ list \
   CONFIG.C_BITS_PER_COMPONENT {8} \
   CONFIG.C_DDC_EDID_SIZE {256} \
   CONFIG.C_HDCP_IF_ENABLE {0} \
   CONFIG.C_PIXELS_PER_CLOCK {4} \
 ] $v_hdmi_rx

  # Create instance: v_vid_in_axi4s, and set properties
  set v_vid_in_axi4s [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_vid_in_axi4s:4.0 v_vid_in_axi4s ]
  set_property -dict [ list \
   CONFIG.C_ADDR_WIDTH {10} \
   CONFIG.C_ADDR_WIDTH_PIXEL_REMAP_420 {10} \
   CONFIG.C_HAS_ASYNC_CLK {1} \
   CONFIG.C_INCLUDE_PIXEL_DROP {0} \
   CONFIG.C_INCLUDE_PIXEL_REMAP_420 {0} \
   CONFIG.C_M_AXIS_VIDEO_DATA_WIDTH {8} \
   CONFIG.C_NATIVE_COMPONENT_WIDTH {8} \
   CONFIG.C_PIXELS_PER_CLOCK {4} \
 ] $v_vid_in_axi4s

  # Create interface connections
  connect_bd_intf_net -intf_net intf_net_bdry_in_LINK_DATA0_IN [get_bd_intf_ports LINK_DATA0_IN] [get_bd_intf_pins v_hdmi_rx/LINK_DATA0_IN]
  connect_bd_intf_net -intf_net intf_net_bdry_in_LINK_DATA1_IN [get_bd_intf_ports LINK_DATA1_IN] [get_bd_intf_pins v_hdmi_rx/LINK_DATA1_IN]
  connect_bd_intf_net -intf_net intf_net_bdry_in_LINK_DATA2_IN [get_bd_intf_ports LINK_DATA2_IN] [get_bd_intf_pins v_hdmi_rx/LINK_DATA2_IN]
  connect_bd_intf_net -intf_net intf_net_bdry_in_SB_STATUS_IN [get_bd_intf_ports SB_STATUS_IN] [get_bd_intf_pins v_hdmi_rx/SB_STATUS_IN]
  connect_bd_intf_net -intf_net intf_net_bdry_in_S_AXI_CPU_IN [get_bd_intf_ports S_AXI_CPU_IN] [get_bd_intf_pins v_hdmi_rx/CPU_IN]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_rx_AUDIO_OUT [get_bd_intf_ports AUDIO_OUT] [get_bd_intf_pins v_hdmi_rx/AUDIO_OUT]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_rx_DDC_OUT [get_bd_intf_ports DDC_OUT] [get_bd_intf_pins v_hdmi_rx/DDC_OUT]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_rx_VIDEO_OUT [get_bd_intf_pins v_hdmi_rx/VIDEO_OUT] [get_bd_intf_pins v_vid_in_axi4s/vid_io_in]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_rx_hdcp_out [get_bd_intf_pins v_hdmi_rx/HDCP_IN] [get_bd_intf_pins v_hdmi_rx/HDCP_OUT]
  connect_bd_intf_net -intf_net intf_net_v_vid_in_axi4s_VIDEO_OUT [get_bd_intf_ports VIDEO_OUT] [get_bd_intf_pins v_vid_in_axi4s/video_out]

  # Create port connections
  connect_bd_net -net net_bdry_in_cable_detect [get_bd_ports cable_detect] [get_bd_pins inverter_1/Op1]
  connect_bd_net -net net_bdry_in_link_clk [get_bd_ports link_clk] [get_bd_pins v_hdmi_rx/link_clk]
  connect_bd_net -net net_bdry_in_s_axi_cpu_aclk [get_bd_ports s_axi_cpu_aclk] [get_bd_pins v_hdmi_rx/s_axi_aclk]
  connect_bd_net -net net_bdry_in_s_axi_cpu_aresetn [get_bd_ports s_axi_cpu_aresetn] [get_bd_pins v_hdmi_rx/s_axi_aresetn]
  connect_bd_net -net net_bdry_in_s_axis_audio_aclk [get_bd_ports s_axis_audio_aclk] [get_bd_pins v_hdmi_rx/m_axis_audio_aclk]
  connect_bd_net -net net_bdry_in_s_axis_audio_aresetn [get_bd_ports s_axis_audio_aresetn] [get_bd_pins v_hdmi_rx/m_axis_audio_aresetn]
  connect_bd_net -net net_bdry_in_s_axis_video_aclk [get_bd_ports s_axis_video_aclk] [get_bd_pins v_hdmi_rx/m_axis_video_aclk] [get_bd_pins v_vid_in_axi4s/aclk]
  connect_bd_net -net net_bdry_in_s_axis_video_aresetn [get_bd_ports s_axis_video_aresetn] [get_bd_pins v_hdmi_rx/m_axis_video_aresetn_in]
  connect_bd_net -net net_bdry_in_video_clk [get_bd_ports video_clk] [get_bd_pins v_hdmi_rx/video_clk] [get_bd_pins v_vid_in_axi4s/vid_io_in_clk]
  connect_bd_net -net net_inverter_1_Res [get_bd_pins inverter_1/Res] [get_bd_pins v_hdmi_rx/cable_detect]
  connect_bd_net -net net_v_hdmi_rx_acr_cts [get_bd_ports acr_cts] [get_bd_pins v_hdmi_rx/acr_cts]
  connect_bd_net -net net_v_hdmi_rx_acr_n [get_bd_ports acr_n] [get_bd_pins v_hdmi_rx/acr_n]
  connect_bd_net -net net_v_hdmi_rx_acr_valid [get_bd_ports acr_valid] [get_bd_pins v_hdmi_rx/acr_valid]
  connect_bd_net -net net_v_hdmi_rx_axis_enable [get_bd_pins v_hdmi_rx/axis_enable] [get_bd_pins v_vid_in_axi4s/axis_enable]
  connect_bd_net -net net_v_hdmi_rx_hpd [get_bd_ports hpd] [get_bd_pins v_hdmi_rx/hpd]
  connect_bd_net -net net_v_hdmi_rx_irq [get_bd_ports irq] [get_bd_pins v_hdmi_rx/irq]
  connect_bd_net -net net_v_hdmi_rx_m_axis_video_aresetn_out [get_bd_pins v_hdmi_rx/m_axis_video_aresetn_out] [get_bd_pins v_vid_in_axi4s/aresetn]
  connect_bd_net -net net_v_hdmi_rx_video_reset [get_bd_pins v_hdmi_rx/video_reset] [get_bd_pins v_vid_in_axi4s/vid_io_in_reset]
  connect_bd_net -net net_v_vid_in_axi4s_fid [get_bd_ports fid] [get_bd_pins v_vid_in_axi4s/fid]
  connect_bd_net -net net_v_vid_in_axi4s_overflow [get_bd_pins v_hdmi_rx/bridge_overflow] [get_bd_pins v_vid_in_axi4s/overflow]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces S_AXI_CPU_IN] [get_bd_addr_segs v_hdmi_rx/CPU_IN/reg0] reg0


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


