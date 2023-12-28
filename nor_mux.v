module nor_mux(
	input a,b,
	output y);
	
wire b_bar;

mux_2x1 i1(.i({1'b0,1'b1}),.sel(b),.o(b_bar));
	
mux_2x1 i2(.i({1'b0,b_bar}),.sel(a),.o(y));

endmodule

module tb_nor_mux;

  // Inputs
  reg a, b;

  // Outputs
  wire y;

  // Instantiate the nor_mux module
  nor_mux uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Initial block for waveform dumping
  initial begin
    $dumpfile("tb_nor_mux.vcd");
    $dumpvars(0, tb_nor_mux);
  end

  // Initial block for test stimulus
  initial begin
    // Initialize inputs
    a = 0;
    b = 0;

    // Apply input changes and observe outputs
    #10 a = 0; b = 0; // a=0, b=0 => y = ~(0 NOR 1) = 1
    #10 a = 0; b = 1; // a=0, b=1 => y = ~(1 NOR 1) = 0
    #10 a = 1; b = 0; // a=1, b=0 => y = ~(0 NOR 0) = 1
    #10 a = 1; b = 1; // a=1, b=1 => y = ~(1 NOR 0) = 0

    // Add more test cases as needed

    #10 $finish; // Finish simulation after some time
  end

endmodule
