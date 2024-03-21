# Khalid Diriye
# IT 320 Programming Assignment 1
# I certify that this program is entirely my own creation
# I have not shared this code with any other person.
	 	
	 	.data	 	
buffer: 	.space 80  	
p1: 		.asciiz "Enter a string: "
p2: 		.asciiz "Your string contains: "
p3: 		.asciiz " characters."
p4:		.asciiz "\nThere are "
p5: 		.asciiz " upper case characters."
p6: 		.asciiz " lower case characters."
p7: 		.asciiz " hexdigits."
p8: 		.asciiz " spaces."
p9: 		.asciiz " other characters."

	.text
main:
	li $v0, 4			# system call code for print_str
	la $a0, p1			# address of string to print
	syscall				# print the first prompt
	
	li $v0, 8			# code for syscall read_string
	la $a0, buffer			# tell syscall where the buffer is
	li $a1, 80			# tell syscall how big the buffer is
	syscall				
	
	li $s1, 0			# place integer 0 to $s1
	li $s2, 0			# place integer 0 to $s2
	li $s3, 0			# place integer 0 to $s3
	li $s4, 0			# place integer 0 to $s4
	li $s5, 0			# place integer 0 to $s5
	li $s6, 0			# place integer 0 to $s6	
	
	la $t0, buffer			# place address of buffer in $t0	
myloop:	lb $t1, 0($t0)			# read byte located at address in $t0
	beq $t1, 10, charCount		# if $t1 is equal to 10 go to label
	addi $s1, $s1, 1 		# increment address in $s1
	addi $t0, $t0, 1		# increment address in $t0
	checkSpaces:
		beq $t1, 32, space	# ascii value to find space in string
	checkSpecialChar:
		bge $t1,123,special     # ascii value to find special characters
	checkLowerCase:			# lower case alphabets for checking the string
		beq $t1,'a',lower	
		beq $t1,'b',lower 
		beq $t1,'c',lower 
		beq $t1,'d',lower 
		beq $t1,'e',lower 
		beq $t1,'f',lower 
		beq $t1,'g',lower
		beq $t1,'h',lower 
		beq $t1,'i',lower 
		beq $t1,'j',lower 
		beq $t1,'k',lower 
		beq $t1,'l',lower 
		beq $t1,'m',lower 
		beq $t1,'n',lower 
		beq $t1,'o',lower 
		beq $t1,'p',lower 
		beq $t1,'q',lower 
		beq $t1,'r',lower 
		beq $t1,'s',lower 
		beq $t1,'t',lower 
		beq $t1,'u',lower 
		beq $t1,'v',lower 
		beq $t1,'w',lower 
		beq $t1,'x',lower 
		beq $t1,'y',lower 
		beq $t1,'z',lower
	checkSpecialChar1:		# ascii values for special characters greater or equal ascii value 91
		bge $t1, 91, special	
	checkUpperCase:			# uppercase alphabets for checking and counting at $t1
		beq $t1,'A',upper
		beq $t1,'B',upper 
		beq $t1,'C',upper 
		beq $t1,'D',upper 
		beq $t1,'E',upper 
		beq $t1,'F',upper 
		beq $t1,'G',upper
		beq $t1,'H',upper 
		beq $t1,'I',upper 
		beq $t1,'J',upper 
		beq $t1,'K',upper 
		beq $t1,'L',upper 
		beq $t1,'M',upper 
		beq $t1,'N',upper 
		beq $t1,'O',upper 
		beq $t1,'P',upper 
		beq $t1,'Q',upper 
		beq $t1,'R',upper 
		beq $t1,'S',upper 
		beq $t1,'T',upper 
		beq $t1,'U',upper 
		beq $t1,'V',upper 
		beq $t1,'W',upper 
		beq $t1,'X',upper 
		beq $t1,'Y',upper 
		beq $t1,'Z',upper
	checkSpecialChar2:		# ascii values for finding special character
		bge $t1, 58, special
	checkHexDigits: 		# checking the hexdigits at $t1 (error here cannot re-check uppercase and lowercase A-F)
		beq $t1,'1',hexdigit
		beq $t1,'2',hexdigit
		beq $t1,'3',hexdigit
		beq $t1,'4',hexdigit
		beq $t1,'5',hexdigit
		beq $t1,'6',hexdigit
		beq $t1,'7',hexdigit
		beq $t1,'8',hexdigit
		beq $t1,'9',hexdigit
		beq $t1,'0',hexdigit
		beq $t1,'a',hexdigit	
		beq $t1,'b',hexdigit 
		beq $t1,'c',hexdigit 
		beq $t1,'d',hexdigit 
		beq $t1,'e',hexdigit 
		beq $t1,'f',hexdigit 
		beq $t1,'A',hexdigit
		beq $t1,'B',hexdigit 
		beq $t1,'C',hexdigit 
		beq $t1,'D',hexdigit 
		beq $t1,'E',hexdigit 
		beq $t1,'F',hexdigit 
	checkSpecialChar3:		# ascii value for finding special characters
		bge $t1, 33, special
