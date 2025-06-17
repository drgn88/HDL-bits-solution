module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//

    wire c_in;
    
    add16 ADD0 ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(c_in) );
    add16 ADD1 ( .a(a[31:16]), .b(b[31:16]), .cin(c_in), .sum(sum[31:16]), .cout(1'b0) );
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    
    assign cout = (a&b) | (b&cin) | (a&cin) | (a&b&cin) ;
    assign sum = a ^ b ^ cin;
endmodule
