%determine average o3 value for each flight
function o3_avg=o3_avger(day_of_year,o3_97);
clear o3_avg;
l=length(day_of_year);
g=find(round(day_of_year(2:l))>round(day_of_year(1:l-1)));
%g=find(gradient(round(day_of_year))>0);
for ii=1:(length(g)-1)
   if ii==1
      bin=1:(g(ii)-1);
      good_bin=find(~isnan(o3_97(bin)));
      if length(good_bin)>5
         o3_avg(bin)=median(o3_97(bin(good_bin(1:5))));
      else
         o3_avg(bin)=median(o3_97(bin));
      end
      bin=(g(ii)):g(ii+1);
      good_bin=find(~isnan(o3_97(bin)));
      if length(good_bin)>5
         o3_avg(bin)=median(o3_97(bin(good_bin(1:5))));
      else
         o3_avg(bin)=median(o3_97(bin));
      end
   else
      bin=g(ii):g(ii+1);
      good_bin=find(~isnan(o3_97(bin)));if length(good_bin)>5
         o3_avg(bin)=median(o3_97(bin(good_bin(1:5))));
      else
         o3_avg(bin)=median(o3_97(bin));
      end
   end
   end
bin=g(ii):l;
good_bin=find(~isnan(o3_97(bin)));
if length(good_bin)>5
         o3_avg(bin)=median(o3_97(bin(good_bin(1:5))));
      else
         o3_avg(bin)=median(o3_97(bin));
      end
