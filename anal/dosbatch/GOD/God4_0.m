echo off
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
% XX                      god_strat.4_0                         XX
% XX                                                            XX
% XX  created Jan, 1997.  Corrects some of the deficiencies     XX
% XX     in god_asho.3_2, better use of the n2 signal; puts the XX
% XX     two axes on a common calibration, equal to the average XX
% XX     of the two axes (using the times when they are both    XX
% XX     measuring OH or HO2). Also corrects for counts that    XX
% XX     fall outside the adjustable gate.                      XX
% XX  version 3.2 from Jan. 1995.  corrects zeros in temp.      XX
% XX     and pressure guages.                                   XX
% XX  version 3.2 changed zeros in pressure gages fall 1996     XX
% XX  version 4.0 changed quenching and new calibration		XX
% XX  Last modified during POLARIS 970710		        XX
% XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
%pause
%  flight.mat contains fltday yymmdd 
load flight

%  hox.mat is the file which includes the difference counts when the
%      back NO injector is on with constant NO flow.

load hox
day=fix(time_hox(1)./(24.*60.*60));

%  n2.mat is the file which includes the data for when the n2 filter is in

load n2

%  oh.mat is the file when both axes are measuring OH

load oh
%

% ho2.mat is the file that includes the data from titrations at the front
%     injector and ho2b.mat for the back injector

load ho2
load ho2b
if length(time_ho2)~=length(time_ho2b) 
	ho2bm1
end
% 
% load zeros  (SD__P0,SD_DP0,temperature zero)
load \polaris\batch\zero
	sd__p0=11.07;
%
% load calibration data  (calibation of axis 1, axis 2, etc.)
load \polaris\batch\const4_0
c1_hox=c1.*ones(size(time_hox));
c2_hox=c2.*ones(size(time_hox));
c1_oh=c1.*ones(size(time_oh));
c2_oh=c2.*ones(size(time_oh));
clear c1 c2
%
%  convert all to GMT
%  load nav
%  toff=median(TDrft)                                         
time_hox=time2d(time_hox);%+toff;  
time_n2=time2d(time_n2);%+toff;
time_oh=time2d(time_oh);%+toff;
time_ho2=time2d(time_ho2);%+toff;
time_ho2b=time2d(time_ho2b);%+toff;
%
%  Set up temperature and pressure; calculate M and velocity
%     saff2 assumed correct.
	
offset=0;

temp_hox=saff1_hox+ offset;
temp_n2=saff1_n2+ offset;
temp_oh=saff1_oh+ offset;
temp_ho2=saff1_no+ offset;
temp_ho2b=saff1_nob+ offset;

if sd_p2_hox<110
press_hox=sd_p2_hox;
else
press_hox=sd__p_hox-sd__p0;
end

if sd_p2_n2<110
press_n2=sd_p2_n2;
else
press_n2=sd__p_n2-sd__p0;
end

if sd_p2_oh<110
press_oh=sd_p2_oh;
else
press_oh=sd__p_oh-sd__p0;
end

if sd_p2_no<110
press_ho2=sd_p2_no;
else
press_ho2=sd__p_no-sd__p0;
end

if sd_p2_nob<110
press_ho2b=sd_p2_nob;
else
press_ho2b=sd__p_nob-sd__p0;
end
% Correct pressure for leak on 970626.
if fltday=='970626'
   press_hox=press_hox-8.5;
   press_oh=press_oh-8.5;
   press_n2=press_n2-8.5;
   press_ho2=press_ho2-8.5;
   press_ho2b=press_ho2b-8.5;
end
% 970626 verify pressure with n2_x1 = 3.14e-17.
%M_fit=(sx1sig_n2+dx1sig_n2)./(0.78.*3.14e-17);
%press=M_fit.*temp_n2./298./3.24e16;
%for i=1:length(time_hox); 
%	[k,l]=sort(abs(time_n2-time_hox(i)));
%	j1=polyfit(time_n2(l(1:4)),press(l(1:4)),1);
%	press1(i)=polyval(j1,time_hox(i));
%end
diffp_hox=sd_dp_hox-sd_dp0;
diffp_ho2=sd_dp_no-sd_dp0;    
diffp_ho2b=sd_dp_nob-sd_dp0;

