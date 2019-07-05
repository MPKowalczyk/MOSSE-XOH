`timescale 1ns / 1ps
//-----------------------------------------------
// Company: AGH
// Engineer: Marcin Kowalczyk
// Create Date:    11:41:13 05/10/2011 
// Description: log FFT to ppm file
//-----------------------------------------------
module hdmi_out16_uhd_4
  #(
    parameter FFT_WIDTH = 16,
    parameter FFT_LENGTH = 64,
    parameter NAME = "real_imag16"
    )
  (
   input 		 s_axis_video_aclk,
   input [FFT_WIDTH-1:0] VIDEO_OUT_tdata,
   input 		 VIDEO_OUT_tlast,
   input 		 VIDEO_OUT_tvalid
   );
   //-----------------------------------------------
   integer 	fm1=0;

   reg [7:0] 	vsc=8'h0;
   reg 		vse=1;

   reg [19:0] 	pixels = 20'b0;

   //-----------------------------------------------
   always @(posedge s_axis_video_aclk)    
     begin

	
	
	if((pixels == 0) && VIDEO_OUT_tvalid)
	  begin
	     pixels <= pixels + 1;
	     
             fm1 = $fopen({NAME, "_", vsc[5:0]/10+8'h30,vsc[5:0]%10+8'h30, ".ppm"},"wb");
             $fwrite(fm1,"P6%c64 64%c65535\n",10,10);
             vsc <= vsc+1;

	     $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
	     $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
	     $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
	     
	  end
	else
	  begin
	     if(VIDEO_OUT_tvalid)
	       begin

		  $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
		  $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
		  $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});

		  if (pixels == FFT_LENGTH * FFT_LENGTH - 1)
		    begin
		       pixels <= 20'b0;
		       $fclose(fm1);
		       $display("Image saved!");
		    end
		  else pixels <= pixels + 1;
	  
	       end
	  end
     end

   //-----------------------------------------------
endmodule
//-----------------------------------------------

module hdmi_out32_uhd_4
  #(
    parameter FFT_WIDTH = 32,
    parameter FFT_LENGTH = 64,
    parameter NAME = "real_imag32"
    )
  (
   input 		 s_axis_video_aclk,
   input [FFT_WIDTH-1:0] VIDEO_OUT_tdata,
   input 		 VIDEO_OUT_tlast,
   input 		 VIDEO_OUT_tvalid
   );
   //-----------------------------------------------
   integer 	fm1=0;

   reg [7:0] 	vsc=8'h0;
   reg 		vse=1;

   reg [19:0] 	pixels = 20'b0;

   //-----------------------------------------------
   always @(posedge s_axis_video_aclk)    
     begin

	
	
	if((pixels == 0) && VIDEO_OUT_tvalid)
	  begin
	     pixels <= pixels + 1;
	     
             fm1 = $fopen({NAME, "_", vsc[5:0]/10+8'h30,vsc[5:0]%10+8'h30, ".ppm"},"wb");
             $fwrite(fm1,"P6%c64 64%c65535\n",10,10);
             vsc <= vsc+1;

	     $fwrite(fm1,"%c",{VIDEO_OUT_tdata[31:24]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[23:16]});
	     $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
	     $fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
	     
	  end
	else
	  begin
	     if(VIDEO_OUT_tvalid)
	       begin

	     	$fwrite(fm1,"%c",{VIDEO_OUT_tdata[31:24]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[23:16]});
	     	$fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});
	     	$fwrite(fm1,"%c",{VIDEO_OUT_tdata[15:8]}); $fwrite(fm1,"%c",{VIDEO_OUT_tdata[7:0]});

		  if (pixels == FFT_LENGTH * FFT_LENGTH - 1)
		    begin
		       pixels <= 20'b0;
		       $fclose(fm1);
		       $display("Image saved!");
		    end
		  else pixels <= pixels + 1;
	  
	       end
	  end
     end

   //-----------------------------------------------
endmodule
//-----------------------------------------------
