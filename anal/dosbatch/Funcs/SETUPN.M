clear
clear
% This script initializes ashoe1 and calculates
% many of the steady state concentrations used
% in various calculations.
d=input('Enter the date. eg., [9,17,1994]: ');
load ashoe1n
time=time2d(t);
save temp time d
clear
jays
clear
load ashoe1n
load rjays
load temp
molpercc;
bry=bryn2o(1e9.*n2o./M);
bro=0.5.*bry'.*M./1e12;
o1d=o1dss(rjo3o1d,o3,M,tmm);
o=oss(M,tmm,o3,rjo3all);
plot(time,o,time,o1d*1e6)
title('o,o1d*1e6')
pause
cloocl=clooclss(clo,rjcloocl,M,tmm);
cl=clss(clo,no,bro,o3,cloocl,rjcloocl,M,tmm);
plot(time,cloocl,time,cl)
title('cloocl,cl')
pause
h2co=h2coss_n(tmm,M,rjh_hco,rjh2_co,ch4al,oh,cl,o1d,o);
no2calc=no2ss(rjno2,clo,o3,no,M,tmm); 
clono2=clono2ss(rjclono2,clo,no2,oh,o1d,cl,M,tmm);
hno3=noy-no2-no-clono2;
plot(time,no2,time,clono2)
title('no2,clono2')
pause
hno4=ho2no2ss(rjhono3,ho2,no2,oh,M,tmm);
plot(time,hno3,time,hno4*10)
title('hno3,hno4*10');
%sza=szac1(latfp,longfp,time,d(1),d(2),d(3));
