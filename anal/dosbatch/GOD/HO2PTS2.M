% script ho2pts2.m finds ho2 at each point in the flight
% 
%      for each sol cycle, find max signal, and which flow gives max        
        [topsig1,topflow1]=max([dx1siga dx1sigb dx1sigc dx1sigd dx1sige ... 
                                  dx1sigf dx1sigg]');
        [topsig2,topflow2]=max([dx2siga dx2sigb dx2sigc dx2sigd dx2sige ...
                                  dx2sigf dx2sigg]');
%
% convert all signals to equivalent OH
%        Qc1=(Qa.*coh1a.*Ma); Qc2=(Qa.*coh2a.*Ma);
        dx1norm(:,1)=dx1siga./(Qc1);
        dx2norm(:,1)=dx2siga./(Qc2);
        dx1norm(:,2)=dx1sigb./(Qc1);
        dx2norm(:,2)=dx2sigb./(Qc2);
        dx1norm(:,3)=dx1sigc./(Qc1);
        dx2norm(:,3)=dx2sigc./(Qc2);
        dx1norm(:,4)=dx1sigd./(Qc1);
        dx2norm(:,4)=dx2sigd./(Qc2);
        dx1norm(:,5)=dx1sige./(Qc1);
        dx2norm(:,5)=dx2sige./(Qc2);
        dx1norm(:,6)=dx1sigf./(Qc1);
        dx2norm(:,6)=dx2sigf./(Qc2);
        dx1norm(:,7)=dx1sigg./(Qc1);
        dx2norm(:,7)=dx2sigg./(Qc2);
%        clear dx1siga dx2siga dx1sigb dx2sigb dx1sigc dx2sigc
%        clear dx1sigd dx2sigd dx1sige dx2sige dx1sigf dx2sigf
%        clear dx1sigg dx2sigg

% find HO2 by fitting observed signal to a kinetic model       
       
      for i=1:length(mrOH1);i 
      
% check that not fitting any points that are utterly wrong       
       if ( nodns(i,2)>0 & nodns(i,3)>0 & nodns(i,4)>0 ...
       & nodns(i,5)>0 & nodns(i,6)>0 & nodns(i,7)>0 ...
       & mrOH1(i)~=NaN & mrOH1(i)<1e-9 & mrOH1(i)>1e-20 ...
       & dx1norm(i,2)~=NaN & abs(dx1norm(i,2))~=inf )
      
        obs=[dx1norm(i,:) dx2norm(i,:)]; 
% this weight is not formally correct        
        osig=[sqrt(abs(dx1norm(i,:)).*Qc1(i))./Qc1(i)+50e-15 ...
              sqrt(abs(dx2norm(i,:)).*Qc2(i))./Qc2(i)+50e-15];

% input obs=signal normalized to 1; osig=uncertainty in obs;
% T=temperature; no=[NO](mol/cc); rtime=reaction time at observation point;
% Ma=[M](nmol/cc)
%        ho2fit(mrOH1(i),Tempa(i),xdist./v(i),Ma(i),nodns(i,:),...
%               dx1norm(i,:),osig)
%       
% initial guesses for parameters, HO2 = 6 times oh signal;
% velocity is center vel; and no adjustment to the relative rates(pa(4)=1
% holding pa(4) fixed so rates are JPL '92 values.

        pa(1)=obs(1); pa(2)=5*obs(1); pa(3)=1.838; pa(4)=1.;
        paf=[1 1 1 0];
        m3=Tempa(i); 
        m1=[nodns(i,:) nodns(i,:)]; 
        rate1=x1dist/v(i); rate2=x2dist/v(i);
        m2 =[rate1 rate1 rate1 rate1 rate1 rate1 rate1 rate2 rate2 rate2 ...
               rate2 rate2 rate2 rate2]; 
        m4 =Ma(i);
        lsqcl;
        if (chsq < 100)
         mrHO2(i)=pa(2);
         roh1(i)=pa(1); rvel(i)=pa(3); rchsq(i)=chsq;
        else
         mrHO2(i)=NaN; roh(i)=NaN; rvel(i)=NaN; rchsq(i)=NaN;
        end
%        plot(m1.*m2,obs,'*',m1.*m2,calc,'+',...
%             m1.*m2,obs-osig,'o',m1.*m2,obs+osig,'o')
        clear m1 m2 m3 m4 obs osig;
%        pause

% generate ho2 at each axis separately
        obs=[dx1norm(i,:)];      
% this weight is not formally correct        
        osig=[sqrt(dx1norm(i,:).*Qc1(i))./Qc1(i)+50e-15];
        
        pa(1)=obs(1); pa(2)=5*obs(1); pa(3)=pa(3); pa(4)=1.;
        paf=[1 1 0 0];
        m3=Tempa(i); m1=[nodns(i,:)]; rate1=x1dist/v(i);
        m2 =[rate1 rate1 rate1 rate1 rate1 rate1 rate1]; 
        m4 =Ma(i);
        lsqcl;
        if (chsq < 100)
         mrHO21(i)=pa(2); roh1(i)=pa(1); rvel1(i)=pa(3); rchsq1(i)=chsq;
        else
         mrHO21(i)=NaN;   roh1(i)=NaN; rvel1(i)=NaN; rchsq1(i)=NaN;
        end
        clear m1 m2 m3 m4 obs osig;

% axis 2
        obs=[dx2norm(i,:)]; 
% this weight is not formally correct        
        osig=[sqrt(dx2norm(i,:).*Qc2(i))./Qc2(i)+50e-15];

        pa(1)=obs(1); pa(2)=5*obs(1); pa(3)=pa(3); pa(4)=1.;
        paf=[1 1 0 0];
        m3=Tempa(i); m1=[nodns(i,:)]; rate2=x2dist/v(i);
        m2 =[rate2 rate2 rate2 rate2 rate2 rate2 rate2]; 
        m4 =Ma(i);
        lsqcl;
        if (chsq < 100)
         mrHO22(i)=pa(2); roh2(i)=pa(1); rvel2(i)=pa(3); rchsq2(i)=chsq;
        else
         mrHO22(i)=NaN;   roh2(i)=NaN; rvel2(i)=NaN; rchsq2(i)=NaN;
        end
        clear m1 m2 m3 m4 obs osig

      else 
        mrHO2(i)=NaN; roh(i)=NaN; rvel(i)=NaN; rchsq(i)=NaN;
        mrHO21(i)=NaN; roh1(i)=NaN; rvel1(i)=NaN; rchsq1(i)=NaN;
        mrHO22(i)=NaN; roh2(i)=NaN; rvel2(i)=NaN; rchsq2(i)=NaN;
      end                                              
     end                              

     clear rate1 rate2 pa paf pasig alphin dbug delchi delgrad chsq i
     clear marq iter
     pack                                                            
