int main(void) {

    // first turn the for-loop into a while-loop 
    // then into a simplified while-loop using labels and goto
    
    //for (int x = 24; x < 42; x += 3) {
    //    printf("%d\n",x);
    //}
    
    
    int x = 24;
    
loop:
    // while (x < 42) {
    if (x >= 42) goto end_loop;
        
    printf("%d\n",x);
    x += 3;
    goto loop;

end_loop:
    
}
