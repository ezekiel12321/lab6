`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2023 01:48:45 PM
// Design Name: 
// Module Name: Molecule
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


module Molecule(
    input H,
    input V,
    input Go
    
    );
    
    wire [15:0] Q1, Q2;
    
    //Directions
    wire left, right, up, down;
    
    counterUD16L horizontal(.Up(right),.Dw(left),.clock(clk),.LD(resetHorizontal),.D_in(16'b0000000000000000),.Q(Q1));   
    counterUD16L vertical(.Up(up),.Dw(down),.clock(clk),.LD(resetHorizontal),.D_in(16'b0000000000000000),.Q(Q2)); 
    
    MoleculeStateMachine(.Go(Go),.leftwall(), .rightwall(),.topwall(),.bottomwall(),.left(left),.right(right), .up(up),.down(down));
    
    wire is_molecule;
    assign is_molecule = (H > Q1 & H < (Q1 + 16)) & (V > Q2 & V < (Q2 + 16)) ;
    
    //what is the case for hitting the left wall
    
    //at pixel (H,V). (H,V) is both within the bounds of our molecule as well as within the bounds of the left wall.
    
     
    
    //assign left wall 
endmodule
