; h2o.sol
;   Mode 0  Everything Off

solenoid In  84 85 0 ; Chopper In
solenoid Out 94 95 0 ; Chopper Out
; This setup uses a decimal encoding to indicate both the mode
; number (in the tens column) and the status of the chopper
; (in the ls-bit)
dtoa S 0x00 { Z:1 _:10 O:11 A:20 B:21 C:30 D:31 E:40 F:41 G:60 H:61}
Command_Set = 'B';

resolution = 1/1

mode 0 {
  initialize In :_
  initialize Out:_
}

mode 1 {
  In:  O_:____:____^
  Out: __:O___:____
  S:   __:OOOO:OOOO
}

mode 2 {
  In:  O___:____:__^
  Out: ____:O___:__
  S:   AAAA:BBBB:BB
}

mode 3 {
  In:  O___:____:____:____:____:____:____:____:__^
  Out: ____:____:O___:____:____:____:____:____:__
  S:   CCCC:CCCC:DDDD:DDDD:DDDD:DDDD:DDDD:DDDD:DD
}

mode 4 {
  In:  O_^
  Out: _O
  S:   EF
}

mode 5 {
  Out: O
  S:   Z
  select 0
}

mode 6 {
  In:  O___^
  Out: __O_
  S:   GGHH
}
