% fx0327.m        
%  corrects for failure on beam splitter cube on 930427.   
        i=find(time_n2>77065);
        n2sig1(i)=n2sig1(i).*1.35; 
        n2sig2(i)=n2sig2(i).*0.3;
        i=find(time_hox>77065);
        dx1sig_hox(i)=dx1sig_hox(i).*1.35;
        dx2sig_hox(i)=dx2sig_hox(i).*.67;
        sx1sig_hox(i)=sx1sig_hox(i).*1.35;
        c2_hox(i)=c2_hox(i)./1.12;
        i=find(time_oh>77065);
        dx1sig_oh(i)=dx1sig_oh(i).*1.35;
        dx2sig_oh(i)=dx2sig_oh(i).*.67;
        c2_oh(i)=c2_oh(i)./1.12;
        i=find(time_ho2>77065);
        dx1sig_no1(i)=dx1sig_no1(i).*1.35;
        dx1sig_no2(i)=dx1sig_no2(i).*1.35;
        dx1sig_no3(i)=dx1sig_no3(i).*1.35;
        dx1sig_no4(i)=dx1sig_no4(i).*1.35;
        dx1sig_no5(i)=dx1sig_no5(i).*1.35;
        dx1sig_no6(i)=dx1sig_no6(i).*1.35;
        dx2sig_no1(i)=dx2sig_no1(i).*0.67;
        dx2sig_no2(i)=dx2sig_no2(i).*0.67;
        dx2sig_no3(i)=dx2sig_no3(i).*0.67;
        dx2sig_no4(i)=dx2sig_no4(i).*0.67;
        dx2sig_no5(i)=dx2sig_no5(i).*0.67;
        dx2sig_no6(i)=dx2sig_no6(i).*0.67;


