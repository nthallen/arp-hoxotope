%____________________________________
% ho2no2_int.m
% FUNCTION VERSION
% function[HNO4_int, HNO4_ss, NO_int, NO2_int]=ho2no2_int(HO2NO2_in,NO2_in,O3,latitude,longitude,...
% day,month,year,time,T,M,jno2_corr,jhno4_corr,oh_corr);
%
%   [HNO4_INT(index) HNO4_SS(index) NO_INT(index) NO2_INT(index)]=ho2no2_new(HNO4(i),NO(i)+NO2c(i),O3(i),...
%   LAT(i),LONG(i),DAY(i),MONTH(i),YEAR(i),time2d(TIME(i)),TMM(i),M(i),jno2_corr(i),jhno4_corr(i),oh_corr(i));
%   
%   Output from this program stored in run_long.mat
%__________________________________

function[HNO4_int, HNO4_ss, NO_int, NO2_int]=ho2no2_int(HO2NO2_in,NOX_in,O3,latitude,longitude,...
   day,month,year,TIME,T,M,jno2_corr,jhno4_corr,oh_corr);

HO2_in=0;
OH_in=0;
NO_in=0;  
NO2_in=NOX_in;
NO=NO_in;   
HO2NO2=HO2NO2_in;
NO2=NOX_in;
HO2=HO2_in;
OH=OH_in;

% create the sza vector, for selected parcel starting at night 
% improve: need to make it start at 95 some how or don't start integrating before 95
localtime=TIME;
if latitude < -50
   starttime=localtime - 3600*24;
else
   starttime=localtime - 3600*24; 
end
endtime=localtime + 3600*0;
time=[starttime : 900 : endtime]; 
sza=szac1(latitude,longitude, time, month, day, year);

% initialize output vectors and store initital values
NO_out    = zeros(size(sza));             
HO2NO2_out = zeros(size(sza));             
NO2_out    = zeros(size(sza));          
Jho2no2_out = zeros(size(sza));
sza_out     = sza;

% this variable will count the number of integrations performed
ncount=0;

% Loop on sza for one parcel on the flight track
for Isza=1:length(sza)-1;   
   
dt=time(Isza+1)-time(Isza);  % delta time between successive sza points (sec)
nloop=1;        
% nloop is the number of integrations at between each sza interval, fn of sza
if (sza(Isza)>93); nloop=2; elseif  (sza(Isza)>=85 & sza(Isza)<=93); nloop=50; 
elseif (sza(Isza)<85); nloop=25; end; 
ncount=ncount+nloop;

% Loop that does the photochemical integration, nloop times
for Iphoto=1:nloop;          
   
dt_nloop=dt/nloop;             % this delta time remains fixed 
sza_nloop=sza(Isza) + ( (sza(Isza+1)-sza(Isza)) * (Iphoto/nloop) );     % sza continuously changes
     
% the current variables, in density units
% density units are not confused with the archive units (mixing ratio)
% the current sza dependent J value
% improve: with Ross J values, what about albedo changes :done

jho2no2=jhno4_corr.*f_jsza(abs(sza_nloop),1.37e-5,0.8857, 0.8282);
jno2=jno2_corr.*f_jsza(abs(sza_nloop),1.35e-2,.965,0.11);
JO1D_FIT=f_jsza(abs(sza_nloop),8e-5,.85,2.2);
JH2CO_FIT=f_jsza(abs(sza_nloop),6.4e-5,.86,0.67);
OH_fit=1.5e10.*JO1D_FIT+1.75e10.*JH2CO_FIT;
  
OH=OH_fit.*oh_corr;
rat=ho2oh(T,O3,NO,0,1e7,5e6,50);
HO2 = rat.*OH;
 
if HO2 < 0; HO2 = 0; end

nono2=jno2./(knoo3(T,M).*O3);
NO2=NOX_in./(1+nono2);
NO=NOX_in-NO2;

if NO < 0; NO = 0; end

if sza_nloop>93
   jho2no2=0;
   jno2=0;
   OH=0;
   HO2=0;
   NO=0;
   NO2=NOX_in;
   HO2NO2ss=HO2NO2_in;
else
   
HO2NO2ss=kho2no2(T,M).*NO2.*HO2./(jho2no2+OH.*kohhno4(T,M));

end

% Integrated production and loss equations
% HO2NO2    

Pho2no2 = kho2no2(T,M).*NO2.*HO2*dt_nloop;
Lho2no2 = (-OH.*HO2NO2.*kohhno4(T,M)-jho2no2.*HO2NO2).*dt_nloop;
HO2NO2 = HO2NO2 + Pho2no2 + Lho2no2;
if HO2NO2 < 0; HO2NO2=0; end

 
end   % Loop that does the photochemical integration, nloop times, Iphoto

end  % Loop on sza for one parcel on the flight track, Isza


% convert results from density to mixing ratio, new names to not confuse with 
% archive names

NO_int=[];
NO2_int=[];
HNO4_int=[];
HNO4_ss=[];
HNO4_int=HO2NO2;
HNO4_ss=HO2NO2ss;
NO_int=NO;
NO2_int=NO2;




   
   
 



   
   
   












