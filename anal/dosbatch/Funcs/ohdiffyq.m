function dxdt=test(t,x)
% diffyq.m function dxdt=test(t,x)
% ode45('diffyq',t,x,...)
area=2;
OH=x(1);
HNO3=x(2);
HO2=x(3);
NO=x(4);
O3=x(5);
plOH=3.*(HNO3.*1e-6 - OH.*HNO3.*kohhno3n(230,2e18))-5.*OH.*HO2.*kho2oh(230,2e18);
cycOH=HO2.*NO.*kho2no(230,2e18) - OH.*O3.*koho3(230,2e18);
dOH=plOH+cycOH;
dHO2=-cycOH-5.*OH.*HO2.*kho2oh(230,2e18);
dO3=0;
dHNO3=0;
dNO=0;
dxdt=[dOH; dHNO3; dHO2; dNO; dO3;];


%k1=ko3no2(230,2e18).*5e12;
%k2=het(230,108,0.1,2);
%c=2e9.*(1-k2./(k2-k1).*exp(-k1.*t)+k1./(k2-k1).*exp(-k2.*t))