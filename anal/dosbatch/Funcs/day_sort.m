% day_sort
clear day_number di d
day_number=day_of_year;
day_number(YEAR>1996)=day_number(YEAR>1996)+365;
dDAY(1)=1;
for d=2:length(day_number)
   dDAY(d)=day_number(d)-day_number(d-1);
end
d=find(abs(dDAY)>0.5);
for di=1:length(d)
   i=find(abs(day_number-day_number(d(di))) < 0.25);
   j=find(abs(dOH(i))<1 & abs(SZA(i))<70);
   if length(j)==0
      j=find(abs(dOH)<1 & abs(SZA)<70);
      avg_dOH(i)=median(dOH(j)).*ones(size(i));
   else
      avg_dOH(i)=median(dOH(i(j))).*ones(size(i));
   end
   k=find(abs(SZA(i))<70 & abs(dOH(i))<0.5);
   flight(i)=di.*ones(size(i));
   if length(k)>0
      plot(O3ABOVE(i(k)),dOH(i(k)),'.')
      label=['i = ', num2str(day_number(d(di)))];
      title(label);
      pause
   end

end

   
   
   