function [newt, newd]=addon(tout,dout,time)
% function [newt, newd]=addon(tout,dout,time)
% Takes an array tout and adds on points so that
% newt and newd are the same length as time.
i=find(time<min(tout));
j=find(time>max(tout));
[x y]=size(tout);
if x~=1
        tout=tout';
end
[x y]=size(dout);
if x~=1
        dout=dout';
end
[x y]=size(i);
if x~=1
        i=i';
        j=j';
end
[x y]=size(time);
if x~=1
        time=time';
end
newt=[time(i) tout time(j)];
newd=[nan.*time(i) dout nan.*time(j)];
