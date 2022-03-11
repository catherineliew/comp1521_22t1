#include <stdio.h>

char flag[6][12] = {
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
};

int main(void) {

    int row = 0;
outer_loop:
    if (row >= 6) goto end_outer_loop;
    
    int col = 0;
inner_loop:
    if (col >= 12) goto end_inner_loop;
    
    printf ("%c", flag[row][col]);
    col++;
    goto inner_loop;
end_inner_loop:
        
    printf ("\n");
        
    row++;
    goto outer_loop;
end_outer_loop:

}
