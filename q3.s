	.file	1 "q3.c"
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
	.frame	$fp,456,$31		# vars= 424, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-456; add immediate unsigned without overflow; $sp = $sp - 456;
	sw	$31,452($sp); store word command; [$sp-452] = $31;
	sw	$fp,448($sp)
	move	$fp,$sp; $sp = $fp;
	lui	$28,%hi(__gnu_local_gp); load upper immediate value ;
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2); load word in $2;
	sw	$2,444($fp)
	addiu	$2,$fp,44
	li	$3,400			# 0x190; load integer 400 in $3;
	move	$6,$3; $3 = $6;
	move	$5,$0
	move	$4,$2
	lw	$2,%call16(memset)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,memset
1:	jalr	$25; calls the subroutine stored in the register $25;
	nop 	//no operation

	lw	$28,16($fp)
	li	$2,1			# 0x1
	sw	$2,24($fp)
	sw	$0,32($fp)
	b	$L2; // branch to $L2
	nop

$L9:
	sw	$0,40($fp)
	sw	$0,36($fp)
	li	$2,1			# 0x1
	sw	$2,28($fp)
	b	$L3
	nop		//No operation

$L7:
	lw	$3,24($fp); Load word command; [$fp + 24] = $3;
	lw	$2,28($fp)
	teq	$2,$0,7; trap 7, if $2 == $0;
	div	$0,$3,$2; $0 = $3 / $2;
	mfhi	$2; 
	bne	$2,$0,$L4;  branch to $L4 if $2 != $0;
	nop

	lw	$2,40($fp)
	addiu	$2,$2,1
	sw	$2,40($fp)
$L4:
	lw	$2,40($fp)
	slt	$2,$2,2; if($2 < 2), $2 = 1; else $2 = 0;
	bne	$2,$0,$L5
	nop

	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L6
	nop

$L5:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L3:
	lw	$2,24($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1; shift right arithmetic; $2>>1;
	move	$3,$2
	lw	$2,28($fp)
	slt	$2,$3,$2
	beq	$2,$0,$L7
	nop

$L6:
	lw	$2,36($fp)
	bne	$2,$0,$L8
	nop

	lw	$2,32($fp)
	sll	$2,$2,2
	addiu	$3,$fp,448
	addu	$2,$3,$2
	lw	$3,24($fp)
	sw	$3,-404($2)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L8:
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$2,24($fp)
	slt	$2,$2,101
	bne	$2,$0,$L9
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,444($fp)
	lw	$3,0($3)
	beq	$4,$3,$L11
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L11:
	move	$sp,$fp
	lw	$31,452($sp)
	lw	$fp,448($sp)
	addiu	$sp,$sp,456
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
