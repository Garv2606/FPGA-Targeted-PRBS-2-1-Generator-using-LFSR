`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 16:44:29
// Design Name: 
// Module Name: Clock_1Hz
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


module Clock_1Hz(
    input clk_in,
    output reg clk_out
    );
    
    reg [25:0] count=0; //will go upto 50M and beyond
    
    always@(posedge clk_in)
    
    begin
        count<=count+1; //counter goes up by one
        
    if (count== 50_000_000) // when counter reach value of 50M
        begin
        count<=0; //count reset itself to zero
     
    clk_out= ~clk_out;
    
    end
    end
    
    
endmodule
