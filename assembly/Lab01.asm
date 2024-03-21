# Example
	.data
# Note space at end of each string! Spacing on-screen is better this way.
p1:
	.asciiz "What is the first integer? "
p2:
	.asciiz "What is the second integer? "
ans1:
	.asciiz "\nThe sum of your numbers is "
ans2:
	.asciiz "\nThe difference of your numbers is "
	
	.text 
	
	li $v0, 4	# system call code for print_str
	la $a0, p1	# address of string to print
	syscall		# print the first prompt
	
	li $v0, 5 	# system call code for read_int
	syscall		# read the first integer
	move  $t1, $v0	# and store it 'till later
	
	li $v0, 4 	# system call code for print_str
	la $a0, p2	# address of string tp print
	syscall		# print the second prompt
	
	li $v0, 5	# system call code for read_int
	syscall		# read the second integer
	move   $t2, $v0	# and store it 'till later
	
	add $t0, $t1, $t2 # add the two integers
	sub $t3, $t1, $t2 # subtract the two integers
	
	li $v0, 4	# system call code for print_str
	la $a0, ans1	# address of string to print
	syscall		# print the answers identifying string
	
	li $v0, 1	# system call code for print_int
	move $a0, $t0	# integer to print (sum)
	syscall		# print it
	
	li $v0, 4	# system call code for print_str
	la $a0, ans2	# address of string to print
	syscall		# print the answer identifying string
	
	li $v0, 1	# system call code for print_int
	move $a0, $t3	# integer to print (difference)
	syscall		# print it
	
	li $v0, 10	#return the system
	syscall 
	
	
	
	