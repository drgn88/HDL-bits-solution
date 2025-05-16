module top_module (
    input  x,
    input  y,
    output z
);

    wire w_a1, w_b1, w_a2, w_b2;
    wire w_or, w_and;

    A IA1 (
        .x(x),
        .y(y),
        .z(w_a1)
    );

    B IB1 (
        .x(x),
        .y(y),
        .z(w_b1)
    );

	A IA2 (
        .x(x),
        .y(y),
        .z(w_a2)
    );

	B IB2 (
        .x(x),
        .y(y),
        .z(w_b2)
    );

	assign w_or = w_a1 | w_b1;
	assign w_and = w_a2 & w_b2;

	assign z = w_and ^ w_or;

endmodule

module A (
    input  x,
    input  y,
    output z
);
    assign z = (x ^ y) & x;
endmodule

module B (
    input  x,
    input  y,
    output z
);
    assign z = x ~^ y;
endmodule