upper: 				
	addi $s2, $s2, 1		# increment address in $s2
	j myloop			# jump to myloop
	j checkUpperCase		# jump to checkUpperCase
lower:
	addi $s3, $s3, 1		# increment address in $s3
	j myloop			# jump to myloop
	j checkLowerCase		# jump to checkLowerCase
hexdigit:
	addi $s4, $s4, 1		# increment address in $s4
	j myloop			# jump to myloop
	j checkHexDigits		# jump to checkHexDigits			
space:
	addi $s5, $s5, 1		# increment address in $s5
	j myloop			# jump to myloop.
	j checkSpaces			# jump to checkSpaces
special:
	addi $s6, $s6, 1		# increment address in $s6
	j myloop			# jump to myloop
	j checkSpecialChar1		# jump to checkSpecialChar1
	j checkSpecialChar2		# jump to checkSpecialChar2
	j checkSpecialChar3		# jump to checkSpecialChar3
charCount:
	li $v0, 4			# system call code for print_int
	la $a0, p2			# address of string to print
	syscall				# print the prompt
	
	li $v0, 1			# system call code for print_int
	move $a0, $s1			# integer to print
	syscall				# print it
	
	li $v0, 4			# system call code for print_str
	la $a0, p3			# address of string to print
	syscall				# print the prompt
	
	j upperCase			# jump to upperCase
upperCase:
	li $v0, 4			# system call code for print_str
	la $a0, p4			# address of string to print
	syscall				# print the prompt
	
	li $v0, 1			# system call code for print_int
	move $a0, $s2			# integer to print
	syscall				# print it
	
	li $v0, 4			# system call code for print_str
	la $a0, p5			# address of string to print
	syscall				# print the prompt
	
	j lowerCase			# jump to lowerCase
lowerCase:
	li $v0, 4			# system call code for print_str
	la $a0, p4			# address of string to print
	syscall				# print the prompt
	
	li $v0, 1			# system call code for print_int
	move $a0, $s3			# integer to print
	syscall				# print it
	
	li $v0, 4			# system call code for print_str
	la $a0, p6			# address of string to print
	syscall				# print the prompt
	
	j hexdigits			# jump to hexdigits
hexdigits:
	li $v0, 4			# system call code for print_str
	la $a0, p4			# address of string to print
	syscall				# print the prompt
	
	li $v0, 1			# system call code for print_int
	move $a0, $s4			# integer to print
	syscall				# print it
	
	li $v0, 4			# system call code for print_str
	la $a0, p7			# address of string to print
	syscall				# print the prompt
	
	j spaces			# jump to spaces
spaces:
	li $v0, 4			# system call code for print_str
	la $a0, p4			# address of string to print
	syscall				# print the prompt
	
	li $v0, 1			# system call code for print_int
	move $a0, $s5			# integer to print
	syscall				# print the prompt
	
	li $v0, 4			# system call code for print_str
	la $a0, p8			# address of string to print
	syscall				# print the prompt
	
	j specialCase			# jump to upperCase
specialCase:
	li $v0, 4			# system call code for print_str
	la $a0, p4			# address of string to print
	syscall				# print the prompt
	
	li $v0, 1			# system call code for print_int
	move $a0, $s6			# integer to print
	syscall				# print the prompt
	
	li $v0, 4			# system call code for print_str
	la $a0, p9			# address of string to print
	syscall				# print the prompt
	
	j done				# jump to done
done:					
	li $v0, 10			# exit the program
	syscall				

	
