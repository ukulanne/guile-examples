#include<stdio.h>
#include<signal.h>
#include<unistd.h>

void 
signal_handler (int signo){
     if (signo == SIGINT)
	  printf ("received SIGINT\n");
}

int 
main (void){
     if (signal (SIGINT, signal_handler) == SIG_ERR)
	  printf ("\ncan't catch SIGINT\n");
    
     while(1) 
	  sleep(1);
     return 0;
}
