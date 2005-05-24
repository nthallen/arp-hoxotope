#include <math.h>
#include <string.h>
#include "scanchop.h"
#include "nortlib.h"
#include "ssp.h"
/* scanchop.c
   od_scan = sc_new();
   sc_reset( od_scan );
   sc_point( od_scan, EtnPs, dtime(), Ratio );
   sc_endscan( od_scan );
   sc_filter_point( od_scan, &filter_etn, &filter_time, &filter_ratio );
   sc_fit_point( od_scan, &filter_etn, &filter_time, &fit_value );
   od_scan->PkPos
   od_scan->NewStart
   od_scan->PkHeight
   od_scan->PkTime
   od_scan->PkStd
   od_scan->PkQuality
*/

/* Creates and initializes a new scanchop object */
scanchop *sc_new( int npts, double filter_period, char *name ) {
  scanchop *sc = new_memory( sizeof(scanchop) );
  sc->npts = npts;
  sc->filter_ratio = new_memory( npts * sizeof(double) );
  sc->prev_ratio = new_memory( npts * sizeof(double) );
  sc->filter_weight = new_memory( npts * sizeof(double) );
  sc->prev_weight = new_memory( npts * sizeof(double) );
  sc->filter_time = new_memory( npts * sizeof(double) );
  if ( filter_period <= 0 ) {
    sc->b[0] = sc->a[0] = 1.;
    sc->b[1] = sc->a[1] = 0.;
  } else {
    double pi = 3.14159265358979;
    double Wn = 2/filter_period;
    double T = .5;
    double RC = 1/(2*pi*Wn);
    sc->a[0] = 1 + 2*RC/T;
    sc->a[1] = (1 - 2*RC/T)/sc->a[0];
    sc->b[0] = sc->b[1] = 1/sc->a[0];
    sc->a[0] = 1;
  }
  sc->log_fp = 0;
  if ( name != 0 )
	sc->log_fp = fopen( name, "w" );
  sc_reset(sc);
  return sc;
}

static void sc_scan_reset( scanchop *sc ) {
  sc->crnt_scan_pts = 0;
  sc->sx = 0.;
  sc->sy = 0.;
  sc->sxy = 0.;
  sc->sx2 = 0.;
  sc->sx2y = 0.;
  sc->sx3 = 0.;
  sc->sx4 = 0.;
  sc->sfw = 0.;
}

/* Clears all the weights in the specified scanchop object */
void sc_reset( scanchop *sc ) {
  int i;
  sc->PkQuality = PKQ_INVALID;
  sc->min_pos = USHRT_MAX;
  sc->max_non_zero = 0;
  sc->min_non_zero = 1;
  for ( i = 0; i < sc->npts; i++ ) {
    sc->filter_weight[i] = sc->prev_weight[i] = 0.;
    sc->filter_ratio[i] = sc->prev_ratio[i] = 0.;
  }
  sc_scan_reset( sc );
}


/* check_step() makes sure the current step is within the current
   filter range, and if it isn't, it re-centers the filter around
   the current non-zero region. Actually, I should take weight
   here and only recenter if non-zero, returning -1 if oor
   Returns the correct index. */
