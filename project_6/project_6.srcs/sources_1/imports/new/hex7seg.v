`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 03:38:21 PM
// Design Name: 
// Module Name: hex7seg
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


module hex7seg(
    input [3:0] n,
    
    output [6:0] seg

    );
    wire n3,n2,n1,n0;
    assign n3 = n[3];
    assign n2 = n[2];
    assign n1 = n[1];
    assign n0 = n[0];
    //MODIFY * to & statements
    assign seg[0] = (~n3 & ~n2 & ~n1 & n0) | (~n3 & n2 & ~n1 & ~n0) | (n3 & ~n2 & n1 & n0) | (n3 & n2 & ~n1 & n0);
    assign seg[1] = (~n3 & n2 & ~n1 & n0) | (~n3 & n2 & n1 & ~n0) | (n3 & ~n2 & n1 & n0) | (n3 & n2 & ~n1 & ~n0) | (n3 & n2 & n1 & ~n0) | (n3 & n2 & n1 & n0);
    assign seg[2] = (~n3 & ~n2 & n1 & ~n0) | (n3 & n2 & ~n1 & ~n0) | (n3 & n2 & n1 & ~n0) | (n3 & n2 & n1 & n0);
    assign seg[3] = (~n3 & ~n2 & ~n1 & n0) | (~n3 & n2 & ~n1 & ~n0) | (~n3 & n2 & n1 & n0) | (n3 & ~n2 & ~n1 & n0) | (n3 & ~n2 & n1 & ~n0) | (n3 & n2 & n1 & n0);
    assign seg[4] = (~n3 & ~n2 & ~n1 & n0) | (~n3 & ~n2 & n1 & n0) | (~n3 & n2 & ~n1 & ~n0) | (~n3 & n2 & ~n1 & n0) | (~n3 & n2 & n1 & n0) | (n3 & ~n2 & ~n1 & n0);
    assign seg[5] = (~n3 & ~n2 & ~n1 & n0) | (~n3 & ~n2 & n1 & ~n0) | (~n3 & ~n2 & n1 & n0) | (~n3 & n2 & n1 & n0) | (n3 & n2 & ~n1 & n0);
    assign seg[6] = (~n3 & ~n2 & ~n1 & ~n0) | (~n3 & ~n2 & ~n1 & n0) | (~n3 & n2 & n1 & n0) | (n3 & n2 & ~n1 & ~n0);

endmodule

