/**
** Name: Jamecia M. Moore
** Date: 11/08/2020
** Assignment: MIPS03
** Class: CSCI 210
*** Objective: Sort an array of n elements using the Stack Pointer
**/

.set noreorder
	#Initialize all variables
	la $sp, 0x7FFFFFFC # the address the sp has to be set to
	li $a1, 10 # parameter n
	# Initalize variables for displaying the sorted/unsorted array
	la $t5, A # address of A
	li $t6, 0 # The counter
	li $s7, 10 # The max time the unsorted/sorted loops can run

	# This prints the string that contains "Unsorted Array"
	li $v0, 4	
	li $a0, STR_P1
	syscall	
		print_unsorted:
		addi $t6, $t6, 1 # Increments the counter
			li $v0, 1
			lw $a0, 0($t5) # Displays the number at the index of A[$t6]
			syscall
					# prints a space in between numbers
					li $a0, 32
					li $v0, 11  
					syscall
			addi $t5, $t5, 4 # Moves the pointer in the array
			bne $s7, $t6, print_unsorted
	# Resets these so the sorted array can be dispayed using the same registers
			li $t6, 0
			addi $t5, $t5, -40
	# a0 is initalized here so it won't be over written --used previously		
	la $a0, A #adress of the array // parameter v
	jal sort # jumps to the sort function
	# RETURNS BACK HERE
		# prints a space in between numbers
		li $v0, 4  
    	la $a0, space  
   		syscall
	# This prints the string that contains 
	li $v0, 4
	li $a0, STR_P2
	syscall
# This prints the string that contains "Sorted Array"	
		print_sorted:
		addi $t6, $t6, 1
			li $v0, 1
			lw $a0, 0($t5)
			syscall
					# prints a space in between numbers
					li $a0, 32
					li $v0, 11  
					syscall
			addi $t5, $t5, 4
			bne $s7, $t6, print_sorted
		
	# This ends it and prints the array sorted using stack pointers
		
END:
	j END
	main:

	/**
	**	The Full Procedure 
	*/
	
	sort: 
	addiu $sp, $sp, -40  # make room on stack for 5 registers
sw   $ra, 16($sp)    # save $ra on stack
sw   $s3, 12($sp)    # save $s3 on stack
sw   $s2, 8($sp)     # save $s2 on stack
sw   $s1, 4($sp)     # save $s1 on stack
sw   $s0, 0($sp)     # save $s0 on stack
move $s2, $a0
move $s3, $a1
move $s0, $zero
	/**
	**	The Procedure Body
	*/

	for1tst: slt  $t0, $s0, $s3       # reg $t0 = 0 if $s0 ≥ $a1 (i ≥ n)
         beq  $t0, $zero, exit1   # go to exit1 if $s0 ≥ $a1 (i ≥ n)
		  	 addi $s1, $s0, -1        # j = i - 1 
	for2tst: slti $t0, $s1, 0         # reg $t0 = 1 if $s1 < 0 (j < 0)
         bne  $t0, $zero, exit2   # goto exit2 if $s1 < 0 (j < 0)
         sll  $t1, $s1, 2         # reg $t1 = j * 4
         add  $t2, $s2, $t1       # reg $t2 = v + (j * 4)
         lw   $t3, 0($t2)         # reg $t3 = v[j]
         lw   $t4, 4($t2)         # reg $t4 = v[j + 1]
         slt  $t0, $t4, $t3       # reg $t0 = 0 if $t4 ≥ $t3
         beq $t0, $zero, exit2    # go to exit2 if $t4 ≥ $t3
		 move $a0, $s2   # first swap parameter is v
		 move $a1, $s1   # second swap parameter is j
		 jal swap
		 addi $s1, $s1, -1        # j -= 1
         j for2tst                # jump to test of inner loop 
exit2:
		addi $s0, $s0, 1
		j for1tst
	
	
	/**
	**	The Procedure Swap
	*/
	swap: sll $t1, $a1, 2 # $t1 = k * 4
	add $t1, $a0, $t1 # $t1 = v+(k*4)
# (address of v[k])
lw $t0, 0($t1) # $t0 (temp) = v[k]
lw $t2, 4($t1) # $t2 = v[k+1]
sw $t2, 0($t1) # v[k] = $t2 (v[k+1])
sw $t0, 4($t1) # v[k+1] = $t0 (temp)
jr $ra # return to calling routine

	exit1: 
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $ra, 16($sp)
	addiu $sp, $sp, 40
	jr $ra 
	
	
.data
STR_P1: .string "\nUnsorted Array: "
space: .asciz "\n\n"
STR_P2: .string "Sorted Array: "
A: .word 4, 3, 6, 7, 2, 34, 9, 0, 4, 1