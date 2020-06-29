`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 04:36:32 AM
// Design Name: 
// Module Name: timeCounter
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


module counter #(parameter n = 15) (digit, en, clk, rst);
    input clk, rst, en;
    output reg [3:0] digit;
    
    always @(posedge clk, posedge rst, negedge en)begin
        if(rst == 1 || en == 0)
            digit <= n;
        else if(en == 1)begin
            if(digit == 0)
                digit <= n;
            else
                digit <= digit - 1'b1;
        end
    end
endmodule
