module top_module (
    input [399:0] a,
    input [399:0] b,
    input cin,
    output cout,
    output [399:0] sum
);

    genvar i;

    wire [99:0] w_cout;

    assign cout = w_cout[99];

    generate

        bcd_fadd U_BCD_LSB (
            .a  (a[3:0]),
            .b  (b[3:0]),
            .cin(cin),

            .cout(w_cout[0]),
            .sum (sum[3:0])
        );

        for (i = 1; i <= 99; i = i + 1) begin : BCD_ADDER_LOOP
            bcd_fadd U_BCD (
                .a  (a[4*i+3:4*i]),
                .b  (b[4*i+3:4*i]),
                .cin(w_cout[i-1]),

                .cout(w_cout[i]),
                .sum (sum[4*i+3:4*i])
            );
        end

    endgenerate
endmodule

