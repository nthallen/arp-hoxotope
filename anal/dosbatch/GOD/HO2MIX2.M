% script ho2mix2.m finds ho2 at each point in the flight
%   for use with god2_1.m to account for leak of NO into flow during 
%    OH measurement
%
%      for each sol cycle, find max signal, and which flow gives max        
%        
%        [topsig1,topflow1]=max([dx1siga dx1sigb dx1sigc dx1sigd dx1sige ... 
%                                  dx1sigf dx1sigg]');
%        [topsig2,topflow2]=max([dx2siga dx2sigb dx2sigc dx2sigd dx2sige ...
%                                  dx2sigf dx2sigg]');
        topsig1n=topsig1'./Qc1;
        topsig2n=topsig2'./Qc2;

% find HO2 by fitting observed signal to a kinetic model       
      rat=5;
      ratio(1:length(oh1))=5.*ones(1:length(oh1));
      qho21=NaN.*ones(1:length(oh1));
      qho22=NaN.*ones(1:length(oh1));
      for i=1:length(mrOH1); 
% check that not fitting any points that are utterly wrong       
       if ( nodns(i,2)>0 & nodns(i,3)>0 & nodns(i,4)>0 ...
       & nodns(i,5)>0 & nodns(i,6)>0 & nodns(i,7)>0 ...
       & oh1(i)~=NaN & oh1(i)<1e-9 & oh1(i)>1e-20)
        k=[k i];

% set rat = last ratio

        if(i~=1)rat=ratio(i-1);end      
        rat;

        [conv(i)]=ho2conv(Tempa(i),Ma(i),rat);
        hox1(i)=topsig1n(i)./conv(i);
        qho21(i)=hox1(i)-oh1(i) ;
        hox2(i)=topsig2n(i)./conv(i);
        qho22(i)=hox2(i)-oh2(i) ;
        ratio(i)=qho21(i)./oh1(i);

% repeat if ratio is different then 10 percent recalculate

        if (abs(ratio(i)./rat-1)>.1) ;
          [conv(i)]=ho2conv(Tempa(i),Ma(i),ratio(i));
          hox1(i)=topsig1n(i)./conv(i) ;
          qho21(i)=hox1(i)-oh1(i)  ;
          hox2(i)=topsig2n(i)./conv(i) ;
          qho22(i)=hox2(i)-oh2(i)  ;
          ratio(i)=qho21(i)./oh1(i) ;
        end

      end;end
        
        qho2=.5.*(qho21+qho22);
