% 	ratio94.m
% 	load asho archive files
%  uses ratioer94 routine
%  ratioer94 uses h2o instead of h2ohv
%	calculate ho2./oh in ratioer94.m
% 	merge arrays in consol_94.m
%
clear RAT Measure TIME OH HO2 NO CO O3 TMM PMM NO2 NOY CH4 LAT LONG
clear JO1D JHNO4 JH2_CO JH_HCO JHNO3
TIME=[];
OH=[];
HO2=[];
H2O=[];
NO=[];
CO=[];
O3=[];
TMM=[];
PMM=[];
CLO=[];
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
JHOCL=[];
JALBEDO=[];
JO3ABOVE=[];
UV_JO1D=[];
UV_JNO2=[];
UV_O3COL=[];
SZA=[];
PT=[];
Z=[];

load d:\asho\archive\940214\940214sp.mat
tmjay=t;
load d:\asho\archive\940214\940214.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),02,14,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,02,14,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%%shg
%pause
i2=j;
length(i2)

load d:\asho\archive\940318\940318sp.mat
tmjay=t;
load d:\asho\archive\940318\940318.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),03,18,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,03,18,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

load d:\asho\archive\940320\940320sp.mat
tmjay=t;
load d:\asho\archive\940320\940320.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),03,20,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,03,20,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause


load d:\asho\archive\940321\940321sp.mat
tmjay=t;
load d:\asho\archive\940321\940321.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),03,21,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,03,21,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
size(j)
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause



load d:\asho\archive\940322\940322sp.mat
tmjay=t;
load d:\asho\archive\940322\940322.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),03,22,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,03,22,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

load d:\asho\archive\940327\940327sp.mat
tmjay=t;
load d:\asho\archive\940327\940327.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),03,27,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,03,27,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

size(j)

load d:\asho\archive\940329\940329sp.mat
tmjay=t;
load d:\asho\archive\940329\940329.mat
ratioer94
jays_94;
size(j)
sza=real(szac1(latfp(j),longfp(j),time(j),03,29,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,03,29,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause


load d:\asho\archive\940330\940330sp.mat
tmjay=t;
load d:\asho\archive\940330\940330.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),03,30,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,03,30,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

i9=j;
length(i9)

load d:\asho\archive\940403\940403sp.mat
tmjay=t;
load d:\asho\archive\940403\940403.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),04,03,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,04,03,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

i10=j;
length(i10)

load d:\asho\archive\940405\940405sp.mat
tmjay=t;
load d:\asho\archive\940405\940405.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),04,05,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,04,05,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

i11=j;
length(i11)

load d:\asho\archive\940408\940408sp.mat
tmjay=t;
load d:\asho\archive\940408\940408.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),04,08,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,04,08,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

i12=j;
length(i12)

load d:\asho\archive\940523\940523sp.mat
tmjay=t;
load d:\asho\archive\940523\940523.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),05,23,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,05,23,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

load d:\asho\archive\940528\940528sp.mat
tmjay=t;
load d:\asho\archive\940528\940528.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),05,28,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,05,28,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause


load d:\asho\archive\940601\940601sp.mat
tmjay=t;
load d:\asho\archive\940601\940601.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),06,01,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,06,01,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

load d:\asho\archive\940603\940603sp.mat
tmjay=t;
load d:\asho\archive\940603\940603.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),06,03,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,06,03,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i16=j;
length(i16)

load d:\asho\archive\940728\940728sp.mat
tmjay=t;
load d:\asho\archive\940728\940728.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),07,28,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,07,28,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94;

load d:\asho\archive\940730\940730sp.mat
tmjay=t;
load d:\asho\archive\940730\940730.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),07,30,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,07,30,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94;
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i18=j;
length(i18)

load d:\asho\archive\940801\940801sp.mat
tmjay=t;
load d:\asho\archive\940801\940801.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),08,01,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,08,01,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i19=j;
length(i19)

load d:\asho\archive\940806\940806sp.mat
tmjay=t;
load d:\asho\archive\940806\940806.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),08,06,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,08,06,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i20=j;
length(i20)

load d:\asho\archive\941010\941010sp.mat
tmjay=t;
load d:\asho\archive\941010\941010.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),10,10,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,10,10,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i22=j;
length(i22)

