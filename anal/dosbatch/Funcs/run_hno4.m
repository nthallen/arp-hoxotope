% File to run ho2no2.int
HNO4_INT=[];
HNO4_SS=[];
NO_INT=[];
NO2_INT=[];
index=0;

for i=1:length(O3);
   index=index+1;
   if (HNO4(i)>0)
      [HNO4_INT(index) HNO4_SS(index) NO_INT(index) NO2_INT(index)]=ho2no2_new(HNO4(i),NO(i)+NO2c(i),O3(i),...
         LAT(i),LONG(i),DAY(i),MONTH(i),YEAR(i),time2d(TIME(i)),TMM(i),M(i),jno2_corr(i),jhno4_corr(i),oh_corr(i));
   else 
      HNO4_INT(index) = NaN;
      HNO4_SS(index) = NaN;
      NO_INT(index) = NaN;
      NO2_INT(index) = NaN;
   end
      
end

save run_long HNO4_INT HNO4_SS NO_INT NO2_INT
