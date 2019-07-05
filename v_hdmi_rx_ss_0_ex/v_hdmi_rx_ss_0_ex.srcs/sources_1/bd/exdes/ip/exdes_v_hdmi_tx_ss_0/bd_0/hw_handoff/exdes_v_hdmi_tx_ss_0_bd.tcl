
################################################################
# This is a generated script based on design: bd_3ea7
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
# source bd_3ea7_script.tcl

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
set design_name bd_3ea7

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
  set AUDIO_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 AUDIO_IN ]
  set DDC_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 DDC_OUT ]
  set LINK_DATA0_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA0_OUT ]
  set_property -dict [ list \
   CONFIG.TDATA_NUM_BYTES {5} \
   ] $LINK_DATA0_OUT
  set LINK_DATA1_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA1_OUT ]
  set_property -dict [ list \
   CONFIG.TDATA_NUM_BYTES {5} \
   ] $LINK_DATA1_OUT
  set LINK_DATA2_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA2_OUT ]
  set_property -dict [ list \
   CONFIG.TDATA_NUM_BYTES {5} \
   ] $LINK_DATA2_OUT
  set SB_STATUS_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 SB_STATUS_IN ]
  set S_AXI_CPU_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CPU_IN ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {17} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $S_AXI_CPU_IN
  set VIDEO_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 VIDEO_IN ]
  set_property -dict [ list \
   CONFIG.TDATA_NUM_BYTES {12} \
   ] $VIDEO_IN

  # Create ports
  set acr_cts [ create_bd_port -dir I -from 19 -to 0 acr_cts ]
  set acr_n [ create_bd_port -dir I -from 19 -to 0 acr_n ]
  set acr_valid [ create_bd_port -dir I acr_valid ]
  set fid [ create_bd_port -dir I fid ]
  set hpd [ create_bd_port -dir I hpd ]
  set irq [ create_bd_port -dir O -type intr irq ]
  set link_clk [ create_bd_port -dir I -type clk link_clk ]
  set locked [ create_bd_port -dir O locked ]
  set s_axi_cpu_aclk [ create_bd_port -dir I -type clk s_axi_cpu_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {SB_STATUS_IN:S_AXI_CPU_IN} \
   CONFIG.ASSOCIATED_RESET {s_axi_cpu_aresetn} \
 ] $s_axi_cpu_aclk
  set s_axi_cpu_aresetn [ create_bd_port -dir I -type rst s_axi_cpu_aresetn ]
  set s_axis_audio_aclk [ create_bd_port -dir I -type clk s_axis_audio_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {AUDIO_IN} \
   CONFIG.ASSOCIATED_RESET {s_axis_audio_aresetn} \
 ] $s_axis_audio_aclk
  set s_axis_audio_aresetn [ create_bd_port -dir I -type rst s_axis_audio_aresetn ]
  set s_axis_video_aclk [ create_bd_port -dir I -type clk s_axis_video_aclk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {VIDEO_IN} \
   CONFIG.ASSOCIATED_RESET {s_axis_video_aresetn} \
 ] $s_axis_video_aclk
  set s_axis_video_aresetn [ create_bd_port -dir I -type rst s_axis_video_aresetn ]
  set video_clk [ create_bd_port -dir I -type clk video_clk ]

  # Create instance: axi_crossbar, and set properties
  set axi_crossbar [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_crossbar:2.1 axi_crossbar ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {17} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.NUM_MI {2} \
   CONFIG.PROTOCOL {AXI4LITE} \
 ] $axi_crossbar

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_0

  # Create instance: v_axi4s_vid_out, and set properties
  set v_axi4s_vid_out [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 v_axi4s_vid_out ]
  set_property -dict [ list \
   CONFIG.C_ADDR_WIDTH {10} \
   CONFIG.C_ADDR_WIDTH_PIXEL_REMAP_420 {10} \
   CONFIG.C_HAS_ASYNC_CLK {1} \
   CONFIG.C_HYSTERESIS_LEVEL {12} \
   CONFIG.C_INCLUDE_PIXEL_REMAP_420 {0} \
   CONFIG.C_INCLUDE_PIXEL_REPEAT {0} \
   CONFIG.C_NATIVE_COMPONENT_WIDTH {8} \
   CONFIG.C_PIXELS_PER_CLOCK {4} \
   CONFIG.C_S_AXIS_VIDEO_DATA_WIDTH {8} \
 ] $v_axi4s_vid_out

  # Create instance: v_hdmi_tx, and set properties
  set v_hdmi_tx [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_hdmi_tx:3.0 v_hdmi_tx ]
  set_property -dict [ list \
   CONFIG.C_BITS_PER_COMPONENT {8} \
   CONFIG.C_HDCP_IF_ENABLE {0} \
   CONFIG.C_PIXELS_PER_CLOCK {4} \
   CONFIG.C_VIDEO_MASK_ENABLE {1} \
 ] $v_hdmi_tx

  # Create instance: v_tc, and set properties
  set v_tc [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 v_tc ]
  set_property -dict [ list \
   CONFIG.GEN_FIELDID_EN {true} \
   CONFIG.INTERLACE_EN {true} \
   CONFIG.enable_detection {false} \
   CONFIG.max_clocks_per_line {8192} \
 ] $v_tc

  # Create interface connections
  connect_bd_intf_net -intf_net intf_net_axi_crossbar_M00_AXI [get_bd_intf_pins axi_crossbar/M00_AXI] [get_bd_intf_pins v_hdmi_tx/S_AXI]
  connect_bd_intf_net -intf_net intf_net_axi_crossbar_M01_AXI [get_bd_intf_pins axi_crossbar/M01_AXI] [get_bd_intf_pins v_tc/ctrl]
  connect_bd_intf_net -intf_net intf_net_bdry_in_AUDIO_IN [get_bd_intf_ports AUDIO_IN] [get_bd_intf_pins v_hdmi_tx/AUDIO_IN]
  connect_bd_intf_net -intf_net intf_net_bdry_in_SB_STATUS_IN [get_bd_intf_ports SB_STATUS_IN] [get_bd_intf_pins v_hdmi_tx/SB_STATUS_IN]
  connect_bd_intf_net -intf_net intf_net_bdry_in_S_AXI_CPU_IN [get_bd_intf_ports S_AXI_CPU_IN] [get_bd_intf_pins axi_crossbar/S00_AXI]
  connect_bd_intf_net -intf_net intf_net_bdry_in_VIDEO_IN [get_bd_intf_ports VIDEO_IN] [get_bd_intf_pins v_axi4s_vid_out/video_in]
  connect_bd_intf_net -intf_net intf_net_v_axi4s_vid_out_vid_io_out [get_bd_intf_pins v_axi4s_vid_out/vid_io_out] [get_bd_intf_pins v_hdmi_tx/VIDEO_IN]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_tx_DDC_OUT [get_bd_intf_ports DDC_OUT] [get_bd_intf_pins v_hdmi_tx/DDC_OUT]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_tx_LINK_DATA0_OUT [get_bd_intf_ports LINK_DATA0_OUT] [get_bd_intf_pins v_hdmi_tx/LINK_DATA0_OUT]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_tx_LINK_DATA1_OUT [get_bd_intf_ports LINK_DATA1_OUT] [get_bd_intf_pins v_hdmi_tx/LINK_DATA1_OUT]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_tx_LINK_DATA2_OUT [get_bd_intf_ports LINK_DATA2_OUT] [get_bd_intf_pins v_hdmi_tx/LINK_DATA2_OUT]
  connect_bd_intf_net -intf_net intf_net_v_hdmi_tx_hdcp_out [get_bd_intf_pins v_hdmi_tx/HDCP_IN] [get_bd_intf_pins v_hdmi_tx/HDCP_OUT]
  connect_bd_intf_net -intf_net intf_net_v_tc_vtiming_out [get_bd_intf_pins v_axi4s_vid_out/vtiming_in] [get_bd_intf_pins v_tc/vtiming_out]

  # Create port connections
  connect_bd_net -net net_bdry_in_acr_cts [get_bd_ports acr_cts] [get_bd_pins v_hdmi_tx/acr_cts]
  connect_bd_net -net net_bdry_in_acr_n [get_bd_ports acr_n] [get_bd_pins v_hdmi_tx/acr_n]
  connect_bd_net -net net_bdry_in_acr_valid [get_bd_ports acr_valid] [get_bd_pins v_hdmi_tx/acr_valid]
  connect_bd_net -net net_bdry_in_fid [get_bd_ports fid] [get_bd_pins v_axi4s_vid_out/fid]
  connect_bd_net -net net_bdry_in_hpd [get_bd_ports hpd] [get_bd_pins v_hdmi_tx/hpd]
  connect_bd_net -net net_bdry_in_link_clk [get_bd_ports link_clk] [get_bd_pins v_hdmi_tx/link_clk]
  connect_bd_net -net net_bdry_in_s_axi_cpu_aclk [get_bd_ports s_axi_cpu_aclk] [get_bd_pins axi_crossbar/aclk] [get_bd_pins v_hdmi_tx/s_axi_aclk] [get_bd_pins v_tc/s_axi_aclk]
  connect_bd_net -net net_bdry_in_s_axi_cpu_aresetn [get_bd_ports s_axi_cpu_aresetn] [get_bd_pins axi_crossbar/aresetn] [get_bd_pins v_hdmi_tx/s_axi_aresetn] [get_bd_pins v_tc/s_axi_aresetn]
  connect_bd_net -net net_bdry_in_s_axis_audio_aclk [get_bd_ports s_axis_audio_aclk] [get_bd_pins v_hdmi_tx/s_axis_audio_aclk]
  connect_bd_net -net net_bdry_in_s_axis_audio_aresetn [get_bd_ports s_axis_audio_aresetn] [get_bd_pins v_hdmi_tx/s_axis_audio_aresetn]
  connect_bd_net -net net_bdry_in_s_axis_video_aclk [get_bd_ports s_axis_video_aclk] [get_bd_pins v_axi4s_vid_out/aclk] [get_bd_pins v_hdmi_tx/s_axis_video_aclk]
  connect_bd_net -net net_bdry_in_s_axis_video_aresetn [get_bd_ports s_axis_video_aresetn] [get_bd_pins v_hdmi_tx/s_axis_video_aresetn_in]
  connect_bd_net -net net_bdry_in_video_clk [get_bd_ports video_clk] [get_bd_pins v_axi4s_vid_out/vid_io_out_clk] [get_bd_pins v_hdmi_tx/video_clk] [get_bd_pins v_tc/clk]
  connect_bd_net -net net_util_vector_logic_0_Res [get_bd_pins util_vector_logic_0/Res] [get_bd_pins v_tc/resetn]
  connect_bd_net -net net_v_axi4s_vid_out_locked [get_bd_ports locked] [get_bd_pins v_axi4s_vid_out/locked] [get_bd_pins v_hdmi_tx/bridge_locked]
  connect_bd_net -net net_v_axi4s_vid_out_vtg_ce [get_bd_pins v_axi4s_vid_out/vtg_ce] [get_bd_pins v_tc/gen_clken]
  connect_bd_net -net net_v_hdmi_tx_irq [get_bd_ports irq] [get_bd_pins v_hdmi_tx/irq]
  connect_bd_net -net net_v_hdmi_tx_s_axis_video_aresetn_out [get_bd_pins v_axi4s_vid_out/aresetn] [get_bd_pins v_hdmi_tx/s_axis_video_aresetn_out]
  connect_bd_net -net net_v_hdmi_tx_video_reset [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins v_axi4s_vid_out/vid_io_out_reset] [get_bd_pins v_hdmi_tx/video_reset]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces S_AXI_CPU_IN] [get_bd_addr_segs v_hdmi_tx/S_AXI/reg0] reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x00010000 [get_bd_addr_spaces S_AXI_CPU_IN] [get_bd_addr_segs v_tc/ctrl/Reg] reg1


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


