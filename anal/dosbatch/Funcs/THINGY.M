% script to calculate the concentration of 
% each species in molecules/cc.
% conc = mixing ratio .* M./ppwhatever;
time=time2d(t);
molpercc;

clo=1e7;
ch4al=2e12; coal=1e10; hclal=1e9;

bry=bryn2o(1e9.*n2o./M);
bro=0.5.*bry.*M./1e12;
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
clono2calc=clono2ss(rjclono2,clo,no2calc,oh,o1d,cl,M,tmm);
hno3=noy-no2calc-no-clono2calc;
plot(time,no2calc,time,clono2calc)
title('calculated no2,clono2')
pause
hno4=ho2no2ss(rjhono3,ho2,no2calc,oh,M,tmm);
plot(time,hno3,time,hno4*10)
title('hno3,hno4*10');
pause
rat=ho2oh(tmm,o3,no,coal,0,0,pmm);
[prod loss]=hoxss_n(ch4al,h2ohv,hclal,oh,ho2,o1d,cl,no2calc,hno3,hno4,h2co,...
rjhono2,rjhono3,rjh_hco,M,tmm);