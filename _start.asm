.text
	.globl _start

_start:
	xor %rbp,%rbp
	pop %rdi
	mov %rsp,%rsi
	and $-0xF,%rsp
	add $8,%rsi
	mov (%rsi),%r8
	mov $0,%r9
	cmp %r8,%r9
	je _exit

_putstr:
	mov $0,%r9b
	movb (%r8),%dil
	cmp %r9b,%dil
	je _nl
	call ft_putchar
	mov $-1,%r9
	cmp %r9,%rax
	je _exit
	add $1,%r8
	jmp _putstr

_nl:
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
