ROW_SIZE = 12

main:
	# int row in $t0
	# int col in $t3
    	li 	$t0, 0	# int row = 0;
outer_loop:
    	bge	$t0, 6, end_outer_loop	# if (row >= 6) goto end_outer_loop;
    
    	li 	$t3, 0			# int col = 0;
inner_loop:
    	bge	$t3, 12, end_inner_loop	# if (col >= 12) goto end_inner_loop;
    
    
    	# TODO printf ("%c", flag[row][col]);
    	# we want to find &flag[row][col]
    	
    	mul	$t1, $t0, ROW_SIZE	# row offset
    	add	$t1, $t1, $t3		# element offset = byte offset
    	la	$t2, flag
    	add	$t2, $t2, $t1		# &flag[row][col] is in $t2
    	
    	li 	$v0, 11
    	lb	$a0, ($t2)
    	syscall
    
    	add	$t3, $t3, 1		# col++;
    	b 	inner_loop		# goto inner_loop;
end_inner_loop:
        
    	li	$v0, 11			# printf ("\n");
        li	$a0, '\n'	
	syscall

    	add	$t0, $t0, 1		# row++;
    	b 	outer_loop		# goto outer_loop;
end_outer_loop:

	li	$v0, 0
	jr 	$ra

    .data
flag: 	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
    	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
    	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'

