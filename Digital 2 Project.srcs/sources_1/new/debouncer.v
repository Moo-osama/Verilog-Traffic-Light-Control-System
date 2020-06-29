`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 06:14:04 AM
// Design Name: 
// Module Name: debouncer
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


module debouncer(clk, rst, signal, out);
    input clk, signal, rst;
    output reg out;
    reg A,B,C;
    
    always @(posedge clk, posedge rst)begin
        if(rst == 1)
            out <= 0;
        else begin
            A <= B;
            B <= C;
            C <= signal;
            if(A == B && A == C)
                out <= A;
            else
                out <= 0;
        end    
    end
endmodule
