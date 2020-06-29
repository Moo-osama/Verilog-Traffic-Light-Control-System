`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 04:35:48 AM
// Design Name: 
// Module Name: clkDivider
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


module clkDivider #(parameter n = 50000000)(divided_clk, clk, rst);
    input clk, rst;
    output reg divided_clk;
    reg [31:0] counter;
    
    always @(posedge clk, posedge rst)begin
        if(rst == 1)begin
            divided_clk <= 0;
            counter <= 32'b0;
        end
        else if(counter == n-1)begin
            divided_clk <= ~divided_clk;
            counter <= 32'b0;
        end 
        else
            counter <= counter + 1;
    end
endmodule
