
% today.m     create an today's date string  930819      10-31-95

xxx=clock;
yr=num2str(xxx(1)-1900);
if xxx(2)<=9
mo=num2str(xxx(2));
mo=(['0',mo]);
else
mo=num2str(xxx(2));
end
if xxx(3)<=9
day=num2str(xxx(3));
day=(['0',day]);
else
day=num2str(xxx(3));
end
TDstr=([yr,mo,day]);
ad_str=([yr,mo,day]);
clear yr mo day xxx



