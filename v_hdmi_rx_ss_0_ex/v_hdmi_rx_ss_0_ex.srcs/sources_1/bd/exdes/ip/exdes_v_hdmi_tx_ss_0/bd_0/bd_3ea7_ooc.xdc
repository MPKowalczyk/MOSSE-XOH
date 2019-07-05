################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name s_axi_cpu_aclk -period 10 [get_ports s_axi_cpu_aclk]
create_clock -name link_clk -period 6.734 [get_ports link_clk]
create_clock -name s_axis_audio_aclk -period 10 [get_ports s_axis_audio_aclk]
create_clock -name video_clk -period 3.367 [get_ports video_clk]
create_clock -name s_axis_video_aclk -period 6.667 [get_ports s_axis_video_aclk]

################################################################################