eval(['load ', fltdir, fltday, '/', fltday, 'sp']);
tmjay=t;
eval(['load ', fltdir, fltday, '/', fltday]);
ratioer97
jays_97;
eval(['load ', fltdir, '/BT/bt', fltday]);
ratioBT
day_of_year=fix(t./86400)-27*365-7;
month=floor(day_of_year./30)+1;
day_of_month=day_of_year-(month-1).*30;
sza=real(szac1(latfp(j),longfp(j),time(j),median(month),median(day_of_month),1997));
nextsza=real(szac1(latfp(j),longfp(j),time(j)+100,median(month),median(day_of_month),1997));
ii=find(sza>nextsza & length(j)>0);
sza(ii)=-sza(ii);
consol_97
