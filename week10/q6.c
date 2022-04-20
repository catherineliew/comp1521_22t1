#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

void *print_msg_thread(void *arg) {
    while (1) {
        printf("Feed me input!\n");
        sleep(1);
    }

}

int main(void) {
    pthread_t thread;
    pthread_create(&thread, NULL, print_msg_thread, NULL);
    
    char string[100];
    while (fgets(string, 100, stdin)) {
        printf("You entered: %s\n", string);
    }
    
    return 0;
    
}
