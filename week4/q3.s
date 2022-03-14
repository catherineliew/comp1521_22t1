
max:
	# max(int a[], int length)
	# int a[] in $a0
	# int length in $a1
	# int first_element in $s0
	# max_so_far in $t0

prologue:
	begin
	push	$s0
	push	$ra
		
   	lw	$s0, ($a0)	# int first_element = a[0];
    	bne	$a1, 1, else	# if (length != 1) goto else;
        move 	$v0, $s0	# return first_element;
        b 	epilogue
else:
        	# // find max value in rest of array
        add 	$a0, $a0, 4	# int max_so_far = max(&a[1], length - 1);
        sub 	$a1, $a1, 1
        jal	max
        move	$t0, $v0
        
        ble	$s0, $t0, not_max	# if (first_element <= max_so_far) goto
        				# not_max;
        move 	$t0, $s0    	# max_so_far = first_element;
not_max:
        move 	$v0, $t0	# return max_so_far;
epilogue:
	pop	$ra
	pop	$s0
	end
	jr $ra

