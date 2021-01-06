module execute( input isret, input isbeq, input isbgt, input isubranch, input isimmediate, input [31:0] branchtarget,
          input [4:0] alusignal,
          input [31:0] op1,
          input [31:0] op2,
          input [31:0] immx,
          output [31:0] aluresult,
          output [31:0] branchpc,
          output isbranchtaken
          );
          
wire isret,isbeq,isbgt,isubranch,isimmediate;
wire [4:0] alusignal;
wire [31:0] op1,op2,immx,branchtarget;
reg [31:0] aluresult,branchpc;
reg isbranchtaken;
reg w1,w2;



always    @(*)
           begin
          
           isbranchtaken = 0;
           if ( isret == 1)
           begin
           branchpc = op1;
           end
           else 
           begin
           branchpc = branchtarget;
           end
           
           if (isbeq == 1 && p.flags[0] == 1)
           begin
           w1 = 1;
           end
           else 
           begin
           w1=0;
           end
           
           if (isbgt == 1 && p.flags[1] == 1)
           begin
           w2 = 1 ;
           end
           else
           begin
           w2=0;
           end
           if (isubranch == 1 || w1 == 1 || w2 == 1 )
           begin
           
           isbranchtaken = 1;
           end
           else
           begin
           isbranchtaken = 0;
           end

           p.a = op1;
           
           if (isimmediate == 1)
           begin
           p.b = immx;
           end
           else
           begin
           p.b = op2;
           end
           
         aluresult = p.alu1.aluresult;
         end
         endmodule
