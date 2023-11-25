`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2023 10:53:09 PM
// Design Name: 
// Module Name: StateMachine_tb
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

module StateMachine_tb();

    // Inputs
    reg btnU;
    reg TimeUp;
    reg GameTimeUp;
    reg Divided;
    reg clk;

    // Instantiate the Unit Under Test (UUT)
    StateMachine uut (
        .btnU(btnU), 
        .TimeUp(TimeUp), 
        .GameTimeUp(GameTimeUp), 
        .Divided(Divided), 
        .clk(clk)
    );

    initial begin
        // Initialize Inputs
        #10;
        btnU = 0;
        TimeUp = 0;
        GameTimeUp = 0;
        Divided = 0;
        clk = 0;
        
        //start at idle (~btnU)
        #100;
     
        
        //go from idle -> countdown (btnU)
        btnU = 1;
        #100;
        
        //go from countdown to play (TimeUp)
        btnU = 0;
        TimeUp = 1;
        
        //Hold at play
        #100;
        
        //go from play to win (Divided)
        TimeUp = 0;
        Divided = 1;
        #100;
        
        //Go back to countdown
        Divided = 0;
        btnU = 1;
        #100;
        
        
        //go from play to lose (GameTimeUp & ~Divided)
        btnU = 0; 
        TimeUp = 1;
        #100;
        TimeUp = 0;
        GameTimeUp = 1;
        #100;
        btnU = 1;
        
        
        
        
    end
    
    // Clock generation
    always #5 clk = ~clk;

    

endmodule

