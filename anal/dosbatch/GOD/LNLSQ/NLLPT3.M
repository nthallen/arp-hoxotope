%     MATLAB VERSION OF 2/27/93
%     NLLPT3.M LOOPS TO FIND MINIMUM CHSQ

      function [calc,ocalc,pa,pasig,x,nextx,chsq,chold,err,...
        grad,ograd,alpha,alphin,icount,beta,deriv,det,marq]=...
       nllpt3(m1,m2,m3,m4,calc,ocalc,pa,pasig,paf,x,xpos,nextx,...
        chsq,chold,err,grad,ograd,alpha,alphin,icount,iter,...
        beta,deriv,det,dbug,marq,delchi,delgrad,obs,weight)

        xnum=length(x);
% CALCULATE PARAMETER INCREMENTS AS DELX=BETA*(MARQ*DIAGONAL(
% ALPHA)+ALPHA)**-1 AND ADD TO X TO GIVE NEXTX, THE NEW TRIAL
% SET OF PARAMETERS. NOTE THAT A SCALED ALPHA IS INVERTED, TO
% IMPROVE ACCURACY, AND THEN RESCALED
   for i1=1:xnum; for i2=1:xnum;
       alphin(i1,i2)=alpha(i1,i2)./sqrt(alpha(i1,i1).*alpha(i2,i2));
   end; alphin(i1,i1)=1+marq; end;

        alphin = inv(alphin);
        err=0;

%  [alphin,det,err] = invert1(alphin,xnum);

% IF JACOBIAN IS SINGULAR ATTEMPT ONE RECOVERY; not currently
% implemented
 if err ~= 0
   if err == 4; return; else; chsq=1.0001*chold; err=4; end;
 end

%  CALCULATE NEW TRIAL CHSQ AND CHECK IF IT INCREASED OR DE-
%  CREASED. IF IT DECREASED, NEXTX BECOMES X. SINCE CHSQ HAS
% ALREADY EVALUATED CALC(NEXTX), THE NEXT ITERATION CAN BE
%  CONTINUED BY CALCULATING A NEW ALPHA AND BETA.
%  IF CHSQ INCREASED, THE MARQUARDT PARAMETER MUST BE INCREA-
%  SED TO FORCE DESCENT IN CHSQ. NEXTX IS DISCARDED AND A
%  SMALLER STEP AWAY FROM THE ORIGINAL X IS TRIED

   if err ~= 4
    nextx=x;
    for i1=1:xnum; for i2=1:xnum;
      nextx(i1)=nextx(i1)+beta(i2).*...
          alphin(i1,i2)./sqrt(alpha(i1,i1).*alpha(i2,i2));
    end; end;

    [chsq,calc,pa] = chisq(m1,m2,m3,m4,obs,weight,pa,nextx,xpos);
   end
%     fprintf('ICOUNT %g CHSQ %g\n',icount,chsq)

% test for convergence
  if chold-chsq >  0
    grad = 0;
    x=nextx;
    for i1=1:xnum, grad=grad+beta(i1).*beta(i1); end;
    grad=sqrt(grad);

    if abs(chold-chsq) <  delchi | abs(ograd-grad) <  delgrad;
     [pasig,alphin] = statist(xpos,alpha); return; end;

    marq=marq*.1;
    ograd=grad;
    chold=chsq;

   if iter < icount; err = 5;
    [pasig,alphin] = statist(xpos,alpha); return; end;

    [calc,ocalc,pa,pasig,x,nextx,chsq,chold,err,...
      grad,ograd,alpha,alphin,icount,beta,deriv,det,marq]=...
    nllpt2(m1,m2,m3,m4,calc,ocalc,pa,pasig,paf,x,xpos,nextx,...
     chsq,chold,err,grad,ograd,alpha,alphin,icount,iter,...
     beta,deriv,det,dbug,marq,delchi,delgrad,obs,weight);

  else
   if iter < icount; err=5;
    [pasig,alphin] = statist(xpos,alpha); return; end;

   marq=max(marq*10d0,0.001d0);

   if marq > 1.e10; err = 6;
    [pasig,alphin] = statist(xpos,alpha); return; end;

   calc = ocalc;
   [calc,ocalc,pa,pasig,x,nextx,chsq,chold,err,...
    grad,ograd,alpha,alphin,icount,beta,deriv,det,marq]=...
    nllpt3(m1,m2,m3,m4,calc,ocalc,pa,pasig,paf,x,xpos,nextx,...
     chsq,chold,err,grad,ograd,alpha,alphin,icount,iter,...
     beta,deriv,det,dbug,marq,delchi,delgrad,obs,weight);
  end
