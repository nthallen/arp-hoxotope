
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

A=[(-k1.*oh - j1) (-k1.*no2 + k3.*hno3) (j2 + k3.*hno3) k2.*o3 k2.*no
   -k1.*oh (-k1.*no2 - k3.*hno3) (j2 +k3.*oh) 0 0
   k1.*oh (k1.*no2 - k3.*hno3) (j2 - k3.*oh) 0 0
   j1 0 0 k2.*o3 k2.*no
   j1 0 0 -k2.*o3 k2.*no];

a=sum(isnan(A) + isinf(A));
if sum(a)>0
   e1(i)=nan;
   e2(i)=nan;
   e3(i)=nan;
   e4(i)=nan;
   e5(i)=nan;
   v1(i)=nan;
   v2(i)=nan;
   v3(i)=nan;
   v4(i)=nan;
   v5(i)=nan;
else
   e=eig(A);
   e1(i)=e(1);
   e2(i)=e(2);
   e3(i)=e(3);
   e4(i)=e(4);
   e5(i)=e(5);
end

end
