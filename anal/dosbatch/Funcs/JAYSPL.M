function newd=jayspl(tin,din,time)
% function newd=jayspl(tin,din,time)
% newspl.m creates a continuous index from tin
% using linear interpolation.  The time basis
% and vector length are determined from time.
% t is assumed to have linear increments.ed
% modified from linspl.m and addon.m
%
dt=median([time(21)-time(20) time(31)-time(30) time(41)-time(40)]);
n=1+round((max(tin)-min(tin))./dt);
tout=ones(size(n));
dout=ones(size(n));
i=length(tin);
c=1;    % c keeps track of the index number where the breaks occur.
m=0;    % m is the length of each break.
s=0;    % s is the sum of the lenghts of the breaks.
% Find where the breaks occur and add m points
% between the start & stop of the breaks.
for j=1:i-1
        if (abs(tin(j+1)-tin(j) - dt) > (0.25.*dt))
                start=tin(j);
                stop=tin(j+1);
                m=round((stop-start)./dt)-1;
                tout((c+s):(j+s))=tin(c:j);
                dout((c+s):(j+s))=din(c:j);
                tout((j+1+s):(j+m+s))=linspace(start+dt,stop-dt,m);
                ug=linspace(din(j),din(j+1),m+2);
                dout((j+1+s):(j+m+s))=ug(2:m+1);
                s=s+m;
                c=j+1;  %=j of the beginning of the next iteration.
        end
end
% Create the data from the last break to the end of the index.
tout((c+s):(i+s))=tin(c:i);
dout((c+s):(i+s))=din(c:i);

% Take tout and add on points so that
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
newt=[time(i) tout time(j)]';
newd=[nan.*time(i) dout nan.*time(j)]';





        

