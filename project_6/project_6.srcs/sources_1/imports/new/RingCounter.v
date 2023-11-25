`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 02:37:32 PM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
//set inputs / outputs
    input Advance,
    input clock,
    output [3:0] Q
    );
    
    
    //define clock to shift bits
    
 
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clock), .CE(Advance), .D(Q[3]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clock), .CE(Advance), .D(Q[0]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clock), .CE(Advance), .D(Q[1]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clock), .CE(Advance), .D(Q[2]), .Q(Q[3]));
    
endmodule
