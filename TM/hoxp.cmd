%{
  /* strat.cmd */
  #ifdef SERVER
	#include "subbus.h"
	#include "collect.h"
	#include "CmdData.h"

	static send_id CmdData_id;
	static CmdData_t CmdData;

	static struct {
	  unsigned short addr;
	  unsigned short value;
	} AdjGates[] = {
	  /* 1A */ 0x604, 0x0000,
	  /* 1B */ 0x606, 0x0000,
	  /* 2A */ 0x644, 0x0000,
	  /* 2B */ 0x646, 0x0000
	};
	typedef enum { Gt1A, Gt1B, Gt2A, Gt2B };

	static void Set_AdjGate( unsigned short gate, unsigned short dly,
			  int inc, int val ) {
	  unsigned short data;
	  int width, delay, *dp;
	  
	  if ( gate <= Gt2B ) {
		data = AdjGates[gate].value;
		width = data & 0xFF;
		delay = (data>>8) & 0xFF;
		dp = dly ? &delay : &width;
		if ( inc ) *dp += val;
		else *dp = val;
		if ( *dp < 0 ) *dp = 0;
		else if( *dp > 255 ) *dp = 255;
		data = ( delay << 8 ) + width;
		AdjGates[gate].value = data;
		sbwr( AdjGates[gate].addr, data );
	  } else {
		msg( 1, "Set_AdjGate(%d) out of range", gate );
	  }
	}
	static void DitherGate( void ) {
	  static unsigned char rdelay = 0;
	  unsigned char rdly = rdelay, delay = 0;
	  int i;
	  for ( i = 0; i < 8; i++ ) {
		delay = (delay << 1) + (rdly & 1);
		rdly >>= 1;
	  }
	  rdelay++;
	  Set_AdjGate( Gt2B, 1, 0, delay );
	}
  #endif
%}
&command
	: OH * &ohcmds *
	: OH &ohcmdset
	: Fail %d (1 = Operate Fail  2 = Record Fail  3 = Both) *
		{ set_failure( $2 & 3 ); }
	;
&ohcmds
	:
	: &ohcmds &ohcmdset
	;
&ohcmdset
	: &ohcmd
	: &indexer_cmd
	: AdjGate &AdjGate &WdDly &SetAdd %d * {
		Set_AdjGate( $2, $3, $4, $5 );
	  }
	: &CmdData {
		if ( CmdData_id == 0 )
		  CmdData_id = Col_send_init( "CmdData", &CmdData,
			sizeof( CmdData ) );
		Col_send( CmdData_id );
	  }
	: PSD Select Dye Laser * { DigSelect( 52, 0xFFFF ); }
	: PSD Select XLas * { DigSelect( 52, 0x0000 ); }
	;
&CmdData
	: SW Status Value to %d * { CmdData.SW_St = $5; }
	: SW Status &SWFlags * { CmdData.SW_St = $3; }
	: Peakup On * { CmdData.SW_St = SWS_PKUP_ON; }
	: Peakup Off * { CmdData.SW_St = SWS_PKUP_OFF; }
	;

&SWFlags <int>
	: Altitude Takeoff { $0 = 1; }
	: Altitude Cruise { $0 = 2; }
	: Altitude Descend { $0 = 3; }
	: Altitude Land { $0 = 4; }
	: C3F6 Addition Enable { $0 = 12; }
	: C3F6 Addition Disable { $0 = 13; }
	: Scan Mode Always { $0 = 14; }
	: Scan Mode By Pressure { $0 = 15; }
	: Diodes On { $0 = 18; }
	: Diodes Off { $0 = 19; }
	: File Read { $0 = 200; }
	: H2O Lamp Enable { $0 = 25; }
	: H2O Lamp Off { $0 = 26; }
	: Laser Power On { $0 = 16; }
	: Laser Power Off { $0 = 17; }
	: Peakup On { $0 = 20; }
	: Peakup Off { $0 = 21; }
	: Proceed { $0 = 22; }
	: Green Peakup Enable { $0 = 23; }
	: Green Peakup Disable { $0 = 24; }
	: Shutoff { $0 = 255; }
	;

&command
	: H2O &h2ocmd
	: H2O * &h2ocmds *
	;
&h2ocmds
	:
	: &h2ocmds &h2ocmd
	;
&h2ocmd
	: Analog Output &adchan Set Point &set_point5 * { sbwr( $3, $6 ); }
	;
&adchan <unsigned short>
	: 4 { $0 = 0xE50; }
	: 5 { $0 = 0xE52; }
	: 6 { $0 = 0xE54; }
	;

&AdjGate <unsigned short>
	: 1A { $0 = Gt1A; }
	: 1B { $0 = Gt1B; }
	: 2A { $0 = Gt2A;; }
	: 2B { $0 = Gt2B; }
	;
&WdDly <unsigned short>
	: Width { $0 = 0; }
	: Delay { $0 = 1; }
	;
&SetAdd <int>
	: Set { $0 = 0; }
	: Add { $0 = 1; }
	;

&set_point <unsigned short>
	: %d (Enter Set Point Value)
	  { $0 = ($1 < 0) ? 0 : (($1 > 0xFFF) ? 0xFFF : $1); }
	;
&set_point5 <unsigned short>
	: %d (Enter Set Point Value)
	  { $0 = ($1 < 0) ? 0 : (($1 > 0x7FF) ? 0x7FF : $1); }
	;
