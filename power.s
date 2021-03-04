.text

askBaseStr: 	.asciz "Typ your non-negative base: "
askExpStr:	.asciz "Typ your exponent: "
number:		.asciz "%ld"
welcomeStr:	.asciz "Hello and welcome to Assignment 1\nMy name: Jesse van Papenrecht\nMy netid: jvanpapenrecht\n"
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

	# print askBaseStr msg
	movq 	$askBaseStr, %rdi
	movq	$0, %rax
	call 	printf		

	# ask for base
	subq	$8, %rsp
	leaq	-8(%rbp), %rsi
	movq 	$number, %rdi
	movq 	$0, %rax
	call	scanf	

	# store base in rbx
	popq 	%rbx

	# print askExpStr
	movq	$askExpStr, %rdi
	movq	$0, %rax
	call 	printf

	# ask for exponent
	subq	$8, %rsp
	leaq	-8(%rbp), %rsi
	movq	$number, %rdi
	movq	$0, %rax
	call 	scanf

	# parameters for power
	movq	%rbx, %rdi	# base
	popq	%rsi		# exp

	call	power		# call subroutine

	movq 	$0, %rdi	# exit the program
	call	exit

power:
	# prologue
	pushq	%rbp
	movq	%rsp, %rbp

	movq	%rdi, %rax	# move base to rax
check:				# checks whether the loop is ready
	cmpq	$1, %rsi	# if counter is equal to exponent	
	jle	print		# if loop is done, print answer. if not, goes to subroutine pow

	mulq	%rdi		# answer = base * answer --> %rax * %rdi
	decq 	%rsi		# increment counter value
	jmp	check		# go to check

print:				# printing the answer
	movq	%rax, %rbx	# store the answer in rbx	

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
	
	# epilogue
	movq	%rbp, %rsp
	popq	%rbp
	ret
