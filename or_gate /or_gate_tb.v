`timescale 1ns/1ns  // Specify the simulation timescale
`include "or_gate.v"
module tb_or_gate;

  // Inputs
  reg a, b;
  
  // Output
  wire y;

  // Instantiate the and_u_mux module
  or_gate uut (
    .a(a),
    .b(b),
    .y(y)
  );

  // Dumpfile and dumpvars
  initial begin
    $dumpfile("tb_or_gate.vcd");  // Output VCD file
    $dumpvars(0, tb_or_gate);  // Dump all variables in the module

   

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
