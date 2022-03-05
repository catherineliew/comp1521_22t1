    # s in $t0
    # length in $t1

main:

    la $t0, string          # char *s = &string[0];
    li $t1, 0               # length = 0;

loop:
    lb $t2, ($t0)
    beq $t2, '\0', end_loop  # if (*s == '\0') goto end_loop;
    add $t1, $t1, 1         #    length++;  // increment length
    add $t0, $t0, 1         #   s++;       // move to next char
    b loop                  # goto loop;
end_loop:
    
    li $v0, 0               # return 0
    jr $ra

    .data
string:
   .asciiz  "hello"
