% 	ratio97.m
% 	load polaris archive files
%
TIME=[];
OH=[];
HO2=[];
H2O=[];
NO=[];
NO2=[];
NO2_hv=[];
CO=[];
O3=[];
TMM=[];
PMM=[];
CLO=[];
CLONO2=[];
BRO=[];
HCL=[];
NO2=[];
NOY=[];
CH4=[];
N2O=[];
PAFCAS=[];
LAT=[];
LONG=[];
JNO2=[];
JO1D=[];
JHNO4=[];
JH2_CO=[];
JH_HCO=[];
JHNO3=[];
JO3ALL=[];
JCLONO2=[];
JCLOOCL=[];
JALBEDO=[];
JO3ABOVE=[];
UV_JO1D=[];
UV_JNO2=[];
UV_O3COL=[];
SOLEXP10=[];
SOLEXP5=[];
SZA=[];
PT=[];
Z=[];


load d:\polaris\archive\970422\970422sp.mat
tmjay=t;
load d:\polaris\archive\970422\970422.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),04,22,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,04,22,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970424\970424sp.mat
tmjay=t;
load d:\polaris\archive\970424\970424.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),04,24,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,04,24,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970426\970426sp.mat
tmjay=t;
load d:\polaris\archive\970426\970426.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),04,26,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,04,26,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970430\970430sp.mat
tmjay=t;
load d:\polaris\archive\970430\970430.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),04,30,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,04,30,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970502\970502sp.mat
tmjay=t;
load d:\polaris\archive\970502\970502.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),05,02,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,05,02,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970506\970506sp.mat
tmjay=t;
load d:\polaris\archive\970506\970506.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),05,06,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,05,06,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970509\970509sp.mat
tmjay=t;
load d:\polaris\archive\970509\970509.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),05,09,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,05,09,1997));
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970511\970511sp.mat
tmjay=t;
load d:\polaris\archive\970511\970511.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),05,11,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,05,11,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970513\970513sp.mat
tmjay=t;
load d:\polaris\archive\970513\970513.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),05,13,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,05,13,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970626\970626sp.mat
tmjay=t;
load d:\polaris\archive\970626\970626.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),06,26,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,06,26,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970629\970629sp.mat
tmjay=t;
load d:\polaris\archive\970629\970629.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),06,29,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,06,29,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970630\970630sp.mat
tmjay=t;
load d:\polaris\archive\970630\970630.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),06,30,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,06,30,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970704\970704sp.mat
tmjay=t;
load d:\polaris\archive\970704\970704.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),07,04,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,07,04,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970707\970707sp.mat
tmjay=t;
load d:\polaris\archive\970707\970707.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),07,07,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,07,07,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970710\970710sp.mat
tmjay=t;
load d:\polaris\archive\970710\970710.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),07,10,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,07,10,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970908\970908sp.mat
tmjay=t;
load d:\polaris\archive\970908\970908.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,08,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,08,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970910\970910sp.mat
tmjay=t;
load d:\polaris\archive\970910\970910.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,10,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,10,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970911\970911sp.mat
tmjay=t;
load d:\polaris\archive\970911\970911.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,11,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,11,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause


load d:\polaris\archive\970915\970915sp.mat
tmjay=t;
load d:\polaris\archive\970915\970915.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,15,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,15,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970918\970918sp.mat
tmjay=t;
load d:\polaris\archive\970918\970918.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,18,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,18,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970919\970919sp.mat
tmjay=t;
load d:\polaris\archive\970919\970919.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,19,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,19,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970921\970921sp.mat
tmjay=t;
load d:\polaris\archive\970921\970921.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,21,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,21,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

