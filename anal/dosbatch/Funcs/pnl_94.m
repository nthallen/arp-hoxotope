H2=5e-7.*m_94;
OH=oh_94;
HO2=oh_94.*rat_94;
RAT=rat_94;
O1D=o1d_94;
H2O=h2o_94;
CH4=ch4_94;
JHNO3=jhno3_94;
JHNO4=jhno4_94;
JH_HCO=jh_hco_94;
JHOBR=0.0;
Cl=cl_94;
HNO3=hno3_94;
HNO4=hno4_94;
H2CO=h2co_94;
NO2=no2c_94;
HCl=hcl_94;
BRO=0.0;
HOBR=0.0;

prodo1d=2..*O1D.*(ko1dh2o(tmm_94,m_94).*H2O + ko1dch4m(tmm_94,m_94).*CH4 + ko1dh2(tmm_94,m_94).*H2);
prodhv=JHNO3.*HNO3 + JHNO4.*HNO4 + 2*JH_HCO.*H2CO + JHOBR.*HOBR;
prodcl=Cl.*CH4.*kclch4(tmm_94,m_94);
prod=prodo1d+prodhv+prodcl;
lossOH=OH.*(kohhno3(tmm_94,m_94).*HNO3 + kohhno4(tmm_94,m_94).*HNO4 + kohno2(tmm_94,m_94).*NO2 + ...
kohhcl(tmm_94,m_94).*HCl+kho2oh(tmm_94,m_94).*HO2);
lossHO2=HO2.*(kho2oh(tmm_94,m_94).*OH + kho2no2(tmm_94,m_94).*NO2 + kho2bro(tmm_94,m_94).*BRO);
loss=lossOH+lossHO2;
ohc=OH.*prod./loss;
ho2c=ohc.*RAT;

prodo1d=2..*O1D.*(ko1dh2o(tmm_94,m_94).*H2O + ko1dch4m(tmm_94,m_94).*CH4 + ko1dh2(tmm_94,m_94).*H2);
prodhv=JHNO3.*HNO3 + JHNO4.*HNO4 + 2*JH_HCO.*H2CO + JHOBR.*HOBR;
prodcl=Cl.*CH4.*kclch4(tmm_94,m_94);
prod=prodo1d+prodhv+prodcl;
lossOH=ohc.*(kohhno3(tmm_94,m_94).*HNO3 + kohhno4(tmm_94,m_94).*HNO4 + kohno2(tmm_94,m_94).*NO2 + ...
kohhcl(tmm_94,m_94).*HCl+kho2oh(tmm_94,m_94).*ho2c);
lossHO2=ho2c.*(kho2oh(tmm_94,m_94).*ohc + kho2no2(tmm_94,m_94).*NO2 + kho2bro(tmm_94,m_94).*BRO);
loss=lossOH+lossHO2;
ohc=ohc.*prod./loss;
ho2c=ohc.*RAT;

prodo1d=2..*O1D.*(ko1dh2o(tmm_94,m_94).*H2O + ko1dch4m(tmm_94,m_94).*CH4 + ko1dh2(tmm_94,m_94).*H2);
prodhv=JHNO3.*HNO3 + JHNO4.*HNO4 + 2*JH_HCO.*H2CO + JHOBR.*HOBR;
prodcl=Cl.*CH4.*kclch4(tmm_94,m_94);
prod=prodo1d+prodhv+prodcl;
lossOH=ohc.*(kohhno3(tmm_94,m_94).*HNO3 + kohhno4(tmm_94,m_94).*HNO4 + kohno2(tmm_94,m_94).*NO2 + ...
kohhcl(tmm_94,m_94).*HCl+kho2oh(tmm_94,m_94).*ho2c);
lossHO2=ho2c.*(kho2oh(tmm_94,m_94).*ohc + kho2no2(tmm_94,m_94).*NO2 + kho2bro(tmm_94,m_94).*BRO);
loss=lossOH+lossHO2;
ohc=ohc.*prod./loss;
ho2c=ohc.*RAT;

p_h2o_94=2..*O1D.*ko1dh2o(tmm_94,m_94).*H2O;
p_ch4_94=2..*O1D.*ko1dch4m(tmm_94,m_94).*CH4;
p_h2_94=2..*O1D.*ko1dh2(tmm_94,m_94).*H2;
p_o1d_94=prodo1d;
p_hno3_94=JHNO3.*HNO3;
p_hno4_94=JHNO4.*HNO4;
p_h2co_94=2..*JH_HCO.*H2CO;
p_HOBR=JHOBR.*HOBR;
p_cl_94=prodcl;
l_hno3_94=ohc.*kohhno3(tmm_94,m_94).*HNO3;
l_hno4_94=ohc.*kohhno4(tmm_94,m_94).*HNO4;
l_no2_94=ohc.*kohno2(tmm_94,m_94).*NO2+ho2c.*kho2no2(tmm_94,m_94).*NO2;
l_hcl_94=ohc.*kohhcl(tmm_94,m_94).*HCl;
l_hox_94=2.*ohc.*kho2oh(tmm_94,m_94).*ho2c;
l_bro=ho2c.*kho2bro(tmm_94,m_94).*BRO;
l_oh_no2_94=ohc.*kohno2(tmm_94,m_94).*NO2;
l_oh_hno4_94=ohc.*kohhno4(tmm_94,m_94).*HNO4;
l_oh_hcl_94=ohc.*kohhcl(tmm_94,m_94).*HCl;