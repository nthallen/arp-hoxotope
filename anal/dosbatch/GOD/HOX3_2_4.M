% hox3_2_4.m

% Program to convert OH and HO2 version 3_2 to version 4
% requires a spreadsheet, ohsubmit.mat, that has SD__P and 
% SAFF1.

load ohsubmit
day=fix(Time(1)./(24.*60.*60));
Time=time2d(Time);
if day < 9600
	sd__p0=0.117;
else
	sd__p0=0.070;
end

%  Set up temperature and pressure; calculate M and velocity
%     saff1 assumed correct.
	
offset=0;
temp=SAFF1+ offset;
press=SD__P-sd__p0;

% calculate the number density 
M_hox=M(press,temp);

ohnew=ohsubmit.*(1.72./1.65).*q2(M_hox,temp)./q3(M_hox,temp);
ho2new=ho2submit.*(1.72./1.65).*q2(M_hox,temp)./q3(M_hox,temp);
