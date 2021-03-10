.text

askNStr: 	.asciz "Typ your value of n: "
number:		.asciz "%ld"
welcomeStr:	.asciz "Hello and welcome to Assignment 2\nMy name: Jesse van Papenrecht\nMy netid: jvanpapenrecht\n"
printAnsStr:	.asciz "Answer is: "
breakStr:	.asciz "\n"

.global main


main:
	# prologue
	movq	%rsp, %rbp

	# print welcome msg
	movq	$welcomeStr, %rdi
	movq	$0, %rax
	call	printf

	# print askNStr msg
	movq 	$askNStr, %rdi
	movq	$0, %rax
	call 	printf

	# ask for n
	subq	$8, %rsp
	leaq	-8(%rbp), %rsi
	movq 	$number, %rdi
	movq 	$0, %rax
	call	scanf

	# give rdi and rsi as parameter for factorial
	popq	%rdi		# pop n in to rsi

	call	factorial	# call factorial subroutine

	

	movq	%rax, %rbx	

	# print "Answer is: " string
	movq	$printAnsStr, %rdi
	movq	$0, %rax
	call	printf

	# print answer
	movq	%rbx, %rsi
	movq	$number, %rdi
	movq	$0, %rax
	call	printf

	# print break \n
	movq	$breakStr, %rdi
	movq	$0, %rax
	call	printf

	movq 	$0, %rdi	# exit the program
	call	exit


factorial:			# subroutine for multiplication
	# prologue subroutine
	pushq 	%rbp
	movq	%rsp, %rbp
	
	cmpq	$1, %rdi
	jle	done
	
	pushq	%rdi		# push to stack
	decq	%rdi		# decrement rdi by 1
	call	factorial	# call factorial subroutine	

	popq	%rdi		
	mulq	%rdi

	# epilogue subroutine
	movq	%rbp, %rsp	
	popq	%rbp
	ret			# return

done:
	movq	$1, %rax
	# epilogue subroutine
	movq	%rbp, %rsp	
	popq	%rbp
	ret			# return


