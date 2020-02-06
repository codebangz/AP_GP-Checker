.data 
values: .space 512
welcome: .asciiz "\nHow many numbers your sequence contains?:\t"
invalid: .asciiz "\nSorry, a sequence consists of atleast 3 numbers."
exitMessage: .asciiz "\nThanks for using me, bye!"
enterMessage: .asciiz "\nEnter your values:\t"
Airthmetic: .asciiz "\nThis is Airthmetic Progression"
Geometric: .asciiz "\nThis is Geometric Progression"

.text
main:
la $t1,values
li $t0,0
#printing welcome msg

li $v0,4
la $a0,welcome
syscall

#takes integer as input

li $v0,5
syscall
move $t0,$v0


#if entered number is less than 3 then exit
blt $t0,3,printExit

#if its greater than 3 then take input of values
la $t1,values
move $s0,$t0
inputLoop:
beq $s0,0,Logic

li $v0,4
la $a0,enterMessage
syscall

li $v0,5
syscall
sw $v0,($t1)


add $t1,$t1,4
sub $s0,$s0,1
b inputLoop


Logic:

#airthmetic
la $t1,values
move $s0,$t0
li $s3,0
lw $t3,($t1)
add $t1,$t1,4
lw $t4,($t1)
sub $t6,$t4,$t3 # one time
la $t1,values
sub $t9,$t0,1
lloop:
beq $s3,$t9,Airth
lw $t3,($t1)
add $t1,$t1,4
lw $t4,($t1)
sub $t5,$t4,$t3
bne $t6,$t5,CheckGeo
move $t6,$t5
add $s3,$s3,1

b lloop

CheckGeo:
la $t1,values
move $s0,$t0
li $s3,0
lw $t3,($t1)
add $t1,$t1,4
lw $t4,($t1)
div $t6,$t4,$t3 # one time
la $t1,values
sub $t9,$t0,1
lloop2:
beq $s3,$t9,Geo
lw $t3,($t1)
add $t1,$t1,4
lw $t4,($t1)
div $t5,$t4,$t3
bne $t6,$t5,endProgram
move $t6,$t5
add $s3,$s3,1

b lloop2

#exit code

endProgram:
li $v0,4
la $a0,exitMessage
syscall

li $v0,10
syscall



Airth:
li $v0,4
la $a0,Airthmetic
syscall

b endProgram


#printExit
printExit:

li $v0,4
la $a0,invalid
syscall

b endProgram

Geo:
li $v0,4
la $a0,Geometric
syscall

b endProgram
