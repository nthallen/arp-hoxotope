&h2ocmd 
	: Soldrv Select Mode %d (Enter Mode Number) * { send_dascmd(DCT_SOLDRV_B, $4, 0); }
	: Lamp On * { send_dascmd(DCT_SCDC, 82, 0); }
	: Lamp Off * { send_dascmd(DCT_SCDC, 83, 0); }
	: Chopper In On * { send_dascmd(DCT_SCDC, 84, 0); }
	: Chopper In Off * { send_dascmd(DCT_SCDC, 85, 0); }
	: Heater On * { send_dascmd(DCT_SCDC, 86, 0); }
	: Heater Off * { send_dascmd(DCT_SCDC, 87, 0); }
	: Chopper Out On * { send_dascmd(DCT_SCDC, 94, 0); }
	: Chopper Out Off * { send_dascmd(DCT_SCDC, 95, 0); }
	: RF Set %d (Enter Set Point Value) * { sbwr(0xE20, $3); }
	: Wet Air On * { send_dascmd(DCT_SCDC, 10, 0); }
	: Wet Air Off * { send_dascmd(DCT_SCDC, 11, 0); }
	: Heater Set %d (Enter Heater Set Point Value) * {
	     sbwr(0xE22, $3); }
	;
