%{
  /* no.cmd
   * $Log$
# Revision 1.1  1994/02/17  01:17:04  nort
# Initial revision
#
   */
  #ifdef SERVER
	static unsigned short NO_Flow = 0;
	static unsigned short NO_Peak_Flow = 0;
	static unsigned short NO_Flow_Spread = 0;
	#define N_NO_PRESETS 5
	#define NO_PK_IDX (N_NO_PRESETS/2)
	static unsigned short NO_Preset[N_NO_PRESETS];
	static void NO_Flow_Set(unsigned short value) {
	  if (value > 0x7FF) value = 0x7FF;
	  NO_Flow = value;
	  sbwr(0xE44, value);
	}
	static void NO_Set_Preset(unsigned short Peak, unsigned short Spread) {
	  int i;

	  if (Peak > 0x7FF) Peak = 0x7FF;
	  NO_Peak_Flow = Peak;
	  if (Spread > 0x7FF) Spread = 0x7FF;
	  if (Spread * (N_NO_PRESETS - 1) > 0x7FF)
		Spread = 0x7FF/(N_NO_PRESETS-1);
	  NO_Flow_Spread = Spread;
	  NO_Preset[NO_PK_IDX] = NO_Peak_Flow;
	  for (i = 0; i < N_NO_PRESETS; i++) {
		if (i < NO_PK_IDX) {
		  if (NO_Peak_Flow >= (NO_PK_IDX-i) * NO_Flow_Spread)
			NO_Preset[i] = NO_Peak_Flow - (NO_PK_IDX-i)*NO_Flow_Spread;
		  else
			NO_Preset[i] =
			  NO_Peak_Flow + (N_NO_PRESETS+i-NO_PK_IDX) * NO_Flow_Spread;
		} else {
		  if (NO_Peak_Flow + (i-NO_PK_IDX) * NO_Flow_Spread <= 0x7FF)
			NO_Preset[i] = NO_Peak_Flow + (i-NO_PK_IDX)*NO_Flow_Spread;
		  else if (NO_Preset[i-1] != 0x7FF) NO_Preset[i] = 0x7FF;
		  else NO_Preset[i] =
			NO_Peak_Flow - (N_NO_PRESETS+NO_PK_IDX-i) * NO_Flow_Spread;
		}
	  }
	}
  #endif
%}

&ohcmd
	: NO FLOW SET &set_point5 * { NO_Flow_Set($4); }
	: NO FLOW STEP %d (Enter Difference from Last Flow) *
		{ NO_Flow_Set(NO_Flow + $4); }
	: NO FLOW PEAK &set_point5 * { NO_Set_Preset($4, NO_Flow_Spread); }
	: NO FLOW SPREAD &set_point5 * { NO_Set_Preset(NO_Peak_Flow, $4); }
	: NO FLOW PRESET %d * {
		  if ($4 >= 0 && $4 < N_NO_PRESETS)
			NO_Flow_Set(NO_Preset[$4]);
		}
	;
