; laser.sol
; modified 02/20/2000 for lab

solenoid A1IN  20 21 0      ; Axis 1 In
solenoid A1OUT 22 23 1      ; Axis 1 Out
solenoid A2IN  24 25 2      ; Axis 2 In
solenoid A2OUT 26 27 3      ; Axis 2 Out

solenoid NO  6 7 4            ; NO Solenoid
solenoid NOC 3 2 5            ; NO Flow Closed
solenoid AIR 8 9 6            ; Air Solenoid loop injector
solenoid C3F6 0 1 7           ; C3F6 Solenoid
solenoid NOB 12 13 8		  ; Back NO injector (Injector Back)
solenoid NOF 14 15 9		  ; Front NO injector (Injector Front)

; NOFlwF contains the flows for the front injector.
; NOFlwB contains the flows for the back injector.
dtoa NOFlwF 0xE84 {K:550 L:400 M:320 N:240 P:150 Q:100 T:2 A:1 Z:0}
dtoa NOFlwB 0xE84 {K:2047 L:1500 M:1200 N:900 P:550 Q:350 T:2 A:1 Z:0}
dtoa SolSt0 0x000 {A:0 B:1 C:2 D:3 E:4 F:5 G:6 H:7 I:8 _:255 
					J:10 K:11 L:12 M:13 N:14 Q:15 R:16 S:17 T:18 U:19}

Resolution = 1/1

mode 0 {
  Etalon: O
  NO:     _
  NOC:    O
  NOFlwF: Z
  AIR:    _
  A1IN:   _
  A1OUT:  _
  A2IN:   _
  A2OUT:  _
  NOF:    _
  NOB:    _
  C3F6:   _
  SolSt0: J
}


mode 1 {
  A1IN:   _____:____:OOO__:____:____:____:____:____:
  A1OUT:  OOO__:____:_____:____:____:____:____:____:
  A2IN:   _____:____:OOO__:____:____:____:____:____:
  A2OUT:  OOO__:____:_____:____:____:____:____:____:
  Etalon: _____:OOOO:+++++:OOOO:____:OOOO:++++:OOOO:
  AIR:    OOOOO:OOOO:OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NO:     _____:____:_____:____:OOOO:OOOO:OOOO:OOOO:
  NOC:    OOOOO:OOOO:OOOOO:OOOO:____:____:____:____:
  NOPre:  00000:0000:00000:0000:CCCC:CCCC:CCCC:CCCC:
  NOF:    _____:____:_____:____:____:____:____:____:
  NOB:    OOOOO:OOOO:OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  C3F6:   _____:____:_____:____:____:____:____:____:
  SolSt0: KFFFF:FFFF:LMHHH:DDDD:MHHH:DDDD:MHHH:DDDD:^

  A1IN:   ____:____:____:____:____:____:____:____:
  A1OUT:  ____:____:____:____:____:____:____:____:
  A2IN:   ____:____:____:____:____:____:____:____:
  A2OUT:  ____:____:____:____:____:____:____:____:
  Etalon: ____:OOOO:++++:OOOO:____:OOOO:++++:OOOO:
  AIR:    OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NO:     ____:____:____:____:OOOO:OOOO:OOOO:OOOO:
  NOC:    OOOO:OOOO:OOOO:OOOO:____:____:____:____:
  NOPre:  0000:0000:0000:0000:CCCC:CCCC:CCCC:CCCC:
  NOF:    ____:____:____:____:____:____:____:____:
  NOB:    OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  C3F6:   ____:____:____:____:____:____:____:____:
  SolSt0: MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:^

  A1IN:   ____:____:____:____:____:____:____:____:
  A1OUT:  ____:____:____:____:____:____:____:____:
  A2IN:   ____:____:____:____:____:____:____:____:
  A2OUT:  ____:____:____:____:____:____:____:____:
  Etalon: ____:OOOO:++++:OOOO:____:OOOO:++++:OOOO:
  AIR:    OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NO:     ____:____:____:____:OOOO:OOOO:OOOO:OOOO:
  NOC:    OOOO:OOOO:OOOO:OOOO:____:____:____:____:
  NOPre:  0000:0000:0000:0000:CCCC:CCCC:CCCC:CCCC:
  NOF:    ____:____:____:____:____:____:____:____:
  NOB:    OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  C3F6:   ____:____:____:____:____:____:____:____:
  SolSt0: MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:^

}

mode 2 {
  A1IN:   _____:____:OOO__:____:____:____:____:____:
  A1OUT:  OOO__:____:_____:____:____:____:____:____:
  A2IN:   _____:____:OOO__:____:____:____:____:____:
  A2OUT:  OOO__:____:_____:____:____:____:____:____:
  Etalon: _____:OOOO:+++++:OOOO:____:OOOO:++++:OOOO:
  AIR:    _____:____:_____:____:____:____:____:____:
  NO:     _____:____:_____:____:____:____:____:____:
  NOC:    OOOOO:OOOO:OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NOPre:  00000:0000:00000:0000:0000:0000:0000:0000:
  NOF:    _____:____:_____:____:____:____:____:____:
  NOB:    _____:____:_____:____:____:____:____:____:
  C3F6:   _____:____:_____:____:____:____:____:____:
  SolSt0: QQQQQ:QQQQ:QQQQQ:QQQQ:QQQQ:QQQQ:QQQQ:QQQQ:^
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
  NOFlwF: ZZZZ
  C3F6:   ____
  NOF:    ____
  NOB:    ____
  SolSt0: DDDD
  Select 0
}

