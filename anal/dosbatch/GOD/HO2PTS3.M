% script ho2pts3.m finds ho2 at each point in the flight
% 
%      for each sol cycle, find max signal, and which flow gives max        
        [topsig1,topflow1]=max([dx1siga dx1sigb dx1sigc dx1sigd dx1sige ... 
                                  dx1sigf dx1sigg]');
        [topsig2,topflow2]=max([dx2siga dx2sigb dx2sigc dx2sigd dx2sige ...
                                  dx2sigf dx2sigg]');
%
% convert all signals to equivalent OH
%        Qc1=(Qa.*coh1a.*Ma); Qc2=(Qa.*coh2a.*Ma);
        dx1norm(:,1)=dx1siga./(Qc1); dx2norm(:,1)=dx2siga./(Qc2);
        dx1norm(:,2)=dx1sigb./(Qc1); dx2norm(:,2)=dx2sigb./(Qc2);
        dx1norm(:,3)=dx1sigc./(Qc1); dx2norm(:,3)=dx2sigc./(Qc2);
        dx1norm(:,4)=dx1sigd./(Qc1); dx2norm(:,4)=dx2sigd./(Qc2);
        dx1norm(:,5)=dx1sige./(Qc1); dx2norm(:,5)=dx2sige./(Qc2);
        dx1norm(:,6)=dx1sigf./(Qc1); dx2norm(:,6)=dx2sigf./(Qc2);
        dx1norm(:,7)=dx1sigg./(Qc1); dx2norm(:,7)=dx2sigg./(Qc2);
        clear dx1siga dx2siga dx1sigb dx2sigb dx1sigc dx2sigc
        clear dx1sigd dx2sigd dx1sige dx2sige dx1sigf dx2sigf
        clear dx1sigg dx2sigg

% find HO2 by fitting observed signal to a kinetic model       
       
      for i=1:(length(mrOH1)-0);i 
%      i=588
%        for i=920:length(mrOH1);i

% check that not fitting any points that are utterly wrong       
       if ( nodns(i,2)>0 & nodns(i,3)>0 & nodns(i,4)>0 ...
       & nodns(i,5)>0 & nodns(i,6)>0 & nodns(i,7)>0 ...
       & mrOH1(i)~=NaN & mrOH1(i)<1e-9 & mrOH1(i)>1e-20 ...
       & dx1norm(i,2)~=NaN & abs(dx1norm(i,2))~=inf )
        
        f1=[1 max(topflow1(i)-1,2):7]; f2=[1 max(topflow2(i)-1,2):7];

        obs=[dx1norm(i,f1) dx2norm(i,f2)]; 
        
% this weight is not formally correct        
        osig=[sqrt(abs(dx1norm(i,f1)).*Qc1(i))./Qc1(i)+50e-15 ...
              sqrt(abs(dx2norm(i,f2)).*Qc2(i))./Qc2(i)+50e-15];

% input obs=signal normalized to 1; osig=uncertainty in obs;
% T=temperature; no=[NO](mol/cc); rtime=reaction time at observation point;
% Ma=[M](nmol/cc)
%        ho2fit(mrOH1(i),safb1a(i),xdist./v(i),Ma(i),nodns(i,:),...
%               dx1norm(i,:),osig)
%       
% initial guesses for parameters, HO2 = 5 times oh signal;
% velocity is center vel; and no adjustment to the relative rates(pa(4)=1
% holding pa(4) fixed so rates are JPL '92 values.

        pa(1)=mrOH(i); pa(2)=5*pa(1); pa(3)=1.838; pa(4)=1.;
        paf=[1 1 1 0];
        m1=[nodns(i,f1) nodns(i,f2)]; 
m2 =[(x1dist./v(i)).*ones(1,length(f1)) (x2dist./v(i)).*ones(1,length(f2))]; 
        m3=Tempa(i); m4 =Ma(i);
        lsqcl;
        
        if (chsq < 100)
         nmrHO2(i)=pa(2); nroh1(i)=pa(1); nrvel(i)=pa(3); nrchsq(i)=chsq;
        else
         nmrHO2(i)=NaN; nroh(i)=NaN; nrvel(i)=NaN; nrchsq(i)=NaN;
        end
        clear m1 m2 m3 m4 obs osig;


% generate ho2 at each axis separately
        obs=[dx1norm(i,f1)];      
% this weight is not formally correct        
        osig=[sqrt(dx1norm(i,f1).*Qc1(i))./Qc1(i)+50e-15];
        
        pa(1)=mrOH1(i); pa(2)=5*pa(1); pa(3)=pa(3); pa(4)=1.;
        paf=[1 1 0 0];
        m1=[nodns(i,f1)]; m2 =[x1dist./v(i).*ones(1,length(f1))]; 
        m3=Tempa(i); m4 =Ma(i);
        lsqcl;
        if (chsq < 100)
         nmrHO21(i)=pa(2); nroh1(i)=pa(1); nrvel1(i)=pa(3); nrchsq1(i)=chsq;
        else
         nmrHO21(i)=NaN;   nroh1(i)=NaN;   nrvel1(i)=NaN;   nrchsq1(i)=NaN;
        end
        clear m1 m2 m3 m4 obs osig;

% axis 2
        obs=[dx2norm(i,f2)]; 
% this weight is not formally correct        
        osig=[sqrt(dx2norm(i,f2).*Qc2(i))./Qc2(i)+50e-15];

        pa(1)=mrOH2(i); pa(2)=5*pa(1); pa(3)=pa(3); pa(4)=1.;
        paf=[1 1 0 0];
        m1=[nodns(i,f2)]; m2 =[x2dist./v(i).*ones(1,length(f2))]; 
        m3=Tempa(i); m4 =Ma(i);
        lsqcl;
        if (chsq < 100)
         nmrHO22(i)=pa(2); nroh2(i)=pa(1); nrvel2(i)=pa(3); nrchsq2(i)=chsq;
        else
         nmrHO22(i)=NaN;   nroh2(i)=NaN;   nrvel2(i)=NaN;   nrchsq2(i)=NaN;
        end
        clear m1 m2 m3 m4 obs osig

      else 
        nmrHO2(i)=NaN; nroh(i)=NaN; nrvel(i)=NaN; nrchsq(i)=NaN;
        nmrHO21(i)=NaN; nroh1(i)=NaN; nrvel1(i)=NaN; nrchsq1(i)=NaN;
        nmrHO22(i)=NaN; nroh2(i)=NaN; nrvel2(i)=NaN; nrchsq2(i)=NaN;
      end                                              
     end                              

     clear marq iter pa paf pasig alphin dbug delchi delgrad chsq i
                                                                 
