%  whiting.m
%
%  function to calculate the Whiting lineshape for H2O near 3765 cm-1

   function [I]=whiting(P,T)  ; P in mb, T in degrees K
%  v0=35461 cm-1
wg=.01% dopwidth(T); % cm-1
wl=9.0e-5.*P.*(T./298).^(-.8); % cm-1
%
%  Approx. to Voight width given by Whiting ( Eq. 6)
%
wv=wl./2+sqrt(wl.^2./4+wg.^2);
%
%  Normalized intensity at linecenter ( Eq. 7)
a=wl./wv;
Ilcl=.0005./(wv.*(1.065+.447.*a+.058.*(a.^2)));
%
%  I(lambda) approx. (Eq. 5)
%
%  assuming that the laser is kept tuned useing the low pressure OH cell
%     we need to consider the small collision induced shift of the center 
%     linewidth. Again from Shirinzadeh et al.
shift=0;%-2.21e-5.*P.*(T./298).^(-.8); % cm-1
dl=[-1.5:.0005:1.5];
I_lm1=Ilcl.*((1-a).*exp(-2.772.*(dl./wv).^2)+a.*(1../(1+4..*(dl./wv).^2)) ...
   +0.016.*(1-a).*a.*(exp(-.4.*(dl./wv).^2.25)-10../(10+(dl./wv).^2.25)));
%
%  now create Q2/Q21 pair; Line spliting from J.J Ter Meulen, W.A. Majewski,
%          W. Leo Meerts and A. Dymanus, Chem. Phys. Letters, 94, 25-28 (1983)
dl2=[-1.25:.0005:1.75];
I_lm2=.16.*(Ilcl.*((1-a).*exp(-2.772.*(dl2./wv).^2)+ ...
    a.*(1../(1+4..*(dl2./wv).^2)) ...
  +0.016.*(1-a).*a.*(exp(-.4.*(dl2./wv).^2.25)-10../(10+(dl2./wv).^2.25))));
  
dl3=[-1.1:.0005:1.9];
I_lm3=.95*(Ilcl.*((1-a).*exp(-2.772.*(dl3./wv).^2)+ ...
    a.*(1../(1+4..*(dl3./wv).^2)) ...
  +0.016.*(1-a).*a.*(exp(-.4.*(dl3./wv).^2.25)-10../(10+(dl3./wv).^2.25))));

dl4=[-.4:.0005:2.6];
I_lm4=260..*(Ilcl.*((1-a).*exp(-2.772.*(dl4./wv).^2)+ ...
    a.*(1../(1+4..*(dl4./wv).^2)) ...
  +0.016.*(1-a).*a.*(exp(-.4.*(dl4./wv).^2.25)-10../(10+(dl4./wv).^2.25))));

plot(dl,I_lm1+I_lm2+I_lm3+I_lm4)  
I=real(I_lm1+I_lm2+I_lm3+I_lm4);
%pause
