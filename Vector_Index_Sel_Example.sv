`timescale 1ns / 1ps
`default_nettype none

module tb;
    reg clk;
   
    always #5 clk = ~clk;
    

  logic [65:0] temp;
    initial begin
        
        clk = 0;
 
      //temp = { {8{7'h06}}, 8'h1e, 2'b01 };
      
      temp[65 -: 56] = { 8{7'h06}};
      temp[2 +: 8] = 8'h1e;
      temp[0 +: 2] = 2'b01;
      $display("Index Part Select        Val=0b%b size=%d", temp, $size(temp)); 
                              
        #100;
        

      temp = { {8{7'h06}}, 8'h1e, 2'b01 };

      $display("Replication and Concat   Val=0b%b size=%d", temp, $size(temp));
        
        $finish; 
    end 
endmodule


`resetall

/*
//Index Vector Partial Selection Example

logic [31: 0] a_vect;
logic [0 :31] b_vect;

logic [63: 0] dword;
integer sel;

a_vect[ 0 +: 8] // == a_vect[ 7 : 0]
a_vect[15 -: 8] // == a_vect[15 : 8]
b_vect[ 0 +: 8] // == b_vect[0 : 7]
b_vect[15 -: 8] // == b_vect[8 :15]

dword[8*sel +: 8] // variable part-select with fixed width

*/