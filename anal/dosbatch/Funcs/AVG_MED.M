function [avgt,avg]=avg(t, raw, pts)
% function [avgt,avg]=avg(t, raw, pts)
% function to create an averaged array.
% Input parameters are the raw data and
% the number of points to average.  The
% new array will be l=length(raw)./(pts*(dt/step)) long.
% Version pre 9/29/94
lraw=length(raw);
l=floor(lraw/pts);
avgt=ones(size(l));
avg=ones(size(l));
%
% Default step size is the numer of averaged points.
% To turn avger.m into a mean filter of width pts, set step=1;
%
step=pts;
c=0;
for j=1:step:(l*pts-3)
        c=c+1;
        k=j:(j-1+pts);
        dt=min([t(j+1)-t(j) t(j+2)-t(j+1) t(j+3)-t(j+2)]);
        z=find(raw(k)~=nan);
        avgt(c)=mean(t(k(z)));
        midt=median(t(k(z)));

% This assumes that the time index is regularly spaced.

        if (t(max(k))-t(min(k)))/(pts-1) == dt
%                avgt(c)=round(avgt(c));
%                avg(c)=mean(raw(k(z)));
                avg(c)=median(raw(k(z)));
        
else
   if midt > avgt(c)
                        hi=find(t(k(z)) > avgt(c));
                        avg(c)=median(raw(k(z(hi))));
                        avgt(c)=mean(t(k(z(hi))));
                else 
                        lo=find(t(k(z)) < avgt(c));
                        avg(c)=median(raw(k(z(lo))));
                        avgt(c)=mean(t(k(z(lo))));
                end
        end
end

