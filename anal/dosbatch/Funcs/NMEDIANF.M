%  median filter. Excludes nan's from the filter.
%  function  fltdat=medianf(dat,pts)
%  filtered_data=medianf(data,number of points/2)
function  fltdat=nmedianf(dat,pts)
%
%  get filter started by extending array
%
z=length(dat);
for i=1:pts
        dat1(i)=dat(i);
        dat1(z+2.*i)=dat(z-pts+i);
end
f=NaN.*ones(size(dat));
dat1((pts+1):(pts+z))=dat;
k1=find(isnan(dat)==1);% | isinf(dat)==0);
if isempty(k1)==0
        f(k1)=NaN.*ones(size(k1));
end
j1=find(isnan(dat1)==0);% & isinf(dat1)==0);
j=find(isnan(dat)==0);% & isinf(dat)==0);
% If the input data has a bunch of nan's at the end,
% ignore them in the filter.
if (length(j1)-length(j)) < 2.*pts
        m=length(j1)-2.*pts;

else
        m=length(j);
end        
for i=1:m
        p=i+2*pts;
        dat1(j1(i:p));
        f(j(i))=median(dat1(j1(i:p)));
end
% If the input data has a bunch of nan's at the end,
% set the end of the output file to equal that of the input.
if m < length(j)
        for i=(m+1):length(j)
                f(j(i))=dat(j(i));
        end
end
fltdat=f;

