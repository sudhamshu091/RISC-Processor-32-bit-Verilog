// Instruction Fetch
module instruction_fetch( pc, clk, isbranchtaken, branchpc, pc_current, instruction );

input [31:0] branchpc,pc;
input clk,isbranchtaken;
output[31:0] instruction;
output [31:0] pc_current;

wire [31:0] branchpc,pc;
wire clk,isbranchtaken;
reg [31:0] instruction;
reg [31:0] pc_current,pc_temp;
integer hal,ind = 0;

                     
                     always @(negedge clk )
                     begin
                     if( ind == 0)
                     begin
                     
                     pc_temp = pc;
                     pc_current = pc;
                     end
                     for (ind = 0;ind < 4;ind = ind + 1 )
                     begin
                     instruction[8*ind +: 8] = p.memory1.mem[pc_temp];
                     pc_temp = pc_temp + 1;
                     end
                     
                     if(isbranchtaken == 1)
                     begin
                     pc_current = branchpc;
                     end
                     else
                     begin
                     pc_current = pc_temp - 4;
                     end
                                        
                     
                     end
                     
                     
                     
                     always @( isbranchtaken )
                     begin                                                 
                     if (isbranchtaken == 1)
                     begin
                     pc_temp = branchpc;
                     end
                     else if ( isbranchtaken == 0)
                     begin
                     pc_temp = pc_temp;
                     end
                                           
                     end
                     
endmodule
