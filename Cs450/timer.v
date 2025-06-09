module top_module (
    input clk,
    input load,
    input [9:0] data,
    output tc
);

    reg [9:0] counter;
    reg r_tc;

    assign tc = (counter == 1'b0) ? 1 : 0;

    always @(posedge clk) begin
        if (load) begin
            counter <= data;
        end
		else if(counter == 1'b0) begin
			counter <= counter;
		end 
		else begin
            counter <= counter - 1'b1;
        end
    end

endmodule
