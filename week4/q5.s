main:

main_prologue:
	begin
	push 	$ra
	
    				# int z = sum4(11, 13, 17, 19);
    				# load arguments into $a registers
    	li	$a0, 11
    	li	$a1, 13
    	li	$a2, 17
    	li 	$a3, 19
    	jal	sum4
    	
    				# printf("%d\n", z);
   

main_epilogue:
	pop	$ra
	end
	li	$v0, 0
	jr 	$ra		#  return 0;

sum4:
    	# int sum4(int a, int b, int c, int d) {
sum4_prologue:
	begin
	push	$ra
	push 	$s0
	push	$s1
	
    	# e in $s0
    	# f in $s1
    	
    	jal	sum2		# int e = sum2(a, b);
    	move	$s0, $v0
    	
    	move 	$a0, $a2
    	move	$a1, $a3
    	jal	sum2
    				# int f = sum2(c, d);
    	move 	$s1, $v0		
    			
    	move	$a0, $s0
    	move	$a1, $s1
    	jal 	sum2		# return sum2(e, f);
    	
sum4_epilogue:
	pop	$s1
	pop 	$s0
	pop	$ra
	end 
	
	jr 	$ra	

sum2:
 	#(int x, int y) {
    	add	$v0, $a0, $a1	# return x + y;
    	jr 	$ra
