%i=find(dl_total>4400);
i=find(dl>4800 & dl<5200);
numbins=30;
dx=(max(dl_x(i))-min(dl_x(i)))./numbins;
x=min(dl_x(i)):dx:max(dl_x(i));
dy=(max(dl_y(i))-min(dl_y(i)))./numbins;
y=min(dl_y(i)):dy:max(dl_y(i));
z=zeros(10);
% Create 3-D matrix of UV power data
for xbin=1:length(x)
   for ybin=1:length(y)
      if dl_uv((abs(dl_x-x(xbin))<2.*dx & abs(dl_y-y(ybin))<2.*dy))
         z(xbin,ybin)=median(dl_uv((abs(dl_x-x(xbin))<2.*dx & abs(dl_y-y(ybin))<2.*dy)));
      end
      
   end
end
