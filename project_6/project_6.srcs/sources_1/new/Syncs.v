`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 07:50:52 PM
// Design Name: 
// Module Name: Syncs
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


module Syncs(
    input [15:0] v, 
    input [15:0] h,
    output Hsync,
    output Vsync
    );
    
    //Hsync signal goes low at 655-750
    assign Hsync = ~(h >= 16'b0000001010001110 && h <= 16'b0000001011101101);
    //16'b0000001010001111
    //&& h <= 16'b0000001011101110
    //Vsync signal goes low at 489-490
    assign Vsync = ~(v >= 16'b0000000111101001 && v <= 16'b0000000111101010);
      
endmodule