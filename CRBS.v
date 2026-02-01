`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.06.2024 20:17:23
// Design Name: 
// Module Name: CRBS
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


module CRBS(
    input clk,
    output [4:1] OUT
    );
    
    reg [8:1] D;
    wire [8:1] Q;
    reg [9:1] A,B; 
    wire [9:1] X; 
    reg [4:1] DL;
    wire [4:1] QL;
    reg [8:1] IN;
    reg [4:1] S;
    
    NEGDFF dff1 (Q[1], D[1], clk);
    NEGDFF dff2 (Q[2], D[2], clk);
    NEGDFF dff3 (Q[3], D[3], clk);
    NEGDFF dff4 (Q[4], D[4], clk);
    NEGDFF dff5 (Q[5], D[5], clk);  
    NEGDFF dff6 (Q[6], D[6], clk);
    NEGDFF dff7 (Q[7], D[7], clk);
    NEGDFF dff8 (Q[8], D[8], clk);
        
    POSDLATCH dlatch1 (QL[1], DL[1], clk);
    POSDLATCH dlatch2 (QL[2], DL[2], clk);
    POSDLATCH dlatch3 (QL[3], DL[3], clk);
    POSDLATCH dlatch4 (QL[4], DL[4], clk);
    
    XOR xor1 (X[1], A[1], B[1]);
    XOR xor2 (X[2], A[2], B[2]);
    XOR xor3 (X[3], A[3], B[3]);
    XOR xor4 (X[4], A[4], B[4]);
    XOR xor5 (X[5], A[5], B[5]);
    XOR xor6 (X[6], A[6], B[6]);
    XOR xor7 (X[7], A[7], B[7]);
    XOR xor8 (X[8], A[8], B[8]);
    XOR xor9 (X[9], A[9], B[9]);
    
    MUX mux1 (IN[1],IN[2],S[1],OUT[1]);
    MUX mux2 (IN[3],IN[4],S[2],OUT[2]);
    MUX mux3 (IN[5],IN[6],S[3],OUT[3]);
    MUX mux4 (IN[7],IN[8],S[4],OUT[4]);
    
     always@* begin
        D[1]<=X[1];
        D[2]<=X[2];
        D[3]<=X[3];
        D[4]<=X[4];
        D[5]<=X[5];
        D[6]<=X[6];
        D[7]<=X[7];
        D[8]<=X[8];           
     end
     
    //------MUX----------------------------
    
    always@* begin
        IN[1]=Q[1];
        IN[2]<=QL[1];
        S[1]<=clk;
    end
    
     always@* begin
        IN[3]=Q[2];
        IN[4]<=QL[2];
        S[2]<=clk;
    end
    
     always@* begin
        IN[5]=Q[3];
        IN[6]<=QL[3];
        S[3]<=clk;
    end
    
     always@* begin
        IN[7]=Q[4];
        IN[8]<=QL[4];
        S[4]<=clk;
    end
    
    //---Latches---------------------------------------
    
    always@* begin
        DL[1]<=Q[5];
        DL[2]<=Q[6];
        DL[3]<=Q[7];
        DL[4]<=Q[8];
    end
    
 //--------XOR Gates------------------------------------------  
  
    always@* begin
        A[1]<=Q[7];
        B[1]<=X[7];
      end  
     
      always@* begin
        A[2]<=X[9];
        B[2]<=X[8];
      end  
      
       always@* begin
        A[3]<=Q[2];
        B[3]<=X[6];
      end  
      
       always@* begin
        A[4]<=Q[3];
        B[4]<=X[7];
      end  
      
       always@* begin
        A[5]<=Q[4];
        B[5]<=X[8];
      end  
      
       always@* begin
        A[6]<=Q[5];
        B[6]<=Q[1];
      end  
      
       always@* begin
        A[7]<=Q[6];
        B[7]<=Q[2];
      end  
      
       always@* begin
        A[8]<=Q[7];
        B[8]<=Q[3];
      end  
      
       always@* begin
        A[9]<=Q[1];
        B[9]<=Q[4];
      end  
         
endmodule

//-----------2x1 MUX-------------------------
module MUX(in1,in2,sel,out);
    input in1,in2,sel;
    output reg out;
    
    always@* begin
        if(sel)
           out=in2;
        else
           out=in1;
        end 
endmodule


//----------Neg D-flip flop----------------
module NEGDFF(Q,D,CLK);
input D , CLK;
output reg Q=1;
reg temp=0;
always @* begin

    if (CLK==0)
    begin
        Q=temp;
    end
    
    else if (CLK==1)
    begin
        temp=D;
    end
end
endmodule
//--------------Positive D Latch---------------------------------
module POSDLATCH(Q,D,CLK);
input D , CLK;
output Q;
reg Q=0;

always @* begin
    
    if (CLK==1)
    begin
        Q=D;
    end
end
endmodule

//--------------XOR Gate----------------------------------
module XOR(x,a,b);
input a,b;
output x;
assign x= a ^ b;
endmodule