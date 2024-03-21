# Khalid Diriye
# IT 320 Lab 3

# Python code for the iterative Factorial algorithm:
# n = int(input("Which Factorial number do you want? "))
# user_input = n
# fact = 1
# while n >= 1:
    # fact = fact * n
    # n = n - 1
# print("Factorial #", user_input ,"is", fact)


	.data
p1: 		.asciiz "Which Factorial number do you want? "
p2: 		.asciiz "Factorial # "
p3:		.asciiz " is "
n1:		.asciiz "\n\n"

	.text 
	
main:
	li $v0, 4		# system call code for print_str
	la $a0, p1		# address of string to print
	syscall			# print the first prompt
	
	li $v0, 5 		# system call code for read_int
	syscall			# read the first integer
	move $t0, $v0		# and store "n"
	
	move $t2, $t0		# initalize "user_input"	
	li $t1, 1		# initialize "fact"		
loop:
	ble $t0, 1, done	# while n >= 1 branch to done
	mul $t1, $t1, $t0	# fact = fact * n
	sub $t0, $t0, 1		# n = n - 1
	b loop			# branch unconditionally to loop
done:
	sw $t1, 24($sp)
	li $v0, 4		# system call code for print_str
	la $a0, p2		# address of string to print
	syscall			# print the answer part 1
	
	li $v0, 1		# system call code for print_int
	move $a0, $t2		# integer to print (user_input)
	syscall			# print it
	
	li $v0, 4		# system call code for print_str
	la $a0, p3		# address of string to print
	syscall			# print "is"
	
	li $v0, 1		# system call code for print_int
	lw $a0, 24($sp)		# integer to print (fact)
	syscall			# print it
	
	li $v0, 4		# system call code for print_str
	la $a0, n1		# address of string to print
	syscall			# print some new lines
	
	li $v0, 10		# exit program
	syscall 
	