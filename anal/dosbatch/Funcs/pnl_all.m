load avg_94
load avg_97
load lod_ju

set(0,'defaultaxeslinewidth',2);
set(0,'defaultaxesfontsize',14);
set(0,'defaultaxesfontname','timesnewroman');

TIME=[time_94 time_97];
H2=[5e-7.*m_94 5e-7.*m_97];
OH=[oh_94 oh_97];
HO2=[ho2_94 ho2_97];
RAT=[rat_94 rat_97];
O1D=[o1d_94 o1d_97];
H2O=[h2o_94 h2o_97];
CH4=[ch4_94 ch4_97];
JHNO3=[jhno3_94 jhno3_97];
JHNO4=[jhno4_94+jno2_94./7.5e3 jhno4_don_97];
JH_HCO=[jh_hco_94 jh_hco_97];
JHOBR=0.0;
Cl=[cl_94 cl_97];
ClO=[clo_94 clo_97];
CO=[co_94 co_97];
PMM=[pmm_94 pmm_97];
HNO3=[hno3_94 hno3_97];
%HNO4=[hno4_94 hno4_97];
H2CO=[h2co_94 h2co_97];
NO2c=[no2c_94 no2c_97];
CLONO2=[clono2_94 clono2_97];
no2_hv=no2_hv_97;
no2_hv(isnan(no2_hv_97))=no2_97(isnan(no2_hv_97));
NO2=[no2_94 (no2_97+no2_hv_97)./2];
HCl=[hcl_94 hcl_97];
BrO=[bro_94 bro_97];
SZA=[sza_94 sza_97];
O3ABOVE=[jo3above_94 jo3above_97];
O3=[o3_94 o3_97];
JO1D=[jo1d_94 jo1d_97];
JO3ALL=[jo3all_94 jo3all_97];
JCLONO2=[jclono2_94 jclono2_97];
JH2CO=[jh_hco_94 jh_hco_97];
JH2_CO=[jh2_co_94 jh2_co_97];
JNO2=[jno2_94 jno2_97];
HOBR=0.0;
SA=[pafcas_94 pafcas_97];
TMM=[tmm_94 tmm_97];
M=[m_94 m_97];
LAT=[lat_94 lat_97];
NOY=[noy_94 noy_97];
NO=[no_94 no_97];
NOx=NO+NO2;
N2O=[n2o_94 n2o_97];
ZFP=[z_94 z_97];
PT=[pt_94 pt_97];
UV_JNO2=[uv_jno2_94 uv_jno2_97];
UV_JO1D=[uv_jo1d_94 uv_jo1d_97];
UV_O3COL=[uv_o3col_94 uv_o3col_97];
AVG_OH=[avg_oh_94 avg_oh_97];
AVG_SZA=[avg_sza_94 avg_sza_97];
LOD=[lod_94 lod_97];
AVG_JHNO3=[avg_jhno3_94 avg_jhno3_97];
AVG_JO1D=[avg_jo1d_94 avg_jo1d_97];
AVG_JNO2=[avg_jno2_94 avg_jno2_97];
AVG_JCLNO2=[avg_jclono2_94 avg_jclono2_97];
AVG_JCLONO2=[avg_jclono2_94 avg_jclono2_97];
AVG_O1D=o1dss(AVG_JO1D,O3,M,TMM);
AVG_JH2CO=[avg_jh2co_94 avg_jh2co_97];
SZA_5=[sza_5_94 sza_5_97];
LAT_5=[lat_5_94 lat_5_97];
TMM_5=[tmm_5_94 tmm_5_97];
PMM_5=[pmm_5_94 pmm_5_97];
LOD_5=[lod_5_94 lod_5_97];

t=TIME;
YEAR=floor(t./86400./365+1970);
day_of_year=fix(t./86400)-(YEAR-1970)*365-(YEAR-1970)./4;
MONTH=floor(day_of_year./30)+1;
DAY=day_of_year-(MONTH-1).*30;

i=find(CH4>0 & N2O>0);
c=polyfit(N2O(i),CH4(i),1);
CH4c=polyval(c,N2O);
i=find(isnan(CH4));
CH4(i)=CH4c(i);

NO2c=no2ss(JNO2,ClO,O3,NO,M,TMM);
HNO4=ho2no2ss(JHNO4,HO2,NO2c,OH,M,TMM);
O=oss(M,TMM,O3,JO3ALL);
ClOf=nmedianf(ClO,11);
CLONO2c=clono2ss(JCLONO2,ClOf,NO2c,OH,O,Cl,M,TMM);

