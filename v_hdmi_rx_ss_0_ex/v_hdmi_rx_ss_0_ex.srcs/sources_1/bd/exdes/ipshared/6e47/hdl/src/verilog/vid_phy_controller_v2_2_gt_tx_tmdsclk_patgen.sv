/*
    Pattern Generator for GT TX USERDATA
    This module generates the pattern for txusrdata
	to use one gt channel as reference clock source
    Written by Gilbert Magnaye
    (c) 2014, 2015 by Xilinx inc.

    History
    -------
    v1.0 - Initial release

*/

`include "vid_phy_controller_v2_2_1_defs.v"
`default_nettype none

module vid_phy_controller_v2_2_1_gt_tx_tmdsclk_patgen #
(
	parameter integer   TXDATA_WIDTH     = 40
)
(
    input  wire         CLK_IN,                         // System Clock 
    input  wire         TXUSRCLK_IN,                    // Clock
	
    input  wire         CTRL_EN_IN,                     // Enable
    input  wire  [2:0]  CTRL_RATIO_IN,                  // Linerate to txusrdata ratio 
	
    output wire [TXDATA_WIDTH-1:0]  TXDATA_OUT          // txdata to GT Channel
	
);

// Logic
logic           txusrclk_div2;
wire            ctrl_en_in_sync;
wire     [2:0]  ctrl_ratio_in_sync;
logic    [2:0]  txdata_counter;
logic    [2:0]  txdata_count;
logic   [39:0]  txdata_out_1;
logic   [39:0]  txdata_out_2;
logic   [39:0]  txdata_out_3;
logic   [39:0]  txdata_out_4;
logic   [39:0]  txdata_out_5;
logic   [39:0]  txdata_out_int;

localparam      LR_RATIO_10_VAL  = 3'b001;
localparam      LR_RATIO_20_VAL  = 3'b010;
localparam      LR_RATIO_30_VAL  = 3'b011;
localparam      LR_RATIO_40_VAL  = 3'b100;
localparam      LR_RATIO_50_VAL  = 3'b101;

localparam      LR_RATIO_10_CNT  = 1;
localparam      LR_RATIO_20_CNT  = 1;
localparam      LR_RATIO_30_CNT  = 3;
localparam      LR_RATIO_40_CNT  = 1;
localparam      LR_RATIO_50_CNT  = 5;

localparam      LR_RATIO_10_DATA   = { 5'b11111, 5'b00000, 5'b11111, 5'b00000, 5'b11111, 5'b00000, 5'b11111, 5'b00000 };
localparam      LR_RATIO_20_DATA   = { 5'b11111, 5'b11111, 5'b00000, 5'b00000, 5'b11111, 5'b11111, 5'b00000, 5'b00000 };
localparam      LR_RATIO_30_DATA1  = { 5'b00000, 5'b00000, 5'b11111, 5'b11111, 5'b11111, 5'b00000, 5'b00000, 5'b00000 };
localparam      LR_RATIO_30_DATA2  = { 5'b11111, 5'b00000, 5'b00000, 5'b00000, 5'b11111, 5'b11111, 5'b11111, 5'b00000 };
localparam      LR_RATIO_30_DATA3  = { 5'b11111, 5'b11111, 5'b11111, 5'b00000, 5'b00000, 5'b00000, 5'b11111, 5'b11111 };
localparam      LR_RATIO_40_DATA   = { 5'b11111, 5'b11111, 5'b11111, 5'b11111, 5'b00000, 5'b00000, 5'b00000, 5'b00000 };
localparam      LR_RATIO_50_DATA1  = { 5'b11111, 5'b11111, 5'b11111, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000 };
localparam      LR_RATIO_50_DATA2  = { 5'b11111, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b11111, 5'b11111 };
localparam      LR_RATIO_50_DATA3  = { 5'b00000, 5'b00000, 5'b00000, 5'b00000, 5'b11111, 5'b11111, 5'b11111, 5'b11111 };
localparam      LR_RATIO_50_DATA4  = { 5'b00000, 5'b00000, 5'b11111, 5'b11111, 5'b11111, 5'b11111, 5'b11111, 5'b00000 };
localparam      LR_RATIO_50_DATA5  = { 5'b11111, 5'b11111, 5'b11111, 5'b11111, 5'b11111, 5'b00000, 5'b00000, 5'b00000 };


// CTRL_EN_IN Sync
xpm_cdc_single 
	#(
		.VERSION        (`XPM_CDC_VERSION       ),
		.SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
		.DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
		.SRC_INPUT_REG  ( 0                     )
	) 
	RESET_IN_SYNC_INST 
	(
		.src_clk         (CLK_IN        ),
		.src_in          (CTRL_EN_IN),
		.dest_clk        (TXUSRCLK_IN),
		.dest_out        (ctrl_en_in_sync)
	);

// CTRL_RATIO_IN Sync
xpm_cdc_array_single 
	#(
		.VERSION        (`XPM_CDC_VERSION       ),
		.SIM_ASSERT_CHK (`XPM_CDC_SIM_ASSERT_CHK),
		.DEST_SYNC_FF   (`XPM_CDC_MTBF_FFS      ),
		.WIDTH          ( 3                     ),
		.SRC_INPUT_REG  ( 0                     )
	) 
	BIT_REP_IN_SYNC_INST 
	(
		.src_clk         (CLK_IN),
		.src_in          (CTRL_RATIO_IN),
		.dest_clk        (TXUSRCLK_IN),
		.dest_out        (ctrl_ratio_in_sync)
    );

