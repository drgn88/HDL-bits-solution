// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
		begin
           shut_off_computer = 1;
		end
		else
		begin
			shut_off_computer = 1'b0;
		end
		
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
		else
			keep_driving = 1'b0;
    end

endmodule
