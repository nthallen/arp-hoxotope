H2=5e-7.*m_97;
OH=oh_97;
HO2=oh_97.*rat_97;
RAT=rat_97;
O1D=o1d_97;
H2O=h2o_97;
CH4=ch4_97;
JHNO3=jhno3_97;
JHNO4=jhno4_97;
JH_HCO=jh_hco_97;
JHOBR=jhobr_sp;
Cl=cl_97;
HNO3=hno3_97;
HNO4=hno4_97;
H2CO=h2co_97;
NO2=no2c_97;
HCl=hcl_97;
BRO=0.0.*bro_97;
HOBR=0.0.*hobr_sp;

prodo1d=2..*O1D.*(ko1dh2o(tmm_97,m_97).*H2O + ko1dch4m(tmm_97,m_97).*CH4 + ko1dh2(tmm_97,m_97).*H2);
prodhv=JHNO3.*HNO3 + JHNO4.*HNO4 + 2*JH_HCO.*H2CO + JHOBR.*HOBR;
prodcl=Cl.*CH4.*kclch4(tmm_97,m_97);
prod=prodo1d+prodhv+prodcl;
lossOH=OH.*(kohhno3(tmm_97,m_97).*HNO3 + kohhno4(tmm_97,m_97).*HNO4 + kohno2(tmm_97,m_97).*NO2 + ...
kohhcl(tmm_97,m_97).*HCl+kho2oh(tmm_97,m_97).*HO2);
lossHO2=HO2.*(kho2oh(tmm_97,m_97).*OH + kho2no2(tmm_97,m_97).*NO2 + kho2bro(tmm_97,m_97).*BRO);
loss=lossOH+lossHO2;
ohc=OH.*prod./loss;
ho2c=ohc.*RAT;

prodo1d=2..*O1D.*(ko1dh2o(tmm_97,m_97).*H2O + ko1dch4m(tmm_97,m_97).*CH4 + ko1dh2(tmm_97,m_97).*H2);
prodhv=JHNO3.*HNO3 + JHNO4.*HNO4 + 2*JH_HCO.*H2CO + JHOBR.*HOBR;
prodcl=Cl.*CH4.*kclch4(tmm_97,m_97);
prod=prodo1d+prodhv+prodcl;
lossOH=ohc.*(kohhno3(tmm_97,m_97).*HNO3 + kohhno4(tmm_97,m_97).*HNO4 + kohno2(tmm_97,m_97).*NO2 + ...
kohhcl(tmm_97,m_97).*HCl+kho2oh(tmm_97,m_97).*ho2c);
lossHO2=ho2c.*(kho2oh(tmm_97,m_97).*ohc + kho2no2(tmm_97,m_97).*NO2 + kho2bro(tmm_97,m_97).*BRO);
loss=lossOH+lossHO2;
ohc=ohc.*prod./loss;
ho2c=ohc.*RAT;

prodo1d=2..*O1D.*(ko1dh2o(tmm_97,m_97).*H2O + ko1dch4m(tmm_97,m_97).*CH4 + ko1dh2(tmm_97,m_97).*H2);
prodhv=JHNO3.*HNO3 + JHNO4.*HNO4 + 2*JH_HCO.*H2CO + JHOBR.*HOBR;
prodcl=Cl.*CH4.*kclch4(tmm_97,m_97);
prod=prodo1d+prodhv+prodcl;
lossOH=ohc.*(kohhno3(tmm_97,m_97).*HNO3 + kohhno4(tmm_97,m_97).*HNO4 + kohno2(tmm_97,m_97).*NO2 + ...
kohhcl(tmm_97,m_97).*HCl+kho2oh(tmm_97,m_97).*ho2c);
lossHO2=ho2c.*(kho2oh(tmm_97,m_97).*ohc + kho2no2(tmm_97,m_97).*NO2 + kho2bro(tmm_97,m_97).*BRO);
loss=lossOH+lossHO2;
ohc=ohc.*prod./loss;
ho2c=ohc.*RAT;