static int check_step( scanchop *sc, EtnPs_t step, double weight ) {
  EtnPs_t idx, shift;
  int npts_to_move, npts_to_zero;
  
  if ( sc->min_non_zero > sc->max_non_zero ) {
	if ( weight == 0. ) return -1;
	sc->min_pos = step - sc->npts/2;
	idx = step - sc->min_pos;
	return idx;
  }
  if ( step < sc->min_pos ) {
	if ( weight == 0. ) return -1;
	/* Need to shift right: put max_non_zero on the far right */
	shift = sc->npts - sc->max_non_zero - 1;
	if ( step+shift < step ) nl_error( 4, "step+shift < step" );
	if ( step + shift < sc->min_pos ) {
	  EtnPs_t extra_shift = sc->min_pos - step - shift + sc->npts/10;
	  if ( shift+extra_shift < shift )
		nl_error( 4, "apparent overflow in right shift" );
	  if ( sc->min_non_zero+shift+extra_shift >= sc->npts ) {
		nl_error( 2, "shifting right over entire non-zero region" );
		sc_reset( sc );
		sc->min_pos = step - sc->npts/2;
		idx = step - sc->min_pos;
		sc->min_non_zero = 1;
		sc->max_non_zero = 0;
		return idx;
	  }
	  nl_error( 2, "non-zero region exceeds filter size: discarding %u", extra_shift );
	  shift += extra_shift;
	  sc->max_non_zero -= extra_shift;
	}
	/* Now shift right by shift */
	sc->min_pos -= shift;
	npts_to_move = sc->max_non_zero - sc->min_non_zero + 1;
	npts_to_zero = npts_to_move < shift ? npts_to_move : shift;
	npts_to_move *= sizeof(double);
	npts_to_zero *= sizeof(double);

	memmove( sc->filter_ratio+sc->min_non_zero+shift,
	         sc->filter_ratio+sc->min_non_zero, npts_to_move );
	memset( sc->filter_ratio+sc->min_non_zero, 0, npts_to_zero );

	memmove( sc->prev_ratio+sc->min_non_zero+shift,
	         sc->prev_ratio+sc->min_non_zero, npts_to_move );
	memset( sc->prev_ratio+sc->min_non_zero, 0, npts_to_zero );

	memmove( sc->filter_weight+sc->min_non_zero+shift,
	         sc->filter_weight+sc->min_non_zero, npts_to_move );
	memset( sc->filter_weight+sc->min_non_zero, 0, npts_to_zero );

	memmove( sc->prev_weight+sc->min_non_zero+shift,
	         sc->prev_weight+sc->min_non_zero, npts_to_move );
	memset( sc->prev_weight+sc->min_non_zero, 0, npts_to_zero );

	memmove( sc->filter_time+sc->min_non_zero+shift,
	         sc->filter_time+sc->min_non_zero, npts_to_move );
	memset( sc->filter_time+sc->min_non_zero, 0, npts_to_zero );

	sc->min_non_zero += shift;
	sc->max_non_zero += shift;
	if ( sc->max_non_zero >= sc->npts )
	  nl_error( 4, "max_non_zero overflowed unexpectedly" );
    idx = idx - sc->min_pos;
  } else {
	idx = step - sc->min_pos;
	if ( idx >= sc->npts ) {
	  if ( weight == 0. ) return -1;
	  /* Need to shift left: put min_non_zero on the far left */
	  shift = sc->min_non_zero;
	  if ( sc->npts + shift < idx ) {
		EtnPs_t extra_shift = idx - sc->npts - shift + sc->npts/10;
		if ( shift+extra_shift < shift )
		  nl_error( 4, "apparent overflow in left shift" );
		if ( shift+extra_shift >= sc->max_non_zero ) {
		  nl_error( 2, "shifting left over entire non-zero region" );
		  sc_reset( sc );
		  sc->min_pos = step - sc->npts/2;
		  idx = step - sc->min_pos;
		  sc->min_non_zero = 1;
		  sc->max_non_zero = 0;
		  return idx;
		}
		nl_error( 2, "non-zero region exceeds filter size: discarding %u", extra_shift );
		shift += extra_shift;
		sc->min_non_zero += extra_shift;
	  }
	  /* Now shift right by shift */
	  sc->min_pos += shift;
	  npts_to_move = sc->max_non_zero - sc->min_non_zero + 1;
	  npts_to_zero = npts_to_move < shift ? npts_to_move : shift;
	  npts_to_move *= sizeof(double);
	  npts_to_zero *= sizeof(double);

	  memmove( sc->filter_ratio+sc->min_non_zero-shift,
			   sc->filter_ratio+sc->min_non_zero, npts_to_move );
	  memset( sc->filter_ratio+sc->max_non_zero+1-shift, 0, npts_to_zero );

	  memmove( sc->prev_ratio+sc->min_non_zero-shift,
			   sc->prev_ratio+sc->min_non_zero, npts_to_move );
	  memset( sc->prev_ratio+sc->max_non_zero+1-shift, 0, npts_to_zero );

	  memmove( sc->filter_weight+sc->min_non_zero-shift,
			   sc->filter_weight+sc->min_non_zero, npts_to_move );
	  memset( sc->filter_weight+sc->max_non_zero+1-shift, 0, npts_to_zero );

	  memmove( sc->prev_weight+sc->min_non_zero-shift,
			   sc->prev_weight+sc->min_non_zero, npts_to_move );
	  memset( sc->prev_weight+sc->max_non_zero+1-shift, 0, npts_to_zero );

	  memmove( sc->filter_time+sc->min_non_zero-shift,
			   sc->filter_time+sc->min_non_zero, npts_to_move );
	  memset( sc->filter_time+sc->max_non_zero+1-shift, 0, npts_to_zero );

	  sc->min_non_zero -= shift;
	  sc->max_non_zero -= shift;
	  if ( sc->min_non_zero >= sc->npts )
		nl_error( 4, "min_non_zero overflowed unexpectedly" );
	  idx = idx - sc->min_pos;
	}
  }
  return idx;
}

