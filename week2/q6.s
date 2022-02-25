main:
    # int x in $t0
    
    li $v0, 4           # printf("Enter a number: ");
    la $a0, prompt
    syscall
    
    
    li $v0, 5           # scanf("%d", &x);
    syscall             # number is in $v0
    move $t0, $v0       # $t0 = $v0

    li $t1, 100         # if (x <= 100) goto small_big;
    ble $t0, $t1, small_big
    
    li $t1, 1000        # if (x >= 1000) goto small_big;
    bge $t0, $t1, small_big
    
    li $v0, 4           # printf("medium\n");
    la $a0, medium_msg
    syscall
    
    b end               # goto end;
small_big:

    li $v0, 4           # printf("small/big\n");
    la $a0, small_big_msg
    syscall

end:
    li $v0, 0           # return 0
    jr $ra



    .data
prompt:         .asciiz "Enter a number: "
medium_msg:     .asciiz "medium\n"
small_big_msg:  .asciiz "small/big\n"


