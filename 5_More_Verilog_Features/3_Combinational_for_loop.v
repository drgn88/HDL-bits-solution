module top_module (
    input  [99:0] in,
    output [99:0] out
);
    integer i;

    reg [99:0] r_out;
    assign out = r_out;

    always @(*) begin
        for (i = 0; i <= 99; i = i + 1) begin
            r_out[i] = in[99-i];
        end
    end
endmodule
