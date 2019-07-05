library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity aud_pat_gen is

  port
  (
   -- AXI4-Lite bus (cpu control)
   axi_aclk    : in std_logic;
   axi_aresetn : in std_logic;
   -- Write address
   axi_awvalid : in std_logic;
   axi_awready : out std_logic;
   axi_awaddr  : in std_logic_vector(31 downto 0);
   axi_awprot  : in std_logic_vector(2 downto 0);
   -- Write data
   axi_wvalid : in std_logic;
   axi_wready : out std_logic;
   axi_wdata  : in std_logic_vector(31 downto 0);
   axi_wstrb  : in std_logic_vector(3 downto 0);
   -- Write response
   axi_bvalid : out std_logic;
   axi_bready : in std_logic;
   axi_bresp  : out std_logic_vector(1 downto 0);
   -- Read address   
   axi_arvalid : in std_logic;
   axi_arready : out std_logic;
   axi_araddr  : in std_logic_vector(31 downto 0);
   axi_arprot  : in std_logic_vector(2 downto 0);
   -- Read data/response
   axi_rvalid : out std_logic;
   axi_rready : in std_logic;
   axi_rdata  : out std_logic_vector(31 downto 0);
   axi_rresp  : out std_logic_vector(1 downto 0);

   -- Audio clock (must be 512 times audio sample rate)
   aud_clk : in std_logic;
   
   -- AXI4-Streaming bus (audio data)
   axis_clk : in std_logic;
   axis_resetn : in std_logic;
   
   -- Audio In
   axis_aud_pattern_tdata_in   : in std_logic_vector(31 downto 0);
   axis_aud_pattern_tid_in     : in std_logic_vector(2 downto 0);
   axis_aud_pattern_tvalid_in  : in std_logic;
   axis_aud_pattern_tready_out : out std_logic;
  
   -- Audio Out
   axis_aud_pattern_tdata_out  : out std_logic_vector(31 downto 0);
   axis_aud_pattern_tid_out    : out std_logic_vector(2 downto 0);
   axis_aud_pattern_tvalid_out : out std_logic; 
   axis_aud_pattern_tready_in  : in std_logic
  );
  
end aud_pat_gen;

architecture rtl of aud_pat_gen is

  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  
  ATTRIBUTE X_INTERFACE_INFO OF axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 axi_aclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_aclk: SIGNAL IS "ASSOCIATED_BUSIF axi, ASSOCIATED_RESET axi_aresetn";
  ATTRIBUTE X_INTERFACE_INFO OF axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 axi_aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axi_aresetn: SIGNAL IS "POLARITY ACTIVE_LOW";  
  
  ATTRIBUTE X_INTERFACE_INFO OF axis_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 axis_clk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axis_clk: SIGNAL IS "ASSOCIATED_BUSIF axis_audio_in:axis_audio_out, ASSOCIATED_RESET axis_resetn";
  ATTRIBUTE X_INTERFACE_INFO OF axis_resetn: SIGNAL IS "xilinx.com:signal:reset:1.0 axis_resetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF axis_resetn: SIGNAL IS "POLARITY ACTIVE_LOW";
  
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tdata_in: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_in TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tid_in: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_in TID";
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tvalid_in: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_in TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tready_out: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_in TREADY";
    
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tdata_out: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_out TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tid_out: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_out TID";
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tvalid_out: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_out TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axis_aud_pattern_tready_in: SIGNAL IS "xilinx.com:interface:axis:1.0 axis_audio_out TREADY";

