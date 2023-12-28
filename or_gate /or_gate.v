`include "../muxes/mux2x1.v"
module or_gate(input a,b,
			output  y);
reg [1:0] in; 
  mux2x1 uut (
    .in(in),
    .sel(b),
    .y(y)
  );
always@(a,b)begin
in = {a,1'b1};
end
endmodule
