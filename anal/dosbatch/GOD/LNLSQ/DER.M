% MATLAB VERSION OF 2/27/93
% DER CALCULATES THE DERIVATIVES OF ALL OBS W/R TO ALL X
% IT ALSO SAVES CALC FOR RECOVERY SHOULD SSQ NOT DECREASE

 function [calc,ocalc,deriv] = der(m1,m2,m3,m4,calc,xpos,pa);

   ocalc=calc;
   deriv=zeros(length(xpos),length(calc));

  for i1=1:length(xpos);
    s1=pa(xpos(i1)); frac=1e-5;
    pa(xpos(i1))=pa(xpos(i1)).*(1.+frac);
    if pa(xpos(i1))== 0; pa(xpos(i1))=frac; end;

    [calc] = model(m1,m2,m3,m4,pa);

    if s1 ~= 0; s2=s1*frac; else; s2=frac; end;

    for i2=1:length(calc); deriv(i1,i2)=(calc(i2)-ocalc(i2))./s2; end;
    pa(xpos(i1))=s1;
  end
