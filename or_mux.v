module or_mux(
	input a,b,
	output y);
	
mux_2x1 i1(.i({1'b1,b}),.sel(a),.o(y));

endmodule

module tb_or_mux;

  // Inputs
  reg a, b;

  // Outputs
  wire y;

  // Instantiate the or_mux module
  or_mux uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Initial block for waveform dumping
  initial begin
    $dumpfile("tb_or_mux.vcd");
    $dumpvars(0, tb_or_mux);
  end

  // Initial block for test stimulus
  initial begin
    // Initialize inputs
    a = 0;
    b = 0;

    // Apply input changes and observe outputs
    #10 a = 0; b = 0; // a=0, b=0 => y = 1 OR 0 = 1
    #10 a = 0; b = 1; // a=0, b=1 => y = 1 OR 1 = 1
    #10 a = 1; b = 0; // a=1, b=0 => y = 0 OR 0 = 0
    #10 a = 1; b = 1; // a=1, b=1 => y = 0 OR 1 = 1

    // Add more test cases as needed

    #10 $finish; // Finish simulation after some time
  end

endmodule
