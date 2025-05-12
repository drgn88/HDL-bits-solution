module top_module (
    input [99:0] a,
    b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

    genvar i;

    generate
        full_adder FA_0 (
            .a(a[0]),
            .b(b[0]),
            .cin(cin),
            .cout(cout[0]),
            .sum(sum[0])
        );

		// generate문에서 for문은 LABEL을 붙여주자
        for (i = 1; i <= 99; i = i + 1) begin : FA_REPEAT
            full_adder FA (
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .cout(cout[i]),
                .sum(sum[i])
            );
        end
    endgenerate

endmodule

module full_adder (
    input  a,
    b,
    cin,
    output cout,
    sum
);

    assign {cout, sum} = a + b + cin;

endmodule
