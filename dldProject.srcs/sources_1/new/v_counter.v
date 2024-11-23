`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 12:08:07 AM
// Design Name: 
// Module Name: v_counter
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


module v_counter( 
    input clk, 
    input enable_v, 
    output v_count 
    ); 
    reg [9:0] v_count; 
initial v_count = 0; 
always @ (posedge clk) 
begin 
if (v_count <= 523 & enable_v == 1) 
begin 
v_count <= v_count + 1; 
end 
else 
begin 
v_count <= 0; 
end 
end 
     
endmodule
