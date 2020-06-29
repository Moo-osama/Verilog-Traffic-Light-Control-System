`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 04:37:54 AM
// Design Name: 
// Module Name: mux4x1
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


module mux4x1(out, seg1, seg2 , seg3, seg4, en);
input [6:0] seg1; 
input [6:0] seg2;
input [6:0] seg3;
input [6:0] seg4;
input [1:0] en; 
output reg [6:0] out; 
always@(en) begin 
    case(en)
    2'b00: out <= seg1; 
    2'b01: out <= seg2;
    2'b10: out <= seg3; 
    2'b11: out <= seg4;  
    endcase
end
endmodule