% MATLAB VERSION OF 2/27/93
% CHISQ RETURNS THE REDUCED CHI**2 AFTER CALLING THE ROUTINE
% MODEL WHICH SHOULD RETURN THE MODELED VALUES OF THE
% OBSERVABLES

    function [chsq,calc,pa] = chisq(m1,m2,m3,m4,obs,weight,pa,x,xpos);

    for  i1=1:length(x); pa(xpos(i1))=x(i1); end;

    [calc] = model(m1,m2,m3,m4,pa);

    chsq=0d0;
    for i1=1:length(obs); chsq=chsq+((obs(i1)-calc(i1)).^2).*weight(i1); end;

    chsq=chsq./(length(obs)-length(x));
