`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 04:37:19 AM
// Design Name: 
// Module Name: decoder2x4
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


module decoder2x4(out, en);
input [1:0]en;
output reg [3:0]out;
    
always@(en)begin 
    case(en)
    2'b00: out <= 4'b1110; 
    2'b01: out <= 4'b1101; 
    2'b10: out <= 4'b1011; 
    2'b11: out <= 4'b0111; 
    endcase
end
endmodule
