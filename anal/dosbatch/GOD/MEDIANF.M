%
%  median filter
%
%  filtered_data=medianf(data,number of points/2)
%
function fltdat=medianf(dat,pts)
%
%  get filter started by extending array
%  last edit: 10-20-93, 10-6-95 for wmatlab
%  make pts a vector, pts was a vector length and is input as a vector length

pts=[1:pts];
if (isnan(dat(2))==1 | isinf(dat(2))==1)
l=find(isnan(dat)==0);
datinit=dat(l(1));
else
datinit=dat(2);
end

if (isnan(dat(length(dat)))==1 | isinf(dat(length(dat)))==1)
datend=dat(l(length(l)));
else
datend=dat(length(dat));
end


dat1=[datinit.*(ones(size(pts))) dat datend.*(ones(size(pts)))];


k1=find(isnan(dat)==1 | isinf(dat)==1);
if isempty(k1)==0
 f(k1)=NaN.*ones(1:length(k1));
end

j1=find(isnan(dat)==0 & isinf(dat)==0);
m=find(isnan(dat1)==0 & isinf(dat1)==0);
dat1nonan=dat1(m);
f=NaN.*ones(size(j1));
for i=1:length(j1)
        f(j1(i))=median(dat1nonan([i:i+2*pts]));
end

fltdat=f;

