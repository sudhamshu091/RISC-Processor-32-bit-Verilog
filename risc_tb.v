// Testbench
`define  td 10000                       // Simulation time
`include "risc.v"

module risc_tb();

reg clk;
integer ind1,i2,i3;
reg [64:0] buffer[32'h1000:0];
integer file,filem,temp,count=0;
//--------------------------
risc   p(.clk(clk));

initial 
       begin
       clk  = 1;
       i2=1;
       i3=0;
       p.reset=1;
       
       

                    $display ( "\t\t\t Output File  : Updated_data\n");
                   
              
                     filem=$fopen("input_memory","r");
                     temp = $fgetc(filem);
                     while (!$feof(filem))
                     begin
                     if (temp == "\n")
                     count=count+1;
                     temp = $fgetc(filem); 
                     end
                             
                     $readmemh("input_memory",buffer,0,count*2-1);
                     for(ind1 = 0;ind1 < 32'h1000;ind1 = ind1 + 1)
                     begin
                     if (i3 == 4)
                     begin      
                     i3 = 0;
                     i2 = i2 + 2 ;
                     end
                     p.memory1.mem[ind1] = buffer [i2] [8*i3 +: 8];
                     i3 = i3 + 1;
                     
                     end
                     $display ("\t\t\t Total no. of instructions = %d\n \t\t\t Simulation time = %d ns\n",count,`td);
                     
                
       # 2 p.reset = 0;
       
       # `td
       $finish;
       
       end
 
       initial 
       begin
       #`td
       file=$fopen("Updated_data","w");
       $fdisplay(file,"\t------------------Registers Updated-----------------\t\n");
       for (ind1=0;ind1<16;ind1=ind1+1)
       begin
       $fdisplay(file,"\tr=[%d] = %h\n",ind1,p.register_file1.r[ind1]);
       end 
       $fdisplay(file,"\n\t------------------Memory Updated-----------------\t\n");
       for(ind1 = 0;ind1 < 32'h1000;ind1 = ind1 + 1)
       begin
       $fdisplay(file,"\ta=%h d=%h \n",ind1,p.memory1.mem[ind1]);
       end
 
       $fclose(file);
       
       end
       
       always 
       begin
       # 5 clk = ~clk;
       end
       
       endmodule

