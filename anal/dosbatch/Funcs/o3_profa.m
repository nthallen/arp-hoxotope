% plot o3_above for eac flight; ASHOE version
fltdir='d:\asho\archive\';
%fltdays=[940214 940318 940320 940321 940322 940327 940329 940330 940403 940405 940408 ...
%      940523 940528 940601 940603 940728 940730 940801 940806 941010 941013 941020 941022 ...
%      941029 941104];
fltdays=[940320 940321 940322 940327 940329 940330 940403 940405 940408 ...
      940523 940528 940730 940801 940806 941010 941013 941020 941022 ...
      941029 941104];

% load mat file with begin, middle, and end o3 column from CT file
load ozone.mat

for index=1:length(fltdays)
fltday=num2str(fltdays(index));
%
   eval(['load ', fltdir, fltday, '/', fltday]);
   ratioer94;
   % interpolate TOMS columns to time grid
   
   o3time=[min(time) (min(time)+max(time))./2 max(time)];
   j=find(ozone(index,:)>0);
   o3column=interp1(o3time(j),ozone(index,j),time);
   eval(['load ', fltdir, fltday, '/', fltday, 'sp']);
   tmjay=t;
   jays_94;
   
  
   i=find(n2o>0);
   bro=1e-12.*M(i).*bryn2o(1e9.*n2o(i)./M(i));
   bro=0.5.*interp1(i,bro,1:length(time));
   bro=bro';
   c=[4.63 6.06e11];
   ch4c=polyval(c,n2o);
   i=find(isnan(ch4al));
   ch4al(i)=ch4c(i);
   c=[-8.7e-4 2.8e9];
   hclc=polyval(c,n2o);
   i=find(isnan(hclal));
   hclal(i)=hclc(i);
   m=M;
   no2=no2ss(rjno2,clo,o3,no,m,tmm);
   o1d=o1dss(rjo3o1d,o3,m,tmm);
   hno4=ho2no2ss(rjhono3,ho2,no2,oh,m,tmm);
   cloocl=real(clooclss(clo,rjcloocl,m,tmm));
   cl=clss(clo,no,bro,o3,cloocl,rjcloocl,M,tmm);
   o=oss(m,tmm,o3,rjo3all);
h2co=h2coss(rjh_hco,rjh2_co,o1d,ch4al,oh,o,cl,m,tmm);
clono2c=clono2ss(rjclono2,clo,no2,oh,o,cl,m,tmm);
hno3=noy-hno4-clono2c-no-no2;
rat=ho2oh(tmm,o3,no,coal,clo,bro,pmm);
 [psp lsp phv po1d loh lho2]=hoxss_n(ch4al,h2o,hclal,oh,ho2,...
   o1d,cl,no2,hno3,hno4,h2co,rjhono2,rjhono3,rjh_hco,m,tmm);

o3above=rjo3above;
   i=find(o3>0);
   z_mm=zfp.*12.*25.4;
   o3_below=cumsum(o3(i).*gradient(z_mm(i))./2.85e17);
   subplot(2,1,1)
   plot(time(i),o3above(i),'.',time(i),o3column(i)-o3_below,'r.')
   xlabel('time')
   ylabel('O_3 above ER-2')
   title(fltday)
   legend('TOMS-climatology',['TOMS - integrated O_3'])
   subplot(2,1,2)
   plot(time(i),psp(i)./lsp(i),'.')
   pause;
   subplot(1,1,1)
   plot((median(o3_below)-o3_below),psp(i)./lsp(i),'.')
   pause
end

  
   
   
   