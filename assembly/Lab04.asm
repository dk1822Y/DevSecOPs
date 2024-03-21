# Khalid Diriye
# IT 320 Lab 4

# ack(1,2)
# What is the value for a? 1
# What is the value for b? 2
# ack function returned 4
# Called times = 6

# ack(2,5)
# What is the value for a? 2
# What is the value for b? 5
# ack function returned 13
# Called times = 90

# ack(2,6)
# What is the value for a? 2
# What is the value for b? 6
# ack function returned 15
# Called times = 119

# ack(3,5)
# What is the value for a? 3
# What is the value for b? 5
# ack function returned 253
# Called times = 42438

	.data
prompt1:
	.asciiz "What is the value for a? "
prompt2:
	.asciiz "What is the value for b? "
result:
	.asciiz "ack function returned "
times:
	.asciiz "\nCalled times = "
	
	.text
main:
	# Build stack frame
	subu 	$sp, $sp, 32	# Stack frame is 32 bytes long
	sw 	$ra,20($sp)	# Save return address
	sw	$fp,16($sp)	# Save old frame pointer
	addiu	$fp,$sp,28	# Set up frame pointer
	
	li	$v0, 4		# system call code for print_str
	la	$a0, prompt1	# address of string to print
	syscall			# and store it
	
	li	$v0, 5		# system call code for print_int
	syscall			# read a
	move	$t0, $v0	# and store it
	
	li	$v0, 4		# system call code for print_str
	la	$a0, prompt2	# address of string to print
	syscall			# print the prompt
	
	li	$v0, 5		# system call code for read_int
	syscall			# read b
	move	$a1, $v0	# and store it
	move	$a0, $t0	# args are now ready for call
	
	move	$t9, $zero	# Clear the count. $t9 used as global var.
	jal	ack		# Call the ack function
	
	move	$s0, $v0	# Take the integer returned from ack
				# and save it in $a0
				
	la	$a0, result	# address of string to print
	li	$v0, 4		# system call for print_str 
	syscall			# Print the answer's string constant
	
	move	$a0, $s0	# prepare to print the integer answer
	li	$v0, 1		# system call code for print_int
	syscall			# print the integer answer
	
	la	$a0, times	# address of string to print
	li	$v0, 4		# system call code for print_str
	syscall			# Print the answer's string constant
	
	move	$a0, $t9	# prepare to print the integer answer
	li	$v0, 1		# system call code for print_int
	syscall			# print the integer answer
	
	# tear down stack frame
	lw	$ra,20($sp)	# Restore return address
	lw	$fp,16($sp)	# Restore frame pointer
	addiu	$sp,$sp,32	# Pop stack frame
	li	$v0, 10		# Exit program
	syscall

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
#
# Python version of ack (use as pseudocode) :
#
# def ack(a,b): # Note: a and b are always zero or positive
#	if a==0: return b+1
#	if b==0: return ack(a-1,1)
#	return ack(a-1,ack(a,b-1) # notice nested recursion

ack:	
	addu	$t9, $t9, 1	# Increment the count (a global variable)
	
	# Build the stack frame
	subu	$sp,$sp,12	# Stack frame is 12 bytes long
	sw	$ra,0($sp)	# Save return address
	sw	$a0,4($sp)	# Save argument (a) 
	sw	$a1,8($sp)	# Save argument (b)
	
	beq	$a0, $zero, base # base case, no recursion
	
	bgtz	$a1, last	# Branch if b > 0
	subu	$a0, $a0, 1	# a=a-1
	li	$a1, 1		# b=1
	jal	ack		# ack(a-1,1)
	j	done
	
last:
	subu 	$a1, $a1, 1	# b-1
	jal 	ack		# ack(a,b-1)
	move	$a1, $v0	# b=ack(a,b-1)
	lw	$a0, 4($sp)	# a -- must be restored after recurision on prev line
	subu 	$a0, $a0, 1	# a=a-1
	jal	ack		# do the outer recursion
	j	done
	
base:
	addu	$v0, $a1, 1	

	# Tear down the stack frame and return

done:				# Result is in $v0
	lw	$ra,0($sp)	# Restore $ra
	lw	$a0,4($sp)	# Restore (a)
	lw	$a1,8($sp)	# Restore (b)
	addiu	$sp,$sp,12	# Pop stack
	jr	$ra		# Return to caller
	
	
		
			
			