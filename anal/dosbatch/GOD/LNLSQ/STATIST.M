% MATLAB VERSION OF 2/27/93
% STATIST EVALUATES UNCERTAINTIES IN PARAMETERS

  function [pasig,alphin] = statist(xpos,alpha)

 xnum=length(xpos);
 for  i1=1:xnum, for  i2=1:xnum
  alphin(i1,i2)=alpha(i1,i2)./sqrt(alpha(i1,i1)*alpha(i2,i2));
 end, end

  [alphin,det,err] = invert1(alphin,xnum);
   if(err ~= 0), err=8, end              ;

   for i1=1:xnum
 pasig(xpos(i1))= sqrt(alphin(i1,i1)./alpha(i1,i1));
   end

  for  i1=1:xnum
  for  i2=1:xnum
  alphin(i1,i2)=alphin(i1,i2)./sqrt(alpha(i1,i1)*alpha(i2,i2))./...
  (pasig(xpos(i1))*pasig(xpos(i2)));
  end
  end
