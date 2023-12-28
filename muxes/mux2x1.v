module mux2x1(input [1:0]in,
		input sel,
		output reg  y);
always @(in or sel)
begin 
y <= sel?in[0]:in[1];
end
endmodule
