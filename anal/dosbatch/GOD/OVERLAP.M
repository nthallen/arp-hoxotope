%  overlap.m 
%  function to calculate the correction term for excitation rates 
%   due to temp and pressure broadening as well as drift in 
%   frequency away from line center.
%
function sigmatp=overlap(T,P,deltanu,lasewidth)
%
%      T in K, P in torr, deltanu and lasewidth in cm-1
%
% wavelength interval is defined in whiting.m as well - make sure these
% are consistent
Delta=[-1.5:.005:1.5];
%
% first define ideal calibration case, i.e. room temp (298K) and 5 torr N2
lab=whiting(5,298);
% assume the laser frequency can be represented as gaussian of width lasewidth
laser=3*gauss(lasewidth,0,1../(length(Delta)),Delta);
labsigma=sum(lab.*laser);
%
% now do the same for P,T in atmosphere
%
d=1;
while d<=length(P)
        atmos=whiting(P(d),T(d));
        Pl=P(d);
        Tl=T(d);
  
%  create a new line shape only if the pressure changes by 2 torr or         
%    if the temperature changes by 2 degrees.
        while d<=length(P) & abs(P(d)-Pl)<2 & abs(T(d)-Tl)<2 
                atmoslas=3*gauss(lasewidth,deltanu(d),1../(length(Delta)),Delta);
                atmos_sigma=sum(atmos.*atmoslas);
                sigmatp(d)=atmos_sigma./labsigma;
                d=d+1;if d>length(P),break;end
                m=d+1000;
%		d
        end
end
% plot(Delta,atmoslas,Delta,atmos)
