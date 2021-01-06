// Memory Access
module memory_access( input [31:0] op2, input [31:0] aluresult, input isld, input isst, output [31:0] ldresult );
          
wire [31:0] op2,aluresult;
wire isld,isst;
reg [31:0] ldresult;


           always @(*)
           begin     
           #2                                   // waiting for aluresult to come.
           if (isld == 1)
           begin
           p.am1    = aluresult ;
           ldresult = p.dm1;
           p.rw     = 0;
          end
          else if ( isst == 1)
          begin
         
           p.rw  = 1;
           p.am2 = aluresult ;
           p.dm3 = op2 ;
          end
          
          end
          endmodule 
