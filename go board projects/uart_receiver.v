module uart_receiver(input i_DataIn, input i_Clk, output o_DataOut);


// first look for falling edge denoting start bit. Then, align to the middle of the data, and then sample each at the middle. at the final rising edge stops.



reg [6:0] r_Counter; // counts to find middle of transmission, and to differentiate each bit
reg [2:0] r_BitCounter; // counts number of bits in current transmission
reg [7:0] r_ReceivedByte;
reg [7:0] r_ByteOutput; 

reg r_State [1:0];


always @ (posedge i_CLK)
begin
	if (r_State == 0 && i_DataIn == 0) 
	begin
		r_State <= 1;
	end
	
	else if (r_State == 1 && r_Counter < 108)
	begin
		// Count until halfway through a bit
		// Baud rate is 115200, 115200 bits/s. 
		// count to 108, reset timer
		r_Counter <= r_Counter + 1;
	end
	else if (r_State == 1 && r_Counter == 108)
	begin
		r_State <= 2;
		r_Counter <= 0;
	end
	else if (r_State == 2 && r_Counter < 217)
	begin
		r_Counter <= r_Counter+1;
	end
	else if (r_State == 2 && r_Counter == 217) 
	begin
		r_ReceivedByte[r_BitCounter] <= i_DataIn;
		r_Counter <= 0;
		r_BitCounter <= r_BitCounter + 1;
	end
	
	if (r_BitCounter == 8) 
	begin
		r_Counter <= 0;
		r_BitCounter <= 0;
		r_State <= 0;
		// how precisely do we output the byte? for one cycle? always? ill do it til i get another.
		r_ByteOutput <= r_ReceivedByte;
	end
end

assign o_DataOut <= r_ByteOutput;

endmodule



// Notes on his version: 
// has an output o_RX_DV -> goes high for one cycle on completion
// used parameters to give his states names. used switch case structure for his states, which is probably easier to follow.

// his use of an "IDLE" state also allows for initial value of variables, counters... but still lol i guess you can question how state is initialized
// checks the middle of the start bit to make sure its still low
// uses a parameter for "CLKS_PER_BIT"

// uses a cleanup state last, and has a "default" as well

// in terms of variables names: his parameters are in all caps
// for naming, he uses i_, o_, r_, followed by capitals. he separates words with another _. 