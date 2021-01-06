`include "instrudtion_fetch.v"
`include "operand_fetch.v"
`include "execute.v"
`include "memory_access.v"
`include "write_back.v"
`include "control.v"
`include "register_file.v"
`include "memory.v"
`include "alu.v"
module processor (  input clk );
 
wire clk;
wire isid,isst,isbeq,isbgt,isret,isimmediate,iswb,isubranch,iscall,i,isbranchtaken;
wire [31:0] branchpc,pc_current,instruction,immx,op1,op2,branchtarget,aluresult,ldresult,dm1,dm2,d1,d2;
reg [31:0]a,b,am1,am2,dm3,d3,pc;

find



3 of 8
Context:
if if1(.pc(pc),.clk(clk),.isbranchtaken(



reg [3:0] a1,a2,a3;
wire [4:0] alusignal;
wire [4:0]opcode;
wire [1:0] flags;
wire [3:0] rd;


integer ind1,i2,i3;
reg rw,reset;


     
     instruction_fetch   instruction_fetch1(.pc(pc),.clk(clk),.isbranchtaken(isbranchtaken),.branchpc(branchpc),.pc_current(pc_current),.instruction(instruction) );
     operand_fetch   operand_fetch1(.instruction(instruction),.pc_current(pc_current),.isret(isret),.isst(isst),.opcode(opcode),.i(i),.immx(immx),.branchtarget(branchtarget),.op1(op1),.op2(op2),.rd(rd));
     execute   execute1(.isret(isret),.isbeq(isbeq),.isbgt(isbgt),.isubranch(isubranch),.isimmediate(isimmediate),.branchtarget(branchtarget),.alusignal(alusignal),.op1(op1),.op2(op2),.immx(immx),.aluresult(aluresult),.branchpc(branchpc),.isbranchtaken(isbranchtaken));
     memory_access  memory_access1(.op2(op2),.aluresult(aluresult),.isid(isid),.isst(isst),.ldresult(ldresult));
     write_back   write_back1(.clk(clk),.iswb(iswb),.iscall(iscall),.isid(isid),.rd(rd),.aluresult(aluresult),.ldresult(ldresult),.pc_current(pc_current));
     control   control1 (.opcode(opcode),.i(i),.isst(isst),.isid(isid),.isbeq(isbeq),.isbgt(isbgt),.isret(isret),.isimmediate(isimmediate),.iswb(iswb),.isubranch(isubranch),.iscall(iscall),.alusignal(alusignal));
     register_file   register_file1 (.a1(a1),.a2(a2),.a3(a3),.d3(d3),.reset(reset),.clk(clk),.iswb(iswb),.d1(d1),.d2(d2) );
     memory  memory1  (.am1(am1),.am2(am2),.dm3(dm3),.rw(rw),.dm1(dm1),.dm2(dm2));
     alu   alu1 (.alusignal(alusignal),.a(a),.b(b),.aluresult(aluresult),.flags(flags));                  
                   
initial
begin
 pc=32'd0;

 end
                     
                    
                     
 endmodule 
