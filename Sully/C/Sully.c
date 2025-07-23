#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#define comp "gcc -o "
#define source "#include<stdio.h>%c#include<fcntl.h>%c#include<unistd.h>%c#include<stdlib.h>%c#include<string.h>%c#define source %c%s%c%cint main(void){int rc;int count=%d;if(count<0)return(0);char name_file[]=%c./Sully_X.c%c;char name_exe[]=%c./Sully_X%c;name_file[8] = count + '0';name_exe[8] = count + '0';char*cmd=calloc(1, 30);if (!cmd)return (1);rc=open(name,O_RDWR|O_TRUNC|O_CREAT,0777);if(rc<0)return(1);dprintf(rc,source,10,10,10,10,34,source,34,10,--count,34,34);close(rc);strcpy(cmd, comp);strcpy(&cmd[7], name_exe);cmd[16] = ' ';strcpy(&cmd[17], name_file);rc = system(cmd);if (rc != 0) return (0);return (0);}"
int main(void){int rc;int count = 5;if(count<0)return(0);char name_file[]="./Sully_X.c";char name_exe[]="./Sully_X";name_file[8] = count + '0';name_exe[8] = count + '0';char*cmd=calloc(1, 30);if (!cmd)return (1);rc=open(name_file,O_RDWR|O_TRUNC|O_CREAT,0777);if(rc < 0)return(1);dprintf(rc,source,10,10,10,10,10,34,source,34,10,--count,34,34,34,34);close(rc);strcpy(cmd, comp);strcpy(&cmd[7], name_exe);cmd[16] = ' ';strcpy(&cmd[17], name_file);rc = system(cmd);if (rc != 0) return (0);return (0);}