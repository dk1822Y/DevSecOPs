# Khalid Diriye
# IT320-lab 3
# I certify thatthis program is entirely my own creation.
# I have not shared this code with any other person.


# Python code for calculating factorial.

# number = int(input("Which Factorial number do you want? "))
# factorial = 1
# if number < 0:
#   print("The number is negative. Please enter positive integer")
# elif number == 0:
#   print("The Factorial # is 1")
# elif number < 0:
#    print("The number is negative. please provide positive number")
# else:
#   for i in range(1,number + 1):
#       factorial = factorial*i
#   print("Factorial # is",factorial)

		.data

prompt: 	.word 	p1
result1:	.word	p2
result2:	.word   p3

p1: 	.asciiz "Which Factorial number do you want? "
p2: 	.asciiz "Factorial # of ("
p3: 	.asciiz ") is "


		.text
main:
	li      $v0, 4               # system call code for print_str
  	la      $t0, prompt          # load address from prompt into $t0
 	lw      $a0, 0($t0)          # load word from $t0 into $a0
 	syscall                      
  
 	li      $v0, 5            # system call code for read_int
  	syscall                   # read the intege  
         
  	move    $t0, $v0          # move address from $vo to $to
  	move    $a0, $t0   	  # move address from $t0 to $a0
  	       
  	addi    $sp, $sp, -12      # factorial stack frame is 12 bytes long
  	   
  	sw      $t0, 0($sp)        # store word from $sp into $t0 register
  	sw      $ra, 8($sp)        # store word from $sp that is 8 byte long into $ra register 
  	       
  	jal     factorial          # jump and link factorial
  	       
  	lw      $s0, 4($sp)        # load word from $sp into $s0
 	la      $t1, result1       # load address from result1 into $t1 register
  	lw      $a0, 0($t1)        # load word from $t1 register into $a0
  	li      $v0, 4             # system call code for print_str
  	syscall                   

  	lw     $a0, 0($sp)        # load original value into $a0
  	li     $v0, 1             # system call for print_int
  	syscall                   # print original value to screen

  	la      $t2, result2      # load result2 address into $t1
  	lw      $a0, 0($t2)       # load $t2 value into $a0
  	li      $v0, 4            # system call for print_string
  	syscall                   # print value  to screen

  	move    $a0, $s0          # move final return value from $s0 to $a0 for return
  	li      $v0, 1            # system call for print_int
  	syscall                   # print final return value to screen

  	addi    $sp, $sp, 12      # move stack pointer back down where we started

  	# return 0;
  	li      $v0, 10           # exit program
  	syscall                   # 

factorial:
  	lw      $t0, 0($sp)       # load word from $sp into $t0 register
  	beq     $t0, 0, returnOne # if $t0 equals 0 then go to returnOne
  	addi    $t0, $t0, -1      # increment $t0 by 1


  	addi    $sp, $sp, -12    # Add immediate $sp by 12 bit
  	sw      $t0, 0($sp)      # store word from $sp into $t0
  	sw      $ra, 8($sp)      # store word from $sp into $ra
  	jal     factorial        # jump and lik factorial


  	lw      $ra, 8($sp)      # load word 8bit $sp into $ra 
  	lw      $t1, 4($sp)      # load word 4bit $sp into $t1

  	lw      $t2, 12($sp)     # load word 12bit $sp into $t2
  	mul     $t3, $t1, $t2    # multply $t2 with $t1 and add to $t3 
  	sw      $t3, 16($sp)     # store 16 bit word from sp to $t3.

  	addi    $sp, $sp, 12     # tear down stack frame.

  	jr     $ra               # jump to $ra.

returnOne:			 # return one
  	li      $t0, 1           # load 1 into $t0 
  	sw      $t0, 4($sp)      # store word from $sp into $t0
  	jr      $ra              # jump to $ra  
