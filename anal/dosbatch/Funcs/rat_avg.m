[slat s]=sort(LAT);
i=find(abs(SZA(s))<85);
avg_lat=fastavg(slat(i),10);
avg_rat=fastavg(HO2(s(i))./OH(s(i)),10);
avg_koho3=fastavg(k3(s(i)),10);
avg_ko3ho2=fastavg(k2(s(i)),10);
avg_kho2no=fastavg(k1(s(i)),10);
avg_kho2bro=fastavg(k7(s(i)),10);
avg_kho2clo=fastavg(k5(s(i)),10);
total=avg_ko3ho2+avg_kho2no+avg_kho2clo+avg_kho2bro;
semilogy(avg_lat,avg_ko3ho2,'.',avg_lat,avg_kho2no,'.',avg_lat,avg_kho2clo,'.',avg_lat,avg_kho2bro,'.',avg_lat,total,'.',avg_lat,avg_koho3,'.')