	.text
	.globl main
main:
__start:
		# Entering Main
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8
	subu  $sp, $sp, 4
		# Main Body
	.data
.L2:	.asciiz"This"	# Storing a string literal
	.text
	la    $t0, .L2		#Pushing address of string literal on the stack
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, .L2		#Pushing address of string literal on the stack
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	bne   $t0, $t1, .L0
	li    $t0, 0
	b     .L1
.L0:		# true section
	li    $t0, 1
.L1:		# finish section
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
#Syscall for writing bools
	li    $v0, 1
	syscall
	la    $t0, .L2		#Pushing address of string literal on the stack
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	.data
.L5:	.asciiz"That"	# Storing a string literal
	.text
	la    $t0, .L5		#Pushing address of string literal on the stack
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	bne   $t0, $t1, .L3
	li    $t0, 0
	b     .L4
.L3:		# true section
	li    $t0, 1
.L4:		# finish section
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
#Syscall for writing bools
	li    $v0, 1
	syscall
		# Exiting Main
	lw    $ra, 0($fp)
	move  $t0, $fp
	lw    $fp, -4($fp)
	move  $sp, $t0
	li    $v0, 10
	syscall
