`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 06:13:19 AM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(clk, rst, signal, synced_signal);
    input clk, signal, rst;
    output reg synced_signal;
    reg meta;
    always @(posedge clk) begin
            meta <= signal;
            synced_signal <= meta;    
    end
endmodule


