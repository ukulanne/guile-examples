#include<stdio.h>
#include<signal.h>
#include<unistd.h>

/**********************************
** Anne Summers                  **
** <ukulanne@gmail.com>          **
** March 8, 2019                 **
** Guile signal example          **
**********************************/

/*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
**    This program is free software: you can redistribute it and/or modify  ;;
;;    it under the terms of the GNU General Public License as published by  ;;
;;    the Free Software Foundation, either version 3 of the License, or     ;;
;;    (at your option) any later version.                                   ;;
;;                                                                          ;;
;;    This program is distributed in the hope that it will be useful,       ;;
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of        ;;
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         ;;
;;    GNU General Public License for more details.                          ;;
;;                                                                          ;;
;;    You should have received a copy of the GNU General Public License     ;;
;;    along with this program.  If not, see <https://www.gnu.org/licenses/>.;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*/

/* Time-stamp: <2019-03-08 14:55:40 panda> */

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
