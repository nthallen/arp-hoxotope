% 	ratio97.m
% 	load polaris SP &  archive files
%
TIME=[];
TOD=[];
OH=[];
HO2=[];
H2O=[];
NO=[];
CO=[];
O3=[];
T=[];
P=[];
CLO=[];
CLONO2=[];
HCL=[];
NO2=[];
NOY=[];
CH4=[];
N2O=[];
HNO3=[];
HNO4=[];
N2O5=[];
GAM_N2O5=[];
PA=[];
SWP=[];
H2CO=[];
JHONO3=[];
JH2_CO=[];
JH_HCO=[];
JHONO2=[];
JN2O5=[];
SZA=[];
O1D=[];
CL=[];
BRO=[];
HOBR=[];
JHOBR=[];
JO3ABOVE=[];
OH_24=[];
HNO3HV_24=[];
N2O5H2O_24=[];
O1DH2O_24=[];
O1DCH4_24=[];
OHHNO3_24=[];
OHHO2_24=[];
OHNO2_24=[];
BRONO2H2O_24=[];


load d:\polaris\archive\970422\970422sp.mat
load d:\polaris\archive\970422\970422ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,04,22,1997));
nextsza=real(szac1(latps,longps,timeps+100,04,22,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970424\970424sp.mat
load d:\polaris\archive\970424\970424ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,04,24,1997));
nextsza=real(szac1(latps,longps,timeps+100,04,24,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970426\970426sp.mat
load d:\polaris\archive\970426\970426ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,04,26,1997));
nextsza=real(szac1(latps,longps,timeps+100,04,26,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970430\970430sp.mat
load d:\polaris\archive\970430\970430ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,04,30,1997));
nextsza=real(szac1(latps,longps,timeps+100,04,30,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970502\970502sp.mat
load d:\polaris\archive\970502\970502ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,05,02,1997));
nextsza=real(szac1(latps,longps,timeps+100,05,02,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970506\970506sp.mat
load d:\polaris\archive\970506\970506ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,05,06,1997));
nextsza=real(szac1(latps,longps,timeps+100,05,06,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970509\970509sp.mat
load d:\polaris\archive\970509\970509ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,05,09,1997));
nextsza=real(szac1(latps,longps,timeps+100,05,09,1997));
consol_SP

load d:\polaris\archive\970511\970511sp.mat
load d:\polaris\archive\970511\970511ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,05,11,1997));
nextsza=real(szac1(latps,longps,timeps+100,05,11,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970513\970513sp.mat
load d:\polaris\archive\970513\970513ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,05,13,1997));
nextsza=real(szac1(latps,longps,timeps+100,05,13,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970626\970626sp.mat
load d:\polaris\archive\970626\970626ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,06,26,1997));
nextsza=real(szac1(latps,longps,timeps+100,06,26,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970630\970630sp.mat
load d:\polaris\archive\970630\970630ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,06,30,1997));
nextsza=real(szac1(latps,longps,timeps+100,06,30,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970704\970704sp.mat
load d:\polaris\archive\970704\970704ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,07,04,1997));
nextsza=real(szac1(latps,longps,timeps+100,07,04,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970707\970707sp.mat
load d:\polaris\archive\970707\970707ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,07,07,1997));
nextsza=real(szac1(latps,longps,timeps+100,07,07,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970710\970710sp.mat
load d:\polaris\archive\970710\970710ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,07,10,1997));
nextsza=real(szac1(latps,longps,timeps+100,07,10,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970908\970908sp.mat
load d:\polaris\archive\970908\970908ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,08,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,08,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970911\970911sp.mat
load d:\polaris\archive\970911\970911ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,11,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,11,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970914\970914sp.mat
load d:\polaris\archive\970914\970914ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,14,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,14,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970915\970915sp.mat
load d:\polaris\archive\970915\970915ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,15,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,15,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970918\970918sp.mat
load d:\polaris\archive\970918\970918ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,18,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,18,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970919\970919sp.mat
load d:\polaris\archive\970919\970919ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,19,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,19,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970921\970921sp.mat
load d:\polaris\archive\970921\970921ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,21,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,21,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

load d:\polaris\archive\970923\970923sp.mat
load d:\polaris\archive\970923\970923ps.mat
mps=emm(tps,pps);
timeps=time2d(t);
sza=real(szac1(latps,longps,timeps,09,23,1997));
nextsza=real(szac1(latps,longps,timeps+100,09,23,1997));
ii=find(sza>nextsza);
sza(ii)=-sza(ii);
consol_SP

M=emm(T,P);

save avg_SP

load avg_97
time_sp=interp1(TIME,TIME,time_97);
tod_sp=interp1(TIME,TOD,time_97);
oh_sp=interp1(TIME,OH,time_97);
ho2_sp=interp1(TIME,HO2,time_97);
h2o_sp=interp1(TIME,H2O,time_97);
no_sp=interp1(TIME,NO,time_97);
co_sp=interp1(TIME,CO,time_97);
o3_sp=interp1(TIME,O3,time_97);
tmm_sp=interp1(TIME,T,time_97);
pmm_sp=interp1(TIME,P,time_97);
clo_sp=interp1(TIME,CLO,time_97);
clono2_sp=interp1(TIME,CLONO2,time_97);
hcl_sp=interp1(TIME,HCL,time_97);
no2_sp=interp1(TIME,NO2,time_97);
noy_sp=interp1(TIME,NOY,time_97);
ch4_sp=interp1(TIME,CH4,time_97);
n2o_sp=interp1(TIME,N2O,time_97);
hno3_sp=interp1(TIME,HNO3,time_97);
hno4_sp=interp1(TIME,HNO4,time_97);
n2o5_sp=interp1(TIME,N2O5,time_97);
gam_n2o5_sp=interp1(TIME,GAM_N2O5,time_97);
pa_sp=interp1(TIME,PA,time_97);
swp_sp=interp1(TIME,SWP,time_97);
h2co_sp=interp1(TIME,H2CO,time_97);
%jhno4_sp=interp1(TIME,JHONO3,time_97);
%jh2_co_sp=interp1(TIME,JH2_CO,time_97);
%jh_hco_sp=interp1(TIME,JH_HCO,time_97);
%jhno3_sp=interp1(TIME,JHONO2,time_97);
%jn2o5_sp=interp1(TIME,JN2O5,time_97);
sza_sp=interp1(TIME,SZA,time_97);
o1d_sp=interp1(TIME,O1D,time_97);
cl_sp=interp1(TIME,CL,time_97);
bro_sp=interp1(TIME,BRO,time_97);
hobr_sp=interp1(TIME,HOBR,time_97);
%jhobr_sp=interp1(TIME,JHOBR,time_97);
%jo3above_sp=interp1(TIME,JO3ABOVE,time_97);
m_sp=interp1(TIME,M,time_97);
oh_24=interp1(TIME,OH_24,time_97);
hno3hv_24=interp1(TIME,HNO3HV_24,time_97);
n2o5h2o_24=interp1(TIME,N2O5H2O_24,time_97);
o1dh2o_24=interp1(TIME,O1DH2O_24,time_97);
o1dch4_24=interp1(TIME,O1DCH4_24,time_97);
ohhno3_24=interp1(TIME,OHHNO3_24,time_97);
ohho2_24=interp1(TIME,OHHO2_24,time_97);
ohno2_24=interp1(TIME,OHNO2_24,time_97);
brono2h2o_24=interp1(TIME,BRONO2H2O_24,time_97);



save avg_sp *_sp *_24
