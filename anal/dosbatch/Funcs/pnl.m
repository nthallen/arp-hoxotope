o1d=1;
hno3=1e10;
h2=1e12;
oh=2e6;
ho2=5e6;
rat=7;
h2o=1e13;
ch4=2.5e12;
jhno3=1e-6;
no2=1e9;
ohc=0;
l_no2=0;
p_o1d=0;

for i=1:20
   o1d=0.25+i./4.5;
   for j=1:20
      no2=j.*1e8;
     
prodo1d=2..*o1d.*(ko1dh2o(225,2.0e18).*h2o + ko1dch4m(225,2.0e18).*ch4 + ko1dh2(225,2.0e18).*h2);
prodhv=jhno3.*hno3;
prod=prodo1d+prodhv;
lossoh=oh.*(kohhno3(225,2.0e18).*hno3 + kohno2(225,2.0e18).*no2 + kho2oh(225,2.0e18).*ho2);
lossho2=ho2.*(kho2oh(225,2.0e18).*oh);
loss=lossoh+lossho2;
oh=oh.*prod./loss;
ho2=oh.*rat;

prodo1d=2..*o1d.*(ko1dh2o(225,2.0e18).*h2o + ko1dch4m(225,2.0e18).*ch4 + ko1dh2(225,2.0e18).*h2);
prodhv=jhno3.*hno3;
prod=prodo1d+prodhv;
lossoh=oh.*(kohhno3(225,2.0e18).*hno3 + kohno2(225,2.0e18).*no2 + kho2oh(225,2.0e18).*ho2);
lossho2=ho2.*(kho2oh(225,2.0e18).*oh);
loss=lossoh+lossho2;
oh=oh.*prod./loss;
ho2=oh.*rat;

ohc(i,j)=oh;
p_hno3(i,j)=prodhv;
l_hno3(i,j)=oh.*kohhno3(225,2.0e18).*hno3;
l_no2(i,j)=oh.*kohno2(225,2e18).*no2;
p_o1d(i,j)=prodo1d;
l_hox(i,j)=2.*ho2.*(kho2oh(225,2.0e18).*oh);
hno3c(i,j)=hno3;
no2c(i,j)=no2;
o1dc(i,j)=o1d;
m=find(HNO3>0 & OH>0 & O1D>0 & abs(SZA)<70 & OH_fit>0 & NO2>0);
k=find(abs(O1D(m)-o1dc(i,j))<0.25 & abs(NO2(m)-no2c(i,j))<1.25e8);
if length(k)==0
   oh_avg(i,j)=nan;
   num_pts(i,j)=nan;   
   avg_err(i,j)=nan;
else
   % use OH @ SZA=40, 1.5e6
   num_pts(i,j)=length(k);
   fakeOH=1.5e6.*OH./OH_fit;
   oh_avg(i,j)=median(fakeOH(m(k)));
   avg_err(i,j)=std(fakeOH(m(k)));
end
end
end
