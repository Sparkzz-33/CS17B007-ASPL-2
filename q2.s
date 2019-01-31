	.file	1 "q2.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,72,$31		# vars= 40, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72; add immediate unsigned integer without overflow to the stack pointer; $sp = $sp - 72;
	sw	$31,68($sp); store word command; [$sp + 68] = $31;
	sw	$fp,64($sp)
	move	$fp,$sp; $sp <- $fp;
	lui	$28,%hi(__gnu_local_gp); load upper immediate
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28); load word command; copy from memory to the register variable;
	lw	$2,0($2)
	sw	$2,60($fp)
	li	$2,5			# 0x5; load integer 5 to register variable;
	sw	$2,32($fp)
	li	$2,10			# 0xa
	sw	$2,36($fp)
	li	$2,1			# 0x1
	sw	$2,40($fp)
	li	$2,2			# 0x2
	sw	$2,44($fp)
	li	$2,3			# 0x3
	sw	$2,48($fp)
	li	$2,4			# 0x4
	sw	$2,52($fp)
	li	$2,5			# 0x5
	sw	$2,56($fp)
	sw	$0,28($fp)
	b	$L2; unconditionally branch to the $L2
	nop

$L3:
	lw	$2,28($fp)
	sll	$2,$2,2; shift logical left; $2 = $2<<2;
	addiu	$3,$fp,64
	addu	$2,$3,$2; add unsigned without overflow; $2 = $3 + $2;
	lw	$3,-24($2)
	lw	$2,36($fp)
	addu	$3,$3,$2
	lw	$2,28($fp)
	sll	$2,$2,2
	addiu	$4,$fp,64
	addu	$2,$4,$2
	sw	$3,-24($2)
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$3,28($fp)
	lw	$2,32($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3; branch to $L3 if $2 != $0;
	nop	// no operation

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,60($fp)
	lw	$3,0($3)
	beq	$4,$3,$L5; branch to $L5 if $4 == $3;
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25; calls the subroutine from register $25;
	nop

$L5:
	move	$sp,$fp
	lw	$31,68($sp)
	lw	$fp,64($sp)
	addiu	$sp,$sp,72
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
