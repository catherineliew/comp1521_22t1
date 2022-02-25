main:
    
    # int x in $t0
    li $t0, 24                  # x = 24;
    
loop:

    bge $t0, 42, end_loop       # if (x >= 42) goto end_loop;
        
    li $v0, 1                   # printf("%d", x);
    move $a0, $t0
    syscall
    
    li $v0, 11                  # putchar("\n");
    li $a0, '\n'
    syscall    
    
    
    add $t0, $t0, 3             # x += 3;
    b loop                      # goto loop;

end_loop:

    li $v0, 0                   #return 0
    jr $ra 
