% 
%  mean filter
%
%  filtered_data=meanf(data,number of points/2)
%
function fltdat=meanf(dat,pts)
%
%  get filter started by extending array
%
dat1=[dat(2).*(ones(size(1:pts))) dat' dat(length(dat)).*(ones(size(1:pts)))];
fltdt=zeros(size(dat));
for i=1:length(dat)
        fltdt(i)=mean(dat1([(i):(i+2*pts-1)]));
end
fltdat=fltdt;