i=find(N2O>0);
c=[4.71e-7 -3.27e-4 4.08e-2 -4.69 +3225];
CLY=polyval(c,N2O./M.*1e9).*M./1e12;
i=find(isnan(HCl));
HCl(i)=0.9.*CLY(i)-CLONO2c(i);

P_O1D=2..*O1D.*(ko1dh2o(TMM,M).*H2O + ko1dch4m(TMM,M).*CH4 + ko1dh2(TMM,M).*H2);
P_HNO3=JHNO3.*HNO3;
P_HNO4=JHNO4.*HNO4;
P_H2CO=2.*JH_HCO.*H2CO;
P_Cl=Cl.*CH4.*kclch4(TMM,M);
P=P_O1D+P_HNO3+P_H2CO+P_Cl;
L_HNO3=OH.*kohhno3n(TMM,M).*HNO3;
L_HNO4=2.*kohhno4(TMM,M).*HNO4.*OH;
L_NO2=kohno2n(TMM,M).*NO2c.*OH;
L_HCl=kohhcl(TMM,M).*HCl.*OH;
L_HOX=2.*kho2oh(TMM,M).*HO2.*OH;
L=L_HNO3+L_NO2+L_HOX+L_HNO4+L_HCl;
OHC=OH.*P./L;
F_HNO3=P_HNO3./P;
F_O1D=P_O1D./P;
F_H2CO=P_H2CO./P;
F_HOX=L_HOX./L;
F_NO2=L_NO2./L;
F_HNO4=L_HNO4./L;
FL_HNO3=L_HNO3./L;

OH_fit=f_jsza(abs(SZA),2.25e6,.73,1.815);
fakeOH=2.75e4.*(97.5-abs(SZA));
oh_corr=OH./fakeOH;
JHNO3_FIT1=f_jsza(abs(SZA),1.0e-6,.945,2.75);
JHNO3_FIT2=f_jsza(abs(SZA),.75e-6,.875,0.775);
jhno3_corr=JHNO3./(JHNO3_FIT1 + JHNO3_FIT2);
jo1d_corr=JO1D./f_jsza(abs(SZA),8e-5,.85,2.2);
jno2_corr=JNO2./f_jsza(abs(SZA),1.35e-2,.965,0.11);
jclono2_corr=JCLONO2./f_jsza(abs(SZA),6.9e-5,.945,0.21);
jh2co_corr=JH2CO./f_jsza(abs(SZA),6.9e-5,.945,0.21);
jhno4_corr=JHNO4./f_jsza(abs(SZA),1.37e-5,0.8857, 0.8282);
JO1D_FIT=f_jsza(abs(SZA),8e-5,.85,2.2);
JH2CO_FIT=f_jsza(abs(SZA),6.4e-5,.86,0.67);
JHNO4_FIT=f_jsza(abs(SZA),1.37e-5,0.8857, 0.8282);
OH_fit=1.5e10.*JO1D_FIT+1.75e10.*JH2CO_FIT;
i=find(abs(SZA)<90 & JHNO4./OH>0);
c=polyfit(JHNO4(i),OH(i),2);
OH_jhno4=polyval(c,JHNO4);
OH_fit4=polyval(c,JHNO4_FIT);
AVG_JHNO4=f_jsza(abs(AVG_SZA),1.37e-5,0.8857, 0.8282);
AVG_OH=polyval(c,AVG_JHNO4);
%AVG_OH=2.75e4.*(97.5-abs(AVG_SZA)).*oh_corr;
[sSZA s]=sort(SZA);
sOH=OH(s);
i=find(sOH > 0 & sSZA>-85 & sSZA<85);
c=polyfit(sSZA(i),sOH(i),7);
OH_fit=polyval(c,SZA);

hno3_ss=OH.*NO2c.*kohno2n(TMM,M)./(JHNO3+kohhno3n(TMM,M).*OH);

set(0,'defaultaxeslinewidth',2);
set(0,'defaultaxesfontsize',14);
set(0,'defaultaxesfontname','timesnewroman');

eff_o1d=2.+2.*JH_HCO./(JH2_CO+JH_HCO);
eff_oh=2.*JH_HCO./(JH2_CO+JH_HCO);
eff_cl=1.+2.*JH_HCO./(JH2_CO+JH_HCO);

