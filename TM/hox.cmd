&ohcmd 
	: AIR SOLENOID LOOP INJECTOR OFF * { send_dascmd(DCT_SCDC, 9, 0); }
	: AIR SOLENOID LOOP INJECTOR ON * { send_dascmd(DCT_SCDC, 8, 0); }
	: Analog Output 0 Set &set_point * { sbwr(0xE40, $5); }
	: Analog Output 1 Set &set_point * { sbwr(0xE42, $5); }
	: Analog Output 3 Set &set_point * { sbwr(0xE46, $5); }
	: Analog Output 4 Set &set_point * { sbwr(0xE50, $5); }
	: Analog Output 5 Set &set_point * { sbwr(0xE52, $5); }
	: Analog Output 6 Set &set_point * { sbwr(0xE54, $5); }
	: Analog Output 7 Set &set_point * { sbwr(0xE56, $5); }
	: AXIS 1 FILTER IN OFF * { send_dascmd(DCT_SCDC, 21, 0); }
	: AXIS 1 FILTER IN ON * { send_dascmd(DCT_SCDC, 20, 0); }
	: AXIS 1 FILTER OUT OFF * { send_dascmd(DCT_SCDC, 23, 0); }
	: AXIS 1 FILTER OUT ON * { send_dascmd(DCT_SCDC, 22, 0); }
	: AXIS 2 FILTER IN OFF * { send_dascmd(DCT_SCDC, 25, 0); }
	: AXIS 2 FILTER IN ON * { send_dascmd(DCT_SCDC, 24, 0); }
	: AXIS 2 FILTER OUT OFF * { send_dascmd(DCT_SCDC, 27, 0); }
	: AXIS 2 FILTER OUT ON * { send_dascmd(DCT_SCDC, 26, 0); }
	: C3F6 SOLENOID OFF * { send_dascmd(DCT_SCDC, 1, 0); }
	: C3F6 SOLENOID ON * { send_dascmd(DCT_SCDC, 0, 0); }
	: DYE PUMP OFF * { send_dascmd(DCT_SCDC, 33, 0); }
	: DYE PUMP ON * { send_dascmd(DCT_SCDC, 32, 0); }
	: Injector Back OFF * { send_dascmd(DCT_SCDC, 13, 0); }
	: Injector Back ON * { send_dascmd(DCT_SCDC, 12, 0); }
	: Injector Front OFF * { send_dascmd(DCT_SCDC, 15, 0); }
	: Injector Front ON * { send_dascmd(DCT_SCDC, 14, 0); }
	: LASER POWER OFF * { send_dascmd(DCT_SCDC, 35, 0); }
	: LASER POWER ON * { send_dascmd(DCT_SCDC, 34, 0); }
	: NO FLOW CLOSED OFF * { send_dascmd(DCT_SCDC, 2, 0); }
	: NO FLOW CLOSED ON * { send_dascmd(DCT_SCDC, 3, 0); }
	: NO PURGE OFF * { send_dascmd(DCT_SCDC, 5, 0); }
	: NO PURGE ON * { send_dascmd(DCT_SCDC, 4, 0); }
	: NO SOLENOID OFF * { send_dascmd(DCT_SCDC, 7, 0); }
	: NO SOLENOID ON * { send_dascmd(DCT_SCDC, 6, 0); }
	: Power 28V Switched Off * { send_dascmd(DCT_SCDC, 47, 0); }
	: Power 28V Switched On * { send_dascmd(DCT_SCDC, 46, 0); }
	: Power OH Cell Off * { send_dascmd(DCT_SCDC, 45, 0); }
	: Power OH Cell On * { send_dascmd(DCT_SCDC, 44, 0); }
	: Power Solenoids and Steppers Off * { send_dascmd(DCT_SCDC, 51, 0); }
	: Power Solenoids and Steppers On * { send_dascmd(DCT_SCDC, 50, 0); }
	: SECONDARY CLOSURE VLV CLOSED OFF * { send_dascmd(DCT_SCDC, 19, 0); }
	: SECONDARY CLOSURE VLV CLOSED ON * { send_dascmd(DCT_SCDC, 18, 0); }
	: SECONDARY CLOSURE VLV OPEN OFF * { send_dascmd(DCT_SCDC, 17, 0); }
	: SECONDARY CLOSURE VLV OPEN ON * { send_dascmd(DCT_SCDC, 16, 0); }
	: Soldrv Select Mode %d (Enter Mode Number) * { send_dascmd(DCT_SOLDRV_A, $4, 0); }
	: Laser COOLANT PUMP OFF * { send_dascmd(DCT_SCDC, 43, 0); }
	: Laser COOLANT PUMP ON * { send_dascmd(DCT_SCDC, 42, 0); }
	;
