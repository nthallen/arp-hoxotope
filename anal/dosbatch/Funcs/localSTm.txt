function lst = f_gmt2lst(gmt,lng)

% function lst = f_gmt2lst(gmt,lng)
%
%	lst = local solar time [sec]
%	gmt = Greenwich mean time [sec]
%	lng = longitude [deg]

% note: raw lng_mm ranges from approximately -175 to +10 degrees in the polaris data set
% note: Julian day is the same everywhere for SZA calculations and is not included here.

lst=gmt+lng/360*86400;				% lst is later than gmt at positive lng
n=find(lst>=86400); lst(n)=lst(n)-86400;	% make max lst < 86400
n=find(lst<0); lst(n)=lst(n)+86400;		% make min lst = 0


