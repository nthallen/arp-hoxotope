%  Windows Matlab version of HOXPLT.BAT
input fltday
!nsnafu -b\strat\batch\hoxplt\tavg.inp
!sps2mat -b\strat\batch\hoxplt\tcavg2m.inp
!sps2mat -b\strat\batch\hoxplt\tfavg2m.inp
!sps2mat -b\strat\batch\hoxplt\tsavg2m.inp
!sps2mat -b\strat\batch\hoxplt\htgas2m.inp
!sps2mat -b\strat\batch\hoxplt\lsrsys2m.inp
!sps2mat -b\strat\batch\hoxplt\lsrrdy2m.inp
!sps2mat -b\strat\batch\hoxplt\press2m.inp
!sps2mat -b\strat\batch\hoxplt\ind2m.inp
!sps2mat -b\strat\batch\hoxplt\power2m.inp
!sps2mat -b\strat\batch\hoxplt\nav2m.inp
rdywin.m
% del cts.sps
% del htgasrdy.sps
% del lsrsys.sps
% del lsrrdy.sps
% del ftmp.sps
% del ptmp.sps
% del power.sps
% del nav.sps
% del pressure.sps
!print ohplt1.ps /flpt1