load d:\asho\archive\941013\941013sp.mat
tmjay=t;
load d:\asho\archive\941013\941013.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),10,13,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,10,13,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i23=j;
length(i23)

load d:\asho\archive\941020\941020sp.mat
tmjay=t;
load d:\asho\archive\941020\941020.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),10,20,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,10,20,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i25=j;
length(i25)

load d:\asho\archive\941022\941022sp.mat
tmjay=t;
load d:\asho\archive\941022\941022.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),10,22,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,10,22,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i26=j;
length(i26)

load d:\asho\archive\941029\941029sp.mat
tmjay=t;
load d:\asho\archive\941029\941029.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),10,29,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,10,29,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause
i27=j;
length(i27)

load d:\asho\archive\941104\941104sp.mat
tmjay=t;
load d:\asho\archive\941104\941104.mat
ratioer94
jays_94;
sza=real(szac1(latfp(j),longfp(j),time(j),11,04,1994));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,11,04,1994));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_94
%plot(SZA,OH,'.',sza,oh(j),'.')
%shg
%pause

% HCl=5e9;
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
HNO4=ho2no2ss(JHNO4,HO2,NO2c,OH,M,TMM);
O=oss(M,TMM,O3,JO3ALL);
H2CO=h2coss(JH_HCO,JH2_CO,O1D,CH4,OH,O,CL,M,TMM);
CLONO2=clono2ss(JCLONO2,CLO,NO2c,OH,O,CL,M,TMM);
HNO3=NOY-HNO4-CLONO2-NO-NO2c;
[prod,loss,prodhv,prodo1d,lossOH,lossHO2]=hoxss_n(CH4,H2O,HCL,OH,...
   HO2,O1D,CL,NO2c,HNO3,HNO4,H2CO,JHNO3,JHNO4,JH_HCO,M,TMM);


i=find(M<2.5e18);
time_94=TIME(i);
oh_94=OH(i);
ho2_94=HO2(i);
h2o_94=H2O(i);
no_94=NO(i);
co_94=CO(i);
o3_94=O3(i);
tmm_94=TMM(i);
pmm_94=PMM(i);
clo_94=CLO(i);
bro_94=BRO(i);
hcl_94=HCL(i);
no2_94=NO2(i);
no2c_94=NO2c(i);
noy_94=NOY(i);
ch4_94=CH4(i);
n2o_94=N2O(i);
pafcas_94=PAFCAS(i);
lat_94=LAT(i);
long_94=LONG(i);
jo1d_94=JO1D(i);
jhno4_94=JHNO4(i);
jh2_co_94=JH2_CO(i);
jh_hco_94=JH_HCO(i);
jhno3_94=JHNO3(i);
jno2_94=JNO2(i);
jo3all_94=JO3ALL(i);
jclono2_94=JCLONO2(i);
cloocl_94=JCLOOCL(i);
jalbedo_94=JALBEDO(i);
jo3above_94=JO3ABOVE(i);
uv_jo1d_94=UV_JO1D(i);
uv_jno2_94=UV_JNO2(i);
uv_o3col_94=UV_O3COL(i);
sza_94=SZA(i);
cl_94=CL(i);
clono2_94=CLONO2(i);
m_94=M(i);
pt_94=PT(i);
z_94=Z(i);

o1d_94=o1dss(jo1d_94,o3_94,m_94,tmm_94);
hno4_94=ho2no2ss(jhno4_94,ho2_94,no2c_94,oh_94,m_94,tmm_94);
o_94=oss(m_94,tmm_94,o3_94,jo3all_94);
h2co_94=h2coss(jh_hco_94,jh2_co_94,o1d_94,ch4_94,oh_94,o_94,cl_94,m_94,tmm_94);
hno3_94=noy_94-hno4_94-clono2_94-no_94-no2c_94;
rat_94=ho2oh(tmm_94,o3_94,no_94,co_94,clo_94,bro_94,pmm_94);
[p_94 l_94 phv_94 po1d_94 loh_94 lho2_94]=hoxss_n(ch4_94,h2o_94,hcl_94,oh_94,ho2_94,...
   o1d_94,cl_94,no2c_94,hno3_94,hno4_94,h2co_94,jhno3_94,jhno4_94,jh_hco_94,m_94,tmm_94);


save avg_94 *_94

