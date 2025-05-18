module top_module( 
    input [99:0] in,
    output reg [98:0] out_both,
    output reg [99:1] out_any,
    output reg [99:0] out_different );

	integer i;
	
	always @(*) begin
		for(i = 0; i <= 98; i = i + 1) begin
			out_both[i] = in[i] & in[i+1];
		end
	end

	always @(*) begin
		for(i = 1; i <= 99; i = i + 1) begin
			out_any[i] = in[i-1] | in[i];
		end
	end

	always @(*) begin
		out_different[99] = in[99] ^ in[0];
		for(i = 0; i <= 98; i = i + 1) begin
			out_different[i] = in[i] ^ in[i+1];
		end
	end
endmodule

/*Solution*/
module solution_module (
	input [99:0] in,
	output [98:0] out_both,
	output [99:1] out_any,
	output [99:0] out_different
);

	// See gatesv for explanations.
	assign out_both = in & in[99:1];
	assign out_any = in[99:1] | in ;
	assign out_different = in ^ {in[0], in[99:1]};
	
endmodule