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
no2=no2.*M./1e9;
no2_hv=no2_hv.*M./1e12;
noy=noy.*M./1e9;
o3=o3.*M./1e9;
i=find(isnan(h2ohv));
h2ohv(i)=h2o(i).*1e6;
h2o=h2ohv.*M./1e6;
ch4al=ch4al.*M;
clo=clo.*M./1e12;
clono2=clono2.*M./1e12;
hclal=hclal.*M;
t_cly=t_cly.*M./1e9;
i=find(clo>0);
if length(i)>2
   cloc=interp1(time(i),clo(i),time);
   i=find(cloc<0);
   cloc(i)=nan.*ones(size(i));
   clo=cloc;
end
i=find(clono2>0);
if length(i)>2
   clono2c=interp1(time(i),clono2(i),time);
   i=find(clono2c<0);
   clono2c(i)=nan.*ones(size(i));
   clono2=clono2c;
end
i=find(t_cly>0);
if length(i)>2
   t_cly_c=interp1(time(i),t_cly(i),time);
   i=find(t_cly_c<0);
   t_cly_cc(i)=nan.*ones(size(i));
   t_cly=clono2c;
end

j=find(oh>0 & no>0);