P_H2O=2..*O1D.*ko1dh2o(TMM,M).*H2O;
P_O1DCH4=eff_o1d.*O1D.*CH4.*ko1dch4m(TMM,M);
P_H2=2..*O1D.*ko1dh2(TMM,M).*H2;
P_OHCH4=eff_oh.*OH.*CH4.*kohch4(TMM,M);
P_CL=eff_cl.*Cl.*CH4.*kclch4(TMM,M);

X_HNO3=L_NO2./(P_HNO3+L_HNO3);
ss=find(X_HNO3>1);
mult=zeros(size(X_HNO3));
mult(ss)=ones(size(ss));
r1=L_HNO3./(P_HNO3+L_HNO3);
r2=P_HNO3./(P_HNO3+L_HNO3);
RC1=L_NO2.*r1;
RC2=L_NO2.*r2;
RC3=0.5.*(L_HNO3-RC1);
RC4=0.5.*(P_HNO3-RC2);
RC3(ss)=zeros(size(ss));
RC4(ss)=zeros(size(ss));
RC1(ss)=0.5.*(L_NO2(ss)+L_HNO3(ss)-P_HNO3(ss));
RC2(ss)=(P_HNO3(ss));

Pcyc=2.*RC4;
Lcyc=2.*(RC1+RC3);

Ptot=P_H2O+P_O1DCH4+P_OHCH4+P_CL+P_H2+Pcyc;
Ltot=Lcyc+L_HOX+L_HNO4+L_HCl;


m=find(abs(SZA)<70 & OH>0 & HNO3>0 & M<2.5e18);

[sLAT s]=sort(LAT(m));
avg_lat=fastavg(sLAT,20);
avg_p=fastavg(P(m(s)),20);
avg_ph2o=fastavg(P_H2O(m(s)),20)./avg_p;
avg_phno3=fastavg(P_HNO3(m(s)),20)./avg_p;
avg_ph2=fastavg(P_H2(m(s)),20)./avg_p;
avg_po1dch4=fastavg(P_O1DCH4(m(s)),20)./avg_p;
avg_pohch4=fastavg(P_OHCH4(m(s)),20)./avg_p;
avg_pc4=fastavg(Pcyc(m(s)),20)./avg_p;
avg_pcl=fastavg(P_CL(m(s)),20)./avg_p;
avg_pnull=fastavg(RC2(m(s)),20)./avg_p;
avg_l=fastavg(L(m(s)),20);
avg_lc1=fastavg(2.*RC1(m(s)),20)./avg_l;
avg_lc3=fastavg(2.*RC3(m(s)),20)./avg_l;
avg_lhno3=fastavg(L_HNO3(m(s)),20)./avg_l;
avg_lno2=fastavg(L_NO2(m(s)),20)./avg_l;
avg_lhox=fastavg(L_HOX(m(s)),20)./avg_l;
avg_lhno4=fastavg(L_HNO4(m(s)),20)./avg_l;
avg_lhcl=fastavg(L_HCl(m(s)),20)./avg_l;
avg_lnull=fastavg(RC2(m(s)),20)./avg_l;

