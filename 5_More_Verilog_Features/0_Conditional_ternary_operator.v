module top_module (
    input  [7:0] a,
    b,
    c,
    d,
    output [7:0] min
);  //


    // assign intermediate_result1 = compare? true: false;

    wire [7:0] w_m0, w_m1;

    assign w_m0 = (a < b) ? a : b;
    assign w_m1 = (c < d) ? c : d;

    assign min  = (w_m0 < w_m1) ? w_m0 : w_m1;
endmodule
