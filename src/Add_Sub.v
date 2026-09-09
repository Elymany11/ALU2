module Add_Sub(
   input [31:0] A, B,
   input Cin,
   input Ainvert,
   input Binvert,
   output reg [31:0] Sum,
   output reg Cout,
   output reg Set,
   output reg Overflow,
   output reg SLT
   );

   reg [31:0] B_not;
   reg [32:0] Carry;



   integer i;
   always @(*) begin
      if (!Ainvert && !Binvert) begin
         Carry[0] = Cin;

         for (i = 0; i < 32; i = i + 1) begin
            {Carry[i+1], Sum[i]} = A[i] + B[i] + Carry[i];
         end

         Cout = Carry[32];
      
      end
      else if (!Ainvert && Binvert) begin

         B_not = ~B;
         Carry[0] = 1;

         for (i = 0; i < 32; i = i + 1) begin
         {Carry[i+1], Sum[i]} = A[i] + B_not[i] + Carry[i];
         end

         Cout = Carry[32];
         Set = Sum[31];
         Overflow = Carry[31] ^ Carry[32];
         SLT = Set ^ Overflow;

      end


   end


endmodule