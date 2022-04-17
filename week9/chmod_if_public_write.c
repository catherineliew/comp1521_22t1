#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>


void chmod_if_needed(char *filename);

int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {
        chmod_if_needed(argv[i]);
    }
}

void chmod_if_needed(char *filename) {
    struct stat s;
    if (stat(filename, &s) != 0) {
        perror("stat failed");
        exit(EXIT_FAILURE);
    }
    
    mode_t mode = s.st_mode;
    
    if (mode & S_IWOTH){
        // file is publically writable
        if (chmod(filename, mode & ~S_IWOTH) != 0) {
            perror("chmod failed");
            exit(EXIT_FAILURE);
        }
        printf("Removing public write from %s\n", filename);
    } else {
        printf("%s is not publically writable\n", filename);
    }
}
