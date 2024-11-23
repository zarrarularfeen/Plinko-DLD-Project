`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 10:28:00 PM
// Design Name: 
// Module Name: keyboard_module
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



module keyboard_module(
    //main game's clock
    input clk,      
    //will be the outpt of the PS2DataReceiver        
    input [15:0] keycode,    
    input oflag,
    //up,down and start signals for the inputs to the pixel_gen module.             
    output reg start,        
    output reg up,           
    output reg down,
    output reg reset         
);

    always @(posedge clk) begin
        if (oflag) begin
            case (keycode[7:0])
                //arrow up key for moving the paddle 
                8'h1D: up<=1;      
                //arrow down key for moving the paddle 
                8'h1B: down<=1;
                //Space bar for the game start logic 
                8'h2D: start<=1;
                //Space bar for reser logic too
                8'h2D: reset<=1;
                default: begin
                    up<=0;
                    down<=0;
                    start<=0;
                    reset<=0;
                end
            endcase
        end else begin
            
            up<=0;
            down<=0;
            start<=0;
            reset<=0;
        end
    end

endmodule

