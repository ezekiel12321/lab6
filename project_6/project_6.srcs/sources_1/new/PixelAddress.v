`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 12:46:00 PM
// Design Name: 
// Module Name: PixelAddress
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


module PixelAddress(
    input clk,
    output [15:0] V,
    output [15:0] H

    );
    
    wire resetHorizontal, resetVertical;
    
    //every clk, we move horizontally
    counterUD16L horizontal(.Up(1'b1),.Dw(1'b0),.clock(clk),.LD(resetHorizontal),.D_in(16'b0000000000000000),.Q(H));   
    assign resetHorizontal = H[0] & H[1] & H[2] & H[3] & H[4] & H[8] & H[9];
    //V & 16'b0000001100011111; //If its at 799 set back to 0
    
    

    counterUD16L vertical(.Up(resetHorizontal),.Dw(1'b0),.clock(clk),.LD(resetVertical),.D_in(16'b0000000000000000),.Q(V));
    assign resetVertical =  V[2] & V[3] & V[9];
    //H & 16'b0000001000001100;
    
    //Will this cause a combinational loop because the output is an input?
    
    
    
endmodule
