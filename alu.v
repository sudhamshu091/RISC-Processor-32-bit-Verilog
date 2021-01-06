// Arithmatic and Logic Unit
module alu(input [4:0] alusignal,input [31:0] a,input [31:0] b,output [31:0] res,output [1:0] flags);

           wire [4:0] alusignal;
           wire signed [31:0] a,b;
           reg [31:0] res;
           wire signed [31:0] a_signed;
           reg [1:0] flags;

           assign a_signed=a;


always @(*)
          begin
          case(alusignal)

5'b00000 : res = a + b ;                         // add
5'b00001 : res = a - b ;                         // sub
5'b00010 : res = a * b ;                         // mul
5'b00011 : res = a / b ;                         // div 
5'b00100 : res = a % b ;                         // mod
5'b00101 : begin
                if (a == b)
                begin 
                flags[0] = 1'b1;
                flags[1] = 1'b0;
                end  
                else if (a > b)
                begin
                flags[0] = 1'b0; 
                flags[1] = 1'b1;
                end
                else 
                begin
                flags[0] = 1'b0; 
                flags[1] = 1'b0;
                end
           end                                   // cmp
5'b00110 : res = a & b ;                         // and
5'b00111 : res = a | b ;                         // or
5'b01000 : res = ~a ;                            // not
5'b01001 : res =  b ;                            // mov
5'b01010 : res = a << b ;                        // lsl
5'b01011 : res = a >> b ;                        // a unsigned   //lsr
5'b01100 : 
          begin
          res= a_signed >>> b;                   // a signed     //asr
          end
5'b01101:
          begin
                                                 // nop
          end
                   
default: begin
          res = 32'd0;
          flags[0] = 1'b0; 
          flags[1] = 1'b0;                       // default  
         end

endcase
end
endmodule
