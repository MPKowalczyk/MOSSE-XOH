`timescale 1ns / 1ps
//-----------------------------------------------
// Company: AGH
// Engineer: Mateusz Komorkiewicz / Tomasz Kryjak / Marcin Kowalczyk
// Create Date:    11:41:13 05/10/2011 
// Description: log image to ppm file
//-----------------------------------------------
module hdmi_out_uhd_4
(
input s_axis_video_aclk,
input [95:0] VIDEO_OUT_tdata,
input VIDEO_OUT_tlast,
output VIDEO_OUT_tready,
input VIDEO_OUT_tuser,
input VIDEO_OUT_tvalid
);
//-----------------------------------------------
integer fm1=0;

reg [7:0]vsc=8'h0;
reg vse=1;
reg tready = 1'b1;

//-----------------------------------------------
always @(posedge s_axis_video_aclk)
begin
    if(VIDEO_OUT_tuser)
    begin
        $fclose(fm1);
        fm1 = $fopen({"out_",vsc[5:0]/10+8'h30,vsc[5:0]%10+8'h30,".ppm"},"wb");
        $display("out%d.ppm saved",vsc);
        $fwrite(fm1,"P6%c64 64%c255\n",10,10);
        vsc <= vsc+1;
       /*
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[95-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[87-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[79-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[71-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[63-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[55-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[47-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[39-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[31-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[23-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7-:8] });
	*/

       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[23-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7-:8] });
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[47-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[39-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[31-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[71-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[63-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[55-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[95-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[87-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[79-:8]});
       
    end
    else
    begin
    if(VIDEO_OUT_tvalid)
      begin
	 //just for good debugging
       /*
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[95-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[87-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[79-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[71-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[63-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[55-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[47-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[39-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[31-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[23-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7-:8] });
	*/

       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[23-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7-:8] });
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[47-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[39-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[31-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[71-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[63-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[55-:8]});
       
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[95-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[87-:8]});
       $fwrite(fm1,"%c",{VIDEO_OUT_tdata[79-:8]});
       
      end
    end
end

assign VIDEO_OUT_tready = tready;

//-----------------------------------------------
endmodule
//-----------------------------------------------
