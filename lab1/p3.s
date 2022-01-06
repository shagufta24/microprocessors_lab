	.file	"p3.c"
	.text
	.section	.rodata
.LC0:
	.string	"\nIncorrect input format."
.LC1:
	.string	"\nBCD form:"
.LC2:
	.string	"%d "
.LC3:
	.string	"\nWrong input 2. Try again."
	.align 8
.LC4:
	.string	"\nWrong input 2. Only binary digits please."
	.align 8
.LC5:
	.string	"\nIt is not possible to have BCD for numbers above 9. Try again."
.LC6:
	.string	"\nDecimal Form: "
.LC7:
	.string	"%d"
	.align 8
.LC8:
	.string	"\nWrong input 1. Please try again."
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$312, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -212(%rbp)
	movq	%rsi, -224(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpl	$3, -212(%rbp)
	je	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-224(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -168(%rbp)
	cmpl	$1, -168(%rbp)
	jne	.L4
	movq	-224(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -172(%rbp)
	movl	$0, -176(%rbp)
	movl	$0, -184(%rbp)
	movl	$0, -188(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movl	-172(%rbp), %eax
	movl	%eax, -180(%rbp)
	jmp	.L5
.L6:
	addl	$1, -176(%rbp)
	movl	-180(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -180(%rbp)
.L5:
	cmpl	$0, -180(%rbp)
	jg	.L6
	movl	-176(%rbp), %eax
	movq	%rsp, %rdx
	movq	%rdx, %rbx
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -112(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -240(%rbp)
	movq	$0, -232(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -256(%rbp)
	movq	$0, -248(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdx
.L7:
	cmpq	%rdx, %rsp
	je	.L8
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L7
.L8:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L9
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L9:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -104(%rbp)
	movl	-176(%rbp), %eax
	sall	$2, %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -96(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	cltq
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdx
.L10:
	cmpq	%rdx, %rsp
	je	.L11
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L10
.L11:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L12
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L12:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -88(%rbp)
	movl	$0, -180(%rbp)
	jmp	.L13
.L14:
	movq	-104(%rbp), %rax
	movl	-180(%rbp), %edx
	movslq	%edx, %rdx
	movl	$0, (%rax,%rdx,4)
	addl	$1, -180(%rbp)
.L13:
	movl	-180(%rbp), %eax
	cmpl	-176(%rbp), %eax
	jl	.L14
	movl	$0, -180(%rbp)
	jmp	.L15
.L16:
	movq	-88(%rbp), %rax
	movl	-180(%rbp), %edx
	movslq	%edx, %rdx
	movl	$0, (%rax,%rdx,4)
	addl	$1, -180(%rbp)
.L15:
	movl	-176(%rbp), %eax
	sall	$2, %eax
	cmpl	%eax, -180(%rbp)
	jl	.L16
	movl	-176(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -180(%rbp)
	jmp	.L17
.L18:
	movl	-172(%rbp), %ecx
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movq	-104(%rbp), %rax
	movl	-180(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-172(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$1717986919, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$2, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -172(%rbp)
	subl	$1, -180(%rbp)
.L17:
	cmpl	$0, -180(%rbp)
	jns	.L18
	movl	$0, -180(%rbp)
	jmp	.L19
.L24:
	movq	-104(%rbp), %rax
	movl	-180(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -196(%rbp)
	movl	$3, -192(%rbp)
	jmp	.L20
.L21:
	movl	-196(%rbp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	movl	-192(%rbp), %eax
	cltq
	movl	%edx, -80(%rbp,%rax,4)
	movl	-196(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -196(%rbp)
	subl	$1, -192(%rbp)
.L20:
	cmpl	$0, -192(%rbp)
	jns	.L21
	movl	$0, -188(%rbp)
	jmp	.L22
.L23:
	movl	-188(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %ecx
	movq	-88(%rbp), %rax
	movl	-184(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	addl	$1, -184(%rbp)
	addl	$1, -188(%rbp)
.L22:
	cmpl	$3, -188(%rbp)
	jle	.L23
	addl	$1, -180(%rbp)
.L19:
	movl	-180(%rbp), %eax
	cmpl	-176(%rbp), %eax
	jl	.L24
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	movl	$0, -180(%rbp)
	jmp	.L25
.L26:
	movq	-88(%rbp), %rax
	movl	-180(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -180(%rbp)
.L25:
	movl	-176(%rbp), %eax
	sall	$2, %eax
	cmpl	%eax, -180(%rbp)
	jl	.L26
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rsp
	jmp	.L27
.L4:
	cmpl	$2, -168(%rbp)
	jne	.L28
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$0, -208(%rbp)
	movq	-224(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -164(%rbp)
	movl	-164(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	je	.L29
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L29:
	movl	-164(%rbp), %edx
	movslq	%edx, %rax
	subq	$1, %rax
	movq	%rax, -160(%rbp)
	movslq	%edx, %rax
	movq	%rax, -272(%rbp)
	movq	$0, -264(%rbp)
	movslq	%edx, %rax
	movq	%rax, -288(%rbp)
	movq	$0, -280(%rbp)
	movslq	%edx, %rax
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdx
.L30:
	cmpq	%rdx, %rsp
	je	.L31
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L30
.L31:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L32
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L32:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -152(%rbp)
	movl	-164(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -144(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -304(%rbp)
	movq	$0, -296(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -320(%rbp)
	movq	$0, -312(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdx
.L33:
	cmpq	%rdx, %rsp
	je	.L34
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L33
.L34:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L35
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L35:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -136(%rbp)
	movl	-164(%rbp), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -128(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -336(%rbp)
	movq	$0, -328(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -352(%rbp)
	movq	$0, -344(%rbp)
	cltq
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rsi
	subq	%rdx, %rsi
	movq	%rsi, %rdx
.L36:
	cmpq	%rdx, %rsp
	je	.L37
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L36
.L37:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L38
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L38:
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -120(%rbp)
	movq	-224(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rdx
	movq	-152(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -200(%rbp)
	jmp	.L39
.L40:
	movq	-152(%rbp), %rdx
	movl	-200(%rbp), %eax
	cltq
	movzbl	(%rdx,%rax), %eax
	movsbl	%al, %eax
	leal	-48(%rax), %ecx
	movq	-136(%rbp), %rax
	movl	-200(%rbp), %edx
	movslq	%edx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	addl	$1, -200(%rbp)
.L39:
	movl	-200(%rbp), %eax
	cmpl	-164(%rbp), %eax
	jl	.L40
	movl	$0, -200(%rbp)
	jmp	.L41
.L43:
	movq	-136(%rbp), %rax
	movl	-200(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	testl	%eax, %eax
	je	.L42
	movq	-136(%rbp), %rax
	movl	-200(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$1, %eax
	je	.L42
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L42:
	addl	$1, -200(%rbp)
.L41:
	movl	-200(%rbp), %eax
	cmpl	-164(%rbp), %eax
	jl	.L43
	movl	$0, -200(%rbp)
	jmp	.L44
.L47:
	movl	$0, -204(%rbp)
	jmp	.L45
.L46:
	movl	-200(%rbp), %edx
	movl	-204(%rbp), %eax
	addl	%eax, %edx
	movq	-136(%rbp), %rax
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %edx
	movl	-204(%rbp), %eax
	cltq
	movl	%edx, -80(%rbp,%rax,4)
	addl	$1, -204(%rbp)
.L45:
	cmpl	$3, -204(%rbp)
	jle	.L46
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	bcdtodecimal
	movq	-120(%rbp), %rdx
	movl	-208(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	%eax, (%rdx,%rcx,4)
	addl	$1, -208(%rbp)
	addl	$4, -200(%rbp)
.L44:
	movl	-200(%rbp), %eax
	cmpl	-164(%rbp), %eax
	jl	.L47
	movl	$0, -200(%rbp)
	jmp	.L48
.L50:
	movq	-120(%rbp), %rax
	movl	-200(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	cmpl	$-1, %eax
	jne	.L49
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$0, %edi
	call	exit@PLT
.L49:
	addl	$1, -200(%rbp)
.L48:
	movl	-164(%rbp), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	cmpl	%eax, -200(%rbp)
	jl	.L50
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$0, -200(%rbp)
	jmp	.L51
.L52:
	movq	-120(%rbp), %rax
	movl	-200(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -200(%rbp)
.L51:
	movl	-164(%rbp), %eax
	leal	3(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	cmpl	%eax, -200(%rbp)
	jl	.L52
	movl	$10, %edi
	call	putchar@PLT
	movq	%rbx, %rsp
	jmp	.L27
.L28:
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
.L27:
	movl	$0, %eax
.L3:
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L53
	call	__stack_chk_fail@PLT
.L53:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	bcdtodecimal
	.type	bcdtodecimal, @function
bcdtodecimal:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	$3, -12(%rbp)
	jmp	.L55
.L56:
	cvtsi2sdl	-12(%rbp), %xmm0
	movq	.LC9(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -4(%rbp)
	movl	$3, %eax
	subl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	imull	-4(%rbp), %eax
	addl	%eax, -8(%rbp)
	subl	$1, -12(%rbp)
.L55:
	cmpl	$0, -12(%rbp)
	jns	.L56
	cmpl	$9, -8(%rbp)
	jg	.L57
	movl	-8(%rbp), %eax
	jmp	.L58
.L57:
	movl	$-1, %eax
.L58:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	bcdtodecimal, .-bcdtodecimal
	.section	.rodata
	.align 8
.LC9:
	.long	0
	.long	1073741824
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
