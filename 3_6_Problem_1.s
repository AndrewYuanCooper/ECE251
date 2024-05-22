################################################################################
#
# file:    3_6_Problem_1.s
# author:  Andrew Yuan <andrew.yuan@cooper.edu.>
# date:    2024-02-23
# purpose: This program is a simple example of an assembly language program
#          that can be assembled and run on a MIPS32 simulator, like spim.
#
################################################################################

.data
### Setup Test Input ###
    A: .word 9, 8, 7, 6, 5
    B: .word 0, 1, 2, 3, 4
    g: .word 5

.text
.globl main
main:
### Load Data Values Into Registers ###
    lw $s1, g
    la $s6, A
    la $s7, B
    
### Your code for Q1 goes here ###

#Calculate Address of B[4] and load
lw $t1, 16($s7)     #$t1 = 4 * 4, offset for B[4]
add $t0, $s7, $t1   #$t0 = address of B[4]
lw $t0, 0($t0)      #$t0 = B[4]

#Calculate Address of A[B[4]] and load
lw $t0, 16($s6)     #$t0 = 4 * 4,  byte offset for A[B[4]]
add $t0, $s6, $t0   #$t0 = address of A[B[4]]
lw $t0, 0($t0)      #$t0 = A[B[4]], loading the value of A[B[4]] into $t0

#Calculate f = g - A[B[4]]
sub $s0, $s1, $t0

### Print S0 Register ###
    move $a0, $s0
    li $v0, 1
    syscall

### Exit Program ###
    li $v0, 10
    syscall

