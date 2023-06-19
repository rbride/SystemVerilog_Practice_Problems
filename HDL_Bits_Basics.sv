/*
Notes from lesson memorize the Xnor and nor table Dweeb 
xnor                        Nor                         Xor
in1     in2     out         in1     in2     out         in1     in2     out
0       0       1           0       0       1           0       0       0
0       1       0           0       1       0           0       1       1
1       0       0           1       0       0           1       0       1
1       1       1           1       1       0           1       1       0


Memorize the operators
https://class.ece.uw.edu/cadta/verilog/operators.html
memorize symbols too
https://www.bing.com/images/search?view=detailV2&ccid=gjm0yCBi&id=CFA2399235312FB0C0ED6EC34E192D2B5591BD20&thid=OIP.gjm0yCBiOP2eeOXO4Lh8JAHaFm&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.8239b4c8206238fd9e78e5cee0b87c24%3frik%3dIL2RVSstGU7Dbg%26riu%3dhttp%253a%252f%252fegomachines.com%252fanimoid%252fann-hardware%252fgates.png%26ehk%3dBrbAkOUUgHJN5GNjTiQU6tLxu4IwnJTlkKsReHvA%252b4U%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=443&expw=585&q=Circuit+gate+symbols&simid=608034436101914028&FORM=IRPRST&ck=9FC1920E177C9956F062E67936374AAF&selectedIndex=0&ajaxhist=0&ajaxserp=0
*/

//Wire: Create a module that behaves like a wire
module _wire( 
            input wire _in,
            output wire _out
            );

        assign _out = _in;
endmodule

//Wire4: create a module with 3 inputs and 4 outputs that behaves like wire and makes the following connections
// a->w     b->x    b->y    c->z
module _wire4( input wire a, b, c, output wire w, x, y, z );
        assign w = a;
        assign x = b;
        assign y = b;
        assign z = c;
endmodule

/*  NotGate: cerate a module that implements a not gate
*/
module _not ( input wire _in, output wire _out );
    assign _out = ~_in;
endmodule
//alt
module _not_alt ( inout wire x );
    assign x = ~x;
endmodule

//And Gate implement an and gate
module _wrong_and ( input wire a, b, output wire out);
    if ( a & b ) begin
        assign out = 1'b1;
    end
    else begin
        assign out = 1'b0;
    end
endmodule
//Using The coditional Operator
module _and ( input wire a, b, output wire out );
    assign out = ( a & b ) ? 1'b1 : 1'b0;
endmodule

//Norgate
// Utilize ~ and or to do the easy work instead of a case switch or multiple ifs 
module _nor ( input wire a, b, output wire out );
    assign out = ~( a | b ) ? 1'b1 : 1'b0;
endmodule


/*  Add to Problem List    */
//XNorGate: Implement an XNor, implement as a not xor gate
module _xnor ( input wire a, b, output wire out);
    //Implemented via an ~ xor gate
    assign out = ~( a ^ b) ? 1'b1 : 1'b0;
endmodule
//alt
module _xnor_alt ( input wire a, b, output wire out );
    assign out = ( a ~^ b ) ? 1'b1 : 1'b0;
endmodule
//Both succeed

// Declaring Wires: implement the described circuit
`default_nettype none
module _decl_wires ( input a, b c, d, output out, out_n );
    wire x, y, z; //X y are the frist two, z is the "one wire"

    assign x = ( a & b ) ? 1'b1 : 1'b0;
    assign y = ( c & d ) ? 1'b1 : 1'b0;
    assign out = ( x | y ) ? 1'b1 : 1'b0;
    assign out_n = ~out;

endmodule 

// 7458 Chip, I.e four ands two ors, slighlyt more complex than 7420
module _7458 ( 
                input p1a, p1b, p1c, p1d, p1e, p1f, p2a, p2b, p2d,
                output p1y, p2y
             );

    wire a, b, c, d;

    assign a = ( p1c & p1b & p1a ) ? 1'b1 : 1'b0;
    assign b = ( p1f & p1e & p1d ) ? 1'b1 : 1'b0;
    // I don't have to do any of the conditonals lmao, I am going to keep doing so for practice typing them
    assign p1y = ( a | b ) ? 1'b1 : 1'b0;
    assign c = ( p2a & p2b ) ? 1'b1 : 1'b0;
    assign d = ( p2c & p2d ) ? 1'b1 : 1'b0;
    assign p2y = ( c | d );

endmodule 