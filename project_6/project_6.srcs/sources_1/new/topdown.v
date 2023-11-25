`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2023 08:45:57 PM
// Design Name: 
// Module Name: topdown
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


module topdown(
    input btnU,
    input btnD,
    input btnC,
    input btnR,
    input btnL,
    input clkin,
    input [15:0] sw,
    output[6:0] seg,
    output dp,
    output [3:0] an,
    output [3:0] vgaBlue,
    output [3:0] vgaGreen,
    output [3:0] vgaRed,
    output Hsync,
    output Vsync,
    output [15:0] led

    );
    wire [15:0] V,H;
    wire clk, digsel;
    wire HsyncWrong, VsyncWrong;
    
    
    labVGA_clks clock(.clkin(clkin),.greset(btnC),.clk(clk),.digsel(digsel));
    
    //Pixel address generates V and H signals
    PixelAddress pixeladdy (.clk(clk),.V(V), .H(H));
    
    //feed in inputs from pixel address into our syncs to generate Hsync and Vsync
    Syncs sync(.v(V),.h(H),.Hsync(HsyncWrong),.Vsync(VsyncWrong));
    
    FDRE #(.INIT(1'b1)) HsyncFlipFlop (.C(clk), .CE(1'b1), .D(HsyncWrong), .Q(Hsync));
    FDRE #(.INIT(1'b1)) VsyncFlipFlop (.C(clk), .CE(1'b1), .D(VsyncWrong), .Q(Vsync));
    
    assign vgaBlue = 4'b0000;
    assign vgaRed= 4'b0000;
    assign vgaGreen = 4'b0000;
    
    
    
    
    
    
    //Set our Pixel Address -> Syncs -> Produce Output
    
endmodule
