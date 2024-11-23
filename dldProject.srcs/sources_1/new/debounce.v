`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 10:15:17 AM
// Design Name: 
// Module Name: debounce
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


`timescale 1ns / 1ps

module debounce(
    input clk,      // 100MHz
    input btn_in,
    output btn_out
    );
    
    reg r1, r2, r3;
    
    always @(posedge clk) begin
        r1 <= btn_in;
        r2 <= r1;
        r3 <= r2;
    end
    
    assign btn_out = r3;
    
endmodule
