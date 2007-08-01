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
		nl_error( 1, "Set_AdjGate(%d) out of range", gate );
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
#	: OH * &ohcmds *
	: &ohcmdset
	: Fail %d (1 = Operate Fail  2 = Record Fail  3 = Both) *
		{ set_failure( $2 & 3 ); }
	;
# &ohcmds
#	:
#	: &ohcmds &ohcmdset
#	;
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
	: Pinch Valve Set Pressure Setpoint &pvgain * { CmdData.PV_SetP = $6; }
	: Pinch Valve Set Gain Gi &pvgain * { CmdData.PV_Gi = $6; }
	: Pinch Valve Set Gain Gp &pvgain * { CmdData.PV_Gp = $6; }
	;

&SWFlags <int>
	: Altitude Takeoff, eh? { $0 = SWS_TAKEOFF; }
	: Altitude Cruise { $0 = SWS_CRUISE; }
	: Altitude Descend { $0 = SWS_DESCEND; }
	: Altitude Land { $0 = SWS_LAND; }
	: Scan Mode Always { $0 = SWS_SCAN_ALWAYS; }
	: Scan Mode By Pressure { $0 = SWS_SCAN_BY_P; }
	: Scan Mode Standby { $0 = SWS_STANDBY; }
	: Diodes On { $0 = SWS_DIODES_ON; }
	: Diodes Off { $0 = SWS_DIODES_OFF; }
	: File Read { $0 = SWS_LAB_READ; }
	: Laser Power On { $0 = SWS_LASER_ON; }
	: Laser Power Off { $0 = SWS_LASER_OFF; }
	: Peakup On { $0 = SWS_PKUP_ON; }
	: Peakup Off { $0 = SWS_PKUP_OFF; }
	: Timewarp { $0 = SWS_TIMEWARP; }
	: Green Peakup Enable { $0 = SWS_GRNPK_ON; }
	: Green Peakup Disable { $0 = SWS_GRNPK_OFF; }
	: Green Peakup Scan { $0 = SWS_GRNPK_SCAN; }
	: Pinch Valve Close { $0 = SWS_PV_CLOSE; }
	: Pinch Valve Regulate by Steps { $0 = SWS_PV_STEPS; }
	: Pinch Valve Regulate by PI { $0 = SWS_PV_PI; }
	: Pinch Valve Scan { $0 = SWS_PV_SCAN; }
    : PD Valve Regulate { $0 = SWS_PDV_PI; }
	: Shutoff { $0 = 255; }
	;

#&command
#	: H2O &h2ocmd
#	: H2O * &h2ocmds *
#	;
#&h2ocmds
#	:
#	: &h2ocmds &h2ocmd
#	;
#&h2ocmd
#	: Analog Output &adchan Set Point &set_point5 * { sbwr( $3, $6 ); }
#	;
#&adchan <unsigned short>
#	: 4 { $0 = 0xE50; }
#	: 5 { $0 = 0xE52; }
#	: 6 { $0 = 0xE54; }
#	;

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
