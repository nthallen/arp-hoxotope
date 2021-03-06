% script to calculate the concentration of 
% each species in molecules/cc.
% conc = mixing ratio .* M./ppwhatever;
time=time2d(t);
M=pmm./1013;
M=M.*2.46e19.*298../tmm;
coal=coal.*M;
oh=oh.*M./1e15;
ho2=ho2.*M./1e15;
n2o=n2o.*M./1e9;
no=no.*M./1e9;
%no2=no2.*M./1e9;
noy=noy.*M./1e9;
o3=o3.*M./1e9;
h2ohv=h2ohv.*M./1e6;
ch4al=ch4al.*M;
%clo=clo.*M./1e12;
mroh=1e15.*oh./M;
mrno=1e9.*no./M;
hclal=hclal.*M;
i=find(isnan(n2o));
n2o(i)=n2oal(i).*M(i);
i=find(n2o>0);
bro=1e-12.*M(i).*bryn2o(1e9.*n2o(i)./M(i));
bro=interp1(time(i),bro,time);
j=find(o3>0);
