function avgout=average(data,binsize)
% function avgout=average(data,binsize)
[x y]=size(data);
if x>1
   data=data';
end
small=binsize.*floor(length(data)./binsize);
big=binsize.*ceil(length(data)./binsize);
data(small+1:big)=nan.*(small+1:big);
p=reshape(data,binsize,length(data)./binsize);
o=ones(size(p));
i=find(isnan(p));
p(i)=zeros(size(i));
o(i)=zeros(size(i));
avgout=sum(p)./sum(o);
