void change (int nrows, int ncols, int M[nrows][ncols], int factor)
{
    int row = 0;
outer_loop:
    if (row >= nrows) goto end_outer_loop;
    int col = 0;
inner_loop:
    if (col >= ncols) goto end_inner_loop;
    M[row][col] = factor * M[row][col];
    col++;
    goto inner_loop;
end_inner_loop:
    row++;
    goto outer_loop;
end_outer_loop:
}
