`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2017 04:39:47 PM
// Design Name: 
// Module Name: Delay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Delay
#(
    parameter Width = 1,
    parameter Delay = 1
)
(
    input [Width-1:0]Input,
    input CLK_in,
    output [Width-1:0]Output
);

wire [Width-1:0]chain[Delay:0];
assign chain[0] = Input;
assign Output = chain[Delay];

genvar i;

generate
    for(i=0;i<Delay;i=i+1)
    begin
        register #(.Width(Width)) reg_i
        (
            .CLK_in(CLK_in),
            .d(chain[i]),
            .q(chain[i+1])
        );
    end
endgenerate

endmodule

module register
#(
    parameter Width=1
)
(
input CLK_in,
input [Width-1:0]d,
output [Width-1:0]q
);

reg [Width-1:0] val=0;

always @(posedge CLK_in)
begin
    val<=d;
end

assign q=val;

endmodule