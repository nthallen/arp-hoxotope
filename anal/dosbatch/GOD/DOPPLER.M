%calculates the doppler width
%function w=doppler(Temp,Lambda,M)
%M is molecular weight
%Lambda in cm
function w=dopwidth(T,lambda,M)
R=8.3147e7;%erg deg-1
c=3e10;%cm s-1
w=2*sqrt(log(2)*R*2)/c/lambda/sqrt(M)*sqrt(T);

