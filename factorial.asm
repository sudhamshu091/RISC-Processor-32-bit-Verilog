.text

mov r0,5              # Given Number in R0.
mov r1,1              # Factorial of the number will be stored in R1.
.loop1:

   mul r1,r1,r0
   sub r0,r0,1
   cmp r0,1
   beq .EXIT
   b .loop1
.EXIT:

