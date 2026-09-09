module ALU_design (
   input      [31:0] A, B,
   input      [2:0]  Sel,
   input             Ainvert, Binvert,
   input             Cin,
   output            Cout,
   output            Set,
   output            Overflow,
   output reg [31:0] Result,
   output reg [31:0] Zero // When (A = B) >> (z = 1)
   );

   wire  Less;
   wire [31:0] out_OR_Nand;
   wire [31:0] out_AND_Nor;
   wire [31:0] out_XOR;
   wire [31:0] out_Add_Sub;

   OR_NAND   or_nand (
      .A(A), .B(B), .Ainvert(Ainvert), .Binvert(Binvert), .out(out_OR_Nand)
   );

   AND_NOR  and_nor (
      .A(A), .B(B), .Ainvert(Ainvert), .Binvert(Binvert), .out(out_AND_Nor)
   );

   XOR   xor0 (
      .A(A), .B(B), .out(out_XOR)
   );

   Add_Sub add_sub (
      .A(A), .B(B), .Cin(Cin), .Ainvert(Ainvert), .Binvert(Binvert), .Sum(out_Add_Sub), 
      .Cout(Cout), .Set(Set), .Overflow(Overflow), .SLT(Less)
   );

   
   always @(*) begin
      
      case (Sel)

         3'b000 : begin
            Result = out_OR_Nand;
         end

         3'b001 : begin
            Result = out_AND_Nor;
         end

         3'b010 : begin
            Result = out_XOR;
         end

         3'b011 : begin
            Result = out_Add_Sub;
         end

         3'b100 : begin
            Result[31:1] = 0;
            Result[0] = Less;
         end

         default : begin
            Result = 32'b11111111111111111111111111111111;
         end

      endcase

      Zero = ~|Result;
   end

endmodule