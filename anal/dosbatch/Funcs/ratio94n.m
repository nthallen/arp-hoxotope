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
JHOCL=[];
JHOBR=[];
JBRONO2=[];
JO3ALL=[];
JCLONO2=[];
JCLOOCL=[];
JALBEDO=[];
JO3ABOVE=[];
UV_JO1D=[];
UV_JNO2=[];
UV_O3COL=[];
SZAC=[];
PT=[];
Z=[];
LAT_5=[];
LONG_5=[];
PMM_5=[];
TMM_5=[];
SZA_5=[];
LOD_5=[];
LAT_10=[];
LONG_10=[];
PMM_10=[];
TMM_10=[];
SZA_10=[];

fltdir='e:\asho\archive\';

fltdays=[940214 940318 940320 940321 940322 940327 940329 940330 940403 940405 940408 ...
      940523 940528 940601 940603 940728 940730 940801 940806 941010 941013 941020 941022 ...
      941029 941104];
for index=1:length(fltdays)
   fltday=num2str(fltdays(index));
   eval(['load ', fltdir, fltday, '/', fltday, 'sp']);
   tmjay=t;
   eval(['load ', fltdir, fltday, '/', fltday]);
   ratioer94;
   jays_94;
   eval(['load ', fltdir, 'BT/bt', fltday]);
   ratioBT;
   year=floor(t./86400./365+1970);
   day_of_year=fix(t./86400)-(year-1970)*365-(year-1970)./4;
   month=floor(day_of_year./30)+1;
   day_of_month=day_of_year-(month-1).*30;
   sza=real(szac1(latfp(j),longfp(j),time(j),median(month),median(day_of_month),min(year)));
   nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,median(month),median(day_of_month),min(year)));
   ii=find(sza>nextsza & length(j)>0);
   sza(ii)=-sza(ii);
   consol_94
end


% HCl=5e9;
clear emm
M=emm(TMM,PMM);
i=find(N2O>0);
BRO=1e-12.*M(i).*bryn2o(1e9.*N2O(i)./M(i));
BRO=0.5.*interp1(i,BRO,1:length(TIME));
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
jhocl_94=JHOCL(i);
jhobr_94=JHOBR(i);
jbrono2_94=JBRONO2(i);
jo3all_94=JO3ALL(i);
jclono2_94=JCLONO2(i);
cloocl_94=JCLOOCL(i);
jalbedo_94=JALBEDO(i);
jo3above_94=JO3ABOVE(i);
uv_jo1d_94=UV_JO1D(i);
uv_jno2_94=UV_JNO2(i);
uv_o3col_94=UV_O3COL(i);
sza_94=SZAC(i);
cl_94=CL(i);
clono2_94=CLONO2(i);
m_94=M(i);
pt_94=PT(i);
z_94=Z(i);
lat_5_94=LAT_5(i);
long_5_94=LONG_5(i);
pmm_5_94=PMM_5(i);
tmm_5_94=TMM_5(i);
sza_5_94=SZA_5(i);
lod_5_94=LOD_5(i);
lat_10_94=LAT_10(i);
long_10_94=LONG_10(i);
pmm_10_94=PMM_10(i);
tmm_10_94=TMM_10(i);
sza_10_94=SZA_10(i);


o1d_94=o1dss(jo1d_94,o3_94,m_94,tmm_94);
hno4_94=ho2no2ss(jhno4_94,ho2_94,no2c_94,oh_94,m_94,tmm_94);
o_94=oss(m_94,tmm_94,o3_94,jo3all_94);
h2co_94=h2coss(jh_hco_94,jh2_co_94,o1d_94,ch4_94,oh_94,o_94,cl_94,m_94,tmm_94);
hno3_94=noy_94-hno4_94-clono2_94-no_94-no2c_94;
rat_94=ho2oh(tmm_94,o3_94,no_94,co_94,clo_94,bro_94,pmm_94);
[p_94 l_94 phv_94 po1d_94 loh_94 lho2_94]=hoxss_n(ch4_94,h2o_94,hcl_94,oh_94,ho2_94,...
   o1d_94,cl_94,no2c_94,hno3_94,hno4_94,h2co_94,jhno3_94,jhno4_94,jh_hco_94,m_94,tmm_94);


save avg_94 *_94

