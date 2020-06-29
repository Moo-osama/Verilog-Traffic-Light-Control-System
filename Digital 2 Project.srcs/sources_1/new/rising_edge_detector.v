`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2019 06:15:14 AM
// Design Name: 
// Module Name: rising_edge_detector
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


module rising_edge_detector(clk,rst, in, out);

    input clk, rst, in;
    output out;
    
    reg [1:0] current_state, next_state;
    parameter [1:0] zero =2'b00, edg =2'b01, one =2'b10;
    always @ (in or current_state)begin
        case (current_state)
            zero: if (in == 1) next_state = edg;
                else next_state = zero;
            edg: if (in == 1) next_state = one;
                else next_state = zero;
            one: if (in == 1) next_state = one;
                else next_state = zero;
        endcase
    end
    
    always @ (posedge clk or posedge rst) begin
        if(rst == 1) 
            current_state <= zero;
        else
            current_state <= next_state;
    end
    
    assign out = (current_state == edg);
endmodule

