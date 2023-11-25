`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 08:34:04 PM
// Design Name: 
// Module Name: Syncs_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Syncs_tb();

// Testbench Signals
reg clk;
wire [15:0] V, H;
wire Hsync, Vsync;

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = !clk; // Generate a clock with a period of 10 ns
end

// Instantiate PixelAddress
PixelAddress uut1(
    .clk(clk),
    .V(V),
    .H(H)
);

// Instantiate Syncs
Syncs uut2(
    .v(V),
    .h(H),
    .Hsync(Hsync),
    .Vsync(Vsync)
);

// Test Sequence
initial begin
    
    #100000;
end

endmodule