/* apply_weight is where we add points to the fit and where we
   trim the non-zero region. */
static void apply_weight( scanchop *sc, EtnPs_t step, double time, double weight ) {
  int idx = check_step( sc, step, weight );
  double fw;

  if ( idx < 0 ) return; /* out of range, but zero weight */
  fw = sc->filter_weight[idx] =
	sc->b[0] * weight + sc->b[1]*sc->prev_weight[idx]
	 - sc->a[1]*sc->filter_weight[idx];
  sc->prev_weight[idx] = weight;
  sc->filter_time[idx] = time;
  if ( fw > FILTER_THRESHOLD ) {
	double x, y, x2;
	if ( sc->min_non_zero > sc->max_non_zero ) {
	  sc->min_non_zero = sc->max_non_zero = idx;
	  sc->crnt_fit_line_ctr = (double) step;
	} else if ( idx < sc->min_non_zero ) {
	  sc->min_non_zero = idx;
	} else if ( idx > sc->max_non_zero ) {
	  sc->max_non_zero = idx;
	}
	x = step - sc->crnt_fit_line_ctr;
	y = sc->filter_ratio[idx];
	x2 = x*x;
	sc->sx += fw * x;
	sc->sy += fw * y;
	sc->sxy += fw * x * y;
	sc->sx2 += fw * x2;
	sc->sx2y += fw * x2 * y;
	sc->sx3 += fw * x2 * x;
	sc->sx4 += fw * x2 * x2;
	sc->sfw += fw;
	if ( sc->log_fp ) {
	  fprintf( sc->log_fp, "%u: %.1lf, %.3lf\n", step, y, fw );
	}
  } else if ( sc->min_non_zero < sc->max_non_zero ) {
	if ( idx == sc->min_non_zero ) {
	  while ( sc->filter_weight[++sc->min_non_zero] <
				FILTER_THRESHOLD );
	} else if ( idx == sc->max_non_zero ) {
	  while ( sc->filter_weight[--sc->max_non_zero] <
				FILTER_THRESHOLD );
	  --sc->max_non_zero;
	}
  } else if ( sc->min_non_zero == sc->max_non_zero && idx == sc->min_non_zero ) {
	/* This should never happen */
	nl_error(2, "Filter has become empty" );
	sc->max_non_zero = 0;
	sc->min_non_zero = 1;
  }
}

static void apply_point( scanchop *sc, EtnPs_t step, double time, double val ) {
  int idx;
  idx = check_step( sc, step, 1. );
  sc->filter_ratio[idx] =
    (1-sc->filter_weight[idx]) * val +
    sc->filter_weight[idx] *
	  (sc->b[0] * val + sc->b[1] * sc->prev_ratio[idx]
	   - sc->a[1] * sc->filter_ratio[idx]);
  sc->prev_ratio[idx] = val;
  apply_weight( sc, step, time, 1. );
}

