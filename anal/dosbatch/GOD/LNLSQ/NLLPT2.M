%     MATLAB VERSION OF 2/27/93
%     NLLPT2.M LOOPS TO FIND MINIMUM CHSQ

      function [calc,ocalc,pa,pasig,x,nextx,chsq,chold,err,...
        grad,ograd,alpha,alphin,icount,beta,deriv,det,marq]=...
       nllpt2(m1,m2,m3,m4,calc,ocalc,pa,pasig,paf,x,xpos,nextx,...
        chsq,chold,err,grad,ograd,alpha,alphin,icount,iter,...
        beta,deriv,det,dbug,marq,delchi,delgrad,obs,weight)

        xnum=length(x);
% CALCULATE ~(J)*F*dF/dX , THE GRADIENT OF CHSQ AND THE
% ~J*J MATRIX, WHERE F=(O-C)/OSIG AND ~ MEANS TRANSPOSE
   beta=zeros(1,xnum); alpha=zeros(xnum,xnum); alphin=alpha;

   icount=icount+1;
   [calc,ocalc,deriv] = der(m1,m2,m3,m4,calc,xpos,pa);

   for i1=1:length(obs); for i2=1:xnum;
     beta(i2)=beta(i2)+weight(i1)*(obs(i1)-calc(i1))*deriv(i2,i1);
     for i3=1:i2;
       alpha(i2,i3)=alpha(i2,i3)+weight(i1)*deriv(i2,i1)*deriv(i3,i1);
       alpha(i3,i2)=alpha(i2,i3);
     end
   end, end

   [calc,ocalc,pa,pasig,x,nextx,chsq,chold,err,...
        grad,ograd,alpha,alphin,icount,beta,deriv,det,marq]=...
       nllpt3(m1,m2,m3,m4,calc,ocalc,pa,pasig,paf,x,xpos,nextx,...
     chsq,chold,err,grad,ograd,alpha,alphin,icount,iter,...
     beta,deriv,det,dbug,marq,delchi,delgrad,obs,weight);
