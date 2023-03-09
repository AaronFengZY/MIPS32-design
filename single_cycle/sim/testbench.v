`timescale 10ns/1ns

module tb_top;

   reg clk;
   reg rst;

   top top_inst(
      .rst(rst),
      .clk(clk)
   );

   // Generate clock
   initial begin
      clk = 0;
      forever begin
         #10 clk = ~clk;
      end
   end

   // Dump wave
   initial begin
      $dumpfile("single_cycle.vcd");
      $dumpvars(0, tb_top);  // we record all the information from tb_top file
   end

   initial begin
      rst = 1;
      #25 rst = 0;
      #5000;
      $finish;
   end

endmodule