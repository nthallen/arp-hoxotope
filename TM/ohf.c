/* ohf.c OH filter functions
 * $Log$
 * Revision 1.2  1994/09/08  14:35:21  nort
 * Moved cic_options() into oui
 *
 * Revision 1.1  1994/07/15  18:46:00  nort
 * Initial revision
 *
 */
#include <stdlib.h>
#include "msg.h"
#include "nortlib.h"
#include "nl_dsp.h"
#include "nl_dsp_ul.h"
#include "indexer.h"
#include "ohf.h"
#pragma off (unreferenced)
  static char rcsid[] =
	"$Id$";
#pragma on (unreferenced)

/* OH filter
  Must include the following features of the existing filter
  1. If a point with a lower position than the previous
     position is encountered, it is not recorded but saved.
	 If a subsequent point has a higher position, the
	 scan is reset, since the zero limit was probably
	 encountered. Care is not crucial in this case, because
	 this probably reflects a long scan for which feedback
	 is unnecessary. However, one low point should not cause
	 a scan reset, since a scan followed by a drive may
	 behave that way.
  2. A point at the same position as the previous is not
     recorded, but no other action is taken. I will use
	 a point the same as the previous to indicate end of
	 scan in ohf_process_point(), but in ohf_scan_point()
	 this could simply be ignored.
  In either of these cases, an analysis program will probably
  want to notice the reset and act accordingly. I will try to
  make this as easy as possible.
*/

typedef struct {
  unsigned short min_pos, max_pos; /* position of first, last point */
  unsigned short rate; /* steps per sample */
  unsigned short n_points; /* number of points in the scan */
  dig_dly *dd; /* digital delay for position */
  ul_dig_dly *rdd; /* digital delay for ratio */
  unsigned short q12c, q12r, q12l, q11c, q11r, q11l;
  unsigned short dlyd_pos;
  long dlyd_fltr;
  long peak_filter; /* largest filter value */
  unsigned short peak_pos; /* position of largest filter value */
} oh_filt;

static oh_filt ohf; /* everything is zero before a scan */

unsigned int low_limit = LOW_SCAN_LIMIT;
unsigned int high_limit = HIGH_SCAN_LIMIT;

/* ohf_init_filter() defines the location of various key points in the
   filter relative to current position. These features are derived
   from the nominal shape of the laser signal. The spacing of these
   features is a function of the rate of the scan as deduced from
   the first two scan points.  I have (probably erroneously) dubbed
   the left peak q11 and the right peak q12. Assuming we have scanned
   over both lines and are currently located on the right side of q12,
   q12l, q12c, and q12r are the number of scan steps to the expected
   position of the left, center, and right of peak q12. Hence q12r = 0.
   In this implementation, these parameters are recorded as positive
   numbers.
   
   Once we've calculated the relative positions of the line
   features, we have enough information to define the delays
   we require. The oldest scan point which enters our calculation
   is q11l, the leftmost point of the first line. The parameter
   ohf.q11l is the number of scan steps back from the current
   position to that data point. Since the current data point is
   0, we will have to buffer ohf.q11l+1 data points of the
   ratio input. If the calculated filter value for those points
   is a maximum, we would want to drive to the center of q11, which
   was ohf.q11c scan steps back in the scan. Hence we will want
   to buffer ohf.q11c+1 values of the position input.
*/
static void ohf_init_filter(void) {
  ohf.q12r = 0; /* We've already done 0 */
  ohf.q12c = ohf.q12r + (103 + ohf.rate/2) / ohf.rate;
  ohf.q12l = 2 * ohf.q12c - ohf.q12r;
  ohf.q11c = ohf.q12r + ((710 + ohf.rate/2) / ohf.rate);
  ohf.q11r = (156 + ohf.rate/2) / ohf.rate; /* just the width for now */
  ohf.q11l = ohf.q11c + ohf.q11r;
  ohf.q11r = ohf.q11c - ohf.q11r;
  ohf.dd = new_dig_delay(ohf.q11c);
  ohf.rdd = new_ul_dig_delay(ohf.q11l+1);
  ohf.peak_filter = 0;
  ohf.n_points = 0;
}

static void ohf_reset_filter(void) {
  free_dig_delay(ohf.dd); ohf.dd = NULL;
  free_ul_dig_delay(ohf.rdd); ohf.rdd = NULL;
  ohf.n_points = 0;
}

