	.file	1 "q5.c"
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
	.frame	$fp,104,$31		# vars= 72, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-104; add immediate unsigned without overflow; $sp = $sp - 104;
	sw	$31,100($sp); store word; [$sp + 100] = $31;
	sw	$fp,96($sp)
	move	$fp,$sp; $sp = $fp
	lui	$28,%hi(__gnu_local_gp); load upper immediate;
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2); load word to $2;
	sw	$2,92($fp)
	li	$2,2		; load integer 2 to $2;	# 0x2
	sw	$2,40($fp)
	sw	$0,28($fp)
	sw	$0,32($fp)
	li	$2,1			# 0x1
	sw	$2,36($fp)
	sw	$0,28($fp)
	b	$L2;    branch to $L2;
	nop		//no operation

$L5:
	sw	$0,32($fp)
	b	$L3
	nop

$L4:
	lw	$2,28($fp)
	sll	$3,$2,1; shift left logical; $3 = $2 << 1;
	lw	$2,32($fp)
	addu	$2,$3,$2
	sll	$2,$2,2
	addiu	$3,$fp,96
	addu	$2,$3,$2
	lw	$3,36($fp)
	sw	$3,-52($2)
	li	$3,4			# 0x4
	lw	$2,36($fp)
	subu	$3,$3,$2
	lw	$2,28($fp)
	sll	$4,$2,1
	lw	$2,32($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addiu	$4,$fp,96
	addu	$2,$4,$2; $2 = $4 + $2;
	sw	$3,-36($2)
	lw	$2,28($fp)
	sll	$3,$2,1
	lw	$2,32($fp)
	addu	$2,$3,$2
	sll	$2,$2,2
	addiu	$3,$fp,96
	addu	$2,$3,$2
	lw	$3,-52($2)
	lw	$2,28($fp)
	sll	$4,$2,1
	lw	$2,32($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addiu	$4,$fp,96
	addu	$2,$4,$2
	lw	$2,-36($2)
	addu	$3,$3,$2
	lw	$2,28($fp)
	sll	$4,$2,1
	lw	$2,32($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addiu	$4,$fp,96
	addu	$2,$4,$2
	sw	$3,-20($2)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L3:
	lw	$2,32($fp)
	slt	$2,$2,2
	bne	$2,$0,$L4; branch to $L4 if $2 != $0;
	nop

	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$2,28($fp)
	slt	$2,$2,2; set $2 to 1 if $2 < 2 else $2 == 0;
	bne	$2,$0,$L5
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,92($fp)
	lw	$3,0($3)
	beq	$4,$3,$L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25; call subroutine from $25;
	nop

$L7:
	move	$sp,$fp
	lw	$31,100($sp)
	lw	$fp,96($sp)
	addiu	$sp,$sp,104
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
