function [tout, dout]=splice(tin,din)
% function [tout, dout]=spl(tin,din)
% splice.m creates a continuous index from tin.
% tin is assumed to normally have increments of dt.
dt=min([tin(2)-tin(1) tin(3)-tin(2) tin(4)-tin(3)]);
n=(max(tin)-min(tin))./dt;
tout=ones(1:n);
dout=ones(1:n);
i=length(tin);
c=1;    % c keeps track of the index number where the breaks occur.
m=0;    % m is the length of each break.
s=0;    % s is the sum of the lenghts of the breaks.
for j=1:i;
        tin(j)=round(tin(j));
end
% Find where the breaks occur and add m points
% between the start & stop of the breaks.
for j=1:i-1
        if (abs(tin(j+1)-tin(j) - dt) > (0.25.*dt))
                start=tin(j);
                stop=tin(j+1);
                m=((stop-start)./dt)-1;
                if m==1, m=2;end
                tout((c+s):(j+s))=tin(c:j);
                dout((c+s):(j+s))=din(c:j);
                j
                tout((j+1+s):(j+m+s))=linspace(start+dt,stop-dt,m);
                dout((j+1+s):(j+m+s))=ones((j+1):(j+m)).*nan;
                s=s+m;
                c=j+1;  %=j of the beginning of the next iteration.
        end
end
% Create the data from the last break to the end of the index.
tout((c+s):(i+s))=tin(c:i);
dout((c+s):(i+s))=din(c:i);




        

