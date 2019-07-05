
/*
 * Copyright (c) 2014 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 *
 * This file contains the library for the audio generator.
 *
 * MODIFICATION HISTORY:
 *
 * Ver   Who Date         Changes
 * ----- --- ----------   -----------------------------------------------
 * 1.00  RHe 2015/01/15   First release
 *
 *****************************************************************************/

module aud_pat_gen_lib_pulse_clkcross
(
  input  in_clk,
  input  in_pulse,
  input  out_clk,
  output out_pulse
);

reg rIn_PulseCap = 1'b0;
reg rIn_Toggle = 1'b0;

always @(posedge in_clk)
begin
  rIn_PulseCap <= in_pulse;
  
  if (in_pulse && !rIn_PulseCap)
    rIn_Toggle <= ~rIn_Toggle;
end

reg [2:0] rOut_Sync = 3'b000;
reg       rOut_Pulse = 1'b0;

always @(posedge out_clk)
begin
  rOut_Sync  <= {rOut_Sync[1:0], rIn_Toggle};
  rOut_Pulse <= rOut_Sync[2] ^ rOut_Sync[1];
end

assign out_pulse = rOut_Pulse;

endmodule //aud_pat_gen_lib_pulse_clkcross
