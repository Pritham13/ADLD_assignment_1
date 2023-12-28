`timescale 1ns / 1ps
module xnor_mux(
	input a,b,
	output y);

wire b_bar;
not (b_bar,b);
	
mux_2x1 i1(.i({b,b_bar}),.sel(a),.o(y));

endmodule

module tb_xnor_mux;

  // Inputs
  reg a, b;

  // Outputs
  wire y;

  // Instantiate the xnor_mux module
  xnor_mux uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Initial block for waveform dumping
  initial begin
    $dumpfile("tb_xnor_mux.vcd");
    $dumpvars(0, tb_xnor_mux);
  end

  // Initial block
  initial begin
    // Initialize inputs
    a = 0;
    b = 0;

    // Apply input changes and observe outputs
    #10 a = 0; b = 0; // a=0, b=0 => y = 1
    #10 a = 0; b = 1; // a=0, b=1 => y = 0
    #10 a = 1; b = 0; // a=1, b=0 => y = 0
    #10 a = 1; b = 1; // a=1, b=1 => y = 1

    // Add more test cases as needed

    #10 $finish; // Finish simulation after some time
  end

endmodule
