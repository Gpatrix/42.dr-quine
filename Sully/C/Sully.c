#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#ifdef QUINE
#define DIFF 1
#else
#define DIFF 0
#endif
#define source "#include<stdio.h>%c#include<fcntl.h>%c#include<unistd.h>%c#include<stdlib.h>%c#include<string.h>%c#ifdef QUINE%c#define DIFF 1%c#else%c#define DIFF 0%c#endif%c#define source %c%s%c%cint main(void){int rc;int count=%d-DIFF;if(count<0)return(0);char name_file[]=%c./Sully_X.c%c;char name_exe[]=%c./Sully_X%c;name_file[8] = count+'0';name_exe[8]=count+'0';char cmd[40] = {0};rc=open(name_file,O_RDWR|O_TRUNC|O_CREAT,0777);if(rc<0)return(1);dprintf(rc,source,10,10,10,10,10,10,10,10,10,10,34,source,34,10,count,34,34,34,34,34,34);close(rc);sprintf(cmd, %cgcc -DQUINE=1 -o %%s %%s%c, name_exe, name_file);rc=system(cmd);if(rc!=0)return(1);rc=system(name_exe);if(rc!=0)return(1);return(0);}"
int main(void){int rc;int count=5-DIFF;if(count<0)return(0);char name_file[]="./Sully_X.c";char name_exe[]="./Sully_X";name_file[8] = count + '0';name_exe[8]=count+'0';char cmd[40] = {0};rc=open(name_file,O_RDWR|O_TRUNC|O_CREAT,0777);if(rc<0)return(1);dprintf(rc,source,10,10,10,10,10,10,10,10,10,10,34,source,34,10,count,34,34,34,34,34,34);close(rc);sprintf(cmd, "gcc -DQUINE=1 -o  %s %s", name_exe, name_file);rc=system(cmd);if(rc!=0)return(1);rc=system(name_exe);if(rc!=0)return(1);return(0);}