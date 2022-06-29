module sseg_count (input i_Clk, input i_B1, input i_B2, output sseg_i);

// This module is going to count how many button presses there are in 4 seconds? (would be interesting to set debounce period for this)


//debounce needs a clock! so does my "last" function
reg [6:0] counter;

B1_db_Last 
B2_db_Last

// hold a previous value of B1
always @ (posedge_Clk)
begin
	B1_db_current <= i_B1;
	B1_db_Last <= B1_db_current;
	
end

// changes of b1 current happen on the clock cycle. is this a correct way to do it, with two always blocks?
// if value of B1 changes

always @ (B1_db_current) 
begin
	if (B1_db_current == 0 && B1_db_Last == 1) // if B1_db went from high to low (button release)
		counter <= counter + 1;
end


	


	



