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

p_h2o=2..*O1D.*ko1dh2o(tmm_97,m_97).*H2O;
p_ch4=2..*O1D.*ko1dch4m(tmm_97,m_97).*CH4;
p_h2=2..*O1D.*ko1dh2(tmm_97,m_97).*H2;
p_hno3=JHNO3.*HNO3;
p_hno4=JHNO4.*HNO4;
p_h2co=2..*JH_HCO.*H2CO;
p_HOBR=JHOBR.*HOBR;
p_cl=prodcl;
l_hno3=ohc.*kohhno3(tmm_97,m_97).*HNO3;
l_hno4=ohc.*kohhno4(tmm_97,m_97).*HNO4;
l_no2=ohc.*kohno2(tmm_97,m_97).*NO2+ho2c.*kho2no2(tmm_97,m_97).*NO2;
l_hcl=ohc.*kohhcl(tmm_97,m_97).*HCl;
l_hox=2.*ohc.*kho2oh(tmm_97,m_97).*ho2c;
l_bro=ho2c.*kho2bro(tmm_97,m_97).*BRO;
l_oh_no2=ohc.*kohno2(tmm_97,m_97).*NO2;
l_oh_hno4=ohc.*kohhno4(tmm_97,m_97).*HNO4;
l_oh_hcl=ohc.*kohhcl(tmm_97,m_97).*HCl;