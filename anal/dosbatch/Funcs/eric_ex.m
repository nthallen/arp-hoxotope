o1d=1;
clo=1e7;
bro=1e7;
h2=1e12;
oh=2e6;
ho2=5e6;
rat=8;
o3=2.5e12;
co=1e10;
h2o=1e13;
ch4=2.5e12;
jhno3=1e-6;
no2=1e9;
tmm=220;
pmm=50;

for i=1:20
   no=1e8+i.*1e8;
   for j=1:20
      o3=1e12+5e12.*j./20;
      rat=ho2ohbr(tmm,o3,no,co,clo,bro,pmm);
      noc(i,j)=no;
      o3c(i,j)=o3;
      ratc(i,j)=rat;
      
      m=find(CO>0 & OH>0 & NO>0);
      k=find(abs(NO(m)-noc(i,j))<1e8 & abs(O3(m)-o3c(i,j))<5e11);
if length(k)==0
   rat_avg(i,j)=nan;
else
   rat_avg(i,j)=median(RAT(m(k)));
end

end
end
