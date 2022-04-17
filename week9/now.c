#include <stdio.h>
#include <stdlib.h>
#include <spawn.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/wait.h>

extern char **environ;


void spawn_process(char **args);

int main(void) {
    spawn_process((char *[]){"/bin/date", "+%d-%m-%Y", NULL});
    spawn_process((char *[]){"/bin/date", "+%T", NULL});
    spawn_process((char *[]){"/usr/bin/whoami", NULL});
    spawn_process((char *[]){"/bin/hostname", "-f", NULL});
    spawn_process((char *[]){"/usr/bin/realpath", ".", NULL});
    
}

void spawn_process(char **args) {
    pid_t pid;
    
    int value = posix_spawn(&pid, args[0], NULL, NULL, args, environ);
    if (value != 0) {
        errno = value;
        perror("posix_spawn failed");
        exit(EXIT_FAILURE);
    }
    
    int exit_status;
    if (waitpid(pid, &exit_status, 0) == -1) {
        perror("waitpid failed");
        exit(EXIT_FAILURE);
    }
    
}

