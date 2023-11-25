`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:18:38 PM
// Design Name: 
// Module Name: countUD4L
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


module countUD4L(
    
    //defining inputs / outputs
    input clk,
    input LD, 
    input Up, 
    input Dw, 
    input R,
    input [3:0] Din, 
    output [3:0] Q,  
    output UTC,
    output DTC
    
);

    wire clock_edge;
    //Use the clock edge to handle logic for how up / down / loads work
    assign clock_edge = (Up ^ Dw) | LD;
    

    // Define counter operation when not loading here (increment, decrement, etc.)
    wire [3:0] D_increment;
    assign D_increment =  {(Q[3] ^ (Up & Q[2] & Q[1] & Q[0])),(Q[2] ^ (Up & Q[1] & Q[0])), (Q[1] ^ (Up & Q[0])), (Q[0] ^ Up)};
    
    
    wire [3:0] D_decrement;
    assign D_decrement =  {(Q[3] ^ (Dw & ~Q[2] & ~Q[1] & ~Q[0])),(Q[2] ^ (Dw & ~Q[1] & ~Q[0])), (Q[1] ^ (Dw & ~Q[0])), (Q[0] ^ Dw)};


    
//    wire [3:0] D_xor_increment_decrement;
//    assign D_xor_increment_decrement = D_increment ^ D_decrement;
//    multiplexor4bit mux(.s(~inc));
    
    wire [3:0] load_din;
    assign load_din = (D_increment & ({4{Up}} & ~{4{Dw}} & ~{4{LD}})) | (D_decrement & (~{4{Up}} & {4{Dw}} & ~{4{LD}})) |(Din & {4{LD}});


    
    
    
    assign UTC = Q[0] & Q[1] & Q[2] & Q[3]; //If all bits are 1's then, make UTC up
    assign DTC = ~Q[0] & ~Q[1] & ~Q[2] & ~Q[3]; //If all of them are negative, then make DTC UP
    
    
    
    

    
//

    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk),.R(R), .CE(clock_edge), .D(load_din[0]), .Q(Q[0]));
    
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk),.R(R), .CE(clock_edge), .D(load_din[1]), .Q(Q[1]));
    
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk),.R(R), .CE(clock_edge), .D(load_din[2]), .Q(Q[2]));
    
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk),.R(R), .CE(clock_edge), .D(load_din[3]), .Q(Q[3]));

    
endmodule


//module Sequential(
//    input clk,
//    input x,
//    //output [1:0] Q, // uncomment this line if you want Q as an output
//    output z
//    );
    
//    wire [3:0] Q;  // comment this line if you want Q as an output
//    wire [3:0] D;
    
//    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
//    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1]));
//    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2]));
//    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3]));
    
//    assign D[0] = x; // logic expression for D[0] in terms of x, Q[1], and Q[0]
//    assign D[1] = Q[0] & x; // logic expression for D[1] in terms of x, Q[1], and Q[0]
//    assign D[2] = x & Q[0] & Q[1]; // logic expression for D[0] in terms of x, Q[1], and Q[0]
//    assign D[3] = x & Q[0] & Q[1] & Q[2]; // logic expression for D[0] in terms of x, Q[1], and Q[0]
//    assign z = x & Q[0] & Q[1] & Q[2] & Q[3] ; // logic expression for z in terms of x, Q[1], and Q[0]
    
//endmodule