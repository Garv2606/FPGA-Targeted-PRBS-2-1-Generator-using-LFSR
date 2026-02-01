`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.06.2024 16:57:44
// Design Name: 
// Module Name: LSFR_Counter
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


module LSFR_Counter(
    input clk,clr,reset,
    output reg [3:0] lsfr_out);
    
    wire [3:0] Q;
    wire clk_out;
    
    //instantiate the two modules we created
    
    Clock_1Hz CLK_1(clk,clk_out);
    four_bit_counter COUNT4BIT(clk_out,clr,Q);
    
    always@(posedge clk_out or posedge reset)
    begin
        if(reset)
            lsfr_out<=4'b0000;
        else
            case(Q)         //follow the table of lsfr
            4'b0000:lsfr_out<=4'b0000;
            4'b0001:lsfr_out<=4'b0001;
            4'b0010:lsfr_out<=4'b0010;
            4'b0011:lsfr_out<=4'b0101;
            4'b0100:lsfr_out<=4'b1010;
            4'b0101:lsfr_out<=4'b0100;
            4'b0110:lsfr_out<=4'b1001;
            4'b0111:lsfr_out<=4'b0011;
            4'b1000:lsfr_out<=4'b0110;
            4'b1001:lsfr_out<=4'b1101;
            4'b1010:lsfr_out<=4'b1011;
            4'b1011:lsfr_out<=4'b0111;
            4'b1100:lsfr_out<=4'b1110;
            4'b1101:lsfr_out<=4'b1100;
            4'b1110:lsfr_out<=4'b1000;
            4'b1111:lsfr_out<=4'b0000;
           default : lsfr_out<=4'b0000; 
                
     endcase
    end  
endmodule