/* ohf_process_point() can safely assume the entire ohf structure
   is now initialized: the digital delays are in place and the
   line parameters have been calculated. Now we simply enter the
   pos and value to their respective delays, then calculate the
   filter value for the current point and evaluate it for a max.
   ohf_process_point() must also determine whether to return TRUE
   or not. We should return TRUE if we have queued enough points
   to start reporting useful filter values (n_points==q11c), but
   should return FALSE if the delayed position has reached the
   maximum scan position.
*/
static int ohf_process_point(unsigned short pos, unsigned long value) {
  /* at this point if any points have been registered at all,
     ohf.dlyd_pos represents the position reported on the previous
	 call. Hence if ohf.dlyd_pos == pos, we have reported all the
	 scan positions up to the max. An alternate test would be
	 npts > 1 && dlyd_pos == max_pos. Both assume the behaviour
	 of ohf_end_point() which repeatedly calls with the last
	 scan point.
  */
  if (ohf.n_points > 0 && ohf.dlyd_pos == pos) {
	ohf_reset_filter();
	return 0;
  }
  ohf.n_points++;
  ohf.max_pos = pos;
  ohf.dlyd_pos = dig_delay(ohf.dd, pos);
  ul_dig_delay(ohf.rdd, value);
  ohf.dlyd_fltr = 0;
  ohf.dlyd_fltr -= value; /* q12r contribution, weighted -1 */
  ohf.dlyd_fltr += 2 * digdly_val(ohf.rdd, ohf.q12c);
  ohf.dlyd_fltr -=     digdly_val(ohf.rdd, ohf.q12l);
  ohf.dlyd_fltr -= 3 * digdly_val(ohf.rdd, ohf.q11r);
  ohf.dlyd_fltr += 6 * digdly_val(ohf.rdd, ohf.q11c);
  ohf.dlyd_fltr -= 3 * digdly_val(ohf.rdd, ohf.q11l);
  if (ohf.dlyd_fltr >  ohf.peak_filter &&
      ohf.dlyd_pos  >= low_limit &&
	  ohf.dlyd_pos  <  high_limit) {
	ohf.peak_filter = ohf.dlyd_fltr;
	ohf.peak_pos = ohf.dlyd_pos;
  }
  return (ohf.n_points > ohf.q11c);
}

/* ohf_point() returns non-zero (TRUE) if there is a valid filter
   data point ready to read via (ohf_pos(), ohf_value())
*/
int ohf_point(unsigned short pos, unsigned long value) {
  static unsigned short lowpos, sawlow = 0;

  /* satisfy condition 1 and 2 above */
  if (ohf.n_points > 0) {
	if (pos < ohf.max_pos) {
	  if (sawlow && lowpos < pos)
		ohf_reset_filter();
	  else {
		sawlow = 1;
		lowpos = pos;
		return 0;
	  }
	} else if (pos == ohf.max_pos) return 0;
  }
  sawlow = 0;

  if (ohf.n_points == 1) { /* Second Point */
	ohf.rate = pos - ohf.min_pos;
	if (ohf.rate > 0) {
	  ohf_init_filter();
	  ohf_process_point(ohf.min_pos, ohf.dlyd_fltr);
	} /* else scan hasn't begun */
  }

  if (ohf.n_points == 0) { /* First Point */
	ohf.min_pos = ohf.max_pos = pos;
	ohf.dlyd_fltr = value; /* store it here just this once */
	ohf.n_points = 1;
	return 0; /* nothing to report yet */
  }

  return ohf_process_point(pos, value);
}

/* ohf_end_point() returns non-zero (TRUE) if there is a valid
   filter data point ready, just as ohf_point(). This should be
   called repeatedly until FALSE at the end of a scan. When FALSE
   is returned, filter arrays are deallocated and subsequent
   ohf_point() starts a new scan.
*/
int ohf_end_point(void) {
  return ohf_process_point(ohf.max_pos, digdly_last(ohf.rdd));
}

/* position of first scan point */
unsigned short ohf_min_pos(void) { return ohf.min_pos; }

/* position of last scan point */
unsigned short ohf_max_pos(void) { return ohf.max_pos; }

/* rate of the most recent scan */
unsigned short ohf_rate(void) { return ohf.rate; }

/* position of the peak filter value */
unsigned short ohf_peak_pos(void) { return ohf.peak_pos;; }

/* the peak filter value */
long ohf_peak_filter(void) { return ohf.peak_filter; }

/* delayed position corresponding to current filtered value */
unsigned short ohf_pos(void) { return ohf.dlyd_pos; }

/* last filter output value. Just for plots. */
long ohf_filter(void) { return ohf.dlyd_fltr; }

/* delayed ratio value corresponding to current filtered value */
unsigned long ohf_ratio(void) { return digdly_val(ohf.rdd, ohf.q11c); }

void ohf_another_scan(step_t from, step_t length, step_t by) {
  step_t scanstrt;

  if (from + length < from)	length = UINT_MAX - from;
  msg(MSG, "Recommend scan from %u out %u by %u", from, length, by);
  if (from > 100) scanstrt = from - 100;
  else scanstrt = 0;
  ci_sendfcmd(2, "OH Drive Etalon to %u\n", scanstrt);
  ci_sendfcmd(2, "OH Drive Etalon to %u\n", from);
  ci_sendfcmd(2, "OH Scan Etalon out %u by %u\n", length, by);
}

void ohf_set_position(step_t steps) {
  ci_sendfcmd(0, "OH Set Etalon Online Position %u\n", steps);
  ci_sendfcmd(0, "OH Drive Etalon Offline\n");
  ci_sendfcmd(0, "OH Soldrv Select Mode 1\n");
}

/* scan options adds -L <low_scan_limit> and -H <high_scan_limit>
   to the options list.
*/
void scan_options(int argc, char **argv) {
  int c;
  extern char *opt_string;
  
  optind = 0;
  do {
	c=getopt(argc,argv,opt_string);
	switch (c) {
	  case 'L': low_limit = strtoul(optarg, NULL, 10); break;
	  case 'H': high_limit = strtoul(optarg, NULL, 10); break;
	}
  } while (c!=-1);
  if (low_limit >= high_limit)
	msg(1, "low scan limit is below high scan limit");
  msg(0, "Low Scan Limit: %u High Scan Limit %u", low_limit, high_limit);
}

/* This is an empty ci_version to disable version checking: we don't
   have a method for verifying formatted commands anyway, so no
   point in getting picky about compatibility!
*/
char ci_version[] = "";