load d:\polaris\archive\970923\970923sp.mat
tmjay=t;
load d:\polaris\archive\970923\970923.mat
ratioer97
jays_97;
sza=real(szac1(latfp(j),longfp(j),time(j),09,23,1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,09,23,1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
%plot(SZA,OH,'.',sza,oh(j),'.')
shg
%pause

clear emm
M=emm(TMM,PMM);
i=find(N2O>0);
BRO=1e-12.*M(i).*bryn2o(1e9.*N2O(i)./M(i));
BRO=interp1(i,BRO,1:length(TIME));
i=find(CH4>0 & N2O>0);
c=polyfit(N2O(i),CH4(i),1);
CH4c=polyval(c,N2O);
i=find(isnan(CH4));
CH4(i)=CH4c(i);
i=find(HCL>0 & N2O>0);
c=polyfit(N2O(i),HCL(i),1);
HCLc=polyval(c,N2O);
i=find(isnan(HCL));
HCL(i)=HCLc(i);
CLOOCL=clooclss(CLO',JCLOOCL',M',TMM')';
CL=clss(CLO,NO,BRO,O3,CLOOCL,JCLOOCL,M,TMM);
O1D=o1dss(JO1D,O3,M,TMM);
NO2c=no2ss(JNO2,CLO,O3,NO,M,TMM);
HNO4=ho2no2ss(JHNO4,HO2,NO2,OH,M,TMM);
O=oss(M,TMM,O3,JO3ALL);
H2CO=h2coss(JH_HCO,JH2_CO,O1D,CH4,OH,O,CL,M,TMM);
CLONO2c=clono2ss(JCLONO2,CLO,NO2,OH,O,CL,M,TMM);
HNO3=NOY-HNO4-CLONO2-NO-NO2;
[prod,loss,prodhv,prodo1d,lossOH,lossHO2]=hoxss_n(CH4,H2O,HCL,OH,...
   HO2,O1D,CL,NO2,HNO3,HNO4,H2CO,JHNO3,JHNO4,JH_HCO,M,TMM);

i=find(M<2.5e18);
time_97=TIME(i);
oh_97=OH(i);
ho2_97=HO2(i);
h2o_97=H2O(i);
no_97=NO(i);
co_97=CO(i);
o3_97=O3(i);
tmm_97=TMM(i);
pmm_97=PMM(i);
clo_97=CLO(i);
bro_97=BRO(i);
hcl_97=HCL(i);
no2_97=NO2(i);
no2c_97=NO2c(i);
no2_hv_97=NO2_hv(i);
noy_97=NOY(i);
ch4_97=CH4(i);
n2o_97=N2O(i);
pafcas_97=PAFCAS(i);
lat_97=LAT(i);
long_97=LONG(i);
jo1d_97=JO1D(i);
jhno4_97=JHNO4(i);
jh2_co_97=JH2_CO(i);
jh_hco_97=JH_HCO(i);
jhno3_97=JHNO3(i);
jno2_97=JNO2(i);
jo3all_97=JO3ALL(i);
jclono2_97=JCLONO2(i);
cloocl_97=JCLOOCL(i);
jalbedo_97=JALBEDO(i);
jo3above_97=JO3ABOVE(i);
uv_jo1d_97=UV_JO1D(i);
uv_jno2_97=UV_JNO2(i);
uv_o3col_97=UV_O3COL(i);
solexp10_97=SOLEXP10(i);
solexp5_97=SOLEXP5(i);
sza_97=SZA(i);
cl_97=CL(i);
clono2_97=CLONO2(i);
m_97=M(i);
pt_97=PT(i);
z_97=Z(i);

o1d_97=o1dss(jo1d_97,o3_97,m_97,tmm_97);
hno4_97=ho2no2ss(jhno4_97,ho2_97,no2c_97,oh_97,m_97,tmm_97);
o_97=oss(m_97,tmm_97,o3_97,jo3all_97);
h2co_97=h2coss(jh_hco_97,jh2_co_97,o1d_97,ch4_97,oh_97,o_97,cl_97,m_97,tmm_97);
hno3_97=noy_97-hno4_97-clono2_97-no_97-no2c_97;
clono2c_97=clono2ss(jclono2_97,clo_97,no2c_97,oh_97,o_97,cl_97,m_97,tmm_97);
rat_97=ho2oh(tmm_97,o3_97,no_97,co_97,clo_97,bro_97,pmm_97);
[p_97 l_97 phv_97 po1d_97 loh_97 lho2_97]=hoxss_n(ch4_97,h2o_97,hcl_97,oh_97,ho2_97,...
   o1d_97,cl_97,no2c_97,hno3_97,hno4_97,h2co_97,jhno3_97,jhno4_97,jh_hco_97,m_97,tmm_97);

save avg_97 *_97
