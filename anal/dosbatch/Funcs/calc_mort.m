%	Type HELP MORT
%
% 

clc;
more off;
J = interest/(12*100);  % interest in decimal
N = 12 * time;		% number of months
M = loan*(J/(1-(1+J)^(-N)));	% initial month payment
disp('Your monthly payments will be:');
disp(' ');
disp(M); 
i = 1;

index_loan = zeros(size(N));
index_interest =  zeros(size(N));
index_principal = zeros(size(N));
index_balance	=  zeros(size(N));

dummy = loan;
for i = 1:N
  H = dummy*J;  	% Current Monthly Interest
  C = M-H;	% Monthly payment towards principal
  Q = dummy-C;	% Balance
 
	dummy = Q;

  index_loan(i) = dummy;
  index_interest(i) = H;
  index_principal(i) = C;
  index_balance(i) = Q;
end
hold on;
color_map = ['rbgrbmbrgr'];
z1 = 0;
z2 = 0;

while (z1 == 0) | (z1 > 9) | (z2 == 0) | (z2 > 9)

  z1 = fix(rand(1)*10);
  z2 = fix(rand(1)*10);

% What are the chances of get the same random number twice!? 
  if (z1 == z2)
    z1 = fix(rand(1)*10);
    z2 = fix(rand(1)*10);
  end
end
z1 = color_map(z1);
z2 = color_map(z2);
plot(index_interest, 'color', z1);
plot(index_principal, 'color', z2);
legend('Interest Payments', 'Principal Payments');
title('Principle and Interest Curve');
xlabel('Month');
ylabel('Dollars ($)');
	
total_interest = sum(index_interest);
total_principal = sum(index_principal);
disp('You end up paying back a total of: ');
disp(' ');
total = total_interest + total_principal
hold off
