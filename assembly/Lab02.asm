# Khalid Diriye
# IT 320 Lab 2

	.data
a1:
	.asciiz "What is integer \"a? "
b1:
	.asciiz "What is integer \"b? "
ans1:
	.asciiz "\nc is "
ans2:
	.asciiz "\nd is "
ans3:
	.asciiz "\ne is "
	
	.text 
	
	main:
	li $v0, 4	# system call code for print_str
	la $a0, a1	# address of string to print
	syscall		# print the first prompt
	
	li $v0, 5 	# system call code for read_int
	syscall		# read the first integer
	move $t1, $v0	# and store it 'till later
	
	li $v0, 4 	# system call code for print_str
	la $a0, b1	# address of string to print
	syscall		# print the second prompt
	
	li $v0, 5	# system call code for read_int
	syscall		# read the second integer
	move $t2, $v0	# and store it 'till later
	
	#C
	mul $t0, $t1, 13	# multiple integer two integers
	sub $t0, $t0, $t2	# subtract two integers
	j D			# jump to D		

D:	
	#D
	bgez $t1, greater_or_zero	# if integer a is greater than or equal to zero go to label 
	add $t3, $t2, -91		# add two integers
	j E				# jump to E
greater_or_zero:
	mul $t3, $t2, 6		# multiple two integers
	sub $t3,$t1, $t3 	# subtract two integers	
	add $t3, $t3, 110	# add two integers 		
	j E			# jump to E
E:
	#E
	bne $t1, $t2, notequal	# if integer a is not equal to integer b go to label
	sub $t5, $t1, 3		# subtract two integers	
	add $t6, $t2, 2		# add two integers
	mul $t7, $t5, $t6	# multiple two integers
	j end			# jump to end
notequal:
	la $t7, ($t1)		# store address of integer a into integer
	j end			# jump to end

end:
	li $v0, 4		# system call code for print_str
	la $a0, ans1		# address of string to print
	syscall			# print the answers identifying string
	
	li $v0, 1		# system call code for print_int
	move $a0, $t0		# integer to print 
	syscall
	
	li $v0, 4		# system call code for print_str
	la $a0, ans2		# address of string to print
	syscall			# print the answers identifying string
	
	li $v0, 1		# system call code for print_int
	move $a0, $t3		# integer to print
	syscall			# print it
	
	li $v0, 4		# system call code for print_str
	la $a0, ans3		# address of string to print
	syscall			# print the answers identifying string
	
	li $v0, 1		# system call code for print_int
	move $a0, $t7		# integer to print 
	syscall			# print it
	
	li $v0, 10		# return the system
	syscall