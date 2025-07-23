#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>
#include<stdlib.h>
#define source "#include<stdio.h>%c#include<fcntl.h>%c#include<unistd.h>%c#include<stdlib.h>%c#define source %c%s%c%cint main(void){int rc;int count=%d;if(count<0)return(0);char name[]=%c./Sully_X.c%c;name[8]=count+'0';rc=open(name,O_RDWR|O_TRUNC|O_CREAT,0777);if(rc<0)return(1);dprintf(rc,source,10,10,10,10,34,source,34,10,--count,34,34);close(rc);return(0);}"
int main(void){int rc;int count=5;if(count<0)return(0);char name[]="./Sully_X.c";name[8]=count+'0';rc=open(name,O_RDWR|O_TRUNC|O_CREAT,0777);if(rc<0)return(1);dprintf(rc,source,10,10,10,10,34,source,34,10,--count,34,34);close(rc);return(0);}