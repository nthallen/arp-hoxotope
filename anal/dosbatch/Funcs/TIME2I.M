%time2i.m
global Time;
t1=Time(1);
h=input('Hour=');
m=input('Min =');
s=input('sec =');
h=h*60*60 +5*60*60;
m=m*60;
day=fix(t1./(24*60*60));
seconds=h+m+s+day*24*60*60;
p=find(Time<=seconds);
p(length(p))
%time=q-day*60*24*60;
%hour=fix(time./(60*60));
%min=fix((time-hour*60*60)./60);
%sec=time-hour*60*60-min*60;
%p=[hour-5 min sec];
