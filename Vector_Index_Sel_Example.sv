`timescale 1ns / 1ps
`default_nettype none

module tb;
reg clk;
    
localparam [1:0]
    D_Hdr           =   2'b10, 
    Ctrl_Hdr        =   2'b01;

localparam [7:0]
    TxD_Term        =   8'hfd,
    TxD_Error       =   8'hfe,
    TxD_Start       =   8'hfb,
    TxD_Seq         =   8'h9c,
    TxD_Idle        =   8'h07,
    TxD_LPI         =   8'h06;

localparam [6:0]
    Idle_Char       =   7'h0,
    LPI_Char        =   7'h06,
    Error_Char      =   7'h1e;
    always #5 clk = ~clk;

logic [63:0] data_bits;     

logic [65:0] temp;
logic [65:0] encoded_data;
initial begin
    
    clk = 0;
    data_bits = 64'h9bd3c750ce28aac0;
    //temp = { {8{7'h06}}, 8'h1e, 2'b01 };
    
    temp[65 -: 56] = { 8{7'h06}};
    temp[2 +: 8] = 8'h1e;
    temp[0 +: 2] = 2'b01;
    encoded_data[0 +: 2] = Ctrl_Hdr;
    encoded_data[2 +: 8] = 8'hAA;
    encoded_data[10 +: 16] = data_bits[0 +: 16]; 
    encoded_data[65 -: 40] = {{5{Idle_Char}}, 5'b0}; 
    $display("Index Part Select        Val=0b%b size=%d", temp, $size(temp)); 
    $display("Index Part Select        Val=0x%h size=%d", encoded_data, $size(encoded_data)); 

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


encoded_data[0 +: 2] = Ctrl_Hdr;
encoded_data[2 +: 8] = 8'hAA;
encoded_data[10 +: 16] = data_bits[0 +: 16]; 
encoded_data[65 -: 40] = {{5{Idle_Char}}, 5'b0}; 
*/