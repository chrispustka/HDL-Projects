module vga_sync ( output o_Vsync, output o_Hsync, output o_Fporch, output o_Bporch, output [2:0] o_PixColor [2:0]);


// so am i sending one pixel of data at a time to the display? do i have to send it the vsync & hsync? front and back porch? i guess so.

// a previous module is setting the values of vsync, hsync, this module will set the porch 