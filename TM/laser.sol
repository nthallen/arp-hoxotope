; laser.sol for lab calibration standard titration
; use mode 5 N2 Raman use mode 9.
; modified 12-5-93 for absorption calibrations
; modified 12-6-94 to include altline delta.
; modified 10-8-96 to alternate N2 and O2 levels (mode 6)
; modified 11-6-96 to cut alternating N2 and O2 levels (mode 7)
; modified 11-14-96 to set up SolSt for different modes
; modified 12-5-96 to change H2O with N2 and O2 levels (mode 8)
; modified 12-10-96 change sampling for mode 6 and mode 7
; modified 1-3-97 to change H2O with different N2 and O2 levels
; than mode 8 (this is done by altering mode 7)
; modified 1-9-97 to have constant H2O level in modes 7 & 8
; (Definitions are in hox.slp)
; Add NOF and NOB injectors.
; 
solenoid A1IN  20 21 0      ; Axis 1 In
solenoid A1OUT 22 23 1      ; Axis 1 Out
solenoid A2IN  24 25 2      ; Axis 2 In
solenoid A2OUT 26 27 3      ; Axis 2 Out

solenoid NO  6 7 4            ; NO Solenoid
solenoid NOC 3 2 5            ; NO Flow Closed
solenoid AIR 8 9 6            ; Air Solenoid loop injector
solenoid C3F6 0 1 7           ; C3F6 Solenoid
solenoid NOB 12 13 8		  ; Back NO injector
solenoid NOF 14 15 9		  ; Front NO injector

dtoa NOFlw0 0xE44 {K:1800 L:1400 M:1000 N:600 P:200 Q:300 T:2 A:1 Z:0}
dtoa NOFlw1 0xE44 {G:2000 H:1800 I:1600 U:1400 V:1200 W:1000 X:0}
dtoa NOFlw2 0xE44 {B:800 C:600 D:400 E:200 J:7 F:0 R:2 Y:111}
dtoa NOFlw3 0xE44 {K:2000 L:1500 M:0 N:1000 P:500 Q:300 T:2 A:1 Z:0}
dtoa NOFlw4 0xE44 {K:2000 L:1500 M:0 N:1000 P:500 Q:300 T:2 A:1 Z:0}
dtoa NOFlw7 0xE44 {A:125 B:250 C:500 D:1000 E:125 F:250 G:500 H:1000}

dtoa SolSt0 0x000 {A:0 B:1 C:2 D:3 E:4 F:6 X:99 Y:199 Z:255}
dtoa SolSt1 0x000 {A:10 B:11 C:12 D:13 E:14 F:16 X:99 Y:199 Z:255}
dtoa SolSt2 0x000 {A:20 B:21 C:22 D:23 E:24 F:26 X:99 Y:199 Z:255}
dtoa SolSt5 0x000 {A:50 B:51 C:52 D:53 E:54 F:56 X:99 Y:199 Z:255}
dtoa SolSt6 0x000 {A:60 B:61 C:62 D:63 E:64 F:66 X:99 Y:199 Z:255}
dtoa SolSt7 0x000 {A:70 B:71 C:72 D:73 E:74 F:76 X:99 Y:199 Z:255}
dtoa SolSt8 0x000 {A:80 B:81 C:82 D:83 E:84 F:86 X:99 Y:199 Z:255}
dtoa SolSt9 0x000 {A:90 B:91 C:92 D:93 E:94 F:96 X:99 Y:199 Z:255}

dtoa A4SPt0 0xE50 {K:2000 L:1300 M:700 Z:0}
dtoa A5SPt0 0xE52 {K:2000 L:1300 M:700 Z:0 A:0}
dtoa A6SPt0 0xE54 {A:125 B:250 C:500 D:1000 E:125 F:250 G:500 H:1000}
dtoa A4SPt1 0xE50 {K:1000 L:650 M:350 Z:0}
dtoa A5SPt1 0xE52 {K:1000 L:650 M:350 Z:0}
dtoa A4SPt7 0xE50 {K:1700 L:425 M:850 N:1275 Z:0}
dtoa A5SPt7 0xE52 {K:1700 L:425 M:850 N:1275 Z:0}
dtoa A6SPt7 0xE54 {A:125 B:250 C:500 D:1000 E:125 F:250 G:500 H:1000}

Resolution = 1/1

