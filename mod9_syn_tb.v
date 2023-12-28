`timescale 1ns/1ps

module mod9_sync_tb;

    reg clk;
    reg rst;
    wire [4:0] y;

    // Instantiate the module
    mod9_sync uut (
        .clk(clk),
        .rst(rst),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk; // Toggle the clock every 5 time units

    // Initial block for testbench
    initial begin
        clk = 0;
        rst = 1; // Apply reset initially

        // Simulate for 10 time units without dumping
        #10;

        // Separate initial block for dumping VCD
        $dumpfile("mod9_sync_tb.vcd");
        $dumpvars;

        // Apply reset for a few clock cycles
        #10 rst = 0;
        #20 rst = 1;

        // Monitor the output
        $monitor("Time=%0t clk=%b rst=%b y=%b", $time, clk, rst, y);

        // Simulate for 100 clock cycles
        #100 $finish; // Stop simulation
    end

endmodule
