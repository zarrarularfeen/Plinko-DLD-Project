`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 01:08:03 AM
// Design Name: 
// Module Name: TopLevelModule
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


module TopLevelModule( 
//    input clk, 
//    output [9:0] h_count, 
//    output [9:0] v_count 
//    ); 
//    wire clk_div_out; 
//    wire trig_v; 
//    clk_div a(clk, clk_div_out); 
//    h_counter b(clk_div_out, h_count, trig_v); 
//    v_counter c(clk_div_out, trig_v, v_count); 
input clk_100MHz,       // from Basys 3
//    input reset,            // btnR
//    input start,
//    input up,               // btnU
//    input down,             // btnD
    output hsync,           // to VGA port
    output vsync,           // to VGA port
    output [11:0] rgb,        // to DAC, to VGA port
    input PS2Clk,
    input PS2Data,
    output reg dataLight

    );
    wire w_vid_on, w_p_tick;
    reg w_reset,w_start, w_up, w_down, w_back,w_startgame;
    wire [9:0] w_x, w_y;
    reg [11:0] rgb_reg;
    wire [11:0] rgb_next;
    wire oflag;
    wire [15:0] keycode;
    
  
     
     
    vga_controller vga(.clk_100MHz(clk_100MHz), .reset(w_reset), .video_on(w_vid_on),
                       .hsync(hsync), .vsync(vsync), .p_tick(w_p_tick), .x(w_x), .y(w_y));

      
    PS2Receiver P1(.clk(clk_100MHz),.kclk(PS2Clk),.kdata(PS2Data),.keycode(keycode),.oflag(oflag));

//    keyboard_module K1(.clk(clk_100MHz),.keycode(keycode),.oflag(oflag),.start(w_start),.up(w_up),.down(w_down),.reset(w_reset));


     always @(posedge clk_100MHz) begin
        if (oflag) begin
//            
                case (keycode[7:0])
                //w key for moving the paddle 
                8'h1D: begin
                w_up<=1; 
                dataLight <= 1;
                end      
                //s key for moving the paddle 
                8'h1B: begin
                w_down<=1; 
                dataLight <= 1;
                end
                //Space bar for the game start logic 
                8'h29: begin
                w_start<=1; 
                dataLight <= 1;
                end
                //r for reser logic too
                8'h2D: begin
                w_reset<=1; 
                dataLight <= 1;
                end
                8'h22: begin
                w_back<=1; 
                dataLight <= 1;
                end
                8'h5A: begin
                w_startgame<=1; 
                dataLight <= 1;
                end
                default: begin
                    w_up<=0;
                    w_down<=0;
                    w_start<=0;
                    w_back<=0;
                    w_startgame<=0;
                    w_reset<=0;
                    dataLight <= 0;
                end
            endcase
        end else begin
            // Reset control signals when key is released
            w_up<=0;
            w_back<=0;
            w_startgame<=0;
            dataLight <= 0;
            w_down<=0;
            w_start<=0;
            w_reset<=0;
        end
    end

    pixel_gen pg(.clk(clk_100MHz),.reset(w_back),.start(w_start), .up(w_up), .down(w_down), 
                 .video_on(w_vid_on), .x(w_x), .y(w_y), .rgb(rgb_next));
//    endscreen_gen pg(.clk(clk_100MHz), .reset(w_reset),.start(w_start), .up(w_up), .down(w_down), 
//                 .video_on(w_vid_on), .x(w_x), .y(w_y), .rgb(rgb_next));  
//      startscreen_gen pg(.clk(clk_100MHz), .reset(w_reset),.start(w_start), .up(w_up), .down(w_down), 
//                 .video_on(w_vid_on), .x(w_x), .y(w_y), .rgb(rgb_next));      
//    debounce dbR(.clk(clk_100MHz), .btn_in(reset), .btn_out(w_reset));
//    debounce dbU(.clk(clk_100MHz), .btn_in(up), .btn_out(w_up));
//    debounce dbD(.clk(clk_100MHz), .btn_in(down), .btn_out(w_down));
//    debounce dbS(.clk(clk_100MHz), .btn_in(start), .btn_out(w_start));
    
    // rgb buffer
    always @(posedge clk_100MHz)
        if(w_p_tick)
            rgb_reg <= rgb_next;
            
            
    assign rgb = rgb_reg;
endmodule 