.text

helloWorldStr:	.asciz "Hello world\n"

.global main

main:
	# prologue
	movq	%rsp, %rbp

	movq	$helloWorldStr, %rdi
	movq	$0, %rax
	call	printf

	

	movq	$0, %rdi
	call	exit
	
