%/////////////////////////////////////////////////////////////             ho2no2_td1.m
% SCRIPT VERSION
%////////////////////////////
latitude=-45;
longitude=0;


%/////////////////////// convert flt_day to year month day;
flt_day=970707;
datestr=int2str(flt_day);
yearstr=(['19',datestr([1 2])]); year=str2num(yearstr);
monthstr=datestr([3 4]);         month=str2num(monthstr);
daystr=datestr([5 6]);           day=str2num(daystr);

T=220; % K 
p=50;  % mbars

M=2.687e19*(273.15./T).*(p/1013.3);  

% initial radical inputs, lower case mixing ratio, upper case density
% for beginnning of integration, less than 24 hours earlier, should be darkness
% if not in darkness, doesn't matter as long as time sufficient to reach ss 
HO2_in=0;
OH_in=0;
no_0     = 0;    
NO_in    =no_0.*M*1e-12;  
ho2no2_0  = 170;        
HO2NO2_in =ho2no2_0.*M*1e-12;
no2_0     = 1000;                            
NO2_in    =no2_0.*M*1e-12;

% create the sza vector, for selected parcel starting at night 
% improve: need to make it start at 95 some how or don't start integrating before 95
localtime=32400;
starttime=localtime - 3600*24; 
endtime=localtime + 3600*5;
time=[starttime : 900 : endtime]; 
sza=szac1(latitude,longitude, time, month, day, year);

% initialize output vectors and store initital values
NO_out    = zeros(size(sza));  NO_out(1)=NO_in;              
HO2NO2_out = zeros(size(sza));  HO2NO2_out(1)=HO2NO2_in;            
NO2_out    = zeros(size(sza));  NO2_out(1)=NO2_in;            
Jho2no2_out = zeros(size(sza));
sza_out     = sza;

% this variable will count the number of integrations performed
ncount=0;

% Loop on sza for one parcel on the flight track
for Isza=1:length(sza)-1;   
   
dt=time(Isza+1)-time(Isza);  % delta time between successive sza points (sec)
        
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
NO=NO_in;   
HO2NO2=HO2NO2_in;
NO2=NO2_in;
HO2=HO2_in;
OH=OH_in;

% NO2 remains fixed for now

% the current sza dependent J value
% improve: with Ross J values, what about albedo changes :done

jho2no2=f_jsza(abs(sza_nloop),1.37e-5,0.8857, 0.8282);
jno2=f_jsza(abs(sza_nloop),1.35e-2,.965,0.11);
if sza_nloop>95
   jho2no2=0;
   jno2=0;
   OH=0;
   HO2=0;
   NO=0;
end

% store the starting J value
J_scale=1;
if (Iphoto==1); Jho2no2_out(Isza)= jho2no2*J_scale; end;
jho2no2=jho2no2*J_scale;
 O3=5e12;
% Integrated production and loss equations
% HO2NO2    
   Pho2no2 = kho2no2(T,M).*NO2.*HO2*dt_nloop;
   Lho2no2 = (-OH.*HO2NO2.*kohhno4(T,M)-jho2no2.*HO2NO2).*dt_nloop;
HO2NO2_in = HO2NO2 + Pho2no2 + Lho2no2;
if HO2NO2_in < 0; HO2NO2_in=0; end

% NO2
Lno2=-jno2.*NO2.*dt_nloop;
Pno2=knoo3(T,M).*NO.*O3.*dt_nloop;
NO2_in=NO2 + Pno2 + Lno2;

% NO 
   Lno = -Pno2;
   Pno = -Lno2;
   NO_in=NO + Pno + Lno;
   
     
   OH_in=2.75e4.*(97.5-sza_nloop);
   rat=ho2oh(T,O3,NO,0,1e7,5e6,50);
   HO2_in = rat.*OH;
 
if HO2_in < 0; HO2_in=0; end

end   % Loop that does the photochemical integration, nloop times, Iphoto

% next value all initialized at ending value
NO_out(Isza+1)   =NO_in;
HO2NO2_out(Isza+1)=HO2NO2_in;
NO2_out(Isza+1)   =NO2_in;
HO2_out(Isza+1)  = HO2_in;
OH_out(Isza+1)   = OH_in;

end  % Loop on sza for one parcel on the flight track, Isza

Jho2no2_out(length(sza))=jho2no2;   

% convert results from density to mixing ratio, new names to not confuse with 
% archive names
no_out =    NO_out * 1e12 ./ M;
ho2no2_out = HO2NO2_out * 1e12 ./ M;
no2_out =    NO2_out * 1e12 ./ M;

%ncount
%fprintf([num2str(flt_day(1)),'  ',num2str(iselc),'/',num2str(length(imeas)),'  ncount=',num2str(ncount),'\n'])


% pause(1)
HO2NO2ss=zeros(size(sza));
for k=1:length(sza);
if Jho2no2_out(k)==0; HO2NO2ss(k)=0; else
   HO2NO2ss(k)=kho2no2(T,M).*NO2_out(k).*HO2_out(k)./(Jho2no2_out(k)+OH_out(k).*kohhno4(T,M));
end; end;
ho2no2ss_out=HO2NO2ss*1e12./M;

hno4ss_r=ho2no2ss_out./ho2no2_out;
hno4ss_r2=ho2no2ss_out./ho2no2_out;

%fprintf(['clono2 timedep /ss =',num2str(clono2ss_out(25)./clono2_out(25)),'\n\n']) 


   
   
 



   
   
   












