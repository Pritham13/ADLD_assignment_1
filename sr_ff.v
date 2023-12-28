module sr_ff (
	input s,r,clk,rst,
	output reg q);
	
always@(posedge clk, posedge rst)
begin
	if(rst)
		q = 1'b1;
	else 
	case({s,r})
		2'b00 : q = q;
		2'b01 : q = 0;
		2'b10 : q = 1;
		2'b11 : q = 1'bx;
		default : q = 1;
	endcase
end

endmodule

module tb_sr_ff;

  // Inputs
  reg s, r, clk, rst;

  // Outputs
  wire q;

  // Instantiate the sr_ff module
  sr_ff uut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Initial block for waveform dumping
  initial begin
    $dumpfile("tb_sr_ff.vcd");
    $dumpvars(0, tb_sr_ff);
  end

  // Initial block for test stimulus
  initial begin
    // Initialize inputs
    s = 0;
    r = 0;
    clk = 0;
    rst = 0;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Apply input changes and observe outputs
    #10 s = 0; r = 0; // No change, q = previous value
    #10 s = 0; r = 1; // Reset, q = 0
    #10 s = 1; r = 0; // Set, q = 1
    #10 s = 1; r = 1; // Invalid, q = x

    // Add more test cases as needed

    #10 $finish; // Finish simulation after some time
  end

endmodule
