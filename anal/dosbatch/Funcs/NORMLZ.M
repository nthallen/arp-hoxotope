function n = m(MR) 
%function n = m(MR) 
% Normalizes MR to max(MR)=1 and min(MR)=0,
% so that nMR can be plotted with a y-axis from 0 to 1.
i=find(~isnan(MR));
n=medianf(MR(i),1);
j=min(n);
k=max(n);
n = (MR-j)./(k);
j=min(n(i));
k=max(n(i));
n=n/(k-j);

