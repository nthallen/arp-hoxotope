% god2_1.m
% 
% created aug. 6, 1993
%  NO is seen to be coming out of the injector a bit during OH measurement
%  the wave forms have a small exponential componant, especially at axis 2
%  during slow flow conditions. 
%  sold22k uses just the last 1 sec of the 6 sec OH measurement period.
%  this correction is generally less than 5 percent.

load sold22a
load sold22h
load sold22i
load sold22j
load sold22k
load hox2

oh1=mrOH1.*((dx1sigk)./dx1siga);
oh2=mrOH2.*((dx2sigk)./dx2siga);

oh=.5.*(oh1+oh2)

ho2mix2

save hox2_1
