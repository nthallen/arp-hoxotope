% function q2.m  t=q(M,T) 
function t=q(M,T)
% calculates fluorescence efficiency in Air
% assumes that argon isn't important
% t=q(M,T); 
tn2=.78.*M.*2.3e-10;
to2=.21.*M.*3.5e-11;
q1n2=(.78).*M.*(1.51e-11).*exp(150../T);
q1o2=(.21).*M.*1.6e-10;
q0n2=q1n2;
q0o2=.21.*M.*1.1e-10;
krad=1.44e6;
trans=(tn2+to2)./(tn2+to2+q1n2+q1o2+krad);
t=trans.*(krad./(q0n2+q0o2+krad));