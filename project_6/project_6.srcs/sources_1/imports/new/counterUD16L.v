`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 03:40:24 PM
// Design Name: 
// Module Name: counterUD16L
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


module counterUD16L(
        input Up,
        input Dw,
        input clock,
        input LD,
        input [15:0] D_in,
        
        output UTC,
        output DTC,
        output [15:0] Q
        
    );
    
    
    wire [3:0] UTC_Output;
    
    wire countUp2;
    assign countUp2 = Up & UTC_Output[0];
    
    wire countUp3;
    assign countUp3 = Up & UTC_Output[1] & UTC_Output[0];
    
    wire countUp4;
    assign countUp4 = Up & UTC_Output[2] & UTC_Output[1] & UTC_Output[0];
    
    assign UTC = UTC_Output[3] & UTC_Output[2] & UTC_Output[1] & UTC_Output[0];
    
    wire [3:0] DTC_Output;
    
    wire countDown2;
    assign countDown2 = Dw & DTC_Output[0];
    
    wire countDown3;
    assign countDown3 = Dw & DTC_Output[1] & DTC_Output[0];
    
    wire countDown4;
    assign countDown4 = Dw & DTC_Output[2] & DTC_Output[1] & DTC_Output[0];
    
    assign DTC = DTC_Output[3] & DTC_Output[2] & DTC_Output[1] & DTC_Output[0];
    
    countUD4L count1(.clk(clock),.Up(Up),.Dw(Dw),.LD(LD),.Din(D_in[3:0]),.Q(Q[3:0]),.UTC(UTC_Output[0]),.DTC(DTC_Output[0]));
    countUD4L count2(.clk(clock),.Up(countUp2),.Dw(countDown2),.LD(LD),.Din(D_in[7:4]),.Q(Q[7:4]),.UTC(UTC_Output[1]),.DTC(DTC_Output[1]));
    countUD4L count3(.clk(clock),.Up(countUp3),.Dw(countDown3),.LD(LD),.Din(D_in[11:8]),.Q(Q[11:8]),.UTC(UTC_Output[2]),.DTC(DTC_Output[2]));
    countUD4L count4(.clk(clock),.Up(countUp4),.Dw(countDown4),.LD(LD),.Din(D_in[15:12]),.Q(Q[15:12]),.UTC(UTC_Output[3]),.DTC(DTC_Output[3]));
endmodule
