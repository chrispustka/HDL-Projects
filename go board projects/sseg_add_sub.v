module sseg_add_sub (input i_B1, input i_B2, output sseg_i);

reg sseg_Current;


// first I've gotta debounce the switches....
// but then

reg B1_db, B2_db;

// insert case structure for sseg_Up / sseg_Down based on sseg_Current;




// The creation of sseg_up / down isn't 100% necessary, but feels cleaner
always @ (B1_db, B2_db)
begin
	if (B1_db && ~B2_db) 
		sseg_Next <= sseg_Up;
	if (~B1_db && B2_db)
		sseg_Next <= sseg_Down;

end


endmodule