`include "../muxes/mux2x1.v"
module and_u_mux(input a,b,
			output  y);
reg [1:0] in; 
  mux2x1 uut (
    .in(in),
    .sel(b),
    .y(y)
  );
always@(a,b)begin
in = {1'b0,a};
end
endmodule
