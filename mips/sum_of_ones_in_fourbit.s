# Name: Jamecia Moore
# Date: 09/18/2020
# Assignment: MIPS01
.set noreorder

.global _start
_start:
	# Initalize variables
	li $s3, 1
	li $t7, 1
	
	jal main # Stores the location into memory for we can return back here
	
	# Ending 
	END:
		b END
main:

# Informs the user to enter a 4 bit number
 	li $v0, 4
 	la $a0, prompt
	syscall	

# Inputs the number entered into a register
	li $v0, 5	
	syscall			# Read integer
	move $t0, $v0	# Save the value in $t0

		# Determining how many times the program runs
			li $t4, 5
			li $s1, 0x4a # = 74 which is 0111 
			bgt $t0, $s1, BEGIN
			li $t4, 7
		
		# Determining how many 1s
			BEGIN: 
			 addi $t3, $t3, 1
			 andi $t2, $t0, 1
			 beq $t2, $t7, CHECK
			 srl $t0, $t0, 1
			 bne $t3, $t4, BEGIN
			 j ENDING
		# If there is a 1 it is counted for below	 
			CHECK:
			addi $t5, $t5, 1
			srl $t0, $t0, 1
			beq $t3, $t4, ENDING
			j BEGIN

ENDING:
# Informs the user how many 1s are in the 4 bits prompt
 	li $v0, 4
 	la $a0, ending_prompt
	syscall	
# Displays the number of 1s present in the 4 bits
	li $v0, 1
	move $a0, $t5
	syscall	
# Create a new line
	li $v0, 11
	li $a0, '\n'
	syscall			
# Reset so the program can run again
	li $t5, 0
	li $t3, 0
	li $t4, 0
	li $t8, 0
	li $t2, 0 
 	jr $ra
.data
prompt: .asciz "Enter a 4 bit number: "
ending_prompt: .asciz  "Number of 1s: "