%/////////////////////////////////////////////////////////////             ho2no2_td1.m
% version for polyphemus, 
% changed time window from +8 before to 4 after to +6 before to 0.5 after
% the majic number changes from 33 to 25


% function[clnss_r,iselc,imeas,nloop,clnss_r2]=cln_dt1(clo_m, clono2, latfp, longfp, ... 
% no2ss, tmm, pmm, gmt, jszaX, jclono2_ross, flt_day);

latitude=45;
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
ho2_0     = 0;    
HO2_in    =ho2_0.*M*1e-12;  
ho2no2_0  = 200;        
HO2NO2_in =ho2no2_0.*M*1e-12;
no2_0     = 400;                            
NO2_in    =no2_0.*M*1e-12;

% create the sza vector, for selected parcel starting at night 
% improve: need to make it start at 95 some how or don't start integrating before 95
localtime=32400;
starttime=localtime - 3600*6; 
endtime=localtime + 3600*6;
time=[starttime : 900 : endtime]; 
sza=szacalc(latitude,longitude, time, month, day, year);

% initialize output vectors and store initital values
ClO_out    = zeros(size(sza));  ClO_out(1)=ClO_in;              
ClONO2_out = zeros(size(sza));  ClONO2_out(1)=ClONO2_in;            
NO2_out    = zeros(size(sza));  NO2_out(1)=NO2_in;            
Jclono2_out = zeros(size(sza));
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
ClO=ClO_in;   
ClONO2=ClONO2_in;
NO2=NO2_in;             % NO2 remains fixed for now

% the current sza dependent J value
% improve: with Ross J values, what about albedo changes :done

if jszaX(imeas(iselc)) < 90;
if  (sza_nloop>93); jclno3=0;
   elseif (sza_nloop>=89.8 & sza_nloop<=93);                                          
      cclno3=[2.5e-8 -6.625e-6 5.8315e-4 -1.7042e-2];                  
      jclno3=polyval(cclno3,sza_nloop);  
   elseif (sza_nloop < 89.8)
      jclno3=jclono2_ross(imeas(iselc))*( cos(sza_nloop*.0174533)/cos(jszaX(imeas(iselc))*.0174533) )^0.5;
end
elseif jszaX(imeas(iselc))>= 90;
if  (sza_nloop>93); jclno3=0;
   elseif (sza_nloop>=89.8 & sza_nloop<=93);                                          
      cclno3=[2.5e-8 -6.625e-6 5.8315e-4 -1.7042e-2];                  
      jclno3=polyval(cclno3,sza_nloop);  
   elseif (sza_nloop < 89.8)
      jclno3=9.0e-5*(cos(sza_nloop*.0174533))^(0.5);
end; end;

% store the starting J value
J_scale=1;
if (Iphoto==1); Jclono2_out(Isza)= jclno3*J_scale; end;
jclno3=jclno3*J_scale;

% Integrated production and loss equations
% ClONO2    
   Pclono2 = kclono2(T,M).*NO2.*ClO*dt_nloop;
   Lclono2 = -jclno3.*ClONO2*dt_nloop;
ClONO2_in = ClONO2 + Pclono2 + Lclono2;
if ClONO2_in < 0; ClONO2_in=0; end

% ClO 
   Lclo = -Pclono2;
   Pclo = -Lclono2;
ClO_in = ClO + Pclo + Lclo;
if ClO_in < 0; ClO_in=0; end

end   % Loop that does the photochemical integration, nloop times, Iphoto

% next value all initialized at ending value
ClO_out(Isza+1)   =ClO_in;
ClONO2_out(Isza+1)=ClONO2_in;
NO2_out(Isza+1)   =NO2_in;

end  % Loop on sza for one parcel on the flight track, Isza

Jclono2_out(length(sza))=jclno3;   

% convert results from density to mixing ratio, new names to not confuse with 
% archive names
clo_out =    ClO_out * 1e12 ./ M;
clono2_out = ClONO2_out * 1e12 ./ M;
no2_out =    NO2_out * 1e12 ./ M;

%ncount
%fprintf([num2str(flt_day(1)),'  ',num2str(iselc),'/',num2str(length(imeas)),'  ncount=',num2str(ncount),'\n'])


% pause(1)
ClONO2ss=zeros(size(sza));
for k=1:length(sza);
if Jclono2_out(k)==0; ClONO2ss(k)=0; else
ClONO2ss(k)=kclono2(T,M).*NO2.*ClO_out(k)./Jclono2_out(k); end; end;
clono2ss_out=ClONO2ss*1e12./M;

clnss_r(iselc)=clono2ss_out(25)./clono2_out(25);
clnss_r2(imeas(iselc))=clono2ss_out(25)./clono2_out(25);

%fprintf(['clono2 timedep /ss =',num2str(clono2ss_out(25)./clono2_out(25)),'\n\n']) 


   
   
 



   
   
   












