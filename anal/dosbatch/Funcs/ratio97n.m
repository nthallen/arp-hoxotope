% 	ratio97.m
% 	load polaris archive files
%
TIME=[];
LST=[];
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
CLY=[];
NO2=[];
NOY=[];
CH4=[];
N2O=[];
PAFCAS=[];
LAT=[];
LONG=[];
JNO2=[];
JHOCL=[];
JHOBR=[];
JBRONO2=[];
JO1D=[];
JHNO4=[];
JHNO4_350=[];
JHNO4_DON=[];
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
JH2_CO_JU=[];
JH_HCO_JU=[];
JHNO3_JU=[];
JHNO4_JU=[];
JNO2_JU=[];
JHOCL_JU=[];
JO3ALL_JU=[];
JO1D_JU=[];
JCLONO2_JU=[];
JCLOOCL_JU=[];
JO3ABOVE_JU=[];


fltdir='d:\polaris\archive\';
fltdays=[970422 970424 970426 970502 970506 970509 970511 970513 970626 970629 ...
   970630 970704 970707 970710 970908 970910 970911 970915 970918 970919 970921 970923];
%fltdays=[970422 970424 970426 970430 970502 970506 970509 970511 970513 970626 970629 ...
%   970630 970704 970707 970710 970908 970910 970911 970915 970918 970919 970921 970923];
for index=1:length(fltdays)
   fltday=num2str(fltdays(index));
   eval(['load ', fltdir, fltday, '/', fltday, 'sp']);
   tmjay=t;
   eval(['load ', fltdir, fltday, '/', fltday, 'ju']);
   tmu=t;
   eval(['load ', fltdir, fltday, '/', fltday]);
   ratioer97
   jays_97;
   ju_97;
   eval(['load ', fltdir, '/BT/bt', fltday]);
   ratioBT
   year=floor(t./86400./365+1970);
   day_of_year=fix(t./86400)-(year-1970)*365-(year-1970)./4;
   month=floor(day_of_year./30)+1;
   day_of_month=day_of_year-(month-1).*30;
   sza=real(szac1(latfp(j),longfp(j),time(j),min(month),min(day_of_month),min(year)));
   nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,min(month),min(day_of_month),min(year)));
   ii=find(sza>nextsza & length(j)>0);
   sza(ii)=-sza(ii);
   consol_97
end


clear emm
M=emm(TMM,PMM);
i=find(N2O>0);
BRO=1e-12.*M(i).*bryn2o(1e9.*N2O(i)./M(i));
BRO=0.5.*interp1(i,BRO,1:length(TIME));
CLOOCL=real(clooclss(CLO',JCLOOCL',M',TMM')');
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
%lst_97=LST(i);
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
cly_97=CLY(i);
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
jhno4_97=JHNO4_350(i);
jhno4_350_97=JHNO4_350(i);
jhno4_don_97=JHNO4_DON(i);
jh2_co_97=JH2_CO(i);
jh_hco_97=JH_HCO(i);
jhno3_97=JHNO3(i);
jno2_97=JNO2(i);
jhocl_97=JHOCL(i);
jo3all_97=JO3ALL(i);
jclono2_97=JCLONO2(i);
jbrono2_97=JBRONO2(i);
jhobr_97=JHOBR(i);
jcloocl_97=JCLOOCL(i);
jalbedo_97=JALBEDO(i);
jo3above_97=JO3ABOVE(i);
uv_jo1d_97=UV_JO1D(i);
uv_jno2_97=UV_JNO2(i);
uv_o3col_97=UV_O3COL(i);
solexp10_97=SOLEXP10(i);
solexp5_97=SOLEXP5(i);
sza_97=SZAC(i);
cl_97=CL(i);
clono2_97=CLONO2(i);
m_97=M(i);
pt_97=PT(i);
z_97=Z(i);
lat_5_97=LAT_5(i);
long_5_97=LONG_5(i);
pmm_5_97=PMM_5(i);
tmm_5_97=TMM_5(i);
sza_5_97=SZA_5(i);
lod_5_97=LOD_5(i);
lat_10_97=LAT_10(i);
long_10_97=LONG_10(i);
pmm_10_97=PMM_10(i);
tmm_10_97=TMM_10(i);
sza_10_97=SZA_10(i);
jh2_co_ju_97=JH2_CO_JU(i);
jh_hco_ju_97=JH_HCO_JU(i);
jhno3_ju_97=JHNO3_JU(i);
jhno4_ju_97=JHNO4_JU(i);
jno2_ju_97=JNO2_JU(i);
jhocl_ju_97=JHOCL_JU(i);
jo3_all_ju_97=JO3ALL_JU(i);
jo1d_ju_97=JO1D_JU(i);
jclono2_ju_97=JCLONO2_JU(i);
jcloocl_ju_97=JCLOOCL_JU(i);
jo3above_ju_97=JO3ABOVE_JU(i);


o1d_97=o1dss(jo1d_97,o3_97,m_97,tmm_97);
hno4_97=ho2no2ss(jhno4_350_97,ho2_97,no2_97,oh_97,m_97,tmm_97);
o_97=oss(m_97,tmm_97,o3_97,jo3all_97);
h2co_97=h2coss(jh_hco_97,jh2_co_97,o1d_97,ch4_97,oh_97,o_97,cl_97,m_97,tmm_97);
hno3_97=noy_97-hno4_97-clono2_97-no_97-no2_97;
clono2c_97=clono2ss(jclono2_97,clo_97,no2_97,oh_97,o_97,cl_97,m_97,tmm_97);
rat_97=ho2oh(tmm_97,o3_97,no_97,co_97,clo_97,bro_97,pmm_97);
[pn_97 ln_97 phv_97 po1d_97 loh_97 lho2_97]=hoxss_n(ch4_97,h2o_97,hcl_97,oh_97,ho2_97,...
   o1d_97,cl_97,no2_97,hno3_97,hno4_97,h2co_97,jhno3_97,jhno4_97,jh_hco_97,m_97,tmm_97);

o1d_ju_97=o1dss(jo1d_ju_97,o3_97,m_97,tmm_97);
hno4_ju_97=ho2no2ss(jhno4_ju_97,ho2_97,no2_97,oh_97,m_97,tmm_97);
o_ju_97=oss(m_97,tmm_97,o3_97,jo3_all_ju_97);
h2co_ju_97=h2coss(jh_hco_97,jh2_co_97,o1d_97,ch4_97,oh_97,o_97,cl_97,m_97,tmm_97);
hno3_97=noy_97-hno4_ju_97-clono2_97-no_97-no2_97;
clono2c_97=clono2ss(jclono2_97,clo_97,no2_97,oh_97,o_97,cl_97,m_97,tmm_97);
rat_97=ho2oh(tmm_97,o3_97,no_97,co_97,clo_97,bro_97,pmm_97);
[pn_ju_97 ln_ju_97 phv_ju_97 po1d_ju_97 loh_97 lho2_97]=hoxss_n(ch4_97,h2o_97,hcl_97,oh_97,ho2_97,...
   o1d_ju_97,cl_97,no2_97,hno3_97,hno4_ju_97,h2co_ju_97,jhno3_ju_97,jhno4_ju_97,jh_hco_ju_97,m_97,tmm_97);

save avg_97 *_97