% calculate the number density 
M_hox=M(press_hox,temp_hox);
M_n2=M(press_n2,temp_n2);
M_oh=M(press_oh,temp_oh);
M_ho2=M(press_ho2,temp_ho2);
M_ho2b=M(press_ho2b,temp_ho2b);
 
% calculate the velocity in the duct
vel_hox=velocity(press_hox,diffp_hox,temp_hox);
vel_ho2=velocity(press_ho2,diffp_ho2,temp_ho2);             
vel_ho2b=velocity(press_ho2b,diffp_ho2b,temp_ho2b);
%
clear saff1_hox saff1_n2 saff1_oh saff1_no saff1_nob sd__p_hox 
clear sd__p_n2 sd__p_no sd__p_nob
clear sd__p_oh sd_dp_hox sd_dp_n2 sd_dp_oh diffp_hox diffp_ho2 diffp_ho2b  
%
% calculate NO density
no_hox=no(noflw_hox,vel_hox);
%
% calculate NO density during titration
nof1=no(nof1+s_nof,vel_ho2);  
nof2=no(nof2+s_nof,vel_ho2);    
nof3=no(nof3+s_nof,vel_ho2);    
nof4=no(nof4+s_nof,vel_ho2);    
nof5=no(nof5+s_nof,vel_ho2);    
nof6=no(nof6+s_nof,vel_ho2);    
nof1b=no(nof1b+s_nofb,vel_ho2b);  
nof2b=no(nof2b+s_nofb,vel_ho2b);    
nof3b=no(nof3b+s_nofb,vel_ho2b);    
nof4b=no(nof4b+s_nofb,vel_ho2b);    
nof5b=no(nof5b+s_nofb,vel_ho2b);    
nof6b=no(nof6b+s_nofb,vel_ho2b);    
%
% note: nof not used in data analysis.  
nof=[nof1 nof2 nof3 nof4 nof5 nof6];                
notb=[nof1b nof2b nof3b nof4b nof5b nof6b];
clear nof1 nof2 nof3 nof4 nof5 nof6
clear nof1b nof2b nof3b nof4b nof5b nof6b 
clear noflw_hox
%
% calculate Quenching 
%
Q_hox=Q3(M_hox,temp_hox);
Q_oh=Q3(M_oh,temp_oh);
%
% calculate OH partition function
% 
partitionrt=popul(298);
partition_hox=popul(temp_hox);
partition_oh=popul(temp_oh);
Nj_hox=partition_hox./partitionrt;
Nj_oh=partition_oh./partitionrt;
clear partitionrt partition_hox partition_oh
%
% calculate N2 signal online
%
n2sig1=(sx1sig_n2+dx1sig_n2)./(.78.*M_n2);
n2sig2=(sx2sig_n2+dx2sig_n2)./(.78.*M_n2);

% determine n2signal at hox times

n2_x1=NaN.*ones(size(time_hox));
n2_x2=n2_x1;

% for each hox point, find four nearest n2 points and linearly interpolate
%       to estimate n2signal at time_hox
for i=1:length(time_hox); 
	[k,l]=sort(abs(time_n2-time_hox(i)));
	j1=polyfit(time_n2(l(1:4)),n2sig1(l(1:4)),1);
	j2=polyfit(time_n2(l(1:4)),n2sig2(l(1:4)),1);
	n2_x1(i)=polyval(j1,time_hox(i));
	n2_x2(i)=polyval(j2,time_hox(i));
end
%
% make a less noisy representation of the background for axis 1
% skip this for now (10/95)
%if day==9434|9524|9528
%	sx1sig_hoxf=sx1sig_hox;
%	dx1sig_hoxf=dx1sig_hox;
%else
	sx1sig_hoxf=nmedianf(sx1sig_hox,20);
	dx1sig_hoxf=dx1sig_hox+sx1sig_hox-sx1sig_hoxf;
