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
					J:10 K:11 L:12 M:13 N:14 Q:15 R:16 S:17 T:18 U:19
					V:20 W:21 X:22}
dtoa AOSPt1 0xE86  {A:0 B:300 C:500 D:700 E:900}

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
  Etalon: ____:OOOO:++++:OOOO:____:OOOO:++++:OOOO:
  SolSt0: KFFF:FFFF:MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:

  Etalon: ____:OOOO:++++:OOOO:____:OOOO:++++:OOOO:
  SolSt0: MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:

  Etalon: ____:OOOO:++++:OOOO:____:OOOO:++++:OOOO:
  SolSt0: MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:MHHH:DDDD:^

}

mode 2 {
  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:EEEE:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:CCCC:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:AAAA:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

  Etalon: ____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:____:++++:OOOO:
  AOSPt1: BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:BBBB:
  SolSt0: VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:VVVV:WWWW:XXXX:^

}

mode 3 {
  A1IN:   _____:____:____:____:____:____:____:____:
  A1OUT:  _____:____:____:____:____:____:____:____:
  A2IN:   _____:____:____:____:____:____:____:____:
  A2OUT:  _____:____:____:____:____:____:____:____:
  Etalon: _____:OOOO:++++:OOOO:____:OOOO:++++:OOOO:
  AIR:    OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  NO:     _____:____:____:____:OOOO:OOOO:OOOO:OOOO:
  NOC:    OOOOO:OOOO:OOOO:OOOO:____:____:____:____:
  NOPre:  00000:0000:0000:0000:CCCC:CCCC:CCCC:CCCC:
  NOF:    _____:____:____:____:____:____:____:____:
  NOB:    OOOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:OOOO:
  C3F6:   _____:____:____:____:____:____:____:____:
  SolSt0: VWWWW:XXXX:WWWW:XXXX:WWWW:XXXX:WWWW:XXXX:^
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
  A1IN:   ______:OOO___:______:
  A1OUT:  OOO___:______:______:
  A2IN:   ______:OOO___:______:
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
; 6 s On-off-alt mode
mode 7 {
  Etalon: OOOOOO:___:++++++:___:OOOOOO:___:++++++:___:OOOOOO:___:++++++:___:
  SolSt0: KKKKKK:LLL:KKKKKK:LLL:KKKKKK:LLL:KKKKKK:LLL:KKKKKK:LLL:KKKKKK:LLL:^ 
}

; 8s On-off-alt mode without bellows chop.
mode 8 {


  Etalon: OOOOOOOO:________:++++++++:________:OOOOOOOO:________:++++++++:________:
  SolSt0: STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:^
}


; On-off-alt mode with water titration.
mode 9 {

  Etalon: OOOOOOOO:________:++++++++:________:OOOOOOOO:________:++++++++:________:____:
  AOSPt1: EEEEEEEE:EEEEEEEE:EEEEEEEE:EEEEEEEE:EEEEEEEE:EEEEEEEE:EEEEEEEE:EEEEEEEE:CCCC:
  SolSt0: STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:DDDD:^

  Etalon: OOOOOOOO:________:++++++++:________:OOOOOOOO:________:++++++++:________:____:
  AOSPt1: CCCCCCCC:CCCCCCCC:CCCCCCCC:CCCCCCCC:CCCCCCCC:CCCCCCCC:CCCCCCCC:CCCCCCCC:BBBB:
  SolSt0: STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:DDDD:^

  Etalon: OOOOOOOO:________:++++++++:________:OOOOOOOO:________:++++++++:________:____:
  AOSPt1: BBBBBBBB:BBBBBBBB:BBBBBBBB:BBBBBBBB:BBBBBBBB:BBBBBBBB:BBBBBBBB:BBBBBBBB:DDDD:
  SolSt0: STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:DDDD:^

  Etalon: OOOOOOOO:________:++++++++:________:OOOOOOOO:________:++++++++:________:____:
  AOSPt1: DDDDDDDD:DDDDDDDD:DDDDDDDD:DDDDDDDD:DDDDDDDD:DDDDDDDD:DDDDDDDD:DDDDDDDD:AAAA:
  SolSt0: STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:DDDD:^

  Etalon: OOOOOOOO:________:++++++++:________:OOOOOOOO:________:++++++++:________:____:
  AOSPt1: AAAAAAAA:AAAAAAAA:AAAAAAAA:AAAAAAAA:AAAAAAAA:AAAAAAAA:AAAAAAAA:AAAAAAAA:EEEE:
  SolSt0: STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:STTTTTTT:UUUUUUUU:DDDD:^

}
