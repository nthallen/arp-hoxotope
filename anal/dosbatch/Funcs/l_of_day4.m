clear avg_sza fakeOH avg_jo1d avg_jhno3 avg_jno2 avg_jclono2 avg_jh2co length_of_day
day_of_year=fix(time_97./86400)-27*365-7;
month=floor(day_of_year./30)+1;
day_of_month=day_of_year-(month-1).*30;
for d=1:length(month)
   sza=szac1(lat_97(d),long_97(d),0:360:86400,month(d),day_of_month(d),1997);
   j=find(sza<94);
   if length(j)>0
      avg_sza(d)=median(abs(sza(j)));
      fakeOH(d)=median(2.7e4.*(100-abs(sza(j))));
      JHNO3_FIT1=f_jsza(abs(sza(j)),1.0e-6,.945,2.75);
      JHNO3_FIT2=f_jsza(abs(sza(j)),.75e-6,.875,0.775);
      avg_jhno3(d)=median(JHNO3_FIT1 + JHNO3_FIT2);
      avg_jo1d(d)=median(f_jsza(abs(sza(j)),8e-5,.85,2.2));
      avg_jno2(d)=median(f_jsza(abs(sza(j)),1.35e-2,.965,0.11));
      avg_jclono2(d)=median(f_jsza(abs(sza(j)),6.9e-5,.945,0.21));
      avg_jh2co(d)=median(f_jsza(abs(sza(j)),6.9e-5,.945,0.21));
      length_of_day(d)=24.*length(j)./length(sza);
   else
      avg_sza(d)=nan;
      fakeOH(d)=nan;
      avg_jo1d(d)=nan;
      avg_jhno3(d)=nan;
      avg_jno2(d)=nan;
      avg_jclono2(d)=nan;
      avg_jh2co(d)=nan;
      length_of_day(d)=nan;
   end
end
lod_97=length_of_day;
avg_sza_97=avg_sza;
avg_oh_97=fakeOH;
avg_jo1d_97=avg_jo1d;
avg_jhno3_97=avg_jhno3;
avg_jclono2_97=avg_jclono2;
avg_jno2_97=avg_jno2;
avg_jh2co_97=avg_jh2co;
day_of_year=fix(time_94./86400)-24*365-6;
month=floor(day_of_year./30)+1;
day_of_month=day_of_year-(month-1).*30;
for d=1:length(month)
   sza=szac1(lat_94(d),long_94(d),0:360:86400,month(d),day_of_month(d),1994);
   j=find(sza<94);
   if length(j)>0
      avg_sza(d)=median(abs(sza(j)));
      fakeOH(d)=median(2.7e4.*(100-abs(sza(j))));
      JHNO3_FIT1=f_jsza(abs(sza(j)),1.0e-6,.945,2.75);
      JHNO3_FIT2=f_jsza(abs(sza(j)),.75e-6,.875,0.775);
      avg_jhno3(d)=median(JHNO3_FIT1 + JHNO3_FIT2);
      avg_jo1d(d)=median(f_jsza(abs(sza(j)),8e-5,.85,2.2));
      avg_jno2(d)=median(f_jsza(abs(sza(j)),1.35e-2,.965,0.11));
      avg_jclono2(d)=median(f_jsza(abs(sza(j)),6.9e-5,.945,0.21));
      avg_jh2co(d)=median(f_jsza(abs(sza(j)),6.9e-5,.945,0.21));
      length_of_day(d)=24.*length(j)./length(sza);
   else
      avg_sza(d)=nan;
      fakeOH(d)=nan;
      avg_jo1d(d)=nan;
      avg_jhno3(d)=nan;
      avg_jno2(d)=nan;
      avg_jclono2(d)=nan;
      avg_jh2co(d)=nan;
      length_of_day(d)=nan;
   end
end
lod_94=length_of_day;
avg_sza_94=avg_sza;
avg_oh_94=fakeOH;
avg_jo1d_94=avg_jo1d;
avg_jhno3_94=avg_jhno3;
avg_jclono2_94=avg_jclono2;
avg_jno2_94=avg_jno2;
avg_jh2co_94=avg_jh2co;

save lod_4 lod* avg_oh_* avg_sza_* avg_j*

