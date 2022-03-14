change: 	# (int nrows, int ncols, int M[nrows][ncols], int factor)
		#     $a0	$a1		$a2		$a3
	# row in $s0
	# col in $s1
	
prologue:
	begin
	push	$s0
	push 	$s1
    
    	li 	$s0, 0			# int row = 0;
outer_loop:
    	bge	$s0, $a0, end_outer_loop	# if (row >= nrows) goto 
    						# end_outer_loop;
    	li 	$s1, 0			# int col = 0;
inner_loop:
    
    	bge	$s1, $a1, end_inner_loop	# if (col >= ncols) goto 
						# end_inner_loop;
    	
    					# M[row][col] = factor * M[row][col];
    	mul	$t0, $a1, $s0		# row offset in $t0
    	add	$t0, $t0, $s1		# element offset in $t0
    	mul	$t0, $t0, 4		# byte offset in $t0
    	add	$t0, $t0, $a2		# &M[row][col] in $t0
    	
    	lw	$t1, ($t0)
    	mul	$t1, $t1, $a3
    	sw	$t1, ($t0)
    
    	add	$s1, $s1, 1		# col++;
    	b 	inner_loop		# goto inner_loop;
end_inner_loop:
    	add	$s0, $s0, 1		# row++;
    	b outer_loop			# goto outer_loop;
end_outer_loop:

epilogue:
	pop 	$s1
	pop	$s0
	end
	jr 	$ra
