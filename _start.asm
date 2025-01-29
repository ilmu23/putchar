.text
	.globl _start

_start:
	xor %rbp,%rbp
	pop %rdi
	mov %rsp,%rsi
	and $-0xF,%rsp
	mov	$0,%r10
	push %rsi

_next_arg:
	pop %r11
	add $8,%r11
	mov (%r11),%r8
	mov $0,%r9
	cmp %r8,%r9
	je _nl
	add $1,%r10
	push %r11
	mov $1,%r9
	cmp %r10,%r9
	je _putstr
	movb $32,%dil
	call ft_putchar

_putstr:
	mov $0,%r9b
	movb (%r8),%dil
	cmp %r9b,%dil
	je _next_arg
	call ft_putchar
	mov $-1,%r9
	cmp %r9,%rax
	je _exit
	add $1,%r8
	jmp _putstr

_nl:
	mov $0,%r9
	cmp %r9,%r10
	je _exit
	movb $10,%dil
	call ft_putchar

_exit:
	mov $0,%rdi
	cmp $-1,%rax
	jne __exit
	mov $1,%rdi
__exit:
	mov $60,%rax
	syscall

	ret
