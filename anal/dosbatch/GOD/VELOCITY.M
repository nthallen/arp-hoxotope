% velocity.m
% created 4/11/93
%
%  v=sqrt(2*Delta_P/rho) = sqrt(2 * Delta_P/P * RT/M)
%      R in Erg K-1 Mole-1, T in K, M in g/mole, P in torr, DP in torr
%      t=velocity(P,DP,T)
%
function t=velocity(P,DP,T)   
t=real(sqrt((2*(DP)./(P)).*(8.314e7/28.96).*(T)));

