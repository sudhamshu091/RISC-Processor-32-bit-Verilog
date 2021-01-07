// Write Back

module write_back ( clk, iswb,iscall,isld,  rd, aluresult, ldresult, pc_current );

input iswb,iscall,isld,clk;
input [31:0] aluresult,ldresult,pc_current;
input [3:0] rd;
         
wire iswb,iscall,isld,clk;
wire [31:0] aluresult,ldresult,pc_current;
wire [3:0] rd;


           always @(*)
           begin
           #1
           if (iswb == 1)
           begin  
               
           if (iscall == 1)
           begin
           p.a3 = 4'b1111;
           end
           
           else if ( iscall == 0)
           begin
            p.a3 = rd;
           end
           
           if  (isld == 0 && iscall == 0)
           begin
           p.d3 = aluresult ;
           end
           else if ( isld == 1 && iscall == 0)
           begin
           p.d3 = ldresult;
           end
           else if (isld == 0 && iscall == 1)
           begin
           p.d3 = pc_current + 4;
           end
           else
           begin
           p.d3 = aluresult ;
           end
           
           
           end
           end
           endmodule



