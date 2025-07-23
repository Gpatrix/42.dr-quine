#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#define comment /*hi*/
#define source "#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c#define comment /*hi*/%c#define source %c%s%c%c#define start(x) int main(void){int rc;comment rc=open(%c./Grace_kid%c,O_RDWR|O_TRUNC|O_CREAT, 0777);if(rc<0)return(1);dprintf(rc,source,10,10,10,10,34,source,34,10,34,34,10);close(rc);return(x);}%cstart(0)"
#define start(x) int main(void){int rc;comment rc=open("./Grace_kid",O_RDWR|O_TRUNC|O_CREAT, 0777);if(rc<0)return(1);dprintf(rc,source,10,10,10,10,34,source,34,10,34,34,10);close(rc);return(x);}
start(0)