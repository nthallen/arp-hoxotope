
for i=1:length(tmm_97)
   k1=kohno2(tmm_97(i),m_97(i));
   k2=0;
   k3=kohhno3(tmm_97(i),m_97(i));
   j1=0;
   j2=jhno3_97(i);
   oh=oh_97(i);
   no2=no2_97(i);
   no=no_97(i);
   o3=o3_97(i);
   hno3=hno3_97(i);
   
   oh=1e6;
   hno3=1e10;
   no2=2e9;
   j2=1e-6;
   k1=6e-12;
   k3=2e-13;
   
A=[(-k1.*oh - j1) (-k1.*no2 + k3.*hno3) (j2 + k3.*oh)
   -k1.*oh (-k1.*no2 - k3.*hno3) (j2 - k3.*oh)
   k1.*oh (k1.*no2 - k3.*hno3) (-j2 - k3.*oh)];

a=sum(isnan(A) + isinf(A));
if sum(a)>0
   e1(i)=nan;
   e2(i)=nan;
   e3(i)=nan;
   
else
   e=eig(A);
   e1(i)=e(1);
   e2(i)=e(2);
   e3(i)=e(3);
   
end

end