// Prepare TXOUT_DATA per CTRL_RATIO_IN
always @ (posedge TXUSRCLK_IN)
begin
	if (~ctrl_en_in_sync)
	begin
		txdata_count <= 3'b1;
		txdata_out_1 <= 40'b0;
		txdata_out_2 <= 40'b0;
		txdata_out_3 <= 40'b0;
		txdata_out_4 <= 40'b0;
		txdata_out_5 <= 40'b0;
	end
	
	else
	begin
		case (ctrl_ratio_in_sync)
			LR_RATIO_10_VAL : 
			begin
				txdata_count <= LR_RATIO_10_CNT;
				txdata_out_1 <= LR_RATIO_10_DATA;
				txdata_out_2 <= LR_RATIO_10_DATA;
				txdata_out_3 <= LR_RATIO_10_DATA;
				txdata_out_4 <= LR_RATIO_10_DATA;
				txdata_out_5 <= LR_RATIO_10_DATA;
			end

			LR_RATIO_20_VAL : 
			begin
				txdata_count <= LR_RATIO_20_CNT;
				txdata_out_1 <= LR_RATIO_20_DATA;
				txdata_out_2 <= LR_RATIO_20_DATA;
				txdata_out_3 <= LR_RATIO_20_DATA;
				txdata_out_4 <= LR_RATIO_20_DATA;
				txdata_out_5 <= LR_RATIO_20_DATA;
			end

			LR_RATIO_30_VAL : 
			begin
				txdata_count <= LR_RATIO_30_CNT;
				txdata_out_1 <= LR_RATIO_30_DATA1;
				txdata_out_2 <= LR_RATIO_30_DATA2;
				txdata_out_3 <= LR_RATIO_30_DATA3;
				txdata_out_4 <= 40'b0;
				txdata_out_5 <= 40'b0;
			end

			LR_RATIO_40_VAL : 
			begin
				txdata_count <= LR_RATIO_40_CNT;
				txdata_out_1 <= LR_RATIO_40_DATA;
				txdata_out_2 <= LR_RATIO_40_DATA;
				txdata_out_3 <= LR_RATIO_40_DATA;
				txdata_out_4 <= LR_RATIO_40_DATA;
				txdata_out_5 <= LR_RATIO_40_DATA;
			end

			LR_RATIO_50_VAL : 
			begin
				txdata_count <= LR_RATIO_50_CNT;
				txdata_out_1 <= LR_RATIO_50_DATA1;
				txdata_out_2 <= LR_RATIO_50_DATA2;
				txdata_out_3 <= LR_RATIO_50_DATA3;
				txdata_out_4 <= LR_RATIO_50_DATA4;
				txdata_out_5 <= LR_RATIO_50_DATA5;
			end
			
			default : 
			begin
				txdata_count <= 3'b1;
				txdata_out_1 <= 40'b0;
				txdata_out_2 <= 40'b0;
				txdata_out_3 <= 40'b0;
				txdata_out_4 <= 40'b0;
				txdata_out_5 <= 40'b0;
			end
		endcase
	end
end



generate
    if (TXDATA_WIDTH == 40)
        begin 
            // Construct TXOUT_DATA 
            always_ff @ (posedge TXUSRCLK_IN)
            begin
                if (~ctrl_en_in_sync)
                    txdata_counter = 3'b0;
                else if (txdata_counter == txdata_count)
                    txdata_counter = 3'b1;
                else	
                    txdata_counter = txdata_counter + 1;
            end

            always_ff @ (posedge TXUSRCLK_IN)
            begin
                if (~ctrl_en_in_sync)
                begin
                    txdata_out_int <= 40'b0;
                end
                
                else	
                begin
                    case (txdata_counter)
                        3'h1 : txdata_out_int <= txdata_out_1;
                        3'h2 : txdata_out_int <= txdata_out_2;
                        3'h3 : txdata_out_int <= txdata_out_3;
                        3'h4 : txdata_out_int <= txdata_out_4;
                        3'h5 : txdata_out_int <= txdata_out_5;
                        default : txdata_out_int <= 40'b0;
                    endcase
                end
            end
                
            // Module Output
            assign TXDATA_OUT = txdata_out_int;
        end
    else  //(TXDATA_WIDTH == 20)
        begin
            // Divide TXUSRCLK_IN by 2
            always_ff @ (posedge TXUSRCLK_IN)
            begin
                if (~ctrl_en_in_sync)
                    txusrclk_div2 = 1'b0;
                else	
                    txusrclk_div2 = ~txusrclk_div2;
            end

            // Construct TXOUT_DATA 
            always_ff @ (posedge txusrclk_div2)
            begin
                if (~ctrl_en_in_sync)
                    txdata_counter = 3'b0;
                else if (txdata_counter == txdata_count)
                    txdata_counter = 3'b1;
                else	
                    txdata_counter = txdata_counter + 1;
            end

            always_ff @ (posedge TXUSRCLK_IN)
            begin
                if (~ctrl_en_in_sync)
                begin
                    txdata_out_int <= 40'b0;
                end
                
                else	
                begin
                    case (txdata_counter)
                        3'h1 : txdata_out_int <= txdata_out_1;
                        3'h2 : txdata_out_int <= txdata_out_2;
                        3'h3 : txdata_out_int <= txdata_out_3;
                        3'h4 : txdata_out_int <= txdata_out_4;
                        3'h5 : txdata_out_int <= txdata_out_5;
                        default : txdata_out_int <= 40'b0;
                    endcase
                end
            end
                
            // Module Output
            assign TXDATA_OUT = txusrclk_div2 ? txdata_out_int[39:20] : txdata_out_int[19:0];
        end
endgenerate

endmodule

`default_nettype wire
