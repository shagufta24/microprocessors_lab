	.file	"p2.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"\nEnter your choice:\n(i for integer (or) r for real number)\n "
.LC1:
	.string	"%c"
	.align 8
.LC2:
	.string	"\nPlease enter 32 bit binary signed integers only."
.LC3:
	.string	"\nEnter binary value 1: "
.LC4:
	.string	"%s"
.LC5:
	.string	"\nEnter binary value 2: "
.LC6:
	.string	"\nInput 1: %Lf\n"
.LC7:
	.string	"Input 2: %Lf\n"
.LC8:
	.string	"\n*** ADDITION ***"
	.align 8
.LC9:
	.string	"\nThe sum is:\nBINARY: %s\nDECIMAL: %Lf\n"
.LC10:
	.string	"\n*** MULTIPLICATION ***"
	.align 8
.LC11:
	.string	"\nThe product is:\nBINARY:%s\nDECIMAL: %Lf\n"
	.align 8
.LC12:
	.string	"\nPlease enter 32 bit IEEE 754 floating point numbers only."
.LC13:
	.string	"Enter binary value 1: "
.LC14:
	.string	"Enter binary value 2: "
.LC15:
	.string	"Incorrect input, try again."
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
	subq	$144, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-133(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-133(%rbp), %eax
	cmpb	$105, %al
	jne	.L2
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, -132(%rbp)
	jmp	.L3
.L4:
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -132(%rbp)
.L3:
	cmpl	$32, -132(%rbp)
	jne	.L4
	movzbl	-96(%rbp), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -128(%rbp)
	movl	$0, -132(%rbp)
	jmp	.L5
.L6:
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -132(%rbp)
.L5:
	cmpl	$32, -132(%rbp)
	jne	.L6
	movzbl	-48(%rbp), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -124(%rbp)
	movl	-128(%rbp), %ecx
	leaq	-96(%rbp), %rax
	movl	$32, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	int_bintodec
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movl	-124(%rbp), %ecx
	leaq	-48(%rbp), %rax
	movl	$32, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	int_bintodec
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$33, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -120(%rbp)
	movl	-120(%rbp), %ecx
	movq	-112(%rbp), %rax
	movl	$32, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	int_bintodec
	movq	-112(%rbp), %rax
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	leaq	-48(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	int_multiply
	movq	%rax, -104(%rbp)
	movq	-104(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -116(%rbp)
	movl	-116(%rbp), %ecx
	movq	-104(%rbp), %rax
	movl	$64, %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	int_bintodec
	movq	-104(%rbp), %rax
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	jmp	.L7
.L2:
	movzbl	-133(%rbp), %eax
	cmpb	$114, %al
	jne	.L8
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-48(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	float_multiply
	leaq	-48(%rbp), %rdx
	leaq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	float_add
	jmp	.L7
.L8:
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L10
.L7:
	movl	$0, %eax
.L10:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.globl	int_add
	.type	int_add, @function
int_add:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	-52(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subl	$1, %eax
	movl	%eax, -28(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L13
.L18:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -20(%rbp)
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -16(%rbp)
	movl	-20(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%eax, %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L14
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	movl	$0, -24(%rbp)
	jmp	.L15
.L14:
	cmpl	$1, -12(%rbp)
	jne	.L16
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$49, (%rax)
	movl	$0, -24(%rbp)
	jmp	.L15
.L16:
	cmpl	$2, -12(%rbp)
	jne	.L17
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	movl	$1, -24(%rbp)
	jmp	.L15
.L17:
	cmpl	$3, -12(%rbp)
	jne	.L15
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$49, (%rax)
	movl	$1, -24(%rbp)
.L15:
	subl	$1, -28(%rbp)
.L13:
	cmpl	$0, -28(%rbp)
	jns	.L18
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	int_add, .-int_add
	.section	.rodata
	.align 8
.LC17:
	.string	"00000000000000000000000000000001"
	.text
	.globl	int_multiply
	.type	int_multiply, @function
int_multiply:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movl	$64, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	$0, -80(%rbp)
	movl	$31, -76(%rbp)
	movl	$64, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L21
.L22:
	movl	-72(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	addl	$1, -72(%rbp)
.L21:
	cmpl	$63, -72(%rbp)
	jle	.L22
	jmp	.L23
.L44:
	movl	$0, -72(%rbp)
	jmp	.L24
.L25:
	movl	-72(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	addl	$1, -72(%rbp)
.L24:
	cmpl	$63, -72(%rbp)
	jle	.L25
	cmpl	$0, -76(%rbp)
	jne	.L26
	movq	-112(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L26
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	-104(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -68(%rbp)
	jmp	.L27
.L30:
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L28
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$49, (%rax)
	jmp	.L29
.L28:
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L29
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
.L29:
	addl	$1, -68(%rbp)
.L27:
	cmpl	$31, -68(%rbp)
	jle	.L30
	movl	$64, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movq	-16(%rbp), %rax
	movl	$32, %edx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -82(%rbp)
	cmpb	$48, -82(%rbp)
	jne	.L31
	movl	$0, -64(%rbp)
	jmp	.L32
.L33:
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	-64(%rbp), %edx
	addl	$32, %edx
	subl	-80(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -64(%rbp)
.L32:
	cmpl	$31, -64(%rbp)
	jle	.L33
	jmp	.L46
.L31:
	cmpb	$49, -82(%rbp)
	jne	.L46
	movl	$0, -60(%rbp)
	jmp	.L35
.L36:
	movl	-60(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	-60(%rbp), %edx
	addl	$32, %edx
	subl	-80(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -60(%rbp)
.L35:
	cmpl	$31, -60(%rbp)
	jle	.L36
	movl	$0, -56(%rbp)
	jmp	.L37
.L38:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$49, (%rax)
	addl	$1, -56(%rbp)
.L37:
	movl	$31, %eax
	subl	-80(%rbp), %eax
	cmpl	%eax, -56(%rbp)
	jle	.L38
	jmp	.L46
.L26:
	movl	-76(%rbp), %eax
	movslq	%eax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -40(%rbp)
	movl	$31, -52(%rbp)
	movl	$63, %eax
	subl	-80(%rbp), %eax
	movl	%eax, -48(%rbp)
	jmp	.L40
.L41:
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, %ecx
	movl	-40(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	imull	%edx, %eax
	leal	48(%rax), %ecx
	movl	-48(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	subl	$1, -52(%rbp)
	subl	$1, -48(%rbp)
.L40:
	cmpl	$0, -52(%rbp)
	jns	.L41
	movl	$32, %eax
	subl	-80(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -81(%rbp)
	movl	-36(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.L42
.L43:
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-81(%rbp), %eax
	movb	%al, (%rdx)
	subl	$1, -44(%rbp)
.L42:
	cmpl	$0, -44(%rbp)
	jns	.L43
	jmp	.L39
.L46:
	nop
.L39:
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$64, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -32(%rbp)
	addl	$1, -80(%rbp)
	subl	$1, -76(%rbp)
.L23:
	cmpl	$0, -76(%rbp)
	jns	.L44
	movq	-32(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	int_multiply, .-int_multiply
	.section	.rodata
	.align 8
.LC18:
	.string	"\nExponents in decimal form:\nExponent 1: %d\nExponent 2: %d\n"
	.align 8
.LC19:
	.string	"\nSecond number is shifted right by %d places."
	.align 8
.LC20:
	.string	"\nShifted mantissas:\nMantissa 1: %s\nMantissa 2: %s\n"
	.align 8
.LC21:
	.string	"\nFirst number is shifted right by %d places\n"
.LC22:
	.string	"Before: %s\n"
.LC23:
	.string	"\nFirst number is negative."
.LC24:
	.string	"\n1s complement: %s"
.LC25:
	.string	"000000000000000000000001"
.LC26:
	.string	"\n2s compl of Mantissa 1: %s\n"
.LC27:
	.string	"\nSecond number is negative."
.LC28:
	.string	"\n2s compl of Mantissa 2: %s\n"
.LC29:
	.string	"\nMantissa Sum: %s\n"
	.align 8
.LC30:
	.string	"\nYour inputs:\nInput1: %Lf\nInput2: %Lf\n"
.LC31:
	.string	"\nFINAL SUM: %d%s%s"
.LC32:
	.string	"\nIn decimal: %Lf\n"
	.text
	.globl	float_add
	.type	float_add, @function
float_add:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%rdi, -216(%rbp)
	movq	%rsi, -224(%rbp)
	movq	-216(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -202(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -120(%rbp)
	movq	-216(%rbp), %rax
	movl	$8, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$23, %edi
	call	malloc@PLT
	movq	%rax, -112(%rbp)
	movq	-216(%rbp), %rax
	movl	$23, %edx
	movl	$9, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-224(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -201(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -104(%rbp)
	movq	-224(%rbp), %rax
	movl	$8, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$23, %edi
	call	malloc@PLT
	movq	%rax, -96(%rbp)
	movq	-224(%rbp), %rax
	movl	$23, %edx
	movl	$9, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	.LC8(%rip), %rdi
	call	puts@PLT
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -144(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -136(%rbp)
	movq	-144(%rbp), %rax
	movb	$49, (%rax)
	movq	-136(%rbp), %rax
	movb	$49, (%rax)
	movl	$0, -200(%rbp)
	jmp	.L48
.L49:
	movl	-200(%rbp), %eax
	movslq	%eax, %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movl	-200(%rbp), %edx
	movslq	%edx, %rdx
	leaq	1(%rdx), %rcx
	movq	-144(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-200(%rbp), %eax
	movslq	%eax, %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movl	-200(%rbp), %edx
	movslq	%edx, %rdx
	leaq	1(%rdx), %rcx
	movq	-136(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -200(%rbp)
.L48:
	cmpl	$22, -200(%rbp)
	jle	.L49
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	simple_to_int
	subl	$127, %eax
	movl	%eax, -160(%rbp)
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	simple_to_int
	subl	$127, %eax
	movl	%eax, -156(%rbp)
	movl	-156(%rbp), %edx
	movl	-160(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC18(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-160(%rbp), %eax
	sarl	$31, %eax
	movl	%eax, %edx
	xorl	-160(%rbp), %edx
	subl	%eax, %edx
	movl	-156(%rbp), %eax
	sarl	$31, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	xorl	-156(%rbp), %eax
	subl	%ecx, %eax
	cmpl	%eax, %edx
	jle	.L50
	movq	-144(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -196(%rbp)
	jmp	.L51
.L50:
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, -196(%rbp)
.L51:
	movl	-160(%rbp), %eax
	cmpl	-156(%rbp), %eax
	jle	.L52
	movq	-120(%rbp), %rax
	movq	%rax, -128(%rbp)
	movl	-160(%rbp), %eax
	subl	-156(%rbp), %eax
	movl	%eax, -148(%rbp)
	movl	-148(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC19(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$23, -192(%rbp)
	jmp	.L53
.L54:
	movl	-192(%rbp), %eax
	subl	-148(%rbp), %eax
	movslq	%eax, %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movl	-192(%rbp), %edx
	movslq	%edx, %rcx
	movq	-136(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	subl	$1, -192(%rbp)
.L53:
	movl	-192(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jge	.L54
	movl	$0, -188(%rbp)
	jmp	.L55
.L56:
	movl	-188(%rbp), %eax
	movslq	%eax, %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	addl	$1, -188(%rbp)
.L55:
	movl	-188(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jl	.L56
	movq	-136(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L57
.L52:
	movl	-156(%rbp), %eax
	cmpl	-160(%rbp), %eax
	jle	.L58
	movq	-104(%rbp), %rax
	movq	%rax, -128(%rbp)
	movl	-156(%rbp), %eax
	subl	-160(%rbp), %eax
	movl	%eax, -152(%rbp)
	movl	-152(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC21(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$23, -184(%rbp)
	jmp	.L59
.L60:
	movl	-184(%rbp), %eax
	subl	-152(%rbp), %eax
	movslq	%eax, %rdx
	movq	-144(%rbp), %rax
	addq	%rdx, %rax
	movl	-184(%rbp), %edx
	movslq	%edx, %rcx
	movq	-144(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	subl	$1, -184(%rbp)
.L59:
	movl	-184(%rbp), %eax
	cmpl	-152(%rbp), %eax
	jge	.L60
	movl	$0, -180(%rbp)
	jmp	.L61
.L62:
	movl	-180(%rbp), %eax
	movslq	%eax, %rdx
	movq	-144(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	addl	$1, -180(%rbp)
.L61:
	movl	-180(%rbp), %eax
	cmpl	-152(%rbp), %eax
	jl	.L62
	movq	-136(%rbp), %rdx
	movq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L57
.L58:
	movq	-120(%rbp), %rax
	movq	%rax, -128(%rbp)
.L57:
	movsbl	-202(%rbp), %eax
	movq	-144(%rbp), %rdx
	movq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	float_to_dec
	fstpt	-48(%rbp)
	movsbl	-201(%rbp), %eax
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	float_to_dec
	fstpt	-32(%rbp)
	cmpb	$49, -202(%rbp)
	jne	.L63
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -88(%rbp)
	movq	-144(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -176(%rbp)
	jmp	.L64
.L67:
	movl	-176(%rbp), %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L65
	movl	-176(%rbp), %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movb	$49, (%rax)
	jmp	.L66
.L65:
	movl	-176(%rbp), %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L66
	movl	-176(%rbp), %eax
	movslq	%eax, %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
.L66:
	addl	$1, -176(%rbp)
.L64:
	cmpl	$23, -176(%rbp)
	jle	.L67
	movq	-88(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -80(%rbp)
	movq	-88(%rbp), %rax
	movl	$24, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -144(%rbp)
	movq	-144(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC26(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L63:
	cmpb	$49, -201(%rbp)
	jne	.L68
	leaq	.LC27(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -72(%rbp)
	movq	-136(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -172(%rbp)
	jmp	.L69
.L72:
	movl	-172(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L70
	movl	-172(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movb	$49, (%rax)
	jmp	.L71
.L70:
	movl	-172(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L71
	movl	-172(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
.L71:
	addl	$1, -172(%rbp)
.L69:
	cmpl	$23, -172(%rbp)
	jle	.L72
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -64(%rbp)
	movq	-72(%rbp), %rax
	movl	$24, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, -136(%rbp)
	movq	-136(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC28(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L68:
	movl	$0, -168(%rbp)
	movq	-144(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L73
	movq	-136(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L73
	movl	$1, -168(%rbp)
.L73:
	movq	-136(%rbp), %rcx
	movq	-144(%rbp), %rax
	movl	$24, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -56(%rbp)
	cmpl	$1, -168(%rbp)
	jne	.L74
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subl	$1, %eax
	movl	%eax, -164(%rbp)
	jmp	.L75
.L76:
	movl	-164(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	-164(%rbp), %edx
	movslq	%edx, %rcx
	movq	-56(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	subl	$1, -164(%rbp)
.L75:
	cmpl	$0, -164(%rbp)
	jg	.L76
	movq	-56(%rbp), %rax
	movb	$49, (%rax)
.L74:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC29(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	pushq	-48(%rbp)
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$32, %rsp
	movl	-196(%rbp), %eax
	leal	-48(%rax), %esi
	movq	-56(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC31(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	cmpl	$1, -168(%rbp)
	jne	.L77
	movl	-196(%rbp), %eax
	movsbl	%al, %eax
	movq	-56(%rbp), %rdx
	movq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	float_to_dec25
	fstpt	-16(%rbp)
	jmp	.L78
.L77:
	movl	-196(%rbp), %eax
	movsbl	%al, %eax
	movq	-56(%rbp), %rdx
	movq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	float_to_dec
	fstpt	-16(%rbp)
.L78:
	fldt	-48(%rbp)
	fldt	-32(%rbp)
	faddp	%st, %st(1)
	leaq	-16(%rsp), %rsp
	fstpt	(%rsp)
	leaq	.LC32(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	float_add, .-float_add
	.section	.rodata
	.align 8
.LC33:
	.string	"\nNumber 1:\nMantissa: %s\nExponent: %s\nSign: %ch\n"
	.align 8
.LC34:
	.string	"\nNumber 2:\nMantissa: %s\nExponent: %s\nSign: %ch\n"
	.align 8
.LC35:
	.string	"\nExtended mantissas:\nMantissa 1: %s\nMantissa 2: %s\n"
.LC36:
	.string	"\nMantissa product: %s\n"
.LC37:
	.string	"10000001"
.LC38:
	.string	"00000001"
.LC39:
	.string	"Final exponent: %s\n"
.LC40:
	.string	"Final sign: %ch\n"
.LC41:
	.string	"\nFINAL PRODUCT: %d%s%s\n"
.LC42:
	.string	"In decimal: %Lf\n"
	.text
	.globl	float_multiply
	.type	float_multiply, @function
float_multiply:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -134(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -128(%rbp)
	movq	-152(%rbp), %rax
	movl	$8, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$23, %edi
	call	malloc@PLT
	movq	%rax, -120(%rbp)
	movq	-152(%rbp), %rax
	movl	$23, %edx
	movl	$9, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-160(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -133(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -112(%rbp)
	movq	-160(%rbp), %rax
	movl	$8, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$23, %edi
	call	malloc@PLT
	movq	%rax, -104(%rbp)
	movq	-160(%rbp), %rax
	movl	$23, %edx
	movl	$9, %esi
	movq	%rax, %rdi
	call	substring
	movq	%rax, %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movsbl	-134(%rbp), %ecx
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC33(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsbl	-133(%rbp), %ecx
	movq	-112(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC34(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -96(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, -88(%rbp)
	movq	-96(%rbp), %rax
	movb	$49, (%rax)
	movq	-88(%rbp), %rax
	movb	$49, (%rax)
	movl	$0, -132(%rbp)
	jmp	.L80
.L81:
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	leaq	1(%rdx), %rcx
	movq	-96(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-132(%rbp), %eax
	movslq	%eax, %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	leaq	1(%rdx), %rcx
	movq	-88(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -132(%rbp)
.L80:
	cmpl	$22, -132(%rbp)
	jle	.L81
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movb	$0, (%rax)
	movq	-88(%rbp), %rax
	addq	$24, %rax
	movb	$0, (%rax)
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-88(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	mantissa_multiply
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	addq	$24, %rax
	movb	$0, (%rax)
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC36(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-112(%rbp), %rcx
	movq	-128(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rax
	movl	$8, %edx
	leaq	.LC37(%rip), %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	$8, %edx
	leaq	.LC38(%rip), %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movzbl	-134(%rbp), %eax
	cmpb	-133(%rbp), %al
	jne	.L82
	movb	$48, -135(%rbp)
	jmp	.L83
.L82:
	movb	$49, -135(%rbp)
.L83:
	movsbl	-135(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC40(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsbl	-134(%rbp), %eax
	movq	-96(%rbp), %rdx
	movq	-128(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	float_to_dec
	fstpt	-48(%rbp)
	movsbl	-133(%rbp), %eax
	movq	-88(%rbp), %rdx
	movq	-112(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	float_to_dec
	fstpt	-32(%rbp)
	pushq	-24(%rbp)
	pushq	-32(%rbp)
	pushq	-40(%rbp)
	pushq	-48(%rbp)
	leaq	.LC30(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$32, %rsp
	movsbl	-135(%rbp), %eax
	movq	-80(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	float_to_dec
	fstpt	-16(%rbp)
	movsbl	-135(%rbp), %eax
	leal	-48(%rax), %esi
	movq	-80(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	pushq	-8(%rbp)
	pushq	-16(%rbp)
	leaq	.LC42(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addq	$16, %rsp
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	float_multiply, .-float_multiply
	.globl	float_to_dec
	.type	float_to_dec, @function
float_to_dec:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, %eax
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movb	%al, -36(%rbp)
	fldz
	fstpt	-16(%rbp)
	movq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	jne	.L85
	fldt	-16(%rbp)
	fld1
	faddp	%st, %st(1)
	fstpt	-16(%rbp)
.L85:
	movl	$1, -24(%rbp)
	jmp	.L86
.L87:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cvtsi2sdl	%eax, %xmm2
	movsd	%xmm2, -80(%rbp)
	cvtsi2sdl	-24(%rbp), %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	.LC46(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	mulsd	-80(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	fldl	-80(%rbp)
	fldt	-16(%rbp)
	faddp	%st, %st(1)
	fstpt	-16(%rbp)
	addl	$1, -24(%rbp)
.L86:
	cmpl	$23, -24(%rbp)
	jle	.L87
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	simple_to_int
	subl	$127, %eax
	movl	%eax, -20(%rbp)
	cmpb	$49, -36(%rbp)
	jne	.L88
	fldt	-16(%rbp)
	fchs
	fstpt	-80(%rbp)
	cvtsi2sdl	-20(%rbp), %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -64(%rbp)
	fldl	-64(%rbp)
	fldt	-80(%rbp)
	fmulp	%st, %st(1)
	jmp	.L84
.L88:
	cmpb	$48, -36(%rbp)
	jne	.L90
	cvtsi2sdl	-20(%rbp), %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -80(%rbp)
	fldl	-80(%rbp)
	fldt	-16(%rbp)
	fmulp	%st, %st(1)
	jmp	.L84
.L90:
	flds	.LC16(%rip)
	fstp	%st(0)
	flds	.LC16(%rip)
.L84:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	float_to_dec, .-float_to_dec
	.globl	float_to_dec25
	.type	float_to_dec25, @function
float_to_dec25:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, %eax
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movb	%al, -36(%rbp)
	fldt	.LC47(%rip)
	fstpt	-16(%rbp)
	movl	$2, -24(%rbp)
	jmp	.L92
.L93:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cvtsi2sdl	%eax, %xmm2
	movsd	%xmm2, -80(%rbp)
	movl	-24(%rbp), %eax
	subl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	.LC46(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	mulsd	-80(%rbp), %xmm0
	movsd	%xmm0, -80(%rbp)
	fldl	-80(%rbp)
	fldt	-16(%rbp)
	faddp	%st, %st(1)
	fstpt	-16(%rbp)
	addl	$1, -24(%rbp)
.L92:
	cmpl	$24, -24(%rbp)
	jle	.L93
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	simple_to_int
	subl	$127, %eax
	movl	%eax, -20(%rbp)
	cmpb	$49, -36(%rbp)
	jne	.L94
	fldt	-16(%rbp)
	fchs
	fstpt	-80(%rbp)
	cvtsi2sdl	-20(%rbp), %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -64(%rbp)
	fldl	-64(%rbp)
	fldt	-80(%rbp)
	fmulp	%st, %st(1)
	jmp	.L91
.L94:
	cmpb	$48, -36(%rbp)
	jne	.L96
	cvtsi2sdl	-20(%rbp), %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -80(%rbp)
	fldl	-80(%rbp)
	fldt	-16(%rbp)
	fmulp	%st, %st(1)
	jmp	.L91
.L96:
	flds	.LC16(%rip)
	fstp	%st(0)
	flds	.LC16(%rip)
.L91:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	float_to_dec25, .-float_to_dec25
	.globl	mantissa_multiply
	.type	mantissa_multiply, @function
mantissa_multiply:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$48, %edi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -40(%rbp)
	movl	$23, -36(%rbp)
	movl	$48, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L98
.L99:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	addl	$1, -32(%rbp)
.L98:
	cmpl	$47, -32(%rbp)
	jle	.L99
	jmp	.L100
.L105:
	movl	$0, -32(%rbp)
	jmp	.L101
.L102:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
	addl	$1, -32(%rbp)
.L101:
	cmpl	$47, -32(%rbp)
	jle	.L102
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -20(%rbp)
	movl	$23, -28(%rbp)
	movl	$47, %eax
	subl	-40(%rbp), %eax
	movl	%eax, -24(%rbp)
	jmp	.L103
.L104:
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, %ecx
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	imull	%edx, %eax
	leal	48(%rax), %ecx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	%ecx, %edx
	movb	%dl, (%rax)
	subl	$1, -28(%rbp)
	subl	$1, -24(%rbp)
.L103:
	cmpl	$0, -28(%rbp)
	jns	.L104
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$48, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	int_add
	movq	%rax, -16(%rbp)
	addl	$1, -40(%rbp)
	subl	$1, -36(%rbp)
.L100:
	cmpl	$0, -36(%rbp)
	jns	.L105
	movq	-16(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	mantissa_multiply, .-mantissa_multiply
	.globl	int_bintodec
	.type	int_bintodec, @function
int_bintodec:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	%edx, -64(%rbp)
	cmpl	$0, -60(%rbp)
	jne	.L108
	movl	$0, -36(%rbp)
	fldz
	fstpt	-32(%rbp)
	movl	-64(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.L109
.L110:
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cvtsi2sdl	%eax, %xmm2
	movsd	%xmm2, -72(%rbp)
	cvtsi2sdl	-36(%rbp), %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	mulsd	-72(%rbp), %xmm0
	movsd	%xmm0, -72(%rbp)
	fldl	-72(%rbp)
	fldt	-32(%rbp)
	faddp	%st, %st(1)
	fstpt	-32(%rbp)
	addl	$1, -36(%rbp)
	subl	$1, -40(%rbp)
.L109:
	cmpl	$0, -40(%rbp)
	jg	.L110
.L108:
	cmpl	$1, -60(%rbp)
	jne	.L111
	fldz
	fstpt	-32(%rbp)
	movl	-64(%rbp), %eax
	subl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	movsd	%xmm0, -72(%rbp)
	fldl	-72(%rbp)
	fstpt	-16(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L112
.L115:
	cmpl	$0, -40(%rbp)
	jne	.L113
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	je	.L113
	fldt	-16(%rbp)
	fchs
	fstpt	-32(%rbp)
	jmp	.L114
.L113:
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -72(%rbp)
	fildl	-72(%rbp)
	fldt	-16(%rbp)
	fmulp	%st, %st(1)
	fldt	-32(%rbp)
	faddp	%st, %st(1)
	fstpt	-32(%rbp)
.L114:
	fldt	-16(%rbp)
	fldt	.LC47(%rip)
	fdivrp	%st, %st(1)
	fstpt	-16(%rbp)
	addl	$1, -40(%rbp)
.L112:
	movl	-40(%rbp), %eax
	cmpl	-64(%rbp), %eax
	jl	.L115
.L111:
	fldt	-32(%rbp)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	int_bintodec, .-int_bintodec
	.globl	substring
	.type	substring, @function
substring:
.LFB15:
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
	movl	%edx, -32(%rbp)
	movl	-32(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L118
.L119:
	movl	-28(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rcx
	movq	-8(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
.L118:
	movl	-12(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L119
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	substring, .-substring
	.globl	simple_to_int
	.type	simple_to_int, @function
simple_to_int:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.L122
.L125:
	cvtsi2sdl	-8(%rbp), %xmm2
	movsd	%xmm2, -32(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	cvtsi2sdl	%eax, %xmm3
	movsd	%xmm3, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	subq	%rdx, %rax
	subq	$1, %rax
	testq	%rax, %rax
	js	.L123
	cvtsi2sdq	%rax, %xmm0
	jmp	.L124
.L123:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L124:
	movq	.LC45(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	mulsd	-40(%rbp), %xmm0
	addsd	-32(%rbp), %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -8(%rbp)
	subl	$1, -4(%rbp)
.L122:
	cmpl	$0, -4(%rbp)
	jns	.L125
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	simple_to_int, .-simple_to_int
	.section	.rodata
	.align 4
.LC16:
	.long	2143289344
	.align 8
.LC45:
	.long	0
	.long	1073741824
	.align 8
.LC46:
	.long	0
	.long	1072693248
	.align 16
.LC47:
	.long	0
	.long	2147483648
	.long	16384
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
