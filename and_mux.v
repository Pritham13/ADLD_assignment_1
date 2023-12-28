module and_mux(
	input a,b,
	output y);
	
mux_2x1 i1(.i({b,1'b0}),.sel(a),.o(y));

endmodule
`timescale 1ns / 1ps

module tb_and_mux;

  // Inputs
  reg a, b;

  // Outputs
  wire y;

  // Instantiate the and_mux module
  and_mux uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Initial block for waveform dumping
  initial begin
    $dumpfile("tb_and_mux.vcd");
    $dumpvars(0, tb_and_mux);
  end

  // Initial block for test stimulus
  initial begin
    // Initialize inputs
    a = 0;
    b = 0;

    // Apply input changes and observe outputs
    #10 a = 0; b = 0; // a=0, b=0 => y = (0 AND 1) = 0
    #10 a = 0; b = 1; // a=0, b=1 => y = (1 AND 1) = 1
    #10 a = 1; b = 0; // a=1, b=0 => y = (0 AND 1) = 0
    #10 a = 1; b = 1; // a=1, b=1 => y = (1 AND 1) = 1

    // Add more test cases as needed

    #10 $finish; // Finish simulation after some time
  end

endmodule
