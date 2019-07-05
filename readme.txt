Team number: xohw19-237
Project name: Vision System for object tracking in UltraHD resolution video stream using a correlation filter
Date: 30.06.2019
Version of uploaded archive: 1.0

University name: AGH University of Science and Technology in Cracow
Supervisor name: Tomasz Kryjak
Supervisor e-mail: tomasz.kryjak@agh.edu.pl
Participant(s): Marcin Kowalczyk
Email: kowalczyk@agh.edu.pl

Board used: ZCU104
Vivado Version: 2018.2
Brief description of project:
In this project a hardware-software implementation of adaptive correlation filter tracking for a 3840 x 2160 @ 60 fps video stream in a Zynq UltraScale+ MPSoC is discussed. Correlation filters gained popularity in recent years because of their efficiency and good results in the VOT (Visual Object Tracking) challenge. An implementation of the MOSSE (Minimum Output Sum of Squared Error) algorithm is presented. It utilizes 2-dimensional FFT for computing correlation and updates filter coefficients in every frame. The initial filter coefficients are computed on the ARM processor in the PS (Processing System), while all other operations are preformed in PL (Programmable Logic). The presented architecture was described with the use of Verilog hardware description language.

Description of archive (explain directory structure, documents and source files):
Instructions to build and test project
Step 1: Decompress the archive.
Step 2: Open the project in folder mainfftTest_ZCU104 (Vivado 2018.2).
Step 3: Run the SDK (bitstream is already generated).
Step 4: Connect the board with USB cable.
Step 5: Connect a UltraHD (3840 x 2160) video source to board's HDMI sink.
Step 6: Connect a UltraHD display to board's HDMI source.
Step 7: Turn on the ZCU104 board.
Step 9: Make sure, that all switches (SW0 to SW3) are in position '0'.
Step 9: Program the FPGA.
Step 10: Program the ARM core.
Step 11: Wait until you see video at your display.
Step 12: Change SW2 to position '1' (tranking module starts operation).
Step 13: Place tracking target in the marked position on the screen.
Step 14: Change SW1 to position '1' (enable update of filter parameters).
Step 15: Change SW0 position to '0' (enable moving of tracking window).

Alternatively one can run the project with the use of SD card:
Step 1: Decompress the archive.
Step 2: Copy the sd_image/bootimage to SD card.
Step 3: Place the SD card in the board's SD slot.
Step 4: Configure the board to boot from SD card.
Step 5: Connect a UltraHD (3840 x 2160) video source to board's HDMI sink.
Step 6: Connect a UltraHD display to board's HDMI source.
Step 7: Turn on the ZCU104 board.
Step 9: Make sure, that all switches (SW0 to SW3) are in position '0'.
Step 11: Wait until you see video at your display.
Step 12: Change SW2 to position '1' (tranking module starts operation).
Step 13: Place tracking target in the marked position on the screen.
Step 14: Change SW1 to position '1' (enable update of filter parameters).
Step 15: Change SW0 position to '0' (enable moving of tracking window).

Link to YouTube Video:
