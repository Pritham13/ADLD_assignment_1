`timescale 1ns/1ns  // Specify the simulation timescale

module tb_and_u_mux;

  // Inputs
  reg a, b;
  
  // Output
  wire y;

  // Instantiate the and_u_mux module
  and_u_mux uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Dumpfile and dumpvars
  initial begin
    $dumpfile("tb_and_u_mux_waveform.vcd");  // Output VCD file
    $dumpvars(0, tb_and_u_mux);  // Dump all variables in the module

   

    // Test Case 1: a = 0, b = 0
    a = 0;
    b = 0;
    #10;
    
    // Test Case 2: a = 1, b = 0
    a = 1;
    b = 0;
    #10;

    // Test Case 3: a = 0, b = 1
    a = 0;
    b = 1;
    #10;

    // Test Case 4: a = 1, b = 1
    a = 1;
    b = 1;
    #10;

    // End simulation
    $finish;
  end

endmodule
