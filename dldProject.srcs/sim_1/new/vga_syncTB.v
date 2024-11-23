`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 01:00:01 AM
// Design Name: 
// Module Name: vga_syncTB
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

module vga_syncTB( 
 
    ); 
    reg clk; 
    wire [9:0] h_count; 
    wire [9:0] v_count; 
    wire h_sync; 
    wire v_sync; 
    wire video_on; 
    wire [9:0] x_loc; 
    wire [9:0] y_loc; 
     
    wire clk_d;
    wire [9:0] h_count;
    wire v_trig;
    wire h_sync;
    wire v_sync;
    clk_div c1(clk,clk_d);
    
    h_counter h1(clk_d,h_count , trig_v);
    
    wire [9:0] v_count;
    v_counter v1(clk_d, enable_v, v_count);
    
    vga_sync vs(h_count,v_count, h_sync, v_sync, video_on, x_loc, y_loc); 
    initial  
    begin 
    clk = 1'b0; 
    end 
    always 
    begin 
    #1 clk = ~clk; 
    end 
     
     
endmodule 
