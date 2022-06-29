module switch_db (input i_Clk, input i_Switch, output o_Switch);

// there is a question of: how high do we want the counter to count to ensure a stable switch? 
// how long til its stable? then, clock cycles * counted number

	parameter c_DEBOUNCE_LIMIT
	
	reg [17:0] r_Count;
	reg r_State = 1'b0;
	
	r_Switch_Last
	
	always @ (posedge i_Clk)
	begin
		if (i_Switch != r_State && r_Count < c_DEBOUNCE_LIMIT)
			r_Count <= r_Count +1;
		else if (r_Count == c_DEBOUNCE_LIMIT)
		begin
			r_State <= i_Switch;
			r_Count <= 0;
		end
		
		else
			r_Count <= 0;
			
	end
	
	assign o_Switch = r_State;




endmodule