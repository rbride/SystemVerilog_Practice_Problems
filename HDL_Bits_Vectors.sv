module _Vector0 ( 
        input wier [2:0] vec,
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