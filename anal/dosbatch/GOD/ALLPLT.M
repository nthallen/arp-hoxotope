hold off
!del data1.met
!del data2.met
oh1=mrOH1;
oh2=mrOH2;

%
%  Now make some nice plots
%  plot 1: OH        
        j=find(oh1~=NaN & oh2~=NaN & oh1~=inf & oh2~=inf);
        j=j(4:length(j)-20);
        k=mean(oh1(j)*1e12);
        ksig=std(oh1(j)*1e12);
        axis([(timea(1)/1000)-5 timea(length(timea))/1000+5 ...
        k-3*ksig  k+3*ksig])
        plot(timea/1000,oh1*1e12,'*',timea/1000,oh2*1e12,'+')         
        xlabel('GMT (K sec)')
        ylabel('OH mixing ratio (ppt)')
        g=[fltday ';  Analysis = ' date  '; software 2.1 '];
        title(g)
        text(.8,.7,'+ = Axis 2','sc')
        text(.8,.6,'* = Axis 1','sc')
        meta data1
%        
%  plot 2: OH
        plot(timea/1000,1e12.*(oh2),'.',timea(j)/1000,1e12.*medianf(oh2(j),3))         
        xlabel('GMT (Ksec)')
        ylabel('OH mixing ratio (ppt)')
        g=[fltday ';  Analysis = ' date '; software 2.1 '];
        title(g) 
        grid
        meta data2

%
%
%  plot 2  HO2
%
        j=find(qmrHO22'~=inf & qmrHO22'~=NaN);
        k=mean(1e12*qmrHO22(j)');
        ksig=std(1e12*qmrHO22(j)');
        k1=find(qmrHO22(j)>1e-14);
        axis([timea(1)/1000-5 timea(length(timea))/1000+5 k-3*ksig  k+3*ksig])
        plot(timea/1000,1e12*qmrHO22','.',timea(j(k1))/1000,...
                  1e12.*medianf(qmrHO22(j(k1))',3))         
        xlabel('GMT (Ksec)')                               
        ylabel('HO2 mixing ratio (ppt)')
        g=[fltday ';  Analysis = ' date '; software 2.1'];
        title(g)
        grid
        meta data2

%  plot 3  OH/HO2
%
        j=find(oh2~=NaN & oh2~=inf & qmrHO22'~=inf & qmrHO22'~=NaN);
        k=mean(oh2(j)./qmrHO22(j)');
        ksig=std(oh2(j)./qmrHO22(j)');
        axis([timea(1)/1000-5 timea(length(timea))/1000+5 -.1 1])
%        axis([timea(1)/1000-5 timea(length(timea))/1000+5 k-3*ksig  k+3*ksig])
        plot(timea/1000,oh2./qmrHO22','.',timea(j)/1000,...
            medianf((oh2(j)./qmrHO22(j)'),3))         
        xlabel('GMT (Ksec)')
        ylabel('OH:HO2 ratio ')
        g=[fltday ';  Analysis = ' date '; software 2.1 '];
        title(g)
        grid
        meta data2

%
% plot 4 N2signal axis 1
        j=find(n2sig1~=NaN & n2sig1~=inf);
        k=mean(n2sig1(j));
        ksig=std(n2sig1(j));
        axis([timea(1)/1000-5 timea(length(timea))/1000+5 k-3*ksig  k+3*ksig])
        plot(timen2/1000,n2sig1,'+',timea/1000,n2sig1a)         
        xlabel('GMT (Ksec)')
        ylabel('Axis 1 Raman Signal (cnts/.25sec/uvmon/[N2])')
        g=[fltday ';  Analysis = ' date ];
        title(g)
        h=['mean = 'num2str(k)]
        text(.2,.8,h,'sc')
        grid
        meta data1

% plot 5 N2signal axis 2
        j=find(n2sig2~=NaN & n2sig2~=inf);
        k=mean(n2sig2(j));
        ksig=std(n2sig2(j));
        axis([timea(1)/1000-5 timea(length(timea))/1000+5 k-3*ksig  k+3*ksig])
        plot(timen2/1000,n2sig2,'+',timea/1000,n2sig2a)         
        xlabel('GMT (Ksec)')                                    
        ylabel('Axis 2 Raman Signal (cnts/.25sec/uvmon/[N2])')
        g=[fltday ';  Analysis = ' date ];
        title(g)
        h=['mean = 'num2str(k)]
        text(.2,.8,h,'sc')
        grid
        meta data1


%
