`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2023 02:24:50 PM
// Design Name: 
// Module Name: StateMachine
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


module StateMachine(
    input btnU,
    input TimeUp,
    input GameTimeUp,
    input Divided,
    input clk

    );
    wire [4:0] D,Q;
    
    assign D[0] = Q[0] & ~btnU; //Idle while not pressed btnU
    assign D[1] = (Q[0] & btnU) | (Q[1] & ~TimeUp) | (Q[3] & btnU) | (Q[4] & btnU);//Countdown from either win / lose, from idle, and from countdown when not timeup
    assign D[2] = (Q[1] & TimeUp) | (Q[2] & ~GameTimeUp & ~Divided); //from countdown and timeup, from play and gametime is not over
    assign D[3] = (Q[3] & ~btnU) | (Q[2] & Divided); // Enter win state when we are in win and ~btnU or from Play and Divided
    assign D[4] = (Q[2] & ~Divided & GameTimeUp) | (Q[4] & ~btnU);   
     
    //Define States
    FDRE #(.INIT(1'b1)) Idle (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Countdown (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Play (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Win (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3]));
    FDRE #(.INIT(1'b0)) Lose (.C(clk), .CE(1'b1), .D(D[4]), .Q(Q[4]));
    
    
    
    
endmodule