if day==9990  %on this sunset flight, the scatter changed by 
		%approximately .9 sturdleys from the offline 
		%to the online position.
	dx1sig_hoxf=dx1sig_hoxf-.9;
end
%end
% determine wavelength detuning;
%   The assumption is made that the line tracking program is not biased to
%       one side or the other of the true oine center. By running a median filter 
%       through the data we hope to capture the true online position and then calculate a 
%       difference for each point.
%
trueo=nmedianf(etnps_hox,40);
trueon=meanf(trueo,40);
clear trueo
del_hox=etnps_hox-trueon;
%
% calculate change in pumping rate due to pressure broadening and 
%       not being perfectly on line.  .00125 is the number of wavenubers
%       per step and will change if a different etalon, or etalon order 
%       is used.  This number new to polaris.

corr_hox=NaN.*ones(size(time_hox));
corr_hox=overlap(temp_hox,(press_hox),-del_hox.*(.00125),linewidth)';
i=find(abs(del_hox)>30);
if length(i)>0
	corr_hox(i)=NaN.*(i);
end
%if (fltday=='951020')
%
%  Correct the calibration for the fluorescence that falls outside the
%       adjust. gate but inside the fixed gate.  This was determined from 
%       the data of 951020.  Also includes correction for
%       the 2 percent increase in the N2 raman signal
%
%        gatecorr_hox=1-exp(-13../(Q_hox.*700))-.025;
%        gatecorr_oh=1-exp(-13../(Q_oh.*700))-.025;
%
%else
%  After the first strat flight, the gate delays were changed
%  to decrease gatecorr - N2 signal is only .5% greater in
%   fixed gate than in adjustible gate.
	
if day < 9600    % this is for Feb 1996 STRAT flights


	gatecorr_hox_x1=1-exp(-25../(Q_hox.*700))-.007;
	gatecorr_hox_x2=gatecorr_hox_x1;
	gatecorr_oh_x1=1-exp(-25../(Q_oh.*700))-.007;
	gatecorr_oh_x2=gatecorr_oh_x1;

elseif day<9900  % this is for July/Aug 1996b STRAT flts (average from 960722 & 960808)
	gatecorr_hox_x1=1-exp(-27./(Q_hox.*700))+.000;
	gatecorr_hox_x2=1-exp(-20./(Q_hox.*700))+.006;
	gatecorr_oh_x1=1-exp(-27./(Q_oh.*700))+.000;
	gatecorr_oh_x2=1-exp(-20./(Q_oh.*700))+.006;

else  % this is for begining POLARIS flights - using "fixed" gate

	gatecorr_hox_x1=ones(size(Q_hox));
	gatecorr_hox_x2=gatecorr_hox_x1;
	gatecorr_oh_x1=ones(size(Q_oh));
	gatecorr_oh_x2=gatecorr_oh_x1;

end
%
%
% calculate OH
%
coh1=c1_hox.*n2_x1.*gatecorr_hox_x1.*Nj_hox;
coh2=c2_hox.*n2_x2.*gatecorr_hox_x2.*Nj_hox;
Qc1=Q_hox.*coh1.*M_hox;
Qc2=Q_hox.*coh2.*M_hox;
OH=dx1sig_hoxf./(corr_hox.*Qc1);
HOx=dx2sig_hox./(corr_hox.*Qc2);
%
% calculate OH for both axes when NO is off
%
for i=1:length(time_oh)
	[l,k]=min(abs(time_hox-time_oh(i)));
	n2_x1oh(i)=n2_x1(k);
	n2_x2oh(i)=n2_x2(k);
	del_oh(i)=etnps_oh(i)-trueon(k);
end
corr_oh=overlap(temp_oh,(press_oh),-del_oh.*(.00125),linewidth)';
i=find(abs(del_oh)>30);
if length(i)>0
	corr_oh(i)=NaN.*(i);
end