; N2 filter mode, followed by OH at both axes

mode 5 {
  A1IN:   ______:______:______:
  A1OUT:  OOO___:______:______:
  A2IN:   ______:______:______:
  A2OUT:  OOO___:______:______:
  Etalon: ___OOO:___OOO:___OOO:
  AIR:    ______:______:______:
  NO:     ______:______:______:
  NOC:    OOOOOO:OOOOOO:OOOOOO:
  NOPre:  000000:000000:000000:
  NOF:    ______:______:______:
  NOB:    ______:______:______:
  C3F6:   ______:______:______:
  SolSt0: AAADDD:FFFDDD:FFFDDD:^
}

; OH at axis 1, HO2 at axis 2 
 
mode 6 {
  A1IN:   _____:_____:_____:_____:_____:_____:
  A1OUT:  _____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:
  A2OUT:  _____:_____:_____:_____:_____:_____:
  Etalon: ___OO:OOOOO:OOOOO:+++OO:OOOOO:OOOOO:
  AIR:    OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  NO:     OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  NOC:    _____:_____:_____:_____:_____:_____:
  NOPre:  CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:
  NOF:    _____:_____:_____:_____:_____:_____:
  NOB:    OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  C3F6:   _____:_____:_____:_____:_____:_____:
  SolSt0: CHH__:_____:_____:CHH__:_____:_____:



  A1IN:   _____:_____:_____:_____:_____:_____:_____:_____:_____:
  A1OUT:  _____:_____:_____:_____:_____:_____:_____:_____:_____:
  A2IN:   _____:_____:_____:_____:_____:_____:_____:_____:_____:
  A2OUT:  _____:_____:_____:_____:_____:_____:_____:_____:_____:
  Etalon: ___OO:OOOOO:OOOOO:+++OO:OOOOO:OOOOO:___OO:OOOOO:OOOOO:
  AIR:    OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  NO:     OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  NOC:    _____:_____:_____:_____:_____:_____:_____:_____:_____:
  NOPre:  CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:CCCCC:
  NOF:    _____:_____:_____:_____:_____:_____:_____:_____:_____:
  NOB:    OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:OOOOO:
  C3F6:   _____:_____:_____:_____:_____:_____:_____:_____:_____:
  SolSt0: CHH__:_____:_____:CHH__:_____:_____:CHH__:_____:_____:
  Select 7
}
; Scan NO at back injector

mode 7 {
  A1IN:   _____:_____:_____:
  A1OUT:  _____:_____:_____:
  A2IN:   _____:_____:_____:
  A2OUT:  _____:_____:_____:
  Etalon: +++OO:OOOOO:OOOOO:
  AIR:    OOOOO:OOOOO:OOOOO:
  NO:     OOOOO:OOOOO:OOOOO:
  NOC:    _____:_____:_____:
  NOFlwB: KKKKK:LLMMN:NPPQQ:
  NOF:    _____:_____:_____:
  NOB:    OOOOO:OOOOO:OOOOO:
  C3F6:   _____:_____:_____:
  SolSt0: IHHGG:GGGGG:GGGGG:^
  Select 8
}
; Scan NO at front injector

mode 8 {
  A1IN:   _____:_____:_____:
  A1OUT:  _____:_____:_____:
  A2IN:   _____:_____:_____:
  A2OUT:  _____:_____:_____:
  Etalon: ___OO:OOOOO:OOOOO:
  AIR:    OOOOO:OOOOO:OOOOO:
  NO:     OOOOO:OOOOO:OOOOO:
  NOC:    _____:_____:_____:
  NOFlwF: KKKKK:LLMMN:NPPQQ:
  NOF:    OOOOO:OOOOO:OOOOO:
  NOB:    _____:_____:_____:
  C3F6:   _____:_____:_____:
  SolSt0: EHHGG:GGGGG:GGGGG:^
  Select 5
}
; Add C3F6 at front injector.
mode 9 {
  A1IN:   OOO__:____:____:____:____:____:____:____:
  A1OUT:  _____:____:____:____:____:____:____:____:
  A2IN:   OOO__:____:____:____:____:____:____:____:
  A2OUT:  _____:____:____:____:____:____:____:____:
  Etalon: OOOOO:++++:OOOO:____:OOOO:++++:OOOO:____:
  AIR:    OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NO:     _____:____:____:____:____:____:____:____:
  NOC:    OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NOPre:  00000:0000:0000:0000:0000:0000:0000:0000:
  NOF:    OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NOB:    _____:____:____:____:____:____:____:____:
  C3F6:   OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  SolSt0: RSTTT:UUUU:STTT:UUUU:STTT:UUUU:STTT:UUUU:^
}
