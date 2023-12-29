module mod6_sync(input clk,rst,
			output reg [3:0]y);
reg [3:0]counter=0;
always @ (posedge clk or posedge rst)
	begin
		if (rst)
			begin
				counter <= (counter == 4'b101)? 0:(counter +4'd1);
				y<=counter;
			end  
		else
			begin
				counter <=0;	
				y<=0;			  		  
			end
	end
	
endmodule
