% LSQCL.M CALLS THE LEAST SQUARES PROGRAM WITH SOME STANDARD INPUT
% THE PROGRAM USE AN INITIAL GUESS AT PARAMETERS TO DETERMINE
% A MINIMUM CHISQ SOLUTION TO A MODEL OF THE OBSERVABLE OBS
% WHERE EACH DATUM IS WEIGHTED BY THE INVERSE SQUARE OF THE
% PRECISION DEFINED IN OSIG

% m1,m2,m3,m4 must be DEFINED ELSEWHERE
% As must obs,osig,pa,paf
  format short e
  
  dbug=1; marq=0.001; delchi=.01; delgrad=.01; iter=60;
  [calc,pa,pasig,chsq,err,grad,alphin] = nllsq1(m1,m2,m3,m4,obs,osig,...
        pa,paf,dbug,marq,delchi,delgrad,iter);
%  if err ~= 0; fprintf('\n FIT FAILED ERR= %g',err), end
%  fprintf('\nCHSQ %g ',chsq)
%  fprintf('GRAD %g \n',grad)
%  for i1=1:length(pa);
%    if paf(i1) == 0; pasig(i1)=0; end
%    fprintf('\n PA( %g), %8.3f, unc  %g',i1,pa(i1),pasig(i1))
%  end
%  fprintf('\n')
%  format short
%  alphin
%  fprintf('\n')
  clear dbug delchi delgrad marq;      
