// $HOME/.diary
// /import/cage/1/z5312235/.diary

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    // contruct filename
    char *home_path = getenv("HOME");
    char *diary_path = ".diary";
    
    int pathname_length = strlen(home_path) + strlen(diary_path) + 2;
    char pathname[pathname_length];
    snprintf(pathname, pathname_length, "%s/%s", home_path, diary_path);
    
    // open file
    FILE *stream = fopen(pathname, "r");
    if (stream == NULL) {
        perror("Failed to open file");
        return 1;
    }
    
    // print contents of file
    int byte = 0;
    while ((byte = fgetc(stream)) != EOF) {
        putchar(byte);
    }
    
    
    // close file
    fclose(stream);
    
    return 0;
}