mode 0 {
  Etalon: O
  NO:     _
  NOC:    O
  NOFlw0: Z
  A4SPt0: Z
  A5SPt0: Z
  AIR:    _
  A1IN:   _
  A1OUT:  _
  A2IN:   _
  A2OUT:  _
  SolSt0: A
}

mode 1 {
  Etalon: _____:OOOOO:+++++:OOOOO:
  SolSt1: ADDDD:DDDDD:ADDDD:DDDDD:^
}

mode 3 {
  Etalon: _____:OOOO:_____:OOOOOO:
  C3F6:   O____:____:_____:______:
  A1IN:   _____:____:OOO__:______:
  A1OUT:  OOO__:____:_____:______:
  A2IN:   _____:____:OOO__:______:
  A2OUT:  OOO__:____:_____:______:^
}

mode 4 {
  Etalon: OOOO
  A1IN:   OOO_
  A1OUT:  ____
  A2IN:   OOO_
  A2OUT:  ____
  AIR:    ____
  NO:     ____
  NOC:    OOOO
  NOFlw0: ZZZZ
  C3F6:   ____
  Select 0
}
;LIF for big flow
mode 5 {
  A1IN:   OOO_:____:____:____:____:____:____:____:____:____:____:____:
  A2IN:   OOO_:____:____:____:____:____:____:____:____:____:____:____:
  Etalon: __OO:OOOO:++OO:OOOO:__OO:OOOO:++OO:OOOO:__OO:OOOO:++OO:OOOO:
  SolSt5: ADDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:
  NOFlw4: LLLL:LLLL:LLLL:LLLL:LLLL:LLLL:LLLL:LLLL:LLLL:LLLL:PPPP:PPPP:
  NOC:    ____:____:____:____:____:____:____:____:____:____:____:____:
  
  A1IN:   ____:____:____:____:____:____:____:____:____:____:____:____:
  A2IN:   ____:____:____:____:____:____:____:____:____:____:____:____:
  Etalon: __OO:OOOO:++OO:OOOO:__OO:OOOO:++OO:OOOO:__OO:OOOO:++OO:OOOO:
  SolSt5: DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:
  NOFlw4: PPPP:PPPP:PPPP:PPPP:PPPP:PPPP:PPPP:PPPP:ZZZZ:ZZZZ:ZZZZ:ZZZZ:
  NOC:    ____:____:____:____:____:____:____:____:OOOO:OOOO:OOOO:OOOO:^
  
}


; N2O2 swapsies
mode 6 {
  
  A1IN:   OOO___:______:______:______:______:______:______:______:
  A2IN:   OOO___:______:______:______:______:______:______:______:
  Etalon: ______:OOOOOO:++++++:OOOOOO:______:OOOOOO:++++++:OOOOOO:
  SolSt6: ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:
  A4SPt0: KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:
  A5SPt0: ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:
  NOC:    ______:______:______:______:______:______:______:______:
 
  A1IN:   ______:______:______:______:______:______:______:______:
  A2IN:   ______:______:______:______:______:______:______:______:
  Etalon: ______:OOOOOO:++++++:OOOOOO:______:OOOOOO:++++++:OOOOOO:
  SolSt6: ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:
  A4SPt0: LLLLLL:LLLLLL:LLLLLL:LLLLLL:MMMMMM:MMMMMM:MMMMMM:MMMMMM:
  A5SPt0: MMMMMM:MMMMMM:MMMMMM:MMMMMM:LLLLLL:LLLLLL:LLLLLL:LLLLLL:
  NOC:    ______:______:______:______:______:______:______:______:
 
  A1IN:   ______:______:______:______:______:______:______:______:
  A2IN:   ______:______:______:______:______:______:______:______:
  Etalon: ______:OOOOOO:++++++:OOOOOO:______:OOOOOO:++++++:OOOOOO:
  SolSt6: ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:
  A4SPt0: ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:ZZZZZZ:
  A5SPt0: KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:KKKKKK:
  NOC:    ______:______:______:______:______:______:______:______:
 
  A1IN:   ______:______:______:______:______:______:______:______:
  A2IN:   ______:______:______:______:______:______:______:______:
  Etalon: ______:OOOOOO:++++++:OOOOOO:______:OOOOOO:++++++:OOOOOO:
  SolSt6: ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:
  A4SPt0: MMMMMM:MMMMMM:MMMMMM:MMMMMM:LLLLLL:LLLLLL:LLLLLL:LLLLLL:
  A5SPt0: LLLLLL:LLLLLL:LLLLLL:LLLLLL:MMMMMM:MMMMMM:MMMMMM:MMMMMM:
  NOC:    ______:______:______:______:OOOOOO:OOOOOO:OOOOOO:OOOOOO:^
  
}


