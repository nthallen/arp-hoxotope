global Time
z=Time(i(1)); 
day=fix(Time(1)./(24*60*60));
time=z-day*60*24*60;
hour=fix(time./(60*60));
min=fix((time-hour*60*60)./60);
sec=time-hour*60*60-min*60;
[hour-5 min sec]