coh1_oh=c1_oh.*n2_x1oh'.*gatecorr_oh_x1.*Nj_oh;
coh2_oh=c2_oh.*n2_x2oh'.*gatecorr_oh_x2.*Nj_oh;
Qc1_oh=Q_oh.*coh1_oh.*M_oh;
Qc2_oh=Q_oh.*coh2_oh.*M_oh;
OH_x1=dx1sig_oh./(corr_oh.*Qc1_oh);
OH_x2=dx2sig_oh./(corr_oh.*Qc2_oh);
%
% calculate HO2
%
x1sig=[dx1sig_no1 dx1sig_no2 dx1sig_no3 dx1sig_no4 dx1sig_no5 dx1sig_no6];
x2sig=[dx2sig_no1 dx2sig_no2 dx2sig_no3 dx2sig_no4 dx2sig_no5 dx2sig_no6];       
[topsig1,topflow1]=max(x1sig');
[topsig2,topflow2]=max(x2sig');
% HO2 back axis
%
x1sigb=[dx1sig_no1b dx1sig_no2b dx1sig_no3b dx1sig_no4b dx1sig_no5b dx1sig_no6b];
x2sigb=[dx2sig_no1b dx2sig_no2b dx2sig_no3b dx2sig_no4b dx2sig_no5b dx2sig_no6b];       
[topsig1b,topflow1b]=max(x1sigb');
[topsig2b,topflow2b]=max(x2sigb');

clear dx1sig_no1 dx1sig_no2 dx1sig_no3 dx1sig_no4 dx1sig_no5 dx1sig_no6
clear dx2sig_no1 dx2sig_no2 dx2sig_no3 dx2sig_no4 dx2sig_no5 dx2sig_no6
clear sx1sig_no1 sx1sig_no2 sx1sig_no3 sx1sig_no4 sx1sig_no5 sx1sig_no6
clear sx2sig_no1 sx2sig_no2 sx2sig_no3 sx2sig_no4 sx2sig_no5 sx2sig_no6
clear dx1sig_no1b dx1sig_no2b dx1sig_no3b dx1sig_no4b dx1sig_no5b dx1sig_no6b
clear dx2sig_no1b dx2sig_no2b dx2sig_no3b dx2sig_no4b dx2sig_no5b dx2sig_no6b
clear sx1sig_no1b sx1sig_no2b sx1sig_no3b sx1sig_no4b sx1sig_no5b sx1sig_no6b
clear sx2sig_no1b sx2sig_no2b sx2sig_no3b sx2sig_no4b sx2sig_no5b sx2sig_no6b
%
% 
% determine hox times closest to HO2 scans
iho2time=NaN.*ones(size(time_ho2));
j=1;
k2=1;
mm=find(isnan(dx2sig_hox)==0);
for i=1:length(time_ho2);
	[k1,k2]=min(abs(time_ho2(i)-time_hox(mm)));
	iho2time(i)=mm(k2);
	iho2mis(i)=k1;
end 
del_ho2=etnps_no-trueon(iho2time);
del_ho2b=etnps_nob-trueon(iho2time);
%save god3_2
i=find(isnan(temp_ho2+press_ho2+del_ho2)==0);   
corr_ho2=NaN.*ones(size(temp_ho2));
corr_ho2b=NaN.*ones(size(temp_ho2));
corr_ho2(i)=overlap(temp_ho2(i),(press_ho2(i)),-del_ho2(i).*(.00125),linewidth)';
corr_ho2b(i)=overlap(temp_ho2b(i),(press_ho2b(i)),-del_ho2b(i).*(.00125),linewidth)'; 
titrate_x2=topsig2./(corr_ho2.*Qc2(iho2time))';
titrate_x1=topsig1./(corr_ho2.*Qc1(iho2time))';
titrate_x2b=topsig2b./(corr_ho2b.*Qc2(iho2time))';
titrate_x1b=topsig1b./(corr_ho2b.*Qc1(iho2time))';
diff_hox=titrate_x2./HOx(iho2time)';
diff_hoxb=titrate_x2b./HOx(iho2time)';
i=find(isnan(diff_hox)==0);
diff_hoxf=diff_hox;
diff_hoxfb=diff_hoxb;
% 970626 use weaker filter to avoid washing out fast velocity changes
if fltday=='970626'
   diff_hoxf=titrate_x2./HOx(iho2time)';
   diff_hoxfb=titrate_x1./HOx(iho2time)';
else
   diff_hoxf(i)=nmedianf(diff_hox(i)',5);
   diff_hoxfb(i)=nmedianf(diff_hoxb(i)',5);
end
%
% determine the kinetic correction at hox times
%
j=0;
kcorr=NaN.*ones(size(time_hox));
for i=1:length(time_ho2)-2
	while(time_hox(j+1)<time_ho2(i+1)&time_hox(j+1)<time_ho2(length(time_ho2)))
	    kcorr(j+1)=diff_hoxf(i+1);
	    j=j+1;
	end
end
% 
% On 960201, strong evidence for cl atom contamination during
%  the titration.  For now use an empirical kcorr for the period
% in question. 
if day==9527
	kcorr(2800:4500)=.35+vel_hox(2800:4500)/7000;
end
% On 970509 night time.  Set kcorr to 1.15
if day==9990
	kcorr(3000:5000)=1.15.*ones(size(3000:5000));
end
HOxf=HOx.*kcorr;
% determine the kinetic correction for back titrations at hox times
%
j=0;
kcorrb=NaN.*ones(size(time_hox));
for i=1:length(time_ho2)-2
	while(time_hox(j+1)<time_ho2(i+1)&time_hox(j+1)<time_ho2(length(time_ho2)))
	    kcorrb(j+1)=diff_hoxfb(i+1);
	    j=j+1;
	end
end
HOxfb=HOx.*kcorrb;

% now place axis 1 and axis 2 on common calibration by using times when
%  OH and HO2 are being measured simultaneously at both axis

cal_diff=OH_x1./OH_x2;
i=find(dx1sig_oh<20&dx2sig_oh<20);

if (isempty(i)==0)
	cal_diff(i)=ones(size(i));
end

% use HO2 titrations to increase the signal to noise of this difference
%   .. but only when peak signal is not at highest (or lowest) NO flow
% also don't use when chlorine atoms present during flight of 960201
i=find(topflow1~=6&topflow2~=6&topflow1~=1&topflow2~=1&topsig1>100&topsig2>100);


cal_diff(i)=titrate_x1(i)./titrate_x2(i);
% median filter
cal_diff_f=cal_diff;
i=find(isnan(cal_diff)==0);
cal_diff_f(i)=nmedianf(cal_diff(i),3);

if day==9527  % set the high clo area cal_diff to 1.0
      cal_diff_f(70:130)=cal_diff_f(70:130)./cal_diff_f(70:130);
end
% apply correction to OH and HO2 data.
cal_diff_hox=NaN.*time_hox;
HOxc=HOxf;
OHc=OH;
for i=1:length(time_hox);
	[k,l]=sort(abs(time_ho2-time_hox(i)));
	p=find(isnan(cal_diff_f(l))==0);
	j=polyfit(time_ho2(l(1:4)),cal_diff_f(l(p(1:4))),1);
	cal_diff_hox(i)=polyval(j,time_hox(i));
	HOxc(i)=HOxf(i).*(1+cal_diff_hox(i))./2;
	OHc(i)=OH(i).*(1+(1../cal_diff_hox(i)))./2;
end

HO2=NaN.*OHc;
for i=1:length(OHc);
	if (isnan(OHc(i)./HOxc(i))==0)
		rat=1.3.*((HOxc(i)-OHc(i))./OHc(i));
		ratnext=.10;
		while (abs(rat-ratnext)./rat>.1)
			ratnext=rat;
			conv=ho2conv(temp_hox(i),M_hox(i),rat);
			hox=HOxc(i)./conv; 
			HO2(i)=hox-OHc(i);
			rat=HO2(i)./OHc(i);
		end
	end
end
clear conv hox i iho2mis iho2time j j1 j2 k k1 k2 l mm ocluv0 p rat ratnext
clear uvmon0 x1dist x2dist x3dist x1las0 x2las0 
