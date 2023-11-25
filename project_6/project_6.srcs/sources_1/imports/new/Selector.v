`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 02:22:46 PM
// Design Name: 
// Module Name: Selector
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


module Selector(
    input [15:0] N,
    input [3:0] sel,
    output [3:0] H
    );

    wire sel1000, sel0100, sel0010, sel0001;
   
    assign sel1000 = sel[3] & ~sel[2] & ~sel[1] & ~sel[0];
    assign sel0100 = ~sel[3] & sel[2] & ~sel[1] & ~sel[0];
    assign sel0010 = ~sel[3] & ~sel[2] & sel[1] & ~sel[0];
    assign sel0001 = ~sel[3] & ~sel[2] & ~sel[1] & sel[0];
    
    assign H[3] = (sel1000 & N[15]) | (sel0100 & N[11]) | (sel0010 & N[7]) | (sel0001 & N[3]);

    // H[2]
    assign H[2] = (sel1000 & N[14]) | (sel0100 & N[10]) | (sel0010 & N[6]) | (sel0001 & N[2]);

    // H[1]
    assign H[1] = (sel1000 & N[13]) | (sel0100 & N[9])  | (sel0010 & N[5]) | (sel0001 & N[1]);

    // H[0]
    assign H[0] = (sel1000 & N[12]) | (sel0100 & N[8])  | (sel0010 & N[4]) | (sel0001 & N[0]);

endmodule
    
    








