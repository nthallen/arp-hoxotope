/* handler.c */
#include <sys/types.h>

pid_t far onint_handler(void) {
  extern pid_t onint_proxy;
  return(onint_proxy);
}
