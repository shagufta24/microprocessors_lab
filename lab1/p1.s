	.file	"p1.c"
	.text
	.section	.rodata
.LC0:
	.string	"\nBinary representation:"
.LC1:
	.string	"%d "
	.text
	.globl	print
	.type	print, @function
print:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L3
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print, .-print
	.globl	binarycalc
	.type	binarycalc, @function
binarycalc:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	andl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	binarycalc, .-binarycalc
	.globl	decimalbinary
	.type	decimalbinary, @function
decimalbinary:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	addss	%xmm0, %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	decimalbinary, .-decimalbinary
	.comm	a,4,4
	.comm	b,4,4
	.comm	c,4,4
	.comm	d,4,4
	.comm	e,8,8
	.section	.rodata
.LC2:
	.string	"\nIncorrect input format."
.LC3:
	.string	"%u"
.LC4:
	.string	"%d"
	.align 8
.LC5:
	.string	"\nUnsigned float does not exist."
.LC6:
	.string	"%f"
	.align 8
.LC7:
	.string	"\nUnsigned double does not exist."
.LC8:
	.string	"%lf"
.LC9:
	.string	"\nIncorrect inputs."
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$4, -4(%rbp)
	je	.L9
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L10
.L9:
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, a(%rip)
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, b(%rip)
	movl	a(%rip), %eax
	cmpl	$1, %eax
	jne	.L11
	movl	b(%rip), %eax
	testl	%eax, %eax
	jne	.L11
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	c(%rip), %rdx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movl	c(%rip), %edx
	movl	b(%rip), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	intunsigned
	jmp	.L12
