`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 06:57:44 PM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [2:0] nin,
    output [7:0] out
    );
    wire d0, d1, d2, d3, d4, d5, d6, d7;

    assign out[0] = ~nin[2] & ~nin[1] & ~nin[0];
    assign out[1] = ~nin[2] & ~nin[1] &  nin[0];
    assign out[2] = ~nin[2] &  nin[1] & ~nin[0];
    assign out[3] = ~nin[2] &  nin[1] &  nin[0];
    assign out[4] =  nin[2] & ~nin[1] & ~nin[0];
    assign out[5] =  nin[2] & ~nin[1] &  nin[0];
    assign out[6] =  nin[2] &  nin[1] & ~nin[0];
    assign out[7] =  nin[2] &  nin[1] &  nin[0];

    //continue the rest for d1 .. d7

endmodule
