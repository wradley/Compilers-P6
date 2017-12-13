	.data
	.align 2
_globalInt: .space 4
	.data
	.align 2
_globalBool: .space 4
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
	subu  $sp, $sp, 0
		# Main Body
		# Assignment Start
	la    $t0, -8($fp)
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    12, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#kyles blunder
		# Assignment Start
		# Assignment Start
	la    $t0, _globalInt
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    2, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#kyles blunder
		# Assignment Start
		# Assignment Start
	la    $t0, _globalBool
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t1, 0($t0)	#kyles blunder
		# Assignment Start
		# Exiting Main
	lw    $ra, 0($fp)
	move  $t0, $fp
	lw    $fp, -4($fp)
	move  $sp, $t0
	li    $v0, 10
	syscall
