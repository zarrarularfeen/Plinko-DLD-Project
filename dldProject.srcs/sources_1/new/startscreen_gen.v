`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2024 05:12:32 PM
// Design Name: 
// Module Name: startscreen_gen
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


module startscreen_gen(
input clk,  
    input reset,
    input start,    
    input up,
    input down,
    input video_on,
    input [9:0] x,
    input [9:0] y,
//    input [9:0] score,
    output reg [11:0] rgb
    );
    
    // maximum x, y values in display area
    parameter X_MAX = 639;
    parameter Y_MAX = 479;
    reg[1:0] currState;
    // create 60Hz refresh tick
    wire refresh_tick;
    assign refresh_tick = ((y == 481) && (x == 0)) ? 1 : 0; // start of vsync(vertical retrace)
    
    // WALL
    // wall boundaries
    parameter X_WALL_L = 32;    
    parameter X_WALL_R = 39;    // 8 pixels wide
    
    // BLOCK
    
    // G
    parameter X_BLOCK1_L = 150;    
    parameter X_BLOCK1_R = 155;    
    parameter Y_BLOCK1_T = 130;
    parameter Y_BLOCK1_B = 190;     
    
    parameter X_BLOCK2_L = 150;    
    parameter X_BLOCK2_R = 210;    
    parameter Y_BLOCK2_T = 130;
    parameter Y_BLOCK2_B = 135;
    
    parameter X_BLOCK3_L = 150;    
    parameter X_BLOCK3_R = 210;    
    parameter Y_BLOCK3_T = 185;
    parameter Y_BLOCK3_B = 190;
    
    parameter X_BLOCK4_L = 205;    
    parameter X_BLOCK4_R = 210;    
    parameter Y_BLOCK4_T = 170;
    parameter Y_BLOCK4_B = 190;
    
    parameter X_BLOCK40_L = 195;    
    parameter X_BLOCK40_R = 210;    
    parameter Y_BLOCK40_T = 170;
    parameter Y_BLOCK40_B = 175;
    
    
    //A
    parameter X_BLOCK21_L = 215;    
    parameter X_BLOCK21_R = 220;    // 3 pixels wide
    parameter Y_BLOCK21_T = 130;
    parameter Y_BLOCK21_B = 190;     // 3 pixel high  
    
    parameter X_BLOCK22_L = 215;    
    parameter X_BLOCK22_R = 275;    // 3 pixels wide
    parameter Y_BLOCK22_T = 130;
    parameter Y_BLOCK22_B = 135;
    
    parameter X_BLOCK23_L = 270;    
    parameter X_BLOCK23_R = 275;    // 3 pixels wide
    parameter Y_BLOCK23_T = 130;
    parameter Y_BLOCK23_B = 190;
    
    parameter X_BLOCK31_L = 215;    
    parameter X_BLOCK31_R = 275;    // 3 pixels wide
    parameter Y_BLOCK31_T = 160;
    parameter Y_BLOCK31_B = 165;     // 3 pixel high  
    
    //M
    
    parameter X_BLOCK32_L = 280;    
    parameter X_BLOCK32_R = 285;    // 3 pixels wide
    parameter Y_BLOCK32_T = 130;
    parameter Y_BLOCK32_B = 190;
    
    parameter X_BLOCK33_L = 335;    
    parameter X_BLOCK33_R = 340;    // 3 pixels wide
    parameter Y_BLOCK33_T = 130;
    parameter Y_BLOCK33_B = 190;
    
    parameter X_BLOCK34_L = 280;    
    parameter X_BLOCK34_R = 340;    // 3 pixels wide
    parameter Y_BLOCK34_T = 130;
    parameter Y_BLOCK34_B = 135;
    
    parameter X_BLOCK41_L = 307;    
    parameter X_BLOCK41_R = 313;    // 3 pixels wide
    parameter Y_BLOCK41_T = 130;
    parameter Y_BLOCK41_B = 150;     // 3 pixel high  
    
    //E
    
    parameter X_BLOCK42_L = 345;    
    parameter X_BLOCK42_R = 350;    // 3 pixels wide
    parameter Y_BLOCK42_T = 130;
    parameter Y_BLOCK42_B = 190;  
    
    parameter X_BLOCK43_L = 345;    
    parameter X_BLOCK43_R = 405;    // 3 pixels wide
    parameter Y_BLOCK43_T = 130;
    parameter Y_BLOCK43_B = 135;
    
    parameter X_BLOCK44_L = 345;    
    parameter X_BLOCK44_R = 405;    // 3 pixels wide
    parameter Y_BLOCK44_T = 185;
    parameter Y_BLOCK44_B = 190;
      
    parameter X_BLOCK45_L = 345;    
    parameter X_BLOCK45_R = 405;    // 3 pixels wide
    parameter Y_BLOCK45_T = 157;
    parameter Y_BLOCK45_B = 163;
    
    //S
    
    parameter X_BLOCK42E_L = 150;    
    parameter X_BLOCK42E_R = 210;    // 3 pixels wide
    parameter Y_BLOCK42E_T = 60;
    parameter Y_BLOCK42E_B = 65;  
    
    parameter X_BLOCK43E_L = 150;    
    parameter X_BLOCK43E_R = 210;    // 3 pixels wide
    parameter Y_BLOCK43E_T = 115;
    parameter Y_BLOCK43E_B = 120;
    
    parameter X_BLOCK44E_L = 150;    
    parameter X_BLOCK44E_R = 210;    // 3 pixels wide
    parameter Y_BLOCK44E_T = 87;
    parameter Y_BLOCK44E_B = 93;
      
    parameter X_BLOCK45E_L = 150;    
    parameter X_BLOCK45E_R = 155;    // 3 pixels wide
    parameter Y_BLOCK45E_T = 60;
    parameter Y_BLOCK45E_B = 87;
    
    parameter X_BLOCK46E_L = 205;    
    parameter X_BLOCK46E_R = 210;    // 3 pixels wide
    parameter Y_BLOCK46E_T = 87;
    parameter Y_BLOCK46E_B = 120;
    
    //T
    
    parameter X_BLOCK42N_L = 215;    
    parameter X_BLOCK42N_R = 275;    // 3 pixels wide
    parameter Y_BLOCK42N_T = 60;
    parameter Y_BLOCK42N_B = 65;  
    
    parameter X_BLOCK43N_L = 242;    
    parameter X_BLOCK43N_R = 248;    // 3 pixels wide
    parameter Y_BLOCK43N_T = 60;
    parameter Y_BLOCK43N_B = 120;
    
    //A
    parameter X_BLOCK21A_L = 280;    
    parameter X_BLOCK21A_R = 285;    // 3 pixels wide
    parameter Y_BLOCK21A_T = 60;
    parameter Y_BLOCK21A_B = 120;     // 3 pixel high  
    
    parameter X_BLOCK22A_L = 280;    
    parameter X_BLOCK22A_R = 340;    // 3 pixels wide
    parameter Y_BLOCK22A_T = 60;
    parameter Y_BLOCK22A_B = 65;
    
    parameter X_BLOCK23A_L = 335;    
    parameter X_BLOCK23A_R = 340;    // 3 pixels wide
    parameter Y_BLOCK23A_T = 60;
    parameter Y_BLOCK23A_B = 120;
    
    parameter X_BLOCK31A_L = 280;    
    parameter X_BLOCK31A_R = 340;    // 3 pixels wide
    parameter Y_BLOCK31A_T = 90;
    parameter Y_BLOCK31A_B = 95;     // 3 pixel high  
    
    //R
    
    parameter X_BLOCK32R_L = 345;    
    parameter X_BLOCK32R_R = 350;    // 3 pixels wide
    parameter Y_BLOCK32R_T = 60;
    parameter Y_BLOCK32R_B = 120;
    
    parameter X_BLOCK33R_L = 345;    
    parameter X_BLOCK33R_R = 405;    // 3 pixels wide
    parameter Y_BLOCK33R_T = 65;
    parameter Y_BLOCK33R_B = 70;
    
    //T
    
    parameter X_BLOCK42T_L = 410;    
    parameter X_BLOCK42T_R = 470;    // 3 pixels wide
    parameter Y_BLOCK42T_T = 60;
    parameter Y_BLOCK42T_B = 65;  
    
    parameter X_BLOCK43T_L = 437;    
    parameter X_BLOCK43T_R = 443;    // 3 pixels wide
    parameter Y_BLOCK43T_T = 60;
    parameter Y_BLOCK43T_B = 120;
    
    
    
    // PADDLE
    // paddle horizontal boundaries
    parameter X_PAD_L = 600;
    parameter X_PAD_R = 603;    // 4 pixels wide
    // paddle vertical boundary signals
    wire [9:0] y_pad_t, y_pad_b;
    parameter PAD_HEIGHT = 72;  // 72 pixels high
    // register to track top boundary and buffer
    reg [9:0] y_pad_reg, y_pad_next;
    // paddle moving velocity when a button is pressed
    parameter PAD_VELOCITY = 3;     // change to speed up or slow down paddle movement
    
    // BALL
    // square rom boundaries
    parameter BALL_SIZE = 8;
    // ball horizontal boundary signals
    wire [9:0] x_ball_l, x_ball_r;
    // ball vertical boundary signals
    wire [9:0] y_ball_t, y_ball_b;
    // register to track top left position
    reg [9:0] y_ball_reg, x_ball_reg;
    // signals for register buffer
    wire [9:0] y_ball_next, x_ball_next;
    // registers to track ball speed and buffers
    reg [9:0] x_delta_reg, x_delta_next;
    reg [9:0] y_delta_reg, y_delta_next;
    // positive or negative ball velocity
    parameter BALL_VELOCITY_POS = 1;
    parameter BALL_VELOCITY_NEG = -1;
    // round ball from square image
    wire [2:0] rom_addr, rom_col;   // 3-bit rom address and rom column
    reg [7:0] rom_data;             // data at current rom address
    wire rom_bit;                   // signify when rom data is 1 or 0 for ball rgb control
    
    // Register Control
    always @(posedge clk or posedge reset or posedge start)
        if(reset) begin
            y_pad_reg <= 0;
            x_ball_reg <= 9'b000010010;
            y_ball_reg <= 9'b011110000;
            x_delta_reg <= 10'h000;
            y_delta_reg <= 10'h001; 
        end
        else if (start)
        begin
            x_delta_reg <= 10'h001;
            y_delta_reg <= 10'h001; 
        end
        else if (x_ball_l > X_MAX)
        begin
            x_ball_reg <= 9'b000010010;
            y_ball_reg <= 9'b011110000;
            x_delta_reg <= 10'h000;
            y_delta_reg <= 10'h001; 
        end
        else begin
            y_pad_reg <= y_pad_next;
            x_ball_reg <= x_ball_next;
            y_ball_reg <= y_ball_next;
            x_delta_reg <= x_delta_next;
            y_delta_reg <= y_delta_next;
        end
    
    // ball rom
    always @*
        case(rom_addr)
            3'b000 :    rom_data = 8'b00111100; //   **  
            3'b001 :    rom_data = 8'b01111110; //  **
            3'b010 :    rom_data = 8'b11111111; // ****
            3'b011 :    rom_data = 8'b11111111; // ****
            3'b100 :    rom_data = 8'b11111111; // ****
            3'b101 :    rom_data = 8'b11111111; // ****
            3'b110 :    rom_data = 8'b01111110; //  **
            3'b111 :    rom_data = 8'b00111100; //   **
        endcase
    
    // OBJECT STATUS SIGNALS
    wire wall_on, pad_on, sq_ball_on, ball_on, block_on;
    wire [11:0] wall_rgb, pad_rgb, ball_rgb, bg_rgb, block_rgb;
    
    // pixel within wall boundaries
    assign wall_on = ((X_WALL_L <= x) && (x <= X_WALL_R)) ? 1 : 0;
//    assign block_on = ((X_BLOCK1_L <= x) && (x <= X_BLOCK1_R)) ? 1 : 0;
    assign block_on = (((X_BLOCK1_L <= x) && (x <= X_BLOCK1_R) && (Y_BLOCK1_T <= y) && (y <= Y_BLOCK1_B)) 
        || ((X_BLOCK2_L <= x) && (x <= X_BLOCK2_R) && (Y_BLOCK2_T <= y) && (y <= Y_BLOCK2_B))
        || ((X_BLOCK3_L <= x) && (x <= X_BLOCK3_R) && (Y_BLOCK3_T <= y) && (y <= Y_BLOCK3_B))
        || ((X_BLOCK4_L <= x) && (x <= X_BLOCK4_R) && (Y_BLOCK4_T <= y) && (y <= Y_BLOCK4_B))
        || ((X_BLOCK21_L <= x) && (x <= X_BLOCK21_R) && (Y_BLOCK21_T <= y) && (y <= Y_BLOCK21_B))
        || ((X_BLOCK22_L <= x) && (x <= X_BLOCK22_R) && (Y_BLOCK22_T <= y) && (y <= Y_BLOCK22_B))
        || ((X_BLOCK23_L <= x) && (x <= X_BLOCK23_R) && (Y_BLOCK23_T <= y) && (y <= Y_BLOCK23_B))
        || ((X_BLOCK31_L <= x) && (x <= X_BLOCK31_R) && (Y_BLOCK31_T <= y) && (y <= Y_BLOCK31_B))
        || ((X_BLOCK32_L <= x) && (x <= X_BLOCK32_R) && (Y_BLOCK32_T <= y) && (y <= Y_BLOCK32_B))
        || ((X_BLOCK33_L <= x) && (x <= X_BLOCK33_R) && (Y_BLOCK33_T <= y) && (y <= Y_BLOCK33_B))
        || ((X_BLOCK34_L <= x) && (x <= X_BLOCK34_R) && (Y_BLOCK34_T <= y) && (y <= Y_BLOCK34_B))
        || ((X_BLOCK41_L <= x) && (x <= X_BLOCK41_R) && (Y_BLOCK41_T <= y) && (y <= Y_BLOCK41_B))
        || ((X_BLOCK42_L <= x) && (x <= X_BLOCK42_R) && (Y_BLOCK42_T <= y) && (y <= Y_BLOCK42_B))
        || ((X_BLOCK43_L <= x) && (x <= X_BLOCK43_R) && (Y_BLOCK43_T <= y) && (y <= Y_BLOCK43_B))
        || ((X_BLOCK44_L <= x) && (x <= X_BLOCK44_R) && (Y_BLOCK44_T <= y) && (y <= Y_BLOCK44_B))
        || ((X_BLOCK45_L <= x) && (x <= X_BLOCK45_R) && (Y_BLOCK45_T <= y) && (y <= Y_BLOCK45_B))
        || ((X_BLOCK40_L <= x) && (x <= X_BLOCK40_R) && (Y_BLOCK40_T <= y) && (y <= Y_BLOCK40_B))
        || ((X_BLOCK42E_L <= x) && (x <= X_BLOCK42E_R) && (Y_BLOCK42E_T <= y) && (y <= Y_BLOCK42E_B))
        || ((X_BLOCK43E_L <= x) && (x <= X_BLOCK43E_R) && (Y_BLOCK43E_T <= y) && (y <= Y_BLOCK43E_B))
        || ((X_BLOCK44E_L <= x) && (x <= X_BLOCK44E_R) && (Y_BLOCK44E_T <= y) && (y <= Y_BLOCK44E_B))
        || ((X_BLOCK45E_L <= x) && (x <= X_BLOCK45E_R) && (Y_BLOCK45E_T <= y) && (y <= Y_BLOCK45E_B))
        || ((X_BLOCK46E_L <= x) && (x <= X_BLOCK46E_R) && (Y_BLOCK46E_T <= y) && (y <= Y_BLOCK46E_B))
        || ((X_BLOCK42N_L <= x) && (x <= X_BLOCK42N_R) && (Y_BLOCK42N_T <= y) && (y <= Y_BLOCK42N_B))
        || ((X_BLOCK43N_L <= x) && (x <= X_BLOCK43N_R) && (Y_BLOCK43N_T <= y) && (y <= Y_BLOCK43N_B))
        || ((X_BLOCK21A_L <= x) && (x <= X_BLOCK21A_R) && (Y_BLOCK21A_T <= y) && (y <= Y_BLOCK21A_B))
        || ((X_BLOCK22A_L <= x) && (x <= X_BLOCK22A_R) && (Y_BLOCK22A_T <= y) && (y <= Y_BLOCK22A_B))
        || ((X_BLOCK23A_L <= x) && (x <= X_BLOCK23A_R) && (Y_BLOCK23A_T <= y) && (y <= Y_BLOCK23A_B))
        || ((X_BLOCK31A_L <= x) && (x <= X_BLOCK31A_R) && (Y_BLOCK31A_T <= y) && (y <= Y_BLOCK31A_B))
        || ((X_BLOCK32R_L <= x) && (x <= X_BLOCK32R_R) && (Y_BLOCK32R_T <= y) && (y <= Y_BLOCK32R_B))
        || ((X_BLOCK33R_L <= x) && (x <= X_BLOCK33R_R) && (Y_BLOCK33R_T <= y) && (y <= Y_BLOCK33R_B))
        || ((X_BLOCK42T_L <= x) && (x <= X_BLOCK42T_R) && (Y_BLOCK42T_T <= y) && (y <= Y_BLOCK42T_B))
        || ((X_BLOCK43T_L <= x) && (x <= X_BLOCK43T_R) && (Y_BLOCK43T_T <= y) && (y <= Y_BLOCK43T_B))
        
     ) ? 1 : 0;
    
    // assign object colors
    assign wall_rgb = 12'h000;      // gray wall
    assign pad_rgb = 12'h000;       // gray paddle
    assign block_rgb = 12'hF1F;     //gray block
    assign ball_rgb = 12'h000;      // white ball
    assign bg_rgb = 12'h000;       // close to black background
    
    // paddle 
    assign y_pad_t = y_pad_reg;                             // paddle top position
    assign y_pad_b = y_pad_t + PAD_HEIGHT - 1;              // paddle bottom position
    assign pad_on = (X_PAD_L <= x) && (x <= X_PAD_R) &&     // pixel within paddle boundaries
                    (y_pad_t <= y) && (y <= y_pad_b);
                    
    // Paddle Control
    always @* begin
        y_pad_next = y_pad_reg;     // no move
        if(refresh_tick)
            if(up & (y_pad_t > PAD_VELOCITY))
                y_pad_next = y_pad_reg - PAD_VELOCITY;  // move up
            else if(down & (y_pad_b < (Y_MAX - PAD_VELOCITY)))
                y_pad_next = y_pad_reg + PAD_VELOCITY;  // move down
    end
    
    // rom data square boundaries
    assign x_ball_l = x_ball_reg;
    assign y_ball_t = y_ball_reg;
    assign x_ball_r = x_ball_l + BALL_SIZE - 1;
    assign y_ball_b = y_ball_t + BALL_SIZE - 1;
    // pixel within rom square boundaries
    assign sq_ball_on = (x_ball_l <= x) && (x <= x_ball_r) &&
                        (y_ball_t <= y) && (y <= y_ball_b);
    // map current pixel location to rom addr/col
    assign rom_addr = y[2:0] - y_ball_t[2:0];   // 3-bit address
    assign rom_col = x[2:0] - x_ball_l[2:0];    // 3-bit column index
    assign rom_bit = rom_data[rom_col];         // 1-bit signal rom data by column
    // pixel within round ball
    assign ball_on = sq_ball_on & rom_bit;      // within square boundaries AND rom data bit == 1
    // new ball position
    assign x_ball_next = (refresh_tick) ? x_ball_reg + x_delta_reg : x_ball_reg;
    assign y_ball_next = (refresh_tick) ? y_ball_reg + y_delta_reg : y_ball_reg;
    
    // change ball direction after collision
    always @* begin
        x_delta_next = x_delta_reg;
        y_delta_next = y_delta_reg;
        
        
//        // ball control
//        if(refresh_tick)
//            if(up)
//                y_delta_next = y_ball_reg - 1;                       // move up
//            else if(down)
//                y_delta_next = y_ball_reg + 1;                       // move down
//        //
        
        if(y_ball_t < 1)                                            // collide with top
            y_delta_next = BALL_VELOCITY_POS;                       // move down
        else if(y_ball_b > Y_MAX)                                   // collide with bottom
            y_delta_next = BALL_VELOCITY_NEG;                       // move up
        else if(x_ball_l == X_WALL_R && x_ball_r > X_WALL_L  )                               // collide with wall
            x_delta_next = BALL_VELOCITY_POS;                       // move right
        else if((X_PAD_L <= x_ball_r) && (x_ball_r <= X_PAD_R) &&
                (y_pad_t <= y_ball_b) && (y_ball_t <= y_pad_b))     // collide with paddle
            x_delta_next = BALL_VELOCITY_NEG; // move left
        else if(
                ((X_BLOCK1_L == x_ball_r) && (x_ball_l < X_BLOCK1_L) &&
                (Y_BLOCK1_T <= y_ball_b) && (y_ball_t <= Y_BLOCK1_B)) 
                || ((X_BLOCK2_L == x_ball_r) && (x_ball_l < X_BLOCK2_L) &&
                (Y_BLOCK2_T <= y_ball_b) && (y_ball_t <= Y_BLOCK2_B))
                || ((X_BLOCK3_L == x_ball_r) && (x_ball_l < X_BLOCK3_L) &&
                (Y_BLOCK3_T <= y_ball_b) && (y_ball_t <= Y_BLOCK3_B))
                || ((X_BLOCK4_L == x_ball_r) && (x_ball_l < X_BLOCK4_L) &&
                (Y_BLOCK4_T <= y_ball_b) && (y_ball_t <= Y_BLOCK4_B))
                || ((X_BLOCK21_L == x_ball_r) && (x_ball_l < X_BLOCK21_L) &&
                (Y_BLOCK21_T <= y_ball_b) && (y_ball_t <= Y_BLOCK21_B))
                || ((X_BLOCK22_L == x_ball_r) && (x_ball_l < X_BLOCK22_L) &&
                (Y_BLOCK22_T <= y_ball_b) && (y_ball_t <= Y_BLOCK22_B))
                || ((X_BLOCK23_L == x_ball_r) && (x_ball_l < X_BLOCK23_L) &&
                (Y_BLOCK23_T <= y_ball_b) && (y_ball_t <= Y_BLOCK23_B))
                || ((X_BLOCK31_L == x_ball_r) && (x_ball_l < X_BLOCK31_L) &&
                (Y_BLOCK31_T <= y_ball_b) && (y_ball_t <= Y_BLOCK31_B)) 
                || ((X_BLOCK32_L == x_ball_r) && (x_ball_l < X_BLOCK32_L) &&
                (Y_BLOCK32_T <= y_ball_b) && (y_ball_t <= Y_BLOCK32_B))
                || ((X_BLOCK33_L == x_ball_r) && (x_ball_l < X_BLOCK33_L) &&
                (Y_BLOCK33_T <= y_ball_b) && (y_ball_t <= Y_BLOCK33_B))
                || ((X_BLOCK34_L == x_ball_r) && (x_ball_l < X_BLOCK34_L) &&
                (Y_BLOCK34_T <= y_ball_b) && (y_ball_t <= Y_BLOCK34_B))
                || ((X_BLOCK21_L == x_ball_r) && (x_ball_l < X_BLOCK21_L) &&
                (Y_BLOCK41_T <= y_ball_b) && (y_ball_t <= Y_BLOCK41_B))
                || ((X_BLOCK42_L == x_ball_r) && (x_ball_l < X_BLOCK42_L) &&
                (Y_BLOCK42_T <= y_ball_b) && (y_ball_t <= Y_BLOCK42_B))
                || ((X_BLOCK43_L == x_ball_r) && (x_ball_l < X_BLOCK43_L) &&
                (Y_BLOCK43_T <= y_ball_b) && (y_ball_t <= Y_BLOCK43_B))
                
                )     // collide with paddle
            x_delta_next = BALL_VELOCITY_NEG; // move left
        else if(
        ((X_BLOCK1_R == x_ball_l) && (X_BLOCK1_R < x_ball_r) 
        && (Y_BLOCK1_T <= y_ball_b) && (y_ball_t <= Y_BLOCK1_B))
        || ((X_BLOCK2_R == x_ball_l) && (X_BLOCK2_R < x_ball_r) 
        && (Y_BLOCK2_T <= y_ball_b) && (y_ball_t <= Y_BLOCK2_B))
        || ((X_BLOCK3_R == x_ball_l) && (X_BLOCK3_R < x_ball_r) 
        && (Y_BLOCK3_T <= y_ball_b) && (y_ball_t <= Y_BLOCK3_B)) 
        || ((X_BLOCK4_R == x_ball_l) && (X_BLOCK4_R < x_ball_r) 
        && (Y_BLOCK4_T <= y_ball_b) && (y_ball_t <= Y_BLOCK4_B))
        || ((X_BLOCK21_R == x_ball_l) && (X_BLOCK21_R < x_ball_r) 
        && (Y_BLOCK21_T <= y_ball_b) && (y_ball_t <= Y_BLOCK21_B))
        || ((X_BLOCK22_R == x_ball_l) && (X_BLOCK22_R < x_ball_r) 
        && (Y_BLOCK22_T <= y_ball_b) && (y_ball_t <= Y_BLOCK22_B))
        || ((X_BLOCK23_R == x_ball_l) && (X_BLOCK23_R < x_ball_r) 
        && (Y_BLOCK23_T <= y_ball_b) && (y_ball_t <= Y_BLOCK23_B))
        || ((X_BLOCK31_R == x_ball_l) && (X_BLOCK31_R < x_ball_r) // wall 3...
        && (Y_BLOCK31_T <= y_ball_b) && (y_ball_t <= Y_BLOCK31_B))
        || ((X_BLOCK32_R == x_ball_l) && (X_BLOCK32_R < x_ball_r) 
        && (Y_BLOCK32_T <= y_ball_b) && (y_ball_t <= Y_BLOCK32_B))
        || ((X_BLOCK33_R == x_ball_l) && (X_BLOCK33_R < x_ball_r) 
        && (Y_BLOCK33_T <= y_ball_b) && (y_ball_t <= Y_BLOCK33_B))
        || ((X_BLOCK34_R == x_ball_l) && (X_BLOCK34_R < x_ball_r) 
        && (Y_BLOCK34_T <= y_ball_b) && (y_ball_t <= Y_BLOCK34_B))
        || ((X_BLOCK41_R == x_ball_l) && (X_BLOCK41_R < x_ball_r) 
        && (Y_BLOCK41_T <= y_ball_b) && (y_ball_t <= Y_BLOCK41_B))
        || ((X_BLOCK42_R == x_ball_l) && (X_BLOCK42_R < x_ball_r) 
        && (Y_BLOCK42_T <= y_ball_b) && (y_ball_t <= Y_BLOCK42_B))
        || ((X_BLOCK43_R == x_ball_l) && (X_BLOCK43_R < x_ball_r) 
        && (Y_BLOCK43_T <= y_ball_b) && (y_ball_t <= Y_BLOCK43_B))
        )                               // collide with wall
            x_delta_next = BALL_VELOCITY_POS; 
    end                    
    
    // rgb multiplexing circuit
    always @*
        if(~video_on)
            rgb = 12'h000;      // no value, blank
        else
            if(wall_on)
                rgb = wall_rgb;     // wall color
            else if(pad_on)
                rgb = pad_rgb;      // paddle color
            else if(ball_on)
                rgb = ball_rgb;     // ball color
            else if (block_on)      //block color
                rgb = block_rgb;
            else
                rgb = bg_rgb;       // background


endmodule
