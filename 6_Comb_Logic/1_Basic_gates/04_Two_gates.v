module top_module (
    input in1,
    input in2,
    input in3,
    output out);

	wire w_xnor;

	assign w_xnor = ~(in1 ^ in2);
	assign out = w_xnor ^ in3;
	
endmodule
