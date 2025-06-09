module tb_timer ();

    reg clk;
    reg load;
    reg [9:0] data;

    wire tc;

    top_module DUT (
        .clk (clk),
        .load(load),
        .data(data),
        .tc  (tc)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        #10;
        load = 1;
        data = 3;

        #10;
        load = 0;
        data = 0;

        #50;

        $finish;

    end

endmodule