plat=[avg_lat' avg_p' avg_ph2o' avg_ph2' avg_po1dch4' avg_pohch4' avg_pcl' avg_pc4' avg_pnull'];
llat=[avg_lat' avg_l' avg_lc1' avg_lc3' avg_lhox' avg_lhno4' avg_lhcl' avg_lnull'];
%plat=[avg_lat' avg_p' avg_ph2o'+avg_ph2' avg_phno3' avg_po1dch4' avg_pohch4' avg_pcl'];
%llat=[avg_lat' avg_l' avg_lno2' avg_lhox' avg_lhno3' avg_lhno4' avg_lhcl'];

[p_sp l_sp phv_sp po1d_sp lohc_sp lho2_sp]=hoxss(ch4_sp,h2o_sp,hcl_sp,oh_sp,ho2_sp,...
   o1d_sp,cl_sp,no2_sp,hno3_sp,hno4_sp,h2co_sp,jhno3_97,jhno4_97,jh_hco_97,m_97,tmm_97);


H2O2OH=LOD.*3600.*AVG_O1D.*2.*(H2O.*ko1dh2o(TMM,M)+CH4.*ko1dch4m(TMM,M));
HNO32OH=LOD.*3600.*AVG_JHNO3.*HNO3.*jhno3_corr;
OH2HNO3=LOD.*3600.*AVG_OH.*NO2c.*kohno2(TMM,M);
OH2NOX=LOD.*3600.*AVG_OH.*HNO3.*kohhno3(TMM,M);
OH2H2O=LOD.*3600.*AVG_OH.*(HNO3.*kohhno3(TMM,M).*2. + 2.*RAT.*AVG_OH.*kho2oh(TMM,M));
NOY2NOX=LOD.*3600.*(AVG_JHNO3.*HNO3 + AVG_OH.*HNO3.*kohhno3n(TMM,M));
PH2CO=LOD.*3600.*(AVG_JH2CO.*H2CO.*2.*jh2co_corr);
k1=ko3no2(TMM,M).*O3;
k2=het(TMM,108,0.1,SA.*1.1);
t=(26-LOD).*3600;
c=(NO2c+NO).*(1-k2./(k2-k1).*exp(-k1.*t)+k1./(k2-k1).*exp(-k2.*t));
PN2O5=2..*c;
NOX2NOY=PN2O5 + LOD.*3600.*AVG_OH.*NO2c.*kohno2n(TMM,M);
K_TERM=kclono2(TMM,M).*kclo3(TMM,M).*knoo3(TMM,M).*kohhcl(TMM,M)./(knoclo(TMM,M).*kclch4(TMM,M).*1.1);
CLONO22HCL=K_TERM.*O3.*O3.*AVG_OH./(CH4.*AVG_JCLONO2.*AVG_JNO2.*jno2_corr.*jclono2_corr);

k_term=kclono2(TMM,M).*kclo3(TMM,M).*knoo3(TMM,M).*kohhcl(TMM,M)./(knoclo(TMM,M).*kclch4(TMM,M).*1.1);
clono22hcl=k_term.*O3.*O3.*OH./(CH4.*JCLONO2.*JNO2);

OH_5=2.7e4.*(100-SZA_5);
JNO2_5=f_jsza(SZA_5,1.35e-2,.965,0.11);
JCLONO2_5=f_jsza(SZA_5,6.9e-5,.945,0.21);
K_TERM=kclono2(TMM,M).*kclo3(TMM,M).*knoo3(TMM,M).*kohhcl(TMM,M)./(knoclo(TMM,M).*kclch4(TMM,M).*1.1);
CLONO22HCL_5=K_TERM.*O3.*O3.*OH_5./(CH4.*JCLONO2_5.*JNO2_5.*jno2_corr.*jclono2_corr);


k1=ko3no2(TMM,M).*O3;
k2=het(TMM,108,0.1,SA);
t=(26-LOD_5).*3600;
c=(NO2c+NO).*(1-k2./(k2-k1).*exp(-k1.*t)+k1./(k2-k1).*exp(-k2.*t));
PN2O5_5=2..*c;
NOX2NOY_5=PN2O5_5 + LOD_5.*3600.*AVG_OH.*NO2c.*kohno2(TMM,M);

%
% pa_sp~=PA !!!!!
%
i=find(year>1996);
k1=ko3no2(TMM(i),M(i)).*O3(i);
k2=het(TMM(i),108,0.1,pa_sp.*1e8);
t=(26-LOD(i)).*3600;
c=(no2_sp+no_sp).*(1-k2./(k2-k1).*exp(-k1.*t)+k1./(k2-k1).*exp(-k2.*t));
PN2O5_sp=2..*c;
NOX2NOY_sp=PN2O5_sp + LOD(i).*3600.*oh_24.*no2_sp.*kohno2(TMM(i),M(i));
nox2noy_sp=(hno3hv_24+ohhno3_24)./(ohno2_24+n2o5h2o_24.*2 + brono2h2o_24.*1);

hno3_ss=OH.*NO2c.*kohno2n(TMM,M)./(JHNO3+kohhno3n(TMM,M).*OH);
dHNO3=HNO3-hno3_ss;
PL_ss=P_O1D./(2.*L_HNO3_n + L_HOX);
PL=(P_O1D+dHNO3.*JHNO3)./(2.*L_HNO3_n + L_HOX);
hno3_int=AVG_OH.*NO2c.*kohno2n(TMM,M)./(AVG_JHNO3+kohhno3n(TMM,M).*AVG_OH);
hno3_ss_n=OH.*NO2c.*kohno2n(TMM,M)./(JHNO3+kohhno3n(TMM,M).*OH);
dHNO3_n=HNO3-hno3_ss_n;

