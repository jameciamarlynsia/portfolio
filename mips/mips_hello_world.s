/**
** Name: Jamecia Marlynsia Moore
*** Date: 11/14/2020
*/
.set noreorder

.global _start
_start:
	jal main
	
	END:
		b END

main:
		# Displays the greeting
	li $v0, 4	
	li $a0, greeting
	syscall		
	jr $ra 
	
.data

greeting: .string "        Hello World!\n\n              Hello World!\n\n                   Hello World!\n\n            Hello World!\n\n      Hello World!\n\n Hello World!"