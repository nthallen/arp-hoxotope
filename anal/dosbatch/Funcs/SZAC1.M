%________________________________________________________________________
% szac1.m
%________________________________________________________________________
%  This program calculates solar zenith angle for any time and place
%  on earth. The required input is date, time and position of the observer.
%  This m file is a transcription of fortran code from S. Lloyd.
% 
%  fuction sza=szac1(Lat,Long,time,month,date,year)
%________________________________________________________________________
% load signal
%________________________________________________________________________
%  Remove nan's, if nan's exist vector length will effect next program
function sza=szac1(Lat,Long,time,am,ai,ak)
skipthis=0;
if skipthis==1
j=[time lat long];
j=remnan(j);
tgmt=j(:,1);
Lat=j(:,2);
Long=j(:,3);
end
%________________________________________________________________________
%ak=1993;             % Year
%am=5;                % Month
%ai=12;                % Day of the month
ut=time./3600;       % GMT in decimal hours
phi=Lat;             % Latitude (North is positive, South is negative)
alambda=Long;        % Longitude (West is negative, East is positive)
%                      a prefix r indicates the angle is in radians
%________________________________________________________________________
% Julian date at midnight gmt minus 1721013.5
ajd0=(367.*ak)-fix((7/4)*(ak+fix((am+9)/12)))+(fix((275*am)/9))+ai;
% Julian date minus 1721013.5
ajd=(367.*ak)-fix((7/4)*(ak+fix((am+9)/12)))+(fix((275*am)/9))+ai+(ut./24);
t0=(ajd0-730531.5)/36525;
t=(ajd-730531.5)./36525;
d=357.528+(35999.05.*t);
for i=1:length(ut)
while d(i) < 0
d(i)=d(i) + 360;
end
while d(i) >= 360
d(i)=d(i) - 360;
end
end
%________________________________________________________________________
rd=d*pi/180;
%----------------------------------- True geocentric longitude of the sun
al=280.46+(36000.772.*t)+(1.916.*sin(rd))+(0.02.*sin(2.*rd));
for i=1:length(ut)
while al(i) < 0
al(i)=al(i)+360;
end
while al(i) >= 360
al(i)=al(i)-360;
end
end
%----------------------------  Nu is the quadrant in which the sun resides
nu=fix(al/90)+1;
rl=al*pi/180;
rra=atan(0.91747.*(tan(rl)));
%------------------------------------- Apparent right ascention of the sun
ra=rra*180/pi;
for i=1:length(ut)
if ra(i) < 0
ra(i)=ra(i)+360;
end
end
%------------------------------ Nub is the quadrant of the right ascension
%---------------------------- Since al and ra must be in the same quadrant,
%------------------------------- We will now check and make sure this is so.
nub=fix(ra/90)+1;
for i=1:length(ut)
while nu(i) < nub(i)
ra(i)=ra(i)-90;
nub(i)=nub(i)-1;
end
while nu(i) > nub(i)
ra(i)=ra(i)+90;
nub(i)=nub(i)+1;
end
end
%________________________________________________________________________
rta=ra;
rdec=asin(0.3978.*sin(rl));
%------------- Declination of the sun, north is positive, south is negative.
dec=rdec*180/pi;
rphi=phi*pi/180;
%--------------------------------------- Greenwich mean sideral time in hours
gmst=6.69737456+(2400.051336.*t0)+(0.0000258622.*t0.^2)+(1.002737909.*ut);
for i=1:length(ut)
while gmst(i) > 24
gmst(i)=gmst(i)-24;
end
while gmst(i) < 0
gmst(i)=gmst(i)+24;
end
end
gmt=gmst;
%-------------- Mean longitude of the ascending node of the moon's orbit ???
omega=125.04452-(1934.13626.*t)+(0.002071.*t.^2);
for i=1:length(ut)
while omega(i) > 360
omega(i)=omega(i)-360;
end
while omega(i) < 0
omega(i)=omega(i)+360;
end
end
romega=omega*pi/180;
%----------------------------------------- Equation of the equinoxes in hours
e=-0.00029.*sin(romega);
%------------------------------------------------------------ Local hour angle
rlha=(15.*(gmst+e-(ra./15))+alambda)*pi/180;
rsza=acos((sin(rphi).*sin(rdec))+(cos(rphi).*cos(rdec).*cos(rlha)));
%---------------------------------------------------------- Solar zenith angle
sza=rsza*180/pi;
%________________________________________________________________________
%plot(tgmt,sza)
%grid
%save sza sza tgmt
%clear
