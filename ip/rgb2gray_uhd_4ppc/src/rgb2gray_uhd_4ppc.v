`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2018 05:07:49 PM
// Design Name: 
// Module Name: rgb2gray_uhd_4ppc
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


module rgb2gray_uhd_4ppc
(
    input [95:0] VIDEO_IN_tdata,
    input VIDEO_IN_tlast,
    output VIDEO_IN_tready,
    input VIDEO_IN_tuser,
    input VIDEO_IN_tvalid,
    input s_axis_video_aclk,
    output [31:0] VIDEO_OUT_tdata,
    output VIDEO_OUT_tlast,
    input VIDEO_OUT_tready,
    output VIDEO_OUT_tuser,
    output VIDEO_OUT_tvalid
);

wire [23:0] px1 = VIDEO_IN_tdata[24*0+:24];
wire [23:0] px2 = VIDEO_IN_tdata[24*1+:24];
wire [23:0] px3 = VIDEO_IN_tdata[24*2+:24];
wire [23:0] px4 = VIDEO_IN_tdata[24*3+:24];

wire [15:0] R_1;
wire [15:0] R_2;
wire [15:0] R_3;
wire [15:0] R_4;

wire [15:0] G_1;
wire [15:0] G_2;
wire [15:0] G_3;
wire [15:0] G_4;

wire [15:0] B_1;
wire [15:0] B_2;
wire [15:0] B_3;
wire [15:0] B_4;

wire [15:0] delB_1;
wire [15:0] delB_2;
wire [15:0] delB_3;
wire [15:0] delB_4;

wire [15:0] RG_1;
wire [15:0] RG_2;
wire [15:0] RG_3;
wire [15:0] RG_4;

wire [15:0] Gray_1;
wire [15:0] Gray_2;
wire [15:0] Gray_3;
wire [15:0] Gray_4;

mult_R R1
(
    .CLK(s_axis_video_aclk),
    .A(px1[16+:8]),
    .P(R_1)
);

mult_R R2
(
    .CLK(s_axis_video_aclk),
    .A(px2[16+:8]),
    .P(R_2)
);

mult_R R3
(
    .CLK(s_axis_video_aclk),
    .A(px3[16+:8]),
    .P(R_3)
);

mult_R R4
(
    .CLK(s_axis_video_aclk),
    .A(px4[16+:8]),
    .P(R_4)
);

mult_B B1
(
    .CLK(s_axis_video_aclk),
    .A(px1[8+:8]),
    .P(B_1)
);

mult_B B2
(
    .CLK(s_axis_video_aclk),
    .A(px2[8+:8]),
    .P(B_2)
);

mult_B B3
(
    .CLK(s_axis_video_aclk),
    .A(px3[8+:8]),
    .P(B_3)
);

mult_B B4
(
    .CLK(s_axis_video_aclk),
    .A(px4[8+:8]),
    .P(B_4)
);

mult_G G1
(
    .CLK(s_axis_video_aclk),
    .A(px1[0+:8]),
    .P(G_1)
);

mult_G G2
(
    .CLK(s_axis_video_aclk),
    .A(px2[0+:8]),
    .P(G_2)
);

mult_G G3
(
    .CLK(s_axis_video_aclk),
    .A(px3[0+:8]),
    .P(G_3)
);

mult_G G4
(
    .CLK(s_axis_video_aclk),
    .A(px4[0+:8]),
    .P(G_4)
);

Delay_B delB1
(
    .Input(B_1),
    .CLK_in(s_axis_video_aclk),
    .Output(delB_1)
);

Delay_B delB2
(
    .Input(B_2),
    .CLK_in(s_axis_video_aclk),
    .Output(delB_2)
);

Delay_B delB3
(
    .Input(B_3),
    .CLK_in(s_axis_video_aclk),
    .Output(delB_3)
);

Delay_B delB4
(
    .Input(B_4),
    .CLK_in(s_axis_video_aclk),
    .Output(delB_4)
);

adder_rgb2gray RG1
(
    .A(R_1),
    .B(G_1),
    .CLK(s_axis_video_aclk),
    .S(RG_1)
);

adder_rgb2gray RG2
(
    .A(R_2),
    .B(G_2),
    .CLK(s_axis_video_aclk),
    .S(RG_2)
);

adder_rgb2gray RG3
(
    .A(R_3),
    .B(G_3),
    .CLK(s_axis_video_aclk),
    .S(RG_3)
);

adder_rgb2gray RG4
(
    .A(R_4),
    .B(G_4),
    .CLK(s_axis_video_aclk),
    .S(RG_4)
);

adder_rgb2gray Gray1
(
    .A(RG_1),
    .B(delB_1),
    .CLK(s_axis_video_aclk),
    .S(Gray_1)
);

adder_rgb2gray Gray2
(
    .A(RG_2),
    .B(delB_2),
    .CLK(s_axis_video_aclk),
    .S(Gray_2)
);

adder_rgb2gray Gray3
(
    .A(RG_3),
    .B(delB_3),
    .CLK(s_axis_video_aclk),
    .S(Gray_3)
);

adder_rgb2gray Gray4
(
    .A(RG_4),
    .B(delB_4),
    .CLK(s_axis_video_aclk),
    .S(Gray_4)
);

Delay_RGB2GraySync DelSync
(
    .Input({VIDEO_IN_tlast, VIDEO_IN_tuser, VIDEO_IN_tvalid}),
    .CLK_in(s_axis_video_aclk),
    .Output({VIDEO_OUT_tlast, VIDEO_OUT_tuser, VIDEO_OUT_tvalid})
);

assign VIDEO_OUT_tdata[0*8+:8] = Gray_1[15:8];
assign VIDEO_OUT_tdata[1*8+:8] = Gray_2[15:8];
assign VIDEO_OUT_tdata[2*8+:8] = Gray_3[15:8];
assign VIDEO_OUT_tdata[3*8+:8] = Gray_4[15:8];


assign VIDEO_IN_tready = VIDEO_OUT_tready;

endmodule
