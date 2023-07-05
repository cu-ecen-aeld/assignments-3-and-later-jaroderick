#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <errno.h>
#include <string.h>

int main(int argc, char *argv[])
{
  FILE *fp;
  
  openlog(NULL, 0, LOG_USER);

  if (argc < 3) {
    syslog(LOG_ERR, "Usage: writer writefile writestring");
    exit(1);
  }

  fp = fopen(argv[1], "w");
  if (fp == NULL) {
    syslog(LOG_ERR, "fopen: %s", strerror(errno));
    exit(1);
  }

  if (fprintf(fp, "%s", argv[2]) < 0) {
    syslog(LOG_ERR, "fprintf failed");
    exit(1);
  }

  return 0;
}
