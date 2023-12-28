module mux_2x1(
	input [1:0]i,
	input sel,
	output reg o);
	
always@(*)
case(sel)
	1'b0 : o = i[0];
	1'b1 : o = i[1];
	default : o = 1'b0;
endcase

endmodule
	

module tb_mux_2x1;

  // Inputs
  reg [1:0] i;
  reg sel;

  // Outputs
  wire o;

  // Instantiate the mux_2x1 module
  mux_2x1 uut (
    .i(i),
    .sel(sel),
    .o(o)
  );

  // Initial block for waveform dumping
  initial begin
    $dumpfile("tb_mux_2x1.vcd");
    $dumpvars(0, tb_mux_2x1);
  end

  // Initial block for test stimulus
  initial begin
    // Initialize inputs
    i = 2'b00;
    sel = 0;

    // Apply input changes and observe outputs
    #10 i = 2'b01; sel = 0; // sel=0 => o = i[0] = 2'b01
    #10 i = 2'b10; sel = 1; // sel=1 => o = i[1] = 2'b10
    #10 i = 2'b11; sel = 0; // sel=0 => o = i[0] = 2'b11
    #10 i = 2'b00; sel = 1; // sel=1 => o = i[1] = 2'b00

    // Add more test cases as needed

    #10 $finish; // Finish simulation after some time
  end

endmodule