component aud_pat_gen_top
  port
  (
   -- AXI4-Lite bus (cpu control)
   axi_aclk    : in std_logic;
   axi_aresetn : in std_logic;
   -- Write address
   axi_awvalid : in std_logic;
   axi_awready : out std_logic;
   axi_awaddr  : in std_logic_vector(31 downto 0);
   axi_awprot  : in std_logic_vector(2 downto 0);
   -- Write data
   axi_wvalid : in std_logic;
   axi_wready : out std_logic;
   axi_wdata  : in std_logic_vector(31 downto 0);
   axi_wstrb  : in std_logic_vector(3 downto 0);
   -- Write response
   axi_bvalid : out std_logic;
   axi_bready : in std_logic;
   axi_bresp  : out std_logic_vector(1 downto 0);
   -- Read address   
   axi_arvalid : in std_logic;
   axi_arready : out std_logic;
   axi_araddr  : in std_logic_vector(31 downto 0);
   axi_arprot  : in std_logic_vector(2 downto 0);
   -- Read data/response
   axi_rvalid : out std_logic;
   axi_rready : in std_logic;
   axi_rdata  : out std_logic_vector(31 downto 0);
   axi_rresp  : out std_logic_vector(1 downto 0);

   -- Audio clock (must be 512 times audio sample rate)
   aud_clk : in std_logic;
   
   -- AXI4-Streaming bus (audio data)
   axis_clk : in std_logic;
   axis_resetn : in std_logic;
   
   -- Audio In
   axis_aud_pattern_tdata_in   : in std_logic_vector(31 downto 0);
   axis_aud_pattern_tid_in     : in std_logic_vector(2 downto 0);
   axis_aud_pattern_tvalid_in  : in std_logic;
   axis_aud_pattern_tready_out : out std_logic;
  
   -- Audio Out
   axis_aud_pattern_tdata_out  : out std_logic_vector(31 downto 0);
   axis_aud_pattern_tid_out    : out std_logic_vector(2 downto 0);
   axis_aud_pattern_tvalid_out : out std_logic; 
   axis_aud_pattern_tready_in  : in std_logic
  );
  end component;

begin

aud_pat_gen_top_inst : aud_pat_gen_top
port map (
   -- AXI4-Lite bus (cpu control)
   axi_aclk               =>     axi_aclk   , 
   axi_aresetn            =>     axi_aresetn, 
   -- Write address                         
   axi_awvalid            =>     axi_awvalid,
   axi_awready            =>     axi_awready,
   axi_awaddr             =>     axi_awaddr ,
   axi_awprot             =>     axi_awprot ,
   -- Write data                            
   axi_wvalid             =>     axi_wvalid ,
   axi_wready             =>     axi_wready ,
   axi_wdata              =>     axi_wdata  ,
   axi_wstrb              =>     axi_wstrb  ,
   -- Write response                        
   axi_bvalid             =>     axi_bvalid ,
   axi_bready             =>     axi_bready ,
   axi_bresp              =>     axi_bresp  ,
   -- Read address                          
   axi_arvalid            =>     axi_arvalid,
   axi_arready            =>     axi_arready,
   axi_araddr             =>     axi_araddr ,
   axi_arprot             =>     axi_arprot ,
   -- Read data/response                    
   axi_rvalid             =>     axi_rvalid ,
   axi_rready             =>     axi_rready ,
   axi_rdata              =>     axi_rdata  ,
   axi_rresp              =>     axi_rresp  ,

   -- Audio clock (must be 512 times audio sample rate)
   aud_clk                =>     aud_clk,
   
   -- AXI4-Streaming bus (audio data)
   axis_clk               =>     axis_clk, 
   axis_resetn            =>     axis_resetn,   
   
   -- Audio In
   axis_aud_pattern_tdata_in   => axis_aud_pattern_tdata_in,   
   axis_aud_pattern_tid_in     => axis_aud_pattern_tid_in,    
   axis_aud_pattern_tvalid_in  => axis_aud_pattern_tvalid_in, 
   axis_aud_pattern_tready_out => axis_aud_pattern_tready_out,
  
   -- Audio Out
   axis_aud_pattern_tdata_out  => axis_aud_pattern_tdata_out,  
   axis_aud_pattern_tid_out    => axis_aud_pattern_tid_out,    
   axis_aud_pattern_tvalid_out => axis_aud_pattern_tvalid_out, 
   axis_aud_pattern_tready_in  => axis_aud_pattern_tready_in  
);

end rtl;

