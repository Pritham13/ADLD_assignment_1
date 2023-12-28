`timescale 1ns/1ns  // Specify the simulation timescale

module tb_mux2x1;

  // Inputs
  reg [1:0] in;
  reg sel;
  
  // Output
  wire y;

  // Instantiate the mux2x1 module
  mux2x1 uut (
    .in(in),
    .sel(sel),
    .y(y)
  );

  // Dumpfile and dumpvars
  initial begin
    $dumpfile("tb_mux2x1_waveform.vcd");  // Output VCD file
    $dumpvars(0, tb_mux2x1);  // Dump all variables in the module

    // Add some initial delay before applying stimulus    

    // Test Case 1: sel = 0
    in = 2'b00;
    sel = 0;
    #10;
  //  if (y !== in[1]) 
    
    // Test Case 2: sel = 1
    in = 2'b10;
    sel = 1;
    #10;
//    if (y !== in[0]) $fatal("Test Case 2 Failed");
    
    // Add more test cases as needed
    
    // End simulation
    $finish;
  end

endmodule