p_h2o_97=2..*O1D.*ko1dh2o(tmm_97,m_97).*H2O;
p_ch4_97=2..*O1D.*ko1dch4m(tmm_97,m_97).*CH4;
p_h2_97=2..*O1D.*ko1dh2(tmm_97,m_97).*H2;
p_o1d_97=prodo1d;
p_hno3_97=JHNO3.*HNO3;
p_hno4_97=JHNO4.*HNO4;
p_h2co_97=2..*JH_HCO.*H2CO;
p_HOBR=JHOBR.*HOBR;
p_cl_97=prodcl;
l_hno3_97=ohc.*kohhno3(tmm_97,m_97).*HNO3;
l_hno4_97=ohc.*kohhno4(tmm_97,m_97).*HNO4;
l_no2_97=ohc.*kohno2(tmm_97,m_97).*NO2+ho2c.*kho2no2(tmm_97,m_97).*NO2;
l_hcl_97=ohc.*kohhcl(tmm_97,m_97).*HCl;
l_hox_97=2.*ohc.*kho2oh(tmm_97,m_97).*ho2c;
l_bro=ho2c.*kho2bro(tmm_97,m_97).*BRO;
l_oh_no2_97=ohc.*kohno2(tmm_97,m_97).*NO2;
l_oh_hno4_97=ohc.*kohhno4(tmm_97,m_97).*HNO4;
l_oh_hcl_97=ohc.*kohhcl(tmm_97,m_97).*HCl;
avg_sza(d)=median(abs(sza(j)));
      oh_5_97=2.7e4.*(100-abs(sza_5_97));
      JHNO3_FIT1=f_jsza(abs(sza_5_97),1.25e-6,.945,2.75);
      JHNO3_FIT2=f_jsza(abs(sza_5_97),.53e-6,.93,0.375);
      jhno3_5_97=JHNO3_FIT1 + JHNO3_FIT2;
      jo1d_5_97=f_jsza(abs(sza_5_97),8e-5,.85,2.2);
      jno2_5_97=f_jsza(abs(sza_5_97),1.35e-2,.965,0.11);
      jclono2_5_97=f_jsza(abs(sza_5_97),6.9e-5,.945,0.21);
      jh2co_5_97=f_jsza(abs(sza_5_97),6.9e-5,.945,0.21);
k1=ko3no2(tmm_97,m_97).*O3;
k2=het(tmm_97,108,0.1,2);
t=(24-LOD).*86400;
c=(NO+NO2).*(1-k2./(k2-k1).*exp(-k1.*t)+k1./(k2-k1).*exp(-k2.*t));
PN2O5=2..*c;
NOX2NOY=PN2O5 + LOD.*3600.*AVG_OH.*NO2.*kohno2(tmm_97,m_97);
CLONO22HCL=kclono2(tmm_97,m_97).*kclo3(tmm_97,m_97).*knoo3(tmm_97,m_97).*kohhcl(tmm_97,m_97)./(knoclo(tmm_97,m_97).*kclch4(tmm_97,m_97).*1.1);
CLONO22HCL=CLONO22HCL.*O3.*O3.*AVG_OH./(CH4.*AVG_JCLONO2.*AVG_JNO2);

top=kclono2(tmm_97,m_97).*kclo3(tmm_97,m_97).*knoo3(tmm_97,m_97).*kohhcl(tmm_97,m_97)./(knoclo(tmm_97,m_97).*kclch4(tmm_97,m_97).*1.1);
CLONO22HCL=top.*o3_97.*o3_97.*avg_oh_97./(ch4_97.*avg_jclono2_97.*avg_jno2_97);
clono22hcl_5=top.*o3_97.*o3_97.*oh_5_97./(ch4_97.*jclono2_5_97.*jno2_5_97);
