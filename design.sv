`timescale 1ns/1ps

module d_flipflop(
    input d,
    input clk,
    output reg q
);

always @(posedge clk)
begin
    q <= d;
end

endmodule


module jk_flipflop(
    input j,
    input k,
    input clk,
    output q
);

wire d;
wire q_internal;

assign d = (j & ~q_internal) | (~k & q_internal);

d_flipflop ff1(
    .d(d),
    .clk(clk),
    .q(q_internal)
);

assign q = q_internal;

endmodule