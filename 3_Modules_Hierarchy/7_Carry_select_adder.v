module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	
    wire sel;
    wire [15:0] lower, higher;

    
    add16 ADD0 ( .a(a[15:0]), .b(b[15:0]), .cin(1'b0), .sum(sum[15:0]), .cout(sel) );
    add16 ADD1 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b0), .sum(lower), .cout(1'b0) );
    add16 ADD2 ( .a(a[31:16]), .b(b[31:16]), .cin(1'b1), .sum(higher), .cout(1'b0) );

    assign sum[31:16] = (sel == 0) ? lower : higher;
    
endmodule
