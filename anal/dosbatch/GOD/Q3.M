% function q3.m  t=q(M,T)
% calculates fluorescence efficiency in Air
% assumes that argon isn't important
% t=q(xo2,M,T);
function t=q(M,T)
xn2=.78;
xo2=.21;
tn2=(xn2).*M.*2.2e-10;
to2=(xo2).*M.*2.5e-11;
q1n2=(xn2).*M.*2.8e-11;
q1o2=(xo2).*M.*1.8e-10;
q0n2=(xn2).*M.*(1.55e-11).*exp(140../T);
q0o2=(xo2).*M.*1.06e-10;
krad0=1.44e6;
krad1=1.32e6;
trans=(tn2+to2)./(tn2+to2+q1n2+q1o2+krad1);
t=trans.*(krad0./(q0n2+q0o2+krad0));