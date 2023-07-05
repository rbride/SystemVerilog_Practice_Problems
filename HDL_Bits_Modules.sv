//Three module
module _shift( 
        input clk, d,
        output q
        );
        // Inited by position because Idk I felt like it I guess
        //module provided is module my_dff (input clk, input d, output q )
        wire q0, q1;
        my_dff DUT1 ( clk, d, q0 );
        my_dff DUT2 ( clk, q0, q1 );
        my_dff DUT3 ( clk, q1, q );

endmodule


module _shift8 ( 
        input clk, input [7:0] d, 
        input [1:0] sel, output [7:0] q
        );
        //Module provided to you is module my_dff8 ( input clk, input [7:0] d, output [7:0] q)
        wire [7:0] q0, q1, q2;
        my_dff8 DUT0 ( clk, d, q0 );
        my_dff8 DUT1 ( clk, q0, q1 );
        my_dff8 DUT2 ( clk, q1, q2 );

        always @* begin
            case(sel)
                2'b00 : q = d;
                2'b01 : q = q0;
                2'b10 : q = q1;
                2'b11 : q = q2;
            endcase

        end

endmodule
// Worked first time

//Module ADD
module _add (
        input [31:0] a, b,
        output [31:0] sum
        );
        //Given a module add16 that performs a 16 bit addtion instatiate two of them to create 32 bit adder
        //module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

        wire cout_lower;
        add16 _lower ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(cout_lower) );
        add16 _higher ( .a(a[31:16]), .b(b[31:16]), .cin(cout_lower), .sum(sum[31:16]) );

        
endmodule


//Module FADD Adder 2
//Two levels of hierarchy, top module instatiates two copies of add16. each of which instantiate 16 copies of add1 
//Write two modules add1 and top 
//Govem ,pdi;e add16 wotj [erfpr,s a 16-bit addition 
/* 
Add 16 has the following declaration:
module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
*/

module top_module (
        input [31:0] a,
        input [31:0] b,
        output [31:0] sum
);
        wire cout_lower;
        add16 _lower ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(cout_lower) );
        add16 _higher ( .a(a[31:16]), .b(b[31:16]), .cin(cout_lower), .sum(sum[31:16]) );

endmodule 


module add1 (
        input a,
        input b, 
        input cin,
        output sum,
        output cout
);
    always_comb begin
        case ( { a, b, cin } )
            3'b111  :   begin
                sum = 1'b1;
                cout = 1'b1;
            end
            3'b110  :   begin
                sum = 1'b0;
                cout = 1'b1;
            end
            3'b101  :   begin
                sum = 1'b0;
                cout = 1'b1;
            end
            3'b100  :   begin
                sum = 1'b1;
                cout = 1'b0; 
            end
            3'b011  :   begin
                sum = 1'b0;
                cout = 1'b1;
            end
            3'b010  :   begin
                sum = 1'b1;
                cout = 1'b0;
            end
            3'b001  :   begin
                sum = 1'b1;
                cout = 1'b0;
            end
            3'b000  :   begin
                sum = 1'b0;
                cout = 1'b0;
            end
        endcase    
    end
    
endmodule

//Carry select adder
/// BRUUUUUUUUHHHHHHHH  memorize the syntax for case switches that was bad
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire cout_lower;
    wire [15:0] upper16_out1;
    wire [15:0] upper16_out2;

    add16 _lower16 ( .a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cout(cout_lower));
    add16 _upper16_1 ( .a(a[31:16]), .b( b[31:16]), .sum( upper16_out1[15:0] ), .cin(1'b0));
    add16 _upper16_2 ( .a(a[31:16]), .b( b[31:16]), .sum( upper16_out2[15:0] ), .cin(1'b1));

    always @* begin
        case (cout_lower) 
            1'b0    :   sum[31:16] = upper16_out1;
            1'b1    :   sum[31:16] = upper16_out2;
        endcase
    end
endmodule

//Adder Subtractor
//An adder-subtractor can be built froma an adder by optionally negating one of the inputs which is equivalent ot inverting the input
//then adding 1, the net result is a circuit that can do two operations, (a+b+0) and (a+ ~b + 1)

module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout_lower;
    wire [31:0] b_out;

    add16 _lower ( .a(a[15:0]), .b(b_out[15:0]), .sum(sum[15:0]), .cout(cout_lower));
    add16 _upper ( .a(a[31:16]), .b(b_out[31:16]), .sum(sum[31:16]), .cin(cout_lower));

    always @* begin
        case(sub) 
            1'b0    :   b_out = b;
            //1'b1    :   b_out = b[31:0] ^ {32{sub}}; 
            1'b1  :   b_out = ~b;
        endcase

    end

endmodule
//   :(
//Redo Adder Subtractor you messed it up