;H2O Switch with N2 O2 swapsies (5 and 10% O2)
mode 7 {

  A1IN:   OOO__:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   OOO__:_____:_____:_____:_____:_____:_____:_____:
  Etalon: _____:_____:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  SolSt7: EEEEE:EEEEE:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:
  A4SPt7: LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:
  A5SPt7: NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:
  A6SPt7: AAAAA:AAAAA:AAAAA:AAAAA:BBBBB:BBBBB:CCCCC:CCCCC:
  
  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  SolSt7: BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:
  A4SPt7: LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:LLLLL:
  A5SPt7: NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:NNNNN:
  A6SPt7: DDDDD:DDDDD:CCCCC:CCCCC:BBBBB:BBBBB:AAAAA:AAAAA:

  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  SolSt7: YYYCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:
  A4SPt7: MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:
  A5SPt7: MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:
  A6SPt7: EEEEE:EEEEE:FFFFF:FFFFF:GGGGG:GGGGG:HHHHH:HHHHH:
  
  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:_____:_____:
  SolSt7: CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:FFFFF:FFFFF:
  A4SPt7: MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:
  A5SPt7: MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:
  A6SPt7: GGGGG:GGGGG:FFFFF:FFFFF:EEEEE:EEEEE:EEEEE:EEEEE:

  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: _____:OOOOO:+++++:OOOOO:_____:OOOOO:+++++:OOOOO:
  SolSt7: ADDDD:DDDDD:ADDDD:DDDDD:ADDDD:DDDDD:ADDDD:DDDDD:
  A4SPt7: MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:
  A5SPt7: MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:MMMMM:
  A6SPt7: AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:^

}

;H20 Switch with N2 O2 swapsies
mode 8 {

  A1IN:   OOO__:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   OOO__:_____:_____:_____:_____:_____:_____:_____:
  Etalon: _____:_____:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  SolSt8: EEEEE:EEEEE:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:
  A4SPt7: KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:
  A5SPt7: ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:
  A6SPt7: AAAAA:AAAAA:AAAAA:AAAAA:BBBBB:BBBBB:CCCCC:CCCCC:
  
  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  SolSt8: BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:BBBBB:
  A4SPt7: KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:
  A5SPt7: ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:
  A6SPt7: DDDDD:DDDDD:CCCCC:CCCCC:BBBBB:BBBBB:AAAAA:AAAAA:

  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  SolSt8: YYYCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:
  A4SPt7: ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:
  A5SPt7: KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:
  A6SPt7: EEEEE:EEEEE:FFFFF:FFFFF:GGGGG:GGGGG:HHHHH:HHHHH:
  
  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:_____:_____:
  SolSt8: CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:FFFFF:FFFFF:
  A4SPt7: ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:
  A5SPt7: KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:
  A6SPt7: GGGGG:GGGGG:FFFFF:FFFFF:EEEEE:EEEEE:EEEEE:EEEEE:

  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: _____:OOOOO:+++++:OOOOO:_____:OOOOO:+++++:OOOOO:
  SolSt8: ADDDD:DDDDD:ADDDD:DDDDD:ADDDD:DDDDD:ADDDD:DDDDD:
  A4SPt7: ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:ZZZZZ:
  A5SPt7: KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:KKKKK:
  A6SPt7: AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:AAAAA:^

}
; N2
mode 9	{
  A1OUT:  OOO___:______:______:______:______:______:______:______:
  A2OUT:  OOO___:______:______:______:______:______:______:______:
  Etalon: ______:OOOOOO:++++++:OOOOOO:______:OOOOOO:++++++:OOOOOO:
  SolSt9: ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:ADDDDD:DDDDDD:
  C3F6:   O_____:______:______:______:______:______:______:______:^

}
; peakup mode
mode 2	{
  A1IN:   OOO_:____:____:____:____:____:____:____:____:____:____:____:
  A2IN:   OOO_:____:____:____:____:____:____:____:____:____:____:____:
  Etalon: OO__:OO++:OO__:OO++:OO__:OO++:OO__:OO++:OO__:OO++:OO__:OO++:
  NOFlw3: PPPP:LLLL:PPPP:LLLL:PPPP:LLLL:PPPP:LLLL:PPPP:LLLL:PPPP:LLLL:
  SolSt2: DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:^
select 6
}
