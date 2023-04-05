.globl factorial

.data
n: .word 8

.text
main:
    addi t2,x0,1
    la t0, n
    lw a0, 0(t0)
    mv t1,a0
    jal ra, factorial
 
    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit
  
    
factorial:
    # YOUR CODE HERE
    addi t1,t1,-1
    mul a0,a0,t1
    bne t1,t2,factorial
    ret 