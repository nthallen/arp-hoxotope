%{
  /* strat.cmd */
  #ifdef SERVER
	#include "subbus.h"
	#include "collect.h"
	#include "CmdData.h"

	static send_id CmdData_id;
	static CmdData_t CmdData;
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
	: Adjustable Gate &adj Delay &adjv Width &adjv *
	  { sbwr($3, ($5 << 8) + $7); }
	: &CmdData {
		if ( CmdData_id == 0 )
		  CmdData_id = Col_send_init( "CmdData", &CmdData,
			sizeof( CmdData ) );
		Col_send( CmdData_id );
	  }
	;
&CmdData
	: SW Status Bit &bitno Set * {
		if ($4 < 8)
		  CmdData.SW_St |= (1<<$4);
	  }
	: SW Status Bit &bitno Clear * {
		if ($4 < 8)
		  CmdData.SW_St &= ~(1<<$4);
	  }
	: Peakup On * { CmdData.SW_St |= 0x80; }
	: Peakup Off * { CmdData.SW_St &= ~0x80; }
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

&adj <unsigned short>
	: 0 { $0 = 0x64E; }
	: 1 { $0 = 0x65E; }
	: 2 { $0 = 0x66E; }
	;
&adjv <unsigned short>
	: %d (Enter 0-255) { $0 = ($1 < 0) ? 0 : (($1 > 255) ? 255 : $1); }
	;
&set_point <unsigned short>
	: %d (Enter Set Point Value)
	  { $0 = ($1 < 0) ? 0 : (($1 > 0xFFF) ? 0xFFF : $1); }
	;
&set_point5 <unsigned short>
	: %d (Enter Set Point Value)
	  { $0 = ($1 < 0) ? 0 : (($1 > 0x7FF) ? 0x7FF : $1); }
	;
&bitno <unsigned short>
	: %d (Enter Bit Number 0-7) { $0 = $1; }
	;
