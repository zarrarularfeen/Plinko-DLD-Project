`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 12:06:45 AM
// Design Name: 
// Module Name: vga_sync
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


module vga_sync( 
    input [9:0] h_count, 
    input [9:0] v_count, 
    output h_sync, 
    output v_sync, 
    output video_on, 
    output [9:0] x_loc, 
    output [9:0] y_loc 
    ); 
    // horizontal 
    localparam HD = 640; // Horizontal Display Area 
    localparam HF = 16;// Horizontal (Front Porch) Right Border 
    localparam HB = 48;// Horizontal (Back Porch) Left Border 
    localparam HR = 96;// Horizontal Retrace 
    // vertical 
    localparam VD =480; // Vertical Display Area 
    localparam VF = 10;// Vertical (Front Porch) BottomBorder 
    localparam VB = 33;// Vertical (Back Porch)Top Border 
    localparam VR = 2;// Vertical Retrace 
     
    assign x_loc = h_count; 
    assign y_loc = v_count; 
    assign v_sync = (v_count <(VD + VF)) | (v_count >= (VF+VD+VR)) ? 1'b1:1'b0; 
    assign h_sync = (h_count <(HD + HF)) | (h_count >= (HF+HD+HR))? 1'b1:1'b0; 
    assign video_on = (h_count < HD) & (v_count < VD); 
     
     
endmodule 
