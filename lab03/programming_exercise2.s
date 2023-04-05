.globl main

.data


.text
main:

    addi a0,x0,6  #num
    call dataArray 
    addi a0, zero, 10 #return 0
    ecall
    
dataArray:

    addi sp,sp,-4    # allocation for ra
    sw ra,0(sp)      # push ra

    addi sp,sp,-4    # space reserved for i
    addi s7, sp,0    # addrees of i
    lw s0,0(s7)      # value of i
    addi s0,zero,0   # i = 0

    addi sp,sp,-40   # allocate space for array
    addi s2,sp,0    # base address of array
    addi s3,x0,9   # size of array

loop:
    
    bgt s0,s3, break    # checking loop condition

    addi sp,sp,-4      # space reserved for num so it will not change
    sw a0,0(sp)
    addi s0,s0,1   # incremenyting i
    sw s0,0(s7)

    call compare

    sw a0,0(s2)    # assigning value of a0 into array
    lw a0,0(sp)    # number is 7 again
    addi sp,sp,4   # free space of num
   
    addi s2,s2,4   # incrementing array address
    j loop

break:

    addi sp,sp,40  # deallocation of array
    addi sp,sp,4   # deallocation of i

    lw ra,0(sp)
    addi sp,sp,4   # deallocation of ra

ret


compare:
    addi sp,sp,-4
    sw ra,0(sp)
    call sub
    bge a0,x0,do
    addi a0,x0,0
    lw ra,0(sp)
    addi sp,sp,4
    ret
do:
    addi a0,x0,1
    lw ra,0(sp)
    addi sp,sp,4
    ret

sub:
sub a0,a0,s0
ret
