%{
  /* Modified from /usr/local/lib/src/idx64.cmd to remove
    &command : &indexer_cmd, since we want to put it elsewhere
  */
  #include "idx64.h"
  #ifdef SERVER

	/* This assumes that we are chopping only one drive (the
	   Etalon). */
	static short int alt_delta = 0, alt_delta_delta = 0;
  #endif
%}

&indexer_cmd
	: Drive &drive &direction &steps * { idx64_drive($2,$3,$4); }
	: Scan &drive &direction &steps by %d (Enter Steps per Step) *
		{ idx64_scan($2,$3,$4,$6); }
	: Stop &drive * { idx64_stop($2); }
	: Drive &drive Online * { idx64_online($2); }
	: Drive &drive Offline * {
		idx64_offline($2);
		if ( $2 == 1 ) DitherGate(); /* Etalon */
	  }
	: Drive &drive Altline * { idx64_altline($2); }
	: Preset &drive Position to &steps * { idx64_preset($2, $5); }
	: Set &drive Online Position %d (Enter Online Position) *
		{ idx64_set_online($2, $5); }
	: Set &drive Online Delta
		%d (Enter positive number of steps between dithered online positions) *
		  { idx64_online_delta($2, $5); }
	: Set &drive Offline Delta
		%d (Enter signed number of steps from Online to Offline position) *
		  { idx64_offline_delta($2, $5); }
	: Set &drive Offline Position %d (Enter Offline Position) *
		{ idx64_offline_pos($2, $5); }
	: Set &drive Altline Delta
		%d (Enter signed number of steps from Online to Altline position) *
		  { idx64_altline_delta($2, $5);
		    if ( $2 == 1 ) alt_delta = $5;
		  }
	: Set &drive Altline Position %d (Enter Altline Position) *
		{ idx64_altline_pos($2, $5); }
	: Set &drive Hysteresis %d (Enter Hysteresis Amount) *
		{ idx64_hysteresis($2, $4); }
	: Set &drive Speed &ix_rate Hz * { idx64_speed( $2, $4<<8 ); }
	: Move &drive Online Position Out * { idx64_move_out($2); }
	: Move &drive Online Position In * { idx64_move_in($2); }
	: Set Altline Increment %d *
		{ alt_delta_delta = $4; }
	: Increase Etalon Altline Delta *
		{ alt_delta += alt_delta_delta;
		  idx64_altline_delta( 1, alt_delta ); }
	: Decrease Etalon Altline Delta *
		{ alt_delta -= alt_delta_delta;
		  idx64_altline_delta( 1, alt_delta ); }
	;
&drive <byte_t>
	: Channel %d (Enter Channel Number from 0-?) { $0 = $2; }
	;
&direction <byte_t>
	: In { $0 = IX64_IN; }
	: Out { $0 = IX64_OUT; }
	: To { $0 = IX64_TO; }
	;
&steps <step_t>
	: %d (Enter Number of Steps or Step Number) { $0 = $1; }
	;
&ix_rate < int >
	: 53 { $0 = 0; }
	: 80 { $0 = 1; }
	: 107 { $0 = 2; }
	: 160 { $0 = 3; }
	: 267 { $0 = 4; }
	: 400 { $0 = 5; }
	: 533 { $0 = 6; }
	: 800 { $0 = 7; }
	: 1067 { $0 = 8; }
	: 1600 { $0 = 9; }
	: 2133 { $0 = 10; }
	: 3200 { $0 = 11; }
	: 5333 { $0 = 12; }
	: 8000 { $0 = 13; }
	: 10667 { $0 = 14; }
	: 16000 { $0 = 15; }
	;
