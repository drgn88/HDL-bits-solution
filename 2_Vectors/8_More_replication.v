module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    assign out[4:0] = ~{a,b,c,d,e,} ^ {5{e}};
    assign out[9:5] = ~{a,b,c,d,e} ^ {5{d}};
    assign out[14:10] = ~{a,b,c,d,e} ^ {5{c}};
    assign out[19:15] = ~{a,b,c,d,e} ^ {5{b}};
    assign out[24:20] = ~{a,b,c,d,e} ^ {5{a}};
endmodule
