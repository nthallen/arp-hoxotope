#include <ctype.h>
#include "topaz.h"

/* Convert_Topaz_Data converts an ASCII string into a fixed-point
   integer. The true value is the return value divided by 
   10^decimals
*/
unsigned short Convert_Topaz_Data( const char *s, int decimals ) {
  unsigned short rv = 0;
  int dec_seen = 0;

  while ( isspace(*s) ) s++;
  while ( isdigit(*s) ) {
	rv = rv * 10 + (*s) - '0';
	s++;
  }
  if ( *s == '.' ) {
	s++;
	while ( isdigit(*s) && dec_seen < decimals ) {
	  rv = rv * 10 + (*s) - '0';
	  dec_seen++; s++;
	}
  }
  while ( dec_seen < decimals ) { rv *= 10; dec_seen++; }
  return rv;
}
