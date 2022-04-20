#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void *print_msg_thread(void *arg) {

    char *msg = (char *)arg;
    while (1) {
        printf("%s\n", msg);
    }
    
    return NULL;
}

int main(void) {
    
    pthread_t thread;
    pthread_create(&thread, NULL, print_msg_thread, "Hello ");
    
    while (1) {
        printf("there!\n");
    }
    
    return 0;
}
