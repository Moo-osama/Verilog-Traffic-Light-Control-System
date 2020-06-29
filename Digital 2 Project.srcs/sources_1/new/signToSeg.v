`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 04:39:01 AM
// Design Name: 
// Module Name: signToSeg
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


module signToSeg(z, x);
input  [1:0]x;
output reg [6:0]z;

always @ (x) begin
    case (x)
    4'b00:       //Hexadecimal g
    z = 7'b0000100;
    4'b01:       //Hexadecimal y
    z = 7'b1000100;
    4'b10:       //Hexadecimal r
    z = 7'b0111001;
    4'b11:       //Hexadecimal s
    z = 7'b0100100;
    endcase
end
endmodule