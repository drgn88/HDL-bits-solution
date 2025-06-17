module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] xor_b;
    wire c_in;
    
    assign xor_b = b ^ {32{sub}};
    
    add16 ADD_L ( .a(a[15:0]), .b(xor_b[15:0]), .cin(sub), .sum(sum[15:0]), .cout(c_in) );
    add16 ADD_H ( .a(a[31:16]), .b(xor_b[31:16]), .cin(c_in), .sum(sum[31:16]), .cout(1'b0) );
    
endmodule
