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
