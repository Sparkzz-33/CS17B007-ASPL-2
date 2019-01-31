	.file	1 "q4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	isPrime
	.set	nomips16
	.set	nomicromips
	.ent	isPrime
	.type	isPrime, @function
isPrime:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24; add immediate unsigned without overflow; $sp = $sp - 24;
	sw	$fp,20($sp); store word command; [$sp + 20] = $fp;
	move	$fp,$sp; $sp = $fp; sp = stack pointer; fp = frame pointer;
	sw	$4,24($fp)
	sw	$0,4($fp)
	sw	$0,8($fp)
	li	$2,1			# 0x1
	sw	$2,12($fp)
	b	$L2; branch to $L2;
	nop	// no operation

$L6:
	lw	$3,24($fp); load word from memory; $3 = [$fp + 24];
	lw	$2,12($fp); 
	teq	$2,$0,7; trap 7 if $2 != $0;
	div	$0,$3,$2; $0 = $3 / $2;
	mfhi	$2; $2 <- hi;
	bne	$2,$0,$L3; branch to $L3 if $2 != $0;
	nop

	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
$L3:
	lw	$2,4($fp)
	slt	$2,$2,2
	bne	$2,$0,$L4
	nop

	li	$2,1			# 0x1; load integer 1 to $2;
	sw	$2,8($fp)
	b	$L5; // branch to $L5
	nop

$L4:
	lw	$2,12($fp)
	addiu	$2,$2,1
	sw	$2,12($fp)
$L2:
	lw	$2,24($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,12($fp)
	slt	$2,$3,$2; $2 = 1 if $3 < $2; else $2 = 1;
	beq	$2,$0,$L6; branch to $L6 if $2 == $0;
	nop

$L5:
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31; return statement
	nop

	.set	macro
	.set	reorder
	.end	isPrime
	.size	isPrime, .-isPrime
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	li	$2,100			# 0x64
	sw	$2,32($fp)
	sw	$0,36($fp)
	li	$2,2			# 0x2
	sw	$2,28($fp)
	lw	$3,32($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$3,$2
	bgez	$2,$L9
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L9:
	beq	$2,$0,$L11
	nop

	li	$3,1			# 0x1
	beq	$2,$3,$L12
	nop

	b	$L10
	nop

$L11:
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
	b	$L10
	nop

$L12:
	lw	$4,32($fp)
	.option	pic0
	jal	isPrime
	nop

	.option	pic2
	bne	$2,$0,$L14
	nop

	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
	b	$L10
	nop

$L17:
	lw	$3,32($fp)
	lw	$2,28($fp)
	addu	$2,$3,$2
	move	$4,$2
	.option	pic0
	jal	isPrime
	nop

	.option	pic2
	bne	$2,$0,$L15
	nop

	lw	$3,32($fp)
	lw	$2,28($fp)
	addu	$2,$3,$2
	sw	$2,32($fp)
	b	$L10
	nop

$L15:
	lw	$3,32($fp)
	lw	$2,28($fp)
	subu	$2,$3,$2
	move	$4,$2
	.option	pic0
	jal	isPrime
	nop

	.option	pic2
	bne	$2,$0,$L16
	nop

	lw	$3,32($fp)
	lw	$2,28($fp)
	subu	$2,$3,$2
	sw	$2,32($fp)
	b	$L10
	nop

$L16:
	lw	$2,28($fp)
	addiu	$2,$2,2
	sw	$2,28($fp)
$L14:
	lw	$2,36($fp)
	bne	$2,$0,$L17
	nop

$L10:
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
