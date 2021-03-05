.text

helloWorldStr:	.asciz "Jay Doerga and Zefan Morsen\n2696009 2691045 \nAssignment 2\n"
formatStr: 	.asciz "%d"
formatResult:	.asciz "Result: %d\n"
.global main

main:
	# prologue
	movq	%rsp, %rbp
	
	#Move the string to rdi as first parameter
	movq	$helloWorldStr, %rdi
	#We dont use vector registers so rax has to be 0
	movq	$0, %rax
	#Print the value
	call 	printf
	#Go to the subroutine inout
	call	inout

	#epilogue (clean rdi parameter)
	movq 	$0, %rdi
	call	exit


inout:
	#prologue
	pushq	%rbp
	movq	%rsp, %rbp
	#reserving space
	subq	$8, %rsp
	leaq	-8(%rbp), %rsi
	#move formatStr to first parameter to specify data type
	movq 	$formatStr, %rdi
	movq	$0, %rax
	call 	scanf
	
	#move the formatResult to rdi
	movq	$formatResult, %rdi
	#scanf pushed the input onto the top of the stack. Here we are popping it into rsi as second parameter
	popq 	%rsi
	#adding 1 to given value
	addq	$1, %rsi
	movq 	$0, %rax
	call 	printf
	
	#epilogue
	movq	%rbp, %rsp
	popq 	%rbp
	ret

