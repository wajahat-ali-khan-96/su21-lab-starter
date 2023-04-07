.data
number: .word 7

.text
main:
    la s0,number
    lw a0,0(s0)
    li t0, 1
    mv t1,a0
    jal fact
    
    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit      
fact:     
    addi  sp, sp, -4 
    sw ra, 0(sp)  
  
recursion:

    ble t1, t0, done 
    addi t1, t1, -1
    mul a0, a0, t1  
    j recursion       
                    
done:
 
    lw ra,0(sp)
    addi sp, sp, 4
    jr ra     
    
 