/* Inserts a new scan point into the scanchop object
   If the new point is outside the range of the filter,
   recenter the filter on the non-zero points.
*/
void sc_point( scanchop *sc,
	  EtnPs_t input_step, double input_time, double input_val ) {
  double dt, T;
  if ( sc->crnt_scan_pts == 0 ) {
	sc->first_EtnPs = input_step;
	sc->prev_fit_line_ctr = -1;
	sc->fit_step = input_step;
	sc->report_direction = 0;
  } else if ( sc->crnt_scan_pts == 1 ) {
	EtnPs_t step;
	if ( input_step < sc->last_EtnPs ) {
	  dt = (input_time-sc->last_time)/(sc->last_EtnPs - input_step);
	  T = sc->last_time;
	  for ( step = sc->last_EtnPs+1; step <= sc->max_non_zero+sc->min_pos; ++step ) {
		T -= dt;
		apply_weight( sc, step, T, 0. );
	  }
	  sc->report_direction = -1;
	  sc->report_step = sc->max_non_zero+sc->min_pos;
	} else if ( input_step > sc->last_EtnPs ) {
	  dt = (input_time - sc->last_time)/(input_step - sc->last_EtnPs);
	  T = sc->last_time;
	  for ( step = sc->last_EtnPs-1; step >= sc->min_non_zero+sc->min_pos; --step ) {
		T -= dt;
		apply_weight( sc, step, T, 0. );
	  }
	  sc->report_direction = 1;
	  sc->report_step = sc->min_non_zero+sc->min_pos;
	} else {
	  nl_error( 2, "New input step unchanged" );
	  sc->last_time = input_time;
	  return;
	}
  }
  apply_point( sc, input_step, input_time, input_val );
  sc->crnt_scan_pts++;
  if ( sc->crnt_scan_pts > 1 ) {
	EtnPs_t step;
	if ( input_step < sc->last_EtnPs ) {
	  dt = (input_time-sc->last_time)/(sc->last_EtnPs - input_step);
	  sc->dtds = dt;
	  T = input_time;
	  for ( step = input_step+1; step < sc->last_EtnPs; ++step ) {
		T -= dt;
		apply_weight( sc, step, T, 0. );
	  }
	} else if ( input_step > sc->last_EtnPs ) {
	  dt = (input_time-sc->last_time)/(input_step - sc->last_EtnPs);
	  sc->dtds = dt;
	  T = input_time;
	  for ( step = input_step-1; step > sc->last_EtnPs; --step ) {
		T -= dt;
		apply_weight( sc, step, T, 0. );
	  }
	} else {
	  nl_error(2, "New input step unchanged at scanpt %d", sc->crnt_scan_pts );
	}
  }
  sc->last_EtnPs = input_step;
  sc->last_time = input_time;
}

/* Called at the end of a scan to calculate the optimal fit.
   Defines attributes PkPos, PkHeight, PkTime, PkStd and
   PkQuality.
*/
void sc_endscan( scanchop *sc ) {
  double k11, k12, k21, k22, R1, R2, D, C, B, A, pkx, x;
  double low_step, high_step;
  
  if ( sc->report_direction > 0 ) {
	EtnPs_t step = sc->last_EtnPs + 1;
	double T = sc->last_time;
	for ( ; step <= sc->max_non_zero + sc->min_pos; step++ ) {
	  T += sc->dtds;
	  apply_weight( sc, step, T, 0. );
	}
  } else {
	EtnPs_t step = sc->last_EtnPs - 1;
	double T = sc->last_time;
	for ( ; step >= sc->max_non_zero + sc->min_pos; step-- ) {
	  T += sc->dtds;
	  apply_weight( sc, step, T, 0. );
	}
  }
  k11 = sc->sfw*sc->sx2 - sc->sx*sc->sx;
  k12 = sc->sfw*sc->sx3 - sc->sx2*sc->sx;
  k21 = k12;
  k22 = sc->sfw*sc->sx4 - sc->sx2*sc->sx2;
  R1 = sc->sfw*sc->sxy - sc->sx*sc->sy;
  R2 = sc->sfw*sc->sx2y - sc->sx2*sc->sy;
  D = (k11*k22-k21*k12);
  C = (k11*R2-k21*R1)/D;
  B = (k22*R1-k12*R2)/D;
  A = (sc->sy-B*sc->sx-C*sc->sx2)/sc->sfw;
  sc->A = A;
  sc->B = B;
  sc->C = C;
  sc->prev_fit_line_ctr = sc->crnt_fit_line_ctr;
  /* Now is the fit useful?
	 y = A + B*x + C*x^2
	 center of parabola where x = -B/2C, y = A-B/4C
	 reasonable if C < 0 and x falls within the scan range.
	 If C < 0
	   if x is within scan range use it
	   else take appropriate end of the scan for new position
	 else if x is before midpoint of scan, take end of scan
	 else take beginning of scan
  */
  sc->PkQuality = PKQ_GOOD; /* highest quality */
  if ( sc->first_EtnPs < sc->last_EtnPs ) {
	low_step = sc->first_EtnPs;
	high_step = sc->last_EtnPs;
  } else {
	low_step = sc->last_EtnPs;
	high_step = sc->first_EtnPs;
  }
  if ( C < 0 ) {
	pkx = sc->crnt_fit_line_ctr - B/(2*C);
	if ( pkx < low_step ) {
	  pkx = low_step;
	  sc->PkQuality = PKQ_POOR;
	} else if ( pkx > high_step ) {
	  pkx = high_step;
	  sc->PkQuality = PKQ_POOR;
	}
  } else {
	double ly, hy;
	sc->PkQuality = PKQ_AWFUL; /* No peak */
	x = low_step - sc->crnt_fit_line_ctr;
	ly = A + B*x + C*x*x;
	x = high_step - sc->crnt_fit_line_ctr;
	hy = A + B*x + C*x*x;
	pkx = hy > ly ? high_step : low_step;
  }
  if ( sc->log_fp ) {
	fprintf( sc->log_fp, "ABC = %lg %lg %lg\n", A, B, C );
	fprintf( sc->log_fp, "x0 = %.1lf\n", sc->crnt_fit_line_ctr );
	fflush(sc->log_fp);
  }
  x = pkx - sc->crnt_fit_line_ctr;
  sc->PkHeight = A + B*x + C*x*x;
  { unsigned xlo, xhi;
	xlo = floor(pkx);
	xhi = ceil(pkx);
	if ( xlo < sc->min_pos || xhi >= sc->min_pos + sc->npts ) {
	  nl_error( 2, "Peak position has expired" );
	  sc->PkTime = non_number;
	  sc->PkPos = non_number;
	} else {
	  sc->PkPos = pkx;
	  if ( xlo == xhi ) {
		sc->PkTime = sc->filter_time[xlo-sc->min_pos];
	  } else if ( xhi != xlo+1 ) {
		nl_error( 4, "Bad Math!" );
	  } else {
		sc->PkTime = sc->filter_time[xlo-sc->min_pos] +
		  (pkx-xlo) * (sc->filter_time[xhi-sc->min_pos]
		   -sc->filter_time[xlo-sc->min_pos]);
	  }
	}
  }
  { EtnPs_t step;
	double sx2, sw;
	sx2 = sw = 0.;
	for ( step = sc->min_non_zero; step <= sc->max_non_zero; ++step ) {
	  double x, y;
	  x = step + sc->min_pos - sc->crnt_fit_line_ctr;
	  y = A + B*x + C*x*x - sc->filter_ratio[step];
	  sx2 += sc->filter_weight[step]*y*y;
	  sw += sc->filter_weight[step];
	}
	sc->PkStd = sqrt(sx2/sw);
  }
  sc->NewStart = floor(pkx + ((double)sc->first_EtnPs - (double)sc->last_EtnPs+1)/2);
  sc->crnt_fit_line_ctr = pkx;
  sc_scan_reset(sc);
}

/* Returns 1 while there are filter points to report. Fills
   in the filter_* arguments. Can be called during a
   scan
*/
int sc_filter_point( scanchop *sc,
	double *filter_etn, double *filter_time, double *filter_val ) {
  int idx;
  if ( sc->report_direction == 0 ) return 0;
  for ( ;; ) {
	if ( sc->report_step == sc->last_EtnPs ) return 0;
	if ( ( sc->report_direction < 0 &&
		  sc->report_step <	sc->last_EtnPs ) ||
		 ( sc->report_direction > 0 &&
		  sc->report_step >	sc->last_EtnPs ) ) {
	  nl_error( 2, "sc_filter_point skipped out of scan" );
	  return 0;
	}
	idx = check_step( sc, sc->report_step, 0. );
	sc->report_step += sc->report_direction;
	if ( idx >= 0 && sc->filter_weight[idx] > FILTER_THRESHOLD ) {
	  *filter_etn = idx + sc->min_pos;
	  *filter_time = sc->filter_time[idx];
	  *filter_val = sc->filter_ratio[idx];
	  return 1;
	}
  }
}

/* Same idea as sc_filter_point(), but the data is only valid after
   calling sc_endscan(). Will include logic to avoid reporting points
   outside the range of the input data
*/
int sc_fit_point( scanchop *sc,
    double *fit_etn, double *fit_time, double *fit_val ) {
  double x;
  int idx;
  for ( idx = -1; sc->prev_fit_line_ctr >= 0 && idx < 0; ) {
	idx = check_step( sc, sc->fit_step, 0. );
	if ( sc->fit_step == sc->last_EtnPs )
	  sc->prev_fit_line_ctr = -1;
	sc->fit_step += sc->report_direction;
  }
  if ( idx >= 0 && sc->prev_fit_line_ctr >= 0 ) {
	*fit_etn = idx + sc->min_pos;
	*fit_time = sc->filter_time[idx];
    x = idx + sc->min_pos - sc->prev_fit_line_ctr;
    *fit_val = sc->A + sc->B * x + sc->C * x * x;
	return 1;
  }
  return 0;
}
