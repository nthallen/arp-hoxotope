o3c=0;
noyc=0;
for i=1:20
   o3=1e12.*(i./3);
   for j=1:20
      noy=1e9.*j;
      
o3c(i,j)=o3;
noyc(i,j)=noy;

m=find(L_HNO3>0 & L_HOX>0 & P_O1D>0 & abs(SZA)<60 & abs(SZA)>50 & OH>0 & HO2>0);
k=find(abs(O3(m)-o3c(i,j))<5e11 & abs(NOY(m)-noyc(i,j))<2e9);
if length(k)==0
   oh_avg(i,j)=nan;
   num_pts(i,j)=nan;
   f(i,j)=nan;
   fOH(i,j)=nan;
   fHO2(i,j)=nan;
else
   % use OH @ SZA=40, 1.5e6
   num_pts(i,j)=length(k);
   f(i,j)=median(OH(m(k)).*P_O1D(m(k))./(2.*L_HNO3(m(k)) + L_HOX(m(k))));
   fHO2(i,j)=median(HO2(m(k)));
   fOH(i,j)=median(OH(m(k)));
end
end
end
