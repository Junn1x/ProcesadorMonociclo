`timescale 1ns/1ps


module top_tb;

  // INPUTS
  logic clk = 0;

  top top1(
    .clk(clk)
  );

  // Generate Clock
  always #10ns clk = ~clk;

  initial begin
    
    $dumpfile("top_tb.vcd");
    $dumpvars(0, top_tb);

    #100
    $finish;

  end
endmodule