`timescale 1ns / 1ps

module PixelAddress_tb;

    // Inputs
    reg clk;

    // Outputs
    wire [15:0] V;
    wire [15:0] H;

    // Instantiate the Unit Under Test (UUT)
    PixelAddress uut (
        .clk(clk), 
        .V(V), 
        .H(H)
    );

    // Clock generation
    always #5 clk = ~clk; // Generate a clock with 10ns period (100MHz)

    // Test sequence
    initial begin
        // Initialize Inputs
        clk = 0;

        
        #10000000;
        
        // Finish the simulation
        $finish;
    end
      
endmodule



