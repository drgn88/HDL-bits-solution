module top_module( 
    input [254:0] in,
    output reg [7:0] out );

	integer i;

	always @(*)begin
		out = 8'd0;
		for(i = 0; i <= 254; i = i + 1) begin
			out = (in[i] == 1) ? (out + 1) : (out + 0);
		end
	end
endmodule