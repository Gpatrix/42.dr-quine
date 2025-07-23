#include <stdio.h>
#define source "#include <stdio.h>%c#define source %c%s%c%c#define comment /*hello*/%c#define start(x) int main(void) {comment printf(source,10,34,source,34,10,10,10);return x;}%cstart(0)"
#define comment /*hello*/
#define start(x) int main(void) {comment printf(source,10,34,source,34,10,10,10);return x;}
start(0)