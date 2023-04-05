.globl main

.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
fun:
    addi t0, a0, 1 # increment value by 1
    sub t1, x0, a0 # take negative of value
    mul a0, t0, t1 # multiply incremented value with negative value for getting final result
    jr ra

main:
    # BEGIN PROLOGUE
    addi sp, sp, -20 # reserving space on stack for saved registers
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)
    # END PROLOGUE
    addi t0, x0, 0  # t0 is used for loop icrement
    addi s0, x0, 0  # s0 is used for result
    la s1, source  # s1 is the pointer for source array and holds address of fisrt location
    la s2, dest    # s2 is the pointer for des array and holds address of first element
loop:
    slli s3, t0, 2  # s3 is register used for holding address of incremented location
    add t1, s1, s3  # t1 temporary holds the address of  source locations
    lw t2, 0(t1) #  t2 holds the value of elements in source array
    beq t2, x0, exit  # checking condition
    add a0, x0, t2   
    addi sp, sp, -8 # space reserved in stack for holding values of t0 and t1 so that when we retirn from function these values remain same because we have to use these value
    sw t0, 0(sp)
    sw t2, 4(sp)
    jal fun
    lw t0, 0(sp) # free t0
    lw t2, 4(sp) # free t1
    addi sp, sp, 8 # free total space
    add t2, x0, a0 # t2 is now holding result
    add t3, s2, s3 # t3 temporary holds the adrees of des locations
    sw t2, 0(t3)    # placing reult value of function in des array
    add s0, s0, t2  # finding sum of values
    addi t0, t0, 1  # incrementing pointer
    jal x0, loop    # jump again on loop
exit:
    add a0, x0, s0
    # BEGIN EPILOGUE
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    # END EPILOGUE
    jr ra
   