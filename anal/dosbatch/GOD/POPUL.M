%program to calculate population density in J=1.5 state of the ground
%electronic state of OH
%
function pop1=popul(T)
%spectroscopic constants
A=-139.228;
B=18.5497;
D0=.001907;
KB=.69504;
Y=A/B;
%
%now, compute the term values for the first 30 rotational states
%in 1/2 and 3/2 pi system using Herzberg expression
for J=1:30
  %for the 1/2 state:
  term1(J)=B.*((J+1).^2-1-.5*sqrt(4*(J+1).^2+Y*(Y-4)))-D0*(J+.5).^4;
  %for the 3/2 state:
  term2(J)=B*(J*J-1+.5*sqrt(4*J*J+Y*(Y-4)))-D0*(J+.5).^4;
end
% calculate the partition function
Q=0;
for J=1:30
   Q=Q+(2*(J+.5)+1)*exp(-((term1(J)-term1(1))./(KB*T)));
   Q=Q+(2*(J-.5)+1)*exp(-((term2(J)-term1(1))./(KB*T)));
end
J=2;
pop1=((2*(J+.5)+1)*exp(-(term1(J)-term1(1))./(KB*T)))./Q;
%pop2=((2*(J-.5)+1)*exp(-(term2(J)-term1(1))./(KB*T)))./Q;
