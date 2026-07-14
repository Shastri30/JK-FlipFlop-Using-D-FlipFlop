`timescale 1ns/1ps

module testbench;

reg j;
reg k;
reg clk;
wire q;

jk_flipflop uut(
    .j(j),
    .k(k),
    .clk(clk),
    .q(q)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("jk_flipflop.vcd");
    $dumpvars(0, testbench);

    clk = 0;

    $display("Time\tJ\tK\tQ");
    $monitor("%0t\t%b\t%b\t%b",$time,j,k,q);

    j = 0; k = 0;
    #10;

    j = 0; k = 1;
    #10;

    j = 1; k = 0;
    #10;

    j = 1; k = 1;
    #10;

    j = 0; k = 0;
    #10;

  j = 1; k = 1;
    #10;

    $finish;
end

endmodule