.L11:
	movl	a(%rip), %eax
	cmpl	$1, %eax
	jne	.L13
	movl	b(%rip), %eax
	cmpl	$1, %eax
	jne	.L13
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	c(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movl	c(%rip), %eax
	movl	%eax, %edx
	movl	b(%rip), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	intsigned
	jmp	.L12
.L13:
	movl	a(%rip), %eax
	cmpl	$2, %eax
	jne	.L14
	movl	b(%rip), %eax
	testl	%eax, %eax
	jne	.L14
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L12
.L14:
	movl	a(%rip), %eax
	cmpl	$2, %eax
	jne	.L15
	movl	b(%rip), %eax
	cmpl	$1, %eax
	jne	.L15
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	d(%rip), %rdx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movl	d(%rip), %eax
	movd	%eax, %xmm0
	call	floatbinary
	jmp	.L12
.L15:
	movl	a(%rip), %eax
	cmpl	$3, %eax
	jne	.L16
	movl	b(%rip), %eax
	testl	%eax, %eax
	jne	.L16
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L12
.L16:
	movl	a(%rip), %eax
	cmpl	$3, %eax
	jne	.L17
	movl	b(%rip), %eax
	cmpl	$1, %eax
	jne	.L17
	movq	-16(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	e(%rip), %rdx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf@PLT
	movq	e(%rip), %rax
	movq	%rax, %xmm0
	call	doublebinary
	jmp	.L12
.L17:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L12:
	movl	$0, %eax
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.globl	intunsigned
	.type	intunsigned, @function
intunsigned:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	movl	%esi, -168(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -152(%rbp)
	jmp	.L19
.L20:
	movl	-152(%rbp), %eax
	cltq
	movl	$0, -144(%rbp,%rax,4)
	addl	$1, -152(%rbp)
.L19:
	cmpl	$31, -152(%rbp)
	jle	.L20
	cmpl	$0, -168(%rbp)
	jne	.L21
	leaq	-144(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	print
	movl	$0, %edi
	call	exit@PLT
.L21:
	movl	-168(%rbp), %eax
	movl	%eax, -148(%rbp)
	movl	$31, -152(%rbp)
	jmp	.L22
.L23:
	movl	-148(%rbp), %eax
	movl	%eax, %edi
	call	binarycalc
	movl	-152(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -144(%rbp,%rdx,4)
	movl	-148(%rbp), %eax
	shrl	%eax
	movl	%eax, -148(%rbp)
	subl	$1, -152(%rbp)
.L22:
	cmpl	$0, -152(%rbp)
	jns	.L23
	leaq	-144(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	print
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE10:
	.size	intunsigned, .-intunsigned
	.globl	intsigned
	.type	intsigned, @function
intsigned:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$432, %rsp
	movl	%edi, -420(%rbp)
	movl	%esi, -424(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -416(%rbp)
	jmp	.L26
.L27:
	movl	-416(%rbp), %eax
	cltq
	movl	$0, -400(%rbp,%rax,4)
	movl	-416(%rbp), %eax
	cltq
	movl	$0, -272(%rbp,%rax,4)
	movl	-416(%rbp), %eax
	cltq
	movl	$0, -144(%rbp,%rax,4)
	addl	$1, -416(%rbp)
.L26:
	cmpl	$31, -416(%rbp)
	jle	.L27
	cmpl	$0, -424(%rbp)
	js	.L28
	movl	-424(%rbp), %eax
	movl	%eax, -412(%rbp)
	cmpl	$0, -424(%rbp)
	jne	.L29
	leaq	-400(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	print
	movl	$0, %edi
	call	exit@PLT
.L29:
	movl	$0, -400(%rbp)
	movl	$31, -416(%rbp)
	jmp	.L30
.L31:
	movl	-412(%rbp), %eax
	movl	%eax, %edi
	call	binarycalc
	movl	-416(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -400(%rbp,%rdx,4)
	movl	-412(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -412(%rbp)
	subl	$1, -416(%rbp)
.L30:
	cmpl	$0, -416(%rbp)
	jg	.L31
	leaq	-400(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	print
	movl	$0, %edi
	call	exit@PLT
.L28:
	cmpl	$0, -424(%rbp)
	jns	.L46
	movl	-424(%rbp), %eax
	negl	%eax
	movl	%eax, -408(%rbp)
	movl	$0, -400(%rbp)
	cmpl	$0, -424(%rbp)
	jne	.L33
	leaq	-400(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	print
	movl	$0, %edi
	call	exit@PLT
.L33:
	movl	$31, -416(%rbp)
	jmp	.L34
.L35:
	movl	-408(%rbp), %eax
	movl	%eax, %edi
	call	binarycalc
	movl	-416(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -400(%rbp,%rdx,4)
	movl	-408(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -408(%rbp)
	subl	$1, -416(%rbp)
.L34:
	cmpl	$0, -416(%rbp)
	jg	.L35
	movl	$31, -416(%rbp)
	jmp	.L36
.L39:
	movl	-416(%rbp), %eax
	cltq
	movl	-400(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jne	.L37
	movl	-416(%rbp), %eax
	cltq
	movl	$1, -272(%rbp,%rax,4)
	jmp	.L38
.L37:
	movl	-416(%rbp), %eax
	cltq
	movl	-400(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L38
	movl	-416(%rbp), %eax
	cltq
	movl	$0, -272(%rbp,%rax,4)
.L38:
	subl	$1, -416(%rbp)
.L36:
	cmpl	$0, -416(%rbp)
	jns	.L39
	movl	$1, -404(%rbp)
	movl	$31, -416(%rbp)
	jmp	.L40
.L44:
	movl	-416(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L41
	cmpl	$1, -404(%rbp)
	jne	.L41
	movl	-416(%rbp), %eax
	cltq
	movl	$0, -144(%rbp,%rax,4)
	jmp	.L42
.L41:
	movl	-416(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jne	.L43
	cmpl	$1, -404(%rbp)
	jne	.L43
	movl	-416(%rbp), %eax
	cltq
	movl	$1, -144(%rbp,%rax,4)
	movl	$0, -404(%rbp)
	jmp	.L42
.L43:
	movl	-416(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %edx
	movl	-416(%rbp), %eax
	cltq
	movl	%edx, -144(%rbp,%rax,4)
.L42:
	subl	$1, -416(%rbp)
.L40:
	cmpl	$0, -416(%rbp)
	jns	.L44
	leaq	-144(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	print
	movl	$0, %edi
	call	exit@PLT
.L46:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	intsigned, .-intsigned
	.section	.rodata
.LC15:
	.string	" %d"
	.text
	.globl	floatbinary
	.type	floatbinary, @function
floatbinary:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$448, %rsp
	movss	%xmm0, -436(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -416(%rbp)
	movl	$0, -412(%rbp)
	movl	$0, -432(%rbp)
	jmp	.L48
.L49:
	movl	-432(%rbp), %eax
	cltq
	movl	$0, -144(%rbp,%rax,4)
	movl	-432(%rbp), %eax
	cltq
	movl	$0, -272(%rbp,%rax,4)
	addl	$1, -432(%rbp)
.L48:
	cmpl	$31, -432(%rbp)
	jle	.L49
	movss	-436(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	jb	.L93
	movl	$0, -272(%rbp)
	jmp	.L52
.L93:
	movl	$1, -272(%rbp)
	movss	-436(%rbp), %xmm0
	movss	.LC11(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -436(%rbp)
.L52:
	movss	-436(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, -424(%rbp)
	cmpl	$0, -424(%rbp)
	jne	.L53
	movl	$1, -408(%rbp)
	jmp	.L54
.L53:
	cvtsi2sdl	-424(%rbp), %xmm0
	call	log@PLT
	movsd	.LC12(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC13(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -408(%rbp)
.L54:
	movl	-408(%rbp), %eax
	cltq
	movl	$46, -144(%rbp,%rax,4)
	cmpl	$0, -424(%rbp)
	jne	.L55
	movl	-408(%rbp), %eax
	cltq
	movl	$0, -144(%rbp,%rax,4)
	jmp	.L56
.L55:
	movl	-408(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -432(%rbp)
	jmp	.L57
.L58:
	movl	-424(%rbp), %eax
	movl	%eax, %edi
	call	binarycalc
	movl	-432(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -144(%rbp,%rdx,4)
	movl	-424(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -424(%rbp)
	subl	$1, -432(%rbp)
.L57:
	cmpl	$0, -432(%rbp)
	jns	.L58
.L56:
	movss	-436(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, -424(%rbp)
	cvtsi2ssl	-424(%rbp), %xmm1
	movss	-436(%rbp), %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, -420(%rbp)
	pxor	%xmm0, %xmm0
	ucomiss	-420(%rbp), %xmm0
	jp	.L59
	pxor	%xmm0, %xmm0
	ucomiss	-420(%rbp), %xmm0
	jne	.L59
	movl	-408(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -432(%rbp)
	jmp	.L61
.L62:
	movl	-432(%rbp), %eax
	cltq
	movl	$0, -144(%rbp,%rax,4)
	addl	$1, -432(%rbp)
.L61:
	cmpl	$31, -432(%rbp)
	jle	.L62
	jmp	.L63
.L59:
	movl	-408(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -432(%rbp)
	jmp	.L64
.L67:
	movl	-420(%rbp), %eax
	movd	%eax, %xmm0
	call	decimalbinary
	movl	-432(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -144(%rbp,%rdx,4)
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L65
	movss	-420(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	.LC14(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -420(%rbp)
	jmp	.L66
.L65:
	movss	-420(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	%xmm0, -420(%rbp)
.L66:
	addl	$1, -432(%rbp)
.L64:
	cmpl	$31, -432(%rbp)
	jle	.L67
.L63:
	movl	$0, -404(%rbp)
	movl	$0, -432(%rbp)
	jmp	.L68
.L70:
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L69
	addl	$1, -404(%rbp)
.L69:
	addl	$1, -432(%rbp)
.L68:
	cmpl	$31, -432(%rbp)
	jle	.L70
	cmpl	$0, -404(%rbp)
	jne	.L71
	movl	$0, -432(%rbp)
	jmp	.L72
.L73:
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -432(%rbp)
.L72:
	cmpl	$31, -432(%rbp)
	jle	.L73
	movl	$0, %edi
	call	exit@PLT
.L71:
	movl	$0, -432(%rbp)
	jmp	.L74
.L75:
	addl	$1, -416(%rbp)
	addl	$1, -432(%rbp)
.L74:
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L75
	addl	$1, -416(%rbp)
	movl	$0, -428(%rbp)
	movl	-416(%rbp), %eax
	movl	%eax, -432(%rbp)
	jmp	.L76
.L79:
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L77
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L78
.L77:
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %edx
	movl	-428(%rbp), %eax
	cltq
	movl	%edx, -368(%rbp,%rax,4)
	addl	$1, -428(%rbp)
.L78:
	addl	$1, -432(%rbp)
.L76:
	cmpl	$22, -428(%rbp)
	jle	.L79
	movl	$0, -428(%rbp)
	movl	-416(%rbp), %eax
	movl	%eax, -432(%rbp)
	jmp	.L80
.L81:
	addl	$1, -412(%rbp)
	addl	$1, -432(%rbp)
.L80:
	movl	-432(%rbp), %eax
	cltq
	movl	-144(%rbp,%rax,4), %eax
	cmpl	$46, %eax
	jne	.L81
	addl	$127, -412(%rbp)
	movl	$0, -432(%rbp)
	jmp	.L82
.L83:
	movl	-432(%rbp), %eax
	cltq
	movl	$0, -400(%rbp,%rax,4)
	addl	$1, -432(%rbp)
.L82:
	cmpl	$7, -432(%rbp)
	jle	.L83
	movl	$7, -432(%rbp)
	jmp	.L84
.L85:
	movl	-412(%rbp), %eax
	movl	%eax, %edi
	call	binarycalc
	movl	-432(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -400(%rbp,%rdx,4)
	movl	-412(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -412(%rbp)
	subl	$1, -432(%rbp)
.L84:
	cmpl	$0, -432(%rbp)
	jns	.L85
	movl	$0, -432(%rbp)
	jmp	.L86
.L87:
	movl	-432(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-432(%rbp), %eax
	cltq
	movl	-400(%rbp,%rax,4), %edx
	movslq	%ecx, %rax
	movl	%edx, -272(%rbp,%rax,4)
	addl	$1, -432(%rbp)
.L86:
	cmpl	$7, -432(%rbp)
	jle	.L87
	movl	$0, -432(%rbp)
	jmp	.L88
.L89:
	movl	-432(%rbp), %eax
	leal	9(%rax), %ecx
	movl	-432(%rbp), %eax
	cltq
	movl	-368(%rbp,%rax,4), %edx
	movslq	%ecx, %rax
	movl	%edx, -272(%rbp,%rax,4)
	addl	$1, -432(%rbp)
.L88:
	cmpl	$22, -432(%rbp)
	jle	.L89
	leaq	-272(%rbp), %rax
	movl	$32, %esi
	movq	%rax, %rdi
	call	print
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L90
	call	__stack_chk_fail@PLT
.L90:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	floatbinary, .-floatbinary
	.globl	doublebinary
	.type	doublebinary, @function
doublebinary:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$832, %rsp
	movsd	%xmm0, -824(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -800(%rbp)
	movl	$0, -796(%rbp)
	movl	$0, -816(%rbp)
	jmp	.L95
.L96:
	movl	-816(%rbp), %eax
	cltq
	movl	$0, -272(%rbp,%rax,4)
	movl	-816(%rbp), %eax
	cltq
	movl	$0, -528(%rbp,%rax,4)
	addl	$1, -816(%rbp)
.L95:
	cmpl	$63, -816(%rbp)
	jle	.L96
	movsd	-824(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	jb	.L140
	movl	$0, -528(%rbp)
	jmp	.L99
.L140:
	movl	$1, -528(%rbp)
	movsd	-824(%rbp), %xmm0
	movq	.LC17(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -824(%rbp)
.L99:
	movsd	-824(%rbp), %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -808(%rbp)
	cmpl	$0, -808(%rbp)
	jne	.L100
	movl	$1, -792(%rbp)
	jmp	.L101
.L100:
	cvtsi2sdl	-808(%rbp), %xmm0
	call	log@PLT
	movsd	.LC12(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	movsd	.LC13(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -792(%rbp)
.L101:
	movl	-792(%rbp), %eax
	cltq
	movl	$46, -272(%rbp,%rax,4)
	movl	-792(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -816(%rbp)
	jmp	.L102
.L105:
	cmpl	$0, -808(%rbp)
	jne	.L103
	movl	$0, -268(%rbp)
	jmp	.L104
.L103:
	movl	-808(%rbp), %eax
	movl	%eax, %edi
	call	binarycalc
	movl	-816(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -272(%rbp,%rdx,4)
	movl	-808(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -808(%rbp)
.L104:
	subl	$1, -816(%rbp)
.L102:
	cmpl	$0, -816(%rbp)
	jns	.L105
	movsd	-824(%rbp), %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -808(%rbp)
	cvtsi2sdl	-808(%rbp), %xmm1
	movsd	-824(%rbp), %xmm0
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -804(%rbp)
	pxor	%xmm0, %xmm0
	ucomiss	-804(%rbp), %xmm0
	jp	.L106
	pxor	%xmm0, %xmm0
	ucomiss	-804(%rbp), %xmm0
	jne	.L106
	movl	-792(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -816(%rbp)
	jmp	.L108
.L109:
	movl	-816(%rbp), %eax
	cltq
	movl	$0, -272(%rbp,%rax,4)
	addl	$1, -816(%rbp)
.L108:
	cmpl	$63, -816(%rbp)
	jle	.L109
	jmp	.L110
.L106:
	movl	-792(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -816(%rbp)
	jmp	.L111
.L114:
	movl	-804(%rbp), %eax
	movd	%eax, %xmm0
	call	decimalbinary
	movl	-816(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -272(%rbp,%rdx,4)
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L112
	movss	-804(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	.LC14(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -804(%rbp)
	jmp	.L113
.L112:
	movss	-804(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	%xmm0, -804(%rbp)
.L113:
	addl	$1, -816(%rbp)
.L111:
	cmpl	$63, -816(%rbp)
	jle	.L114
.L110:
	movl	$0, -788(%rbp)
	movl	$0, -816(%rbp)
	jmp	.L115
.L117:
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L116
	addl	$1, -788(%rbp)
.L116:
	addl	$1, -816(%rbp)
.L115:
	cmpl	$31, -816(%rbp)
	jle	.L117
	cmpl	$0, -788(%rbp)
	jne	.L118
	movl	$0, -816(%rbp)
	jmp	.L119
.L120:
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -816(%rbp)
.L119:
	cmpl	$63, -816(%rbp)
	jle	.L120
	movl	$0, %edi
	call	exit@PLT
.L118:
	movl	$0, -816(%rbp)
	jmp	.L121
.L122:
	addl	$1, -800(%rbp)
	addl	$1, -816(%rbp)
.L121:
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L122
	addl	$1, -800(%rbp)
	movl	$0, -812(%rbp)
	movl	-800(%rbp), %eax
	movl	%eax, -816(%rbp)
	jmp	.L123
.L126:
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	testl	%eax, %eax
	je	.L124
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L125
.L124:
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %edx
	movl	-812(%rbp), %eax
	cltq
	movl	%edx, -736(%rbp,%rax,4)
	addl	$1, -812(%rbp)
.L125:
	addl	$1, -816(%rbp)
.L123:
	cmpl	$51, -812(%rbp)
	jle	.L126
	movl	$0, -812(%rbp)
	movl	-800(%rbp), %eax
	movl	%eax, -816(%rbp)
	jmp	.L127
.L128:
	addl	$1, -796(%rbp)
	addl	$1, -816(%rbp)
.L127:
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	cmpl	$46, %eax
	jne	.L128
	addl	$1023, -796(%rbp)
	movl	$0, -816(%rbp)
	jmp	.L129
.L130:
	movl	-816(%rbp), %eax
	cltq
	movl	$0, -784(%rbp,%rax,4)
	addl	$1, -816(%rbp)
.L129:
	cmpl	$10, -816(%rbp)
	jle	.L130
	movl	$10, -816(%rbp)
	jmp	.L131
.L132:
	movl	-796(%rbp), %eax
	movl	%eax, %edi
	call	binarycalc
	movl	-816(%rbp), %edx
	movslq	%edx, %rdx
	movl	%eax, -784(%rbp,%rdx,4)
	movl	-796(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -796(%rbp)
	subl	$1, -816(%rbp)
.L131:
	cmpl	$0, -816(%rbp)
	jns	.L132
	movl	$0, -816(%rbp)
	jmp	.L133
.L134:
	movl	-816(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-816(%rbp), %eax
	cltq
	movl	-784(%rbp,%rax,4), %edx
	movslq	%ecx, %rax
	movl	%edx, -528(%rbp,%rax,4)
	addl	$1, -816(%rbp)
.L133:
	cmpl	$10, -816(%rbp)
	jle	.L134
	movl	$0, -816(%rbp)
	jmp	.L135
.L136:
	movl	-816(%rbp), %eax
	leal	12(%rax), %ecx
	movl	-816(%rbp), %eax
	cltq
	movl	-736(%rbp,%rax,4), %edx
	movslq	%ecx, %rax
	movl	%edx, -528(%rbp,%rax,4)
	addl	$1, -816(%rbp)
.L135:
	cmpl	$51, -816(%rbp)
	jle	.L136
	leaq	-528(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	print
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L137
	call	__stack_chk_fail@PLT
.L137:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	doublebinary, .-doublebinary
	.section	.rodata
	.align 16
.LC11:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.align 8
.LC12:
	.long	4277811695
	.long	1072049730
	.align 8
.LC13:
	.long	0
	.long	1073741824
	.align 4
.LC14:
	.long	1065353216
	.align 16
.LC17:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
