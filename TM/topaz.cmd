%{
  #include <math.h>
  #include <string.h>
  #include "cltsrvr.h"
  #include "topaz.h"
  #ifdef SERVER
	Server_Def Topaz = { PAZ, 1, 0, 1, 0, 0, 0, 0 };
	void Topaz_cmd( char *cmd ) {
	  char rmsg[1];
	  CltSend( &Topaz, cmd, rmsg, strlen(cmd)+1, sizeof(rmsg) );
	}
	void Topaz_set( char c, int diode, unsigned short val ) {
	  char buf[20];
	  sprintf( buf, "%c%d:%03d;", c, diode, val );
	  Topaz_cmd( buf );
	}
  #endif
%}
&ohcmd
	: Topaz Emission Start * { Topaz_cmd( "D1;" ); }
	: Topaz Emission Off * { Topaz_cmd( "D0;" ); }
	: Topaz Reboot * { Topaz_cmd( "B1;" ); }
	: Topaz Current &topaz_amps * {
		Topaz_set( 'C', 1, $3 );
		Topaz_set( 'C', 2, $3 );
	  }
	: Topaz Diode &topaz_diode Current &topaz_amps * {
		Topaz_set( 'C', $3, $5 );
	  }
	: Topaz Diode &topaz_diode Temperature &topaz_temp * {
		Topaz_set( 'T', $3, $5 );
	  }
	: Topaz KDP SetPoint &dblr_temp * {
		Topaz_set( 'T', 4, $4 );
	  }
	: Topaz Frequency %d (Enter RepRate in Hz) * {
		char buf[20];
		sprintf( buf, "Q:%d;", $3 );
		Topaz_cmd( buf );
	  }
	: Topaz Set Current Mode * { Topaz_cmd( "M0;" ); }
	: Topaz Set Power Mode * { Topaz_cmd( "M2;" ); }
	;
&topaz_amps <int>
	: %lf (Enter Current in Amps) Amps {
		if ( $1 > 28.0 ) $1 = 28.0;
		$0 = floor($1*100+.5);
	  }
	;
&topaz_temp <int>
	: %lf (Enter Temperature in C) C { $0 = floor($1*10+.5); }
	;
&topaz_diode <int>
	: 1 { $0 = 1; }
	: 2 { $0 = 2; }
	;
&dblr_temp <int>
	: %d (Enter Doubler Setpoint) {
		$0 = $1;
		if ( $1 > 4000 || $1 < 0 ) {
		  nl_error( 1, "Double Setpoint %d out of range", $1 );
		  CANCEL_LINE;
		}
	  }
	;
