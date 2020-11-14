/**
** Name: Jamecia M. Moore
** Date: 11/08/2020
** Assignment: MIPS03
** Class: CSCI 210
*** Objective: I tackled the problem by thinking of the $sp as an array, 
***** I would be creating a smaller like "array" which seperates the 
****** [sorted // non-sorted]. 
**/
.text
.set noreorder

.global _start
_start:

Initialization:
		la $t2, A # Contains the address of the array A
		li $t1, 0 # Making sure this set to 0, so it can be incremented
		li $s0, 10 # Total number of elements in the array
		la $sp, 0x80000050 # Sets $sp to a certain address
		addiu $sp, $sp, 44 # (n * 4) + 4 , Allocates space
		
			# This prints the string that contains 
	li $v0, 4	
	li $a0, STR_P1
	syscall	
		/*
		** This prints the contents in A ( Unsorted ) & Adds them to the SP
		*/
		print_unsorted:
		li $v0, 1
		lw $a0, 0($t2)
		syscall
	# Loads the input into the stack pointer
		sw $a0, 0($sp)
	# prints a space in between numbers
		li $a0, 32
		li $v0, 11  
		syscall
	# This moves the pointer and increments the counter
		addi $sp,$sp, -4 # Deallocating space
		addi $t2, $t2, 4
		addi $t1, $t1, 1
	bne $t1, $s0, print_unsorted # When they equal then it has reached the n elements
	
	# Resets variables
		move $t1, $zero
		addiu $sp, $sp, 40 # (n * 4)
		li $a3, 0
	jal Sort
	
main:
			
Sort:

# This prints the string that contains 
	li $v0, 4	
	li $a0, STR_P2
	syscall	
li $s2, 9 # Max INNER LOOP can run

forTestOne:

	beq $t1, $s0, print_sorted # Max times it can run OVERALL PROGRAM
	addi $t1, $t1, 1 # Keeps track of the number of times the program can run // 10
		li $s3, 0 # Start time the inner loop can run
	lw $t4, 0($sp) # Loads in A		
	la $t8, 0($sp) # Stores A address

			forTestTwo:
				beq $s2, $s3, reset # The last smallest number in the $sp has been found
				addi $sp, $sp, -4 # Brings in the next element -- B
					lw $t5, 0($sp) # The next element getting compared to the starting variable
					la $t9, 0($sp) # Stores the address of B
				blt $t5, $t4, swap # A > B it needs to be flipped
				blt $t4, $t5, flip
					# if not
			addi $s3, $s3, 1 # Keeps track on the number of times inner loop runs
				j forTestTwo

	swap:
			addi $s3, $s3, 1	# Keeps track on the number of times inner loop runs
		# A > B
		move $s5, $t4 # Saves the value so it can be replaced
		sw $t5, 0($t8) # B into A old location
		move $t4, $t5
		sw $s5, 0($t9) # swaps
			j forTestTwo
	
		
	flip: # A < B
		move $s5, $t4 # Saves the value of $t4
		move $t4, $t5 # Moves $t5 into $t4 old address
		move $t5, $s5 # Moves $t4 into $t5 old address
		j swap
		
					
# Setting it up to where it will breaksit into a smaller array
	# Since its smaller the amount of elements that need to be check needs to be sub.
		# n = total of elements in the $sp
			# n - 1 = remainging elements that need to be check in the $sp
reset:
addi $s2, $s2, -1
addiu $sp, $sp, 36 # (n * (n -1) ) , resets to a certain position
		
		addiu $a3, $a3, -4 # Decreases be cause a sorted number was 
		addu $sp, $sp, $a3	# Splits it into a smaller array [sorted // non-sorted]
	j forTestOne

	print_sorted:
		addiu $sp, $sp, 40 # n * 4 , Resetting the array to the beginning
		move $a1, $zero # Making sure $a1 is set to zero
print:
# Displays a element in the $sp at a current address
		li $v0, 1
		lw $a0, 0($sp)
		syscall
# prints a space in between numbers
		li $a0, 32
		li $v0, 11  
		syscall
		
	addiu $sp, $sp, -4 # Deallocating space, and moving the location of the $sp
	addi $a1, $a1, 1
	bne $a1, $s0, print

	# This ends it and prints the array sorted using stack pointers
END:
	b END	
.data
STR_P1: .string "\nUnsorted Array: "
STR_P2: .string "\n\nSorted Array: "
A: .word 4, 3, 6, 7, 2, 34, 9, 0, 4, 1