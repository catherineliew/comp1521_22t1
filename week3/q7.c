int main(void) {
    int i;
    int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};

    i = 0;
    
loop_start:
    if (i >= 10) goto end_loop;
    if (numbers[i] >= 0) goto if_false;
    
    numbers[i] += 42;
    
if_false:
    i++;
    goto loop_start;
    
end_loop:
}
