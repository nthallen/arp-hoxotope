% plot o3_above for eac flight
fltdir='d:\polaris\archive\';
%fltdays=[970502 970506 970513 970626 970707 970908 970918 970919];
%for index=1:length(fltdays)
%fltday=num2str(fltdays(index));
%
   eval(['load ', fltdir, fltday, '/', fltday]);
   ratioer97;
   eval(['load ', fltdir, fltday, '/', fltday, 'cp']);
   tcp=t;
   jo3above_cp=jo3above;
   eval(['load ', fltdir, fltday, '/', fltday, 'sp']);
   tmjay=t;
   tsp=t;
   jo3above_sp=jo3above;
   jays_97;
   
   i=find(n2o>0);
   bro=1e-12.*M(i).*bryn2o(1e9.*n2o(i)./M(i));
   bro=0.5.*interp1(i,bro,1:length(time));
   bro=bro';
   i=find(ch4al>0 & n2o>0);
   c=polyfit(n2o(i),ch4al(i),1);
   ch4c=polyval(c,n2o);
   i=find(isnan(ch4al));
   ch4al(i)=ch4c(i);
   i=find(hclal>0 & n2o>0);
   c=polyfit(n2o(i),hclal(i),1);
   hclc=polyval(c,n2o);
   i=find(isnan(hclal));
   hclal(i)=hclc(i);
m=M;
   o1d=o1dss(rjo3o1d,o3,m,tmm);
   hno4=ho2no2ss(rjhno4_350,ho2,no2,oh,m,tmm);
   cloocl=clooclss(clo,rjcloocl,m,tmm);
   cl=clss(clo,no,bro,o3,cloocl,rjcloocl,M,tmm);
   o=oss(m,tmm,o3,rjo3all);
h2co=h2coss(rjh_hco,rjh2_co,o1d,ch4al,oh,o,cl,m,tmm);
hno3=noy-hno4-clono2-no-no2;
clono2c=clono2ss(rjclono2,clo,no2,oh,o,cl,m,tmm);
rat=ho2oh(tmm,o3,no,coal,clo,bro,pmm);
[pcp lcp phv po1d loh lho2]=hoxss_n(ch4al,h2o,hclal,oh,ho2,...
   o1d,cl,no2,hno3,hno4,h2co,rjhono2,rjhno4_350,rjh_hco,m,tmm);

   
   
   eval(['load ', fltdir, fltday, '/', fltday, 'tm']);
   ttm=t;
   tmjay=t;
   jays_97;
   o1d=o1dss(rjo3o1d,o3,m,tmm);
   hno4=ho2no2ss(rjhno4_350,ho2,no2,oh,m,tmm);
   cloocl=clooclss(clo,rjcloocl,m,tmm);
   cl=clss(clo,no,bro,o3,cloocl,rjcloocl,M,tmm);
   o=oss(m,tmm,o3,rjo3all);
h2co=h2coss(rjh_hco,rjh2_co,o1d,ch4al,oh,o,cl,m,tmm);
hno3=noy-hno4-clono2-no-no2;
clono2c=clono2ss(rjclono2,clo,no2,oh,o,cl,m,tmm);
rat=ho2oh(tmm,o3,no,coal,clo,bro,pmm);
[ptm ltm phv po1d loh lho2]=hoxss_n(ch4al,h2o,hclal,oh,ho2,...
   o1d,cl,no2,hno3,hno4,h2co,rjhono2,rjhno4_350,rjh_hco,m,tmm);

   jo3above_tm=jo3above;
   o3above_cp=interp1(time2d(tcp),jo3above_cp,time);
   o3above_sp=interp1(time2d(tsp),jo3above_sp,time);
   o3above_tm=interp1(time2d(ttm),jo3above_tm,time);
   i=find(o3>0);
   z_mm=zfp.*12.*25.4;
   o3_below=cumsum(o3(i).*gradient(z_mm(i))./2.85e17);
   o3_column=[340 340 320 240 295 240 300 300];
   subplot(2,1,1)
   plot(time(i),o3above_sp(i),'.',time(i),o3above_tm(i),'g.',time(i),o3column-o3_below,'r.')
   xlabel('time')
   ylabel('O_3 above ER-2')
   title(fltday)
   legend('CPFM','TOMS',[num2str(o3column) ' - integrated O_3'])
   subplot(2,1,2)
   plot(time(i),pcp(i)./lcp(i),'.',time(i),ptm(i)./ltm(i),'.g')
   ylabel('P/L')
   xlabel('time')
   legend('CPFM','TOMS')
   out=[time(i) o3above_sp(i) o3above_tm(i) o3column-o3_below (pcp(i)-lcp(i))./(pcp(i)+lcp(i)).*2 (ptm(i)-ltm(i))./(ptm(i)+ltm(i)).*2];
   
   
   