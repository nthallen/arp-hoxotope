/* ohf.h include file for OH filter functions
 * $Log$
 * Revision 1.2  1994/09/08  14:35:38  nort
 * Removed statements made obsolete by OUI
 *
 * Revision 1.1  1994/07/15  18:45:42  nort
 * Initial revision
 *
 */
int ohf_point(unsigned short pos, unsigned long value);
int ohf_end_point(void);
unsigned short ohf_min_pos(void); /* position of first scan point */
unsigned short ohf_max_pos(void);  /* position of last scan point */
unsigned short ohf_rate(void); /* rate of the most recent scan */
unsigned short ohf_peak_pos(void); /* position of the peak filter value */
long ohf_peak_filter(void);
/* ohf_pos(), ohf_ratio() and ohf_filter() all correspond to the
   same scan position. ohf_ratio() is the delayed input ratio value.
   The delay is simply convenient for reporting. ohf_pos() is also
   delayed by the same amount. ohf_filter() is the filtered value
   which corresponds with the other two points. It isn't delayed,
   since it requires data after the designated scan point in its
   calculation.
*/
unsigned short ohf_pos(void);
unsigned long ohf_ratio(void);
long ohf_filter(void);
#ifndef INDEXER_H_INCLUDED
  #error Must include indexer.h before ohf.h
#endif
void ohf_another_scan(step_t from, step_t length, step_t by);
void ohf_set_position(step_t steps);
void scan_options(int argc, char **argv);
#define LOW_SCAN_LIMIT 28000
#define HIGH_SCAN_LIMIT 38000
extern unsigned int low_limit;
extern unsigned int high_limit;
