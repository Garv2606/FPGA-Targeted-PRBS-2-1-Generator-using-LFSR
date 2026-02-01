`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2024 21:55:12
// Design Name: 
// Module Name: testbench
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


module testbench;
  reg clk;
  wire [4:1] OUT;
  CRBS pp(clk,OUT);

initial begin
    $dumpfile("crbs.vcd");
  $dumpvars(0,clk,OUT);
  clk=1;
    #800 $finish;
end


always begin
#0.5 clk=!clk;
end

endmodule

