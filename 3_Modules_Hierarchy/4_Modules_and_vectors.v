module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    wire [7:0] w1;
    wire [7:0] w2;
    wire [7:0] w3;
    
    my_dff8 D0 (.clk(clk), .d(d), .q(w1));
    my_dff8 D1 (.clk(clk), .d(w1), .q(w2));
    my_dff8 D2 (.clk(clk), .d(w2), .q(w3));
    
    always @(*)
        begin
            case(sel) 
                2'b00: q = d;
                2'b01: q = w1;
                2'b10: q = w2;
                2'b11: q = w3;
                //default: q = 8'b0;
            endcase
        end
endmodule
