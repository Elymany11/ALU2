module OR_NAND(
   input [31:0] A,
   input [31:0] B,
   input Ainvert,
   input Binvert,
   output reg [31:0] out
   );

   always @(*) begin
      
      if (!Ainvert && !Binvert) begin
         out = A | B;
      end

      else if (Ainvert && Binvert) begin
         out = ~(A & B);
      end
      
      else begin
         out = A | B;    
      end



   end


endmodule