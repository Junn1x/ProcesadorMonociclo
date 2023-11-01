`timescale 1ns/1ps


module top_tb;

  // INPUTS
  logic clk = 0;

<<<<<<< HEAD
  mp mp1(
=======
  top top1(
>>>>>>> f373532ed7d12c0df984f122ab1e4e8a9b3f244e
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