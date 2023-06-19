module _Vector0 ( 
        input wire [2:0] vec,
        output wire [2:0] outv,
        output wire o0, o1, o2 
        );  

    assign outv = vec;
    assign o2 = vec[2];
    assign o1 = vec[1];
    assign o0 = vec[0];

endmodule

// Default_nettype none disables the creation of implicit nets. Based. 
// ... Skipped Exercise 1. 
// Vector 2 reverse 32 bit vector ( i.e    AaaaaaaaBbbbbbbbCcccccccDddddddd => DdddddddCcccccccBbbbbbbbAaaaaaaa )
module _Vector2 ( 
        input [31:0] in,
        output [31:0] out
        );

    assign out [31:24] = in [7:0];
    assign out [23:16] = in [15:8];
    assign out [15:8] = in [23:16];
    assign out [7:0] = in [31:24];

endmodule
//Was actually more challenging than thought, I don't yet intuitively think about the busses with the correct value. This one is to be added to the problem list

//compare the waveforms of the bitwise or and logic or
// the bitwise will compare each of the individual bits of the vector 
// the logical will compare the entire vector at once 
module _Vector3 (
        input [2:0] a, b,
        output [2:0] out_or_bitwise,
        output out_or_logical,
        output [5:0] out_not
        );
        //bitwise or
        assign out_or_bitwise = ( a | b );
        assign out_or_logical = ( a || b );
        assign out_not[5:0] = { ~b, ~a };
 
endmodule

// the bitwise operators are also reduction operators 
module _gates4 (
        input [3:0] in,
        output out_and, out_or, output_xor
        );

        assign out_and = ( in[0] & in[1] & in[2] & in[3] );
        assign out_or = ( in[0] | in[1] | in[2] | in[3] );
        

endmodule