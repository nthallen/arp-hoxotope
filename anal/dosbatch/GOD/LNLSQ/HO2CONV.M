% calculate signal from ho2
% this routine calculates the observed peak signal expected
% based on a kinetic model of the OH and HO2 reactions with NO
% m1=[NO](mol/cc); m3=T(Kelvin) assumes a single temperature
% is appropriate to the cycle; m4=[M])mol/cc); m2=reaction time at
% the observation point; pa(3) is a parameter allowing the effective NO 
% density to change, it is expected to be slightly greater than one
% indicating the bulk velocity is slightly slower than the pitot tube 
% measurement at the center of the duct, and consequently longer reaction
% times ad higher NO densities; pa(4) is an adjustable parameter modifying
% the rate of the NO+HO2 reaction; However, in effect it could just 
% as easily be used to modify the back reaction.
%function [conv] =ho2conv(T,M,ratio)
 
 function [conv] =ho2conv(T,M,ratio)
 OH=1.; HO2=ratio*OH; NO=[1:30].*1e12; time=.010;

k0=7e-31.*(T./300).^(-2.6);
koo=1.5e-11.*(T./300).^(-.5);
k1=k0.*M./(1+(k0.*M./koo));
k2=(.6.^( (1+( log10(k0.*M./koo) ).^2).^(-1)) );
l=real(k2); back=(k1.*l);

forward=3.7e-12.*exp(250../T);
calc=((forward*HO2)./(back-forward)).*(exp(-forward.*NO.*time)-...
     exp(-back.*NO.*time))+OH.*exp(-back.*NO.*time);

conv=max(calc)./(OH+HO2);
