#include <stdio.h>

int main(int argc, char *argv[]) {
    // check number of arguments
    if (argc != 2) {
        fprintf(stderr, "Incorrect number of arguments");
        return 1;
    }
    
    // open the file
    FILE *stream = fopen(argv[1], "r");
    if (stream == NULL) {
        perror(argv[0]);
        return 1;
    }
    
    // print first line of file
    int byte = 0;
    
    while ((byte = fgetc(stream)) != EOF) {
        putchar(byte);
        if (byte == '\n') {
            break;
        }
    }
    
    // close file
    fclose(stream);

}

// printf("Hello") is equivalent to fprintf(stdout, "Hello")
// fprintf fscanf
// fgetc fputc
// fgets fputs
