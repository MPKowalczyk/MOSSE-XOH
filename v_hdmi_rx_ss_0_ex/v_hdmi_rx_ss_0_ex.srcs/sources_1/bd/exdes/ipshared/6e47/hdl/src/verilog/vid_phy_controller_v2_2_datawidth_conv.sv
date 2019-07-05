/*
    HDMI GT
    data width converter

    This module transfers the 20-bits RX data coming from the GTP RX to the 40-bits link data.
    It also divides the GTP RX clock by two to produce the HDMI RX link clock.

    Written by Marco Groeneveld
    (c) 2014, 2015 by Xilinx Inc.

    History
    -------
    v1.0 - Initial release
*/

`default_nettype none
`include "vid_phy_controller_v2_2_1_defs.v"

module vid_phy_controller_v2_2_1_datawidth_conv
(
    // SYSTEM CLOCK
	input wire          CLK_IN,         // Clock
	
	// GTP RX
    input wire          RX_USRCLK_IN,   // RX clock
    input wire          RX_USRRDY_IN,   // RX ready in
    input wire [19:0]   RX_DAT_IN,      // Data

    input wire          LCLK_IN,

    // HDMI Link
//    output wire         LNK_CLK_OUT,    // Link clock
    output wire [39:0]  LNK_DAT_OUT     // Data
);

// Parameters
localparam FIFO_WRDS    = 8;
localparam FIFO_ADR     = $clog2(FIFO_WRDS);
localparam FIFO_DAT     = 40;

// Variables
wire            rclk_rst;
logic           rclk_fifo_ph;
logic           rclk_fifo_wr;
logic   [39:0]  rclk_fifo_din;

//(* dont_touch = "true" *) logic           lclk;
wire lclk;

wire            lclk_rst;
logic           lclk_fifo_rd;
wire    [39:0]  lclk_fifo_dout;


    assign lclk = LCLK_IN;



// RX reset
xpm_cdc_single 
	#(
		.VERSION        (`XPM_CDC_VERSION       ),
		.SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
		.DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
		.SRC_INPUT_REG  (0                      )
	) 
	RCLK_RST_SYNC_INST 
	(
		.src_clk         (CLK_IN        ),
		.src_in          (~RX_USRRDY_IN),
		.dest_clk        (RX_USRCLK_IN),
		.dest_out        (rclk_rst)
	);

// HDMI reset
xpm_cdc_single 
	#(
		.VERSION        (`XPM_CDC_VERSION       ),
		.SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
		.DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
		.SRC_INPUT_REG  (0                      )
	) 
	LCLK_RST_SYNC_INST 
	(
		.src_clk         (CLK_IN        ),
		.src_in          (~RX_USRRDY_IN),
		.dest_clk        (lclk),
		.dest_out        (lclk_rst)
	);

// Link clock
//    always_ff @ (posedge RX_USRCLK_IN)
//    begin
//        lclk <= ~lclk;
//    end

// Fifo data
    always_ff @ (posedge rclk_rst, posedge RX_USRCLK_IN)
    begin
        if (rclk_rst)
        begin
            rclk_fifo_ph <= 0;
            rclk_fifo_wr <= 0;
            rclk_fifo_din <= 0;
        end

        else
        begin
            // Toggle phase
            rclk_fifo_ph <= ~rclk_fifo_ph;

            // Phase 1
            if (rclk_fifo_ph)
            begin
                rclk_fifo_wr <= 1;
                rclk_fifo_din[20+:20] <= RX_DAT_IN;
            end

            // Phase 0
            else
            begin
                rclk_fifo_wr <= 0;
                rclk_fifo_din[0+:20] <= RX_DAT_IN;
            end
        end
    end

// Dual clock fifo
vid_phy_controller_v2_2_1_lib_fifo_dc_v1_0
    #(
        .ADR_WIDTH_A        (FIFO_ADR),
        .DAT_WIDTH_A        (FIFO_DAT),
        .ADR_WIDTH_B        (FIFO_ADR),
        .DAT_WIDTH_B        (FIFO_DAT)
    )
    FIFO_INST
    (
        .A_RST_IN       (rclk_rst),
        .B_RST_IN       (lclk_rst),
        .A_CLK_IN       (RX_USRCLK_IN),
        .B_CLK_IN       (lclk),
        .A_CKE_IN       (1'b1),
        .B_CKE_IN       (1'b1),

        // Input (A)
        .A_WP_LD_IN     (1'b0),                 // Load write pointer
        .A_WP_IN        ({FIFO_ADR{1'b0}}),     // Write pointer
        .A_WR_IN        (rclk_fifo_wr),         // Write
        .A_DAT_IN       (rclk_fifo_din),        // Write data

        // Output (B)
        .B_RP_LD_IN     (1'b0),                 // Load read pointer
        .B_RP_IN        ({FIFO_ADR{1'b0}}),     // Read pointer
        .B_RD_IN        (lclk_fifo_rd),         // Read
        .B_DAT_OUT      (lclk_fifo_dout),       // Read data
        .B_SDE_OUT      (),                     // Single data enable
        .B_BDE_OUT      (),                     // Burst data enable

        // Status (A)
        .A_WP_OUT       (),                     // Write pointer out
        .A_RP_OUT       (),                     // Read pointer
        .A_WRDS_OUT     (),                     // Used words
        .A_FL_OUT       (),                     // Full
        .A_EP_OUT       (),                     // Empty

        // Status (B)
        .B_WP_OUT       (),                     // Write pointer
        .B_RP_OUT       (),                     // Read pointer
        .B_WRDS_OUT     (),                     // Used words
        .B_FL_OUT       (),                     // Full
        .B_EP_OUT       ()                      // Empty
    );

// FIFO read
// The fifo is always reading
    always_comb
    begin
        lclk_fifo_rd = 1;
    end

// Outputs
//    assign LNK_CLK_OUT = lclk;
    assign LNK_DAT_OUT = lclk_fifo_dout;

endmodule

`default_nettype wire

