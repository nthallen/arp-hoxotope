%  whiting.m
%
%  function to calculate the Whiting lineshape for OH Q1(2)/ Q21(2) doublet.
%     E.E. Whiting, J.Quant.Spectrosc.Radiat.Transfer, 8,1379-1384 (1968)
% 
%     broadening data come from B. Shirinzadeh, D.M.Bakalyar, C.C. Wang, 
%       JCP 82,7,2877-2879 (1985)
%   
%     temperature dependence of broadening is from E.C.Rea Jr.,A.Y.Chang    
%        and R.K. Hanson, JQSRT, 37,117-127
%
%     W.J.Kessler, M.G.Allen S.J.Davis, JQSRT, 49,107-117 show that A-X(1,0)    
%        broadening is not different than A-X(0,0) broadening

function [I]=whiting(P,T); %P in torr, T in degrees K
%  v0=35461 cm-1
wg=dopwidth(T); % cm-1
wl=26.4e-5.*P.*(T./298).^(-.8); % cm-1
%
%  Approx. to Voight width given by Whiting ( Eq. 6)
%
wv=wl./2+sqrt(wl.^2./4+wg.^2);
%
%  Normalized intensity at linecenter ( Eq. 7)
a=wl./wv;
Ilcl=.005./(wv.*(1.065+.447.*a+.058.*(a.^2)));
%
%  I(lambda) approx. (Eq. 5)
%
%  assuming that the laser is kept tuned useing the low pressure OH cell
%     we need to consider the small collision induced shift of the center 
%     linewidth. Again from Shirinzadeh et al.
shift=-2.21e-5.*P.*(T./298).^(-.8); % cm-1
dl=[-1.5-shift:.005:1.5-shift];
I_lm1=Ilcl.*((1-a).*exp(-2.772.*(dl./wv).^2)+a.*(1../(1+4..*(dl./wv).^2)) ...
   +0.016.*(1-a).*a.*(exp(-.4.*(dl./wv).^2.25)-10../(10+(dl./wv).^2.25)));
%
%  now create Q2/Q21 pair; Line spliting from J.J Ter Meulen, W.A. Majewski,
%          W. Leo Meerts and A. Dymanus, Chem. Phys. Letters, 94, 25-28 (1983)
dl2=[-.961-shift:.005:2.039-shift];
I_lm2=1../3.*(Ilcl.*((1-a).*exp(-2.772.*(dl2./wv).^2)+ ...
    a.*(1../(1+4..*(dl2./wv).^2)) ...
  +0.016.*(1-a).*a.*(exp(-.4.*(dl2./wv).^2.25)-10../(10+(dl2./wv).^2.25))));
  

%plot(dl,I_lm1+I_lm2,'*')  
I=real(I_lm1+I_lm2);
%pause
