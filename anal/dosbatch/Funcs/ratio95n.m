% 	ratio95.m
% 	load strat archive files
%  uses ratioer95 routine
%  ratioer95 uses h2o instead of h2ohv
%	calculate ho2./oh in ratioer95.m
% 	merge arrays in consol_95.m
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
LAT_10=[];
LONG_10=[];
PMM_10=[];
TMM_10=[];
SZA_10=[];

fltdir='d:\strat\archive\';


fltdays=[951020 951024 951026 951031 951102 951105 951107 951109 ...
      960129 960201 960202 960205 960208 960212 960213 960215 ...
      960718 960722 960725 960730 960801 960803 960805 960807 960808 960810];
for index=1:length(fltdays)
   fltday=num2str(fltdays(index));
   %eval(['load ', fltdir, fltday, '/', fltday, 'sp']);
   %tmjay=t;
   eval(['load ', fltdir, fltday, '/', fltday]);
   ratioer95
   %jays_95;
   eval(['load ', fltdir, '/BT/bt', fltday]);
   ratioBT
   day_of_year=fix(t./86400)-25*365-6;
   month=floor(day_of_year./30)+1;
   day_of_month=day_of_year-(month-1).*30;
   sza=real(szac1(latfp(j),longfp(j),time(j),median(month),median(day_of_month),1995));
   nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,median(month),median(day_of_month),1995));
   ii=find(sza>nextsza & length(j)>0);
   sza(ii)=-sza(ii);
   consol_95
end
     
 
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
%CLOOCL=clooclss(CLO',JCLOOCL',M',TMM')';
%CL=clss(CLO,NO,BRO,O3,CLOOCL,JCLOOCL,M,TMM);
%O1D=o1dss(JO1D,O3,M,TMM);
%NO2c=no2ss(JNO2,CLO,O3,NO,M,TMM);
%HNO4=ho2no2ss(JHNO4,HO2,NO2c,OH,M,TMM);
%O=oss(M,TMM,O3,JO3ALL);
%H2CO=h2coss(JH_HCO,JH2_CO,O1D,CH4,OH,O,CL,M,TMM);
%CLONO2=clono2ss(JCLONO2,CLO,NO2c,OH,O,CL,M,TMM);
%HNO3=NOY-HNO4-CLONO2-NO-NO2c;
%[prod,loss,prodhv,prodo1d,lossOH,lossHO2]=hoxss_n(CH4,H2O,HCL,OH,...
%   HO2,O1D,CL,NO2c,HNO3,HNO4,H2CO,JHNO3,JHNO4,JH_HCO,M,TMM);


i=find(M<2.5e18);
time_95=TIME(i);
oh_95=OH(i);
ho2_95=HO2(i);
h2o_95=H2O(i);
no_95=NO(i);
co_95=CO(i);
o3_95=O3(i);
tmm_95=TMM(i);
pmm_95=PMM(i);
%clo_95=CLO(i);
bro_95=BRO(i);
hcl_95=HCL(i);
%no2_95=NO2(i);
%no2c_95=NO2c(i);
noy_95=NOY(i);
ch4_95=CH4(i);
n2o_95=N2O(i);
pafcas_95=PAFCAS(i);
lat_95=LAT(i);
long_95=LONG(i);
%jo1d_95=JO1D(i);
%jhno4_95=JHNO4(i);
%jh2_co_95=JH2_CO(i);
%jh_hco_95=JH_HCO(i);
%jhno3_95=JHNO3(i);
%jno2_95=JNO2(i);
%jo3all_95=JO3ALL(i);
%jclono2_95=JCLONO2(i);
%jcloocl_95=JCLOOCL(i);
%jalbedo_95=JALBEDO(i);
%jo3above_95=JO3ABOVE(i);
uv_jo1d_95=UV_JO1D(i);
uv_jno2_95=UV_JNO2(i);
uv_o3col_95=UV_O3COL(i);
sza_95=SZA(i);
%cl_95=CL(i);
%clono2_95=CLONO2(i);
m_95=M(i);
pt_95=PT(i);
z_95=Z(i);

%o1d_95=o1dss(jo1d_95,o3_95,m_95,tmm_95);
%hno4_95=ho2no2ss(jhno4_95,ho2_95,no2c_95,oh_95,m_95,tmm_95);
%o_95=oss(m_95,tmm_95,o3_95,jo3all_95);
%h2co_95=h2coss(jh_hco_95,jh2_co_95,o1d_95,ch4_95,oh_95,o_95,cl_95,m_95,tmm_95);
%hno3_95=noy_95-hno4_95-clono2_95-no_95-no2c_95;
rat_95=ho2oh(tmm_95,o3_95,no_95,co_95,1e7,bro_95,pmm_95);
%[p_95 l_95 phv_95 po1d_95 loh_95 lho2_95]=hoxss_n(ch4_95,h2o_95,hcl_95,oh_95,ho2_95,...
 %  o1d_95,cl_95,no2c_95,hno3_95,hno4_95,h2co_95,jhno3_95,jhno4_95,jh_hco_95,m_95,tmm_95);


save avg_95 *_95

