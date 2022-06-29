module sseg_inc (input i_Clk, output [6:0] sseg_i);

reg [6:0] sseg_Current;
reg [6:0] sseg_Next;

// can i define "macros" whats the word, to replace "seg1" "seg2" with the correct coding of segment inputs

parameter [6:0] sseg_1 = 6'b0001;


initial begin
	segment_7_current = 0;
end

case sseg_Current
		sseg_0: sseg_Next <= sseg_1;
		sseg_1:
		sseg_2:
		sseg_3:
		sseg_4:
		sseg_5:
		sseg_6:
		sseg_7:
		sseg_8:
		sseg_9: sseg_Next <= sseg_0;
		
		// is there a way to do this without all this mess?
		// 
		
		// what if i implement an actual counter
		// and encode that counter to the sseg values
		// the encoding always has to happen somewhere, here its happening in the case structure. the only other way of getting the info would be reading the variable names lol
		// i could initialize the sseg parameters as an array, and access the indices that corrolate with the 
		// ans: it seems that solution requires fancy moves, or systemVerilog to create a 2 dimensional parameter array. 
endcase
		
always @ (posedge i_Clk)
begin
	sseg_i <= sseg_Next;
	sseg_Current <= sseg_Next;
		// do i need to have a current and an sseg_i ? only testing will tell i feel.



end


