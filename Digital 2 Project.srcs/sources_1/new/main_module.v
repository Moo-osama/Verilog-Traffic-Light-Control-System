`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 04:42:20 AM
// Design Name: 
// Module Name: main_module
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


module main_module(input clk, input rst, input walk_filtered_button, input sensor, output  [3:0] segEn, output  [6:0] seg_bin);
    wire [3:0]segEnCounter;
    wire clk1Hz;
    wire clk200Hz;
    wire [6:0]seg1, seg2, seg3, seg4;
    // wire walk_filtered_button;
    wire sync_in;
    wire dep_in;
    
    reg [1:0]mainSign;
    reg [1:0]sideSign;
    reg [2:0] c_state;
    reg [1:0]walkSign;
    reg [4:0] sec_counter;
    reg activate_walk;
    
    parameter G_R = 3'b000, Y_R = 3'b001, R_G = 3'b010, R_Y = 3'b011, walk_state = 3'b100;
    
    /*synchronizer sync_1 (clk, rst, walk_request, sync_in);
    debouncer deb_1 (clk, rst, sync_in, dep_in);
    rising_edge_detector edg_1 (clk,rst, dep_in, walk_filtered_button);*/
    
    
    clkDivider clk1HzModule (clk1Hz, clk, rst);
    clkDivider #(250000) clk200HzModule (clk200Hz, clk, rst);
    
    counter #(3) segEnCounterModule (segEnCounter, 1, clk200Hz, rst);
    
    // 7-Segemnt Display
    decoder2x4 segEnDec(segEn, segEnCounter);
    mux4x1 segEnMux (seg_bin, seg1, seg2 , seg3, seg4, segEnCounter);
    signToSeg mainStreetSeg(seg4, mainSign);
    signToSeg sideStreetSeg(seg3, sideSign);
    hexToSeg timeCounterSeg(seg2, sec_counter);
    signToSeg walkSeg(seg1, walkSign);
    
    always @(posedge clk1Hz, posedge rst) begin
    if (rst == 1) begin
    c_state <= G_R;
    sec_counter <= 12;
    end 
    
    else begin
    
    case (c_state)
    
    G_R: begin
        if (walk_filtered_button == 1) begin
        activate_walk = 1'b1; end
        if ((sec_counter == 3 && sensor) || (sec_counter == 0))begin
        c_state <= Y_R;
        sec_counter <=2;
        end
        else begin
        c_state <= G_R;
        sec_counter <= sec_counter -1;
        end
        end
            
    Y_R: begin
        if (walk_filtered_button == 1) begin
        activate_walk = 1'b1; end
        
        if (activate_walk == 1 && sec_counter == 0) begin
        c_state <= walk_state;
        sec_counter <=3;
        end
        else if (sec_counter > 0)begin
        c_state<=Y_R;
        sec_counter <= sec_counter - 1;
        end
        else begin
        c_state <= R_G;
        sec_counter <=12;
        end
        end
        
    R_G: begin
        if (walk_filtered_button == 1) begin
        activate_walk = 1'b1; end
        if ((sec_counter == 3 && sensor) || (sec_counter == 0))begin
        c_state <= R_Y;
        sec_counter <=2;
        end
        else begin
        c_state <= R_G;
        sec_counter <= sec_counter -1;
        end
        end
                
    R_Y: begin
        if (walk_filtered_button == 1) begin
        activate_walk = 1'b1; end
        if (sec_counter > 0)begin
        c_state<=R_Y;
        sec_counter <= sec_counter - 1;
        end
        else begin
        c_state <= G_R;
        sec_counter <=12;
        end
        end
    
    walk_state: begin
        activate_walk = 1'b0;
        if (sec_counter > 0)begin
        c_state<=walk_state;
        sec_counter <= sec_counter - 1;
        end
        else begin
        c_state <= R_G;
        sec_counter <=12;
        end
    end
    default: c_state <= G_R; 
    
    endcase
    
    end //end else
    
    end //end always
    
    always @* begin
    case (c_state)
    
    G_R: 
    begin
    mainSign <= 2'b00;
    sideSign <= 2'b10;
    walkSign <= 2'b11;
    end
    
    Y_R: 
    begin
    mainSign <= 2'b01;
    sideSign <= 2'b10;
    walkSign <= 2'b11;
    end
       
    R_G: 
    begin
    mainSign <= 2'b10;
    sideSign <= 2'b00;
    walkSign <= 2'b11;
    end
          
    R_Y:
    begin
    mainSign <= 2'b10;
    sideSign <= 2'b01;
    walkSign <= 2'b11;
    end
    
    walk_state:
    begin
    mainSign <= 2'b10;
    sideSign <= 2'b10;
    walkSign <= 2'b00;
    end
    
    endcase
    
    end
endmodule
