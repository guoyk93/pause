#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

void sighandler(int);

int main()
{
    signal(SIGINT, sighandler);
    signal(SIGTERM, sighandler);
    pause();
    return 0;
}

void sighandler(int signum)
{
    exit(0);
}
