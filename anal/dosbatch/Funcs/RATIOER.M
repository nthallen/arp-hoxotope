% script to calculate the concentration of 
% each species in molecules/cc.
% conc = mixing ratio .* M./ppwhatever;
time=time2d(t);
M=pmm./1013;
M=M.*2.46e19.*298../tmm;
coal=coal.*M;
ch4=ch4al.*M;
oh=oh.*M./1e15;
ho2=ho2.*M./1e15;
n2o=n2o.*M./1e9;
no=no.*M./1e9;
%
no2ss=no.*o3.*knoo3(tmm,M)./0.012;
%
no2=no2.*M./1e9;
noy=noy.*M./1e9;
clo=clo.*M./1e12;
o3=o3.*M./1e9;
h2o=h2o.*M./1e6;
L1=ho2.*oh.*kho2oh(tmm,M);
k1=kho2no(tmm,M);
k2=kohco(tmm,M);
k3=koho3(tmm,M);
k4=kho2o3(tmm,M);
frxnco=k2.*coal./(k3.*o3);
frxnno=k1.*ho2.*no./(2*L1);
%frxnno=NO.*kho2no(TMM,M)./(O3.*kho2o3(TMM,M)+2.*OH.*kho2oh(TMM,M));
mroh=1e15.*oh./M;
mrno=1e9.*no./M;
rat=ho2oh(tmm,o3,no,coal,clo,1e6,pmm);
i=find(o3>0);
j=i;
%j=find(frxnco> 8 & frxnno> 4 & mroh>250 & mrno>.0);
