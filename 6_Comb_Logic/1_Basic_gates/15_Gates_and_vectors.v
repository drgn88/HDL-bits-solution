module top_module( 
    input [3:0] in,
    output reg [2:0] out_both,
    output reg [3:1] out_any,
    output reg [3:0] out_different );

	integer i;
	
	always @(*) begin
		for(i = 0; i <= 2; i = i + 1) begin
			out_both[i] = in[i] & in[i+1];
		end
	end

	always @(*) begin
		for(i = 1; i <= 3; i = i + 1) begin
			out_any[i] = in[i-1] | in[i];
		end
	end

	always @(*) begin
		out_different[3] = in[3] ^ in[0];
		for(i = 0; i <= 2; i = i + 1) begin
			out_different[i] = in[i] ^ in[i+1];
		end
	end

endmodule

/* Solution */

module solution_module (
	input [3:0] in,
	output [2:0] out_both,
	output [3:1] out_any,
	output [3:0] out_different
);

	// Use bitwise operators and part-select to do the entire calculation in one line of code
	// in[3:1] is this vector:   					 in[3]  in[2]  in[1]
	// in[2:0] is this vector:   					 in[2]  in[1]  in[0]
	// Bitwise-OR produces a 3 bit vector.			   |      |      |
	// Assign this 3-bit result to out_any[3:1]:	o_a[3] o_a[2] o_a[1]

	// Thus, each output bit is the OR of the input bit and its neighbour to the right:
	// e.g., out_any[1] = in[1] | in[0];	
	// Notice how this works even for long vectors.
	assign out_any = in[3:1] | in[2:0];

	assign out_both = in[2:0] & in[3:1];
	
	// XOR 'in' with a vector that is 'in' rotated to the right by 1 position: {in[0], in[3:1]}
	// The rotation is accomplished by using part selects[] and the concatenation operator{}.
	assign out_different = in ^ {in[0], in[3:1]};
	
endmodule