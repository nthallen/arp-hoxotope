%calculates the doppler width of OH at temp. T

function w=dopwidth(T)
R=8.3147e7;%erg deg-1
c=3e10;%cm s-1
M=17;
lambda=282e-7; %cm
w=2*sqrt(log(2)*R*2)/c/lambda/sqrt(M)*sqrt(T);

