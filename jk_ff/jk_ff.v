`timescale 1ns / 1ps
module jk_ff (
	input j,k,clk,rst,
	output reg q);
	
always@(posedge clk, posedge rst)
begin
	if(rst)
		q = 1'b1;
	else 
	case({j,k})
		2'b00 : q = q;
		2'b01 : q = 0;
		2'b10 : q = 1;
		2'b11 : q = ~q;
		default : q = 1;
	endcase
end

endmodule

module tb_jk_ff;

  // Inputs
  reg j, k, clk, rst;

  // Outputs
  wire q;

  // Instantiate the JK flip-flop
  jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Assuming a half-period of 5 simulation time units
  end

  // Initial block for simulation setup
  initial begin
    // Initialize inputs
    j = 0;
    k = 0;
    clk = 0;
    rst = 0;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Apply input changes and observe outputs
    #10 j = 1; k = 0; // Set JK to 01
    #10 j = 0; k = 1; // Set JK to 10
    #10 j = 1; k = 1; // Set JK to 11
    #10 j = 0; k = 0; // Set JK to 00

    // Add more test cases as needed

    #10 $finish; // Finish simulation after some time
  end

  // Initial block for waveform dumping
  initial begin
    $dumpfile("tb_jk_ff.vcd");
    $dumpvars(0, tb_jk_ff);
  end

endmodule
