function dxdt=test(t,x)
% diffyq.m function dxdt=test(t,x)
% ode45('diffyq',t,x,...)
area=2;
NO2=x(1);
O3=x(2);
NO3=x(3);
N2O5=x(4);
HNO3=x(5);
dNO2=-O3.*NO2.*ko3no2(230,2e18)-NO2.*NO3.*kno2no3(230,2e18);
dO3=-O3.*NO2.*ko3no2(230,2e18);
dNO3=O3.*NO2.*ko3no2(230,2e18)-NO2.*NO3.*kno2no3(230,2e18);
dN2O5=NO2.*NO3.*kno2no3(200,2e18)-N2O5.*het(230,108,0.1,area);
dHNO3=2.*N2O5.*het(230,108,0.1,area);
dxdt=[dNO2; dO3; dNO3; dN2O5; dHNO3;];


%k1=ko3no2(230,2e18).*5e12;
%k2=het(230,108,0.1,2);
%c=2e9.*(1-k2./(k2-k1).*exp(-k1.*t)+k1./(k2-k1).*exp(-k2.*t))