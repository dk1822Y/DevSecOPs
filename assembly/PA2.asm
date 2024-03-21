# Khalid Diriye
# IT 320 PA 2
# I cerifty that this program is entirely my own creation.
# I have no shared this code with any other person.

	.data
prompt1:
	.asciiz "What is the value for n? "
prompt2:
	.asciiz "The ouput of this program is:\n"
ans:
	.asciiz ""
count:
	.asciiz " "
	
	.text 
main:
	# Build stack frame
	subu 	$sp, $sp,32	# Stack frame is 32 bytes long
	sw 	$ra,20($sp)	# Save return address
	sw	$fp,16($sp)	# Save old frame pointer
	addiu	$fp,$sp,28	# Set up frame pointer
	
	li	$v0, 4		# system call code for print_str
	la	$a0, prompt1	# address of string to print
	syscall			# and store it
	
	li	$v0, 5		# system call code for print_int
	syscall			# read n
	move	$t0, $v0	# and store it
	
	move	$a0, $t0	# args are now ready for call
	
	move	$t9, $zero	# Clear the count. $t9 used as global var.
	jal	mcc91		# Call the mcc91 function
	
	move	$s0, $v0	# Take the integer returned from mcc91
				# and save it in $a0
	
	li $v0, 4		# system call for print_str
	la $a0, prompt2		# address of string to print
	syscall			# print prompt
						
	la $a0, ans		# address of string to print
	li $v0, 4		# system call for print_str
	syscall			# Print the answer's string constant
	
	move $a0, $s0		# prepare to print the integer answer
	li $v0, 1		# system call code for print_int
	syscall			# print the integer answer
		
	la $a0, count		# address of string to print
	li $v0, 4		# system call code for print_str
	syscall			# print the integer answer
	
	move $a0, $t9		# prepare to print the integer answer
	li $v0, 1		# system call code for print_int
	syscall			# Print the answer's string constant
	
	# tear down stack frame
	lw	$ra,20($sp)	# Restore return address
	lw	$fp,16($sp)	# Restore frame pointer
	addiu	$sp,$sp,32	# Pop stack frame
	li	$v0, 10		# Exit program
	syscall

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#
# Python implementation of the McCarthy 91 function
# def mcc91(n) :
#	global count
#	count += 1
#	if n > 100:
#		return n - 10
#	else:
#		return mcc91(mcc91(n + 11))

mcc91:
	addi $t9, $t9, 1	# Increment the count (a global variable)
	
	# Build the stack frame
	subu	$sp,$sp,12	# Stack frame is 12 bytes long
	sw	$ra,0($sp)	# Save return address
	sw	$a0,4($sp)	# Save argument (n) 
	
	bgt $a0, 100, base 	# if n > 100 go to label 
	
	addi $a0, $a0, 11	# add 11 to n
	jal mcc91		# mcc91(n+11)
	
	move $a0, $v0		# store result
	jal mcc91		# mcc91(mcc91(n+11))
			
	j done			# jump to done
base:
	subu $v0, $a0, 10	# return n - 10
done:				# Result is in $v0
	lw	$ra,0($sp)	# Restore $ra
	lw	$a0,4($sp)	# Restore (n)
	addiu	$sp,$sp,12	# Pop stack
	jr	$ra		# Return to caller

