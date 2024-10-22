
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array #load address of array into a0 reg
    li a1, 7    # unsigned , num of elements in array
    li a2, 1 #target number
prog:
#-----------------------------
# Write your code here!
    add s0, zero, zero #s0=0
    loop:
        beq s0, a1, no_solution #if s0==a1 pos not found / number not in array 
        lw t1, 0(a0) #load the current element into the array of t1
        beq t1, a2, solution #if 0(a0)==a2 , go to solution
        addi s0, s0, 1 #counter++
        addi a0, a0, 4 #a0 += 4 , next element in array
        j loop #repeat
        no_solution:
            addi s0, zero, -1 # return -1
        solution:
            add a0, s0, zero #return value should be in a0
            
    
# Do not remove the prog label or write code above it!
#-----------------------------
done:
    addi a7, zero, 10 
    ecall
