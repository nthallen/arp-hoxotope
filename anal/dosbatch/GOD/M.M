        %
%  M.m 
%  created 4/11/93
%  P=pressure in volts (10 V = 1000 torr)
%
function t=M(P,T);
%
t=(P).*3.24e16.*298../T;
