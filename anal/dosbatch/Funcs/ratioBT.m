time=time2d(t);
year=floor(t(100)./86400./365+1970);
day_of_year=fix(t(100)./86400)-(year-1970)*365-(year-1970)./4;
month=floor(day_of_year./30)+1;
day_of_month=day_of_year-(month-1).*30;
clear sza_5 lod_5
%ASHOE/MAESA BT files use 500 pts for 10 day back trajectory
if year==1994
   bin=1:250;
else
   bin=1:50;
end

lat_5=interp1(ftimes,mean(Lat(bin,:)),time);
long_5=interp1(ftimes,mean(Long(bin,:)),time);
pmm_5=interp1(ftimes,mean(P(bin,:)),time);
tmm_5=interp1(ftimes,mean(T(bin,:)),time);
lat_10=interp1(ftimes,mean(Lat(2.*bin,:)),time);
long_10=interp1(ftimes,mean(Long(2.*bin,:)),time);
pmm_10=interp1(ftimes,mean(P(2.*bin,:)),time);
tmm_10=interp1(ftimes,mean(T(2.*bin,:)),time);
sza_10=interp1(ftimes,mean(SZA(2.*bin,:)),time);
for d=1:length(ftimes)
   sza=szac1(mean(Lat(bin,d)),mean(Long(bin,d)),0:3600:86400,month,day_of_month,year);
   e=find(sza<90);
   if length(e)>0
      sza_5(d)=median(abs(sza(e)));
      lod_5(d)=24.*length(e)./length(sza);
   else
      sza_5(d)=nan;
      lod_5(d)=nan;
   end
end
sza_5=interp1(ftimes,sza_5,time);
lod_5=interp1(ftimes,lod_5,time);