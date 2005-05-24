#ifndef SCANCHOP_H_INCLUDED
#define SCANCHOP_H_INCLUDED
#include <stdio.h>
/* scanchop.h
   od_scan = sc_new();
   sc_reset( od_scan );
   sc_point( od_scan, EtnPs, dtime(), Ratio );
   sc_filter_point( od_scan, &filter_etn, &filter_time, &filter_ratio );
   sc_endscan( od_scan );
   od_scan->PkPos
   od_scan->PkHeight
   od_scan->PkTime
   od_scan->PkStd
   od_scan->PkQuality
 */

typedef unsigned short EtnPs_t;

typedef struct {
  double PkPos;
  double PkHeight;
  double PkTime;
  double PkStd;
  int PkQuality;
  EtnPs_t NewStart;
  int npts;
  EtnPs_t min_pos;
  EtnPs_t min_non_zero; /* normalized to min_pos */ 
  EtnPs_t max_non_zero; /* normalized to min_pos */
  double *filter_ratio;
  double *prev_ratio;
  double *filter_weight;
  double *prev_weight;
  double *filter_time;
  double crnt_fit_line_ctr; /* not normalized */
  double b[2], a[2];
  double sx, sy, sxy, sx2, sx2y, sx3, sx4, sfw;
  double dtds;

  int crnt_scan_pts;
  
  /* Values for use by sc_filter_point
     When report_direction != 0, sc_filter_point can return
	 data points from report_step to last_EtnPs in the
	 specified direction. Should be reset by sc_reset() */
  int report_direction;
  EtnPs_t report_step; /* not normalized */
  
  /* Values for use by sc_fit_point
     These values should not be reset by sc_scan_reset(),
	 but should be by sc_reset() (since no time data will
	 be left over) These values are valid between sc_endscan
	 and the first point of the next scan (although in
	 practice all the points should be served up before
	 the next data point.) I will use prev_fit_line_ctr < 0
	 to indicate that the data is no longer valid.
  */
  double A, B, C, prev_fit_line_ctr;
  EtnPs_t fit_step;
  
  EtnPs_t first_EtnPs, last_EtnPs; /* not normalized */
  double last_time;
  FILE *log_fp;
} scanchop;

#define PKQ_GOOD 0
#define PKQ_POOR 1
#define PKQ_AWFUL 2
#define PKQ_INVALID 3
#define FILTER_THRESHOLD (1e-3)

extern scanchop *sc_new( int npts, double filter_period,
  char *name );
extern void sc_reset( scanchop *sc );
extern void sc_point( scanchop *sc,
  unsigned short input_step, double input_time, double input_val );
extern int sc_filter_point( scanchop *sc,
  double *filter_etn, double *filter_time, double *filter_val );
extern int sc_fit_point( scanchop *sc,
  double *fit_etn, double *fit_time, double *fit_val );
extern void sc_endscan( scanchop *sc );

#endif
