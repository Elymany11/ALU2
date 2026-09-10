`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a FST file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Replace tt_um_example with your module name:
   ALU_design user_project (
       .A(ui_in[3:0]),             // A gets bits 0 to 3 of ui_in
       .B(ui_in[7:4]),             // B gets bits 4 to 7 of ui_in
       .Sel(uio_in[2:0]),          // Sel gets bits 0 to 2 of uio_in
       .Ainvert(uio_in[3]),        // Ainvert gets bit 3
       .Binvert(uio_in[4]),        // Binvert gets bit 4
       .Cin(uio_in[5]),            // Cin gets bit 5
       .Result(uo_out[3:0]),       // Result goes to bits 0 to 3 of uo_out
       .Cout(uo_out[4]),           // Cout goes to bit 4
       .Set(uo_out[5]),            // Set goes to bit 5
       .Overflow(uo_out[6]),       // Overflow goes to bit 6
       .Zero(uo_out[7])            // Zero goes to bit 7
   );
endmodule
