% 
%  median filter, copied from Rick 9-08-94
%  filtered_data=medianf(data,number of points/2)
%
function fltdat=medianf(dat,pts)
%
%  get filter started by extending array
%
if (dat(2)==nan | abs(dat(2))==inf)
l=find(dat~=nan);
datinit=dat(l(1));
else
datinit=dat(2);
end

if (dat(length(dat))==nan | abs(dat(length(dat)))==inf)
l=find(dat~=nan);
datend=dat(l(length(l)));
else
datend=dat(length(dat));
end

dat1=[datinit.*(ones(1:pts)) dat' datend.*(ones(1:pts))];

k1=find(dat==NaN | abs(dat)==inf);
if isempty(k1)==0
 f(k1)=NaN.*ones(1:length(k1));
end

j1=find(dat~=NaN & abs(dat)~=inf);
m=find(dat1~=nan & abs(dat1)~=nan);
dat1nonan=dat1(m);
for i=1:length(j1)
        f(j1(i))=median(dat1nonan([i:i+2*pts]));
end
fltdat=f;

