% nuwave.m
%   matlab file to take the place of wave.bat routine for HOX
%   data analysis
%  1. take start time of the flight, correct for TDrft 
%  2. sps2mat run on unix side to create one big 'ol file.
%       copy to dos as nwave1.mat and nwave4.mat
%  3. Break this file up and plot in 15:00 minute intervals
%   
%   plots waveforms from the detection axis
%
%   may 1996 by Eric Lanzendorf
%   Comparison of oclsig corrected by uvmon instead of ocluv
%	 added for 6/97 deployment of polaris

!del wave.ps
fltday = input('enter fltday = ');
save flight;

load jumbo Time TDrft;
timenv=Time; clear Time;
load sigwave;load ohcellwv;load preswave; 
load zero;
load flight;     
timenv=time2d(timenv);

     hour=fix(timenv(1)./(60*60));
     min=fix((timenv(1)-hour*60*60)./60);
     sec=timenv(1)-hour*60*60-min*60;


toff=median(TDrft);
Time=time2d(Time)-toff;
     stop=length(Time)-1;
Time1=Time(1);
 
timepres=time2d(timepres)-toff;
timeohcl=time2d(timeohcl)-toff;

ocluv=OClUV-ocluv0;
uv=UVMon-uvmon0;
%vel=velocity(SD__P-sd__p0,SD_DP-sd_dp0,SAFB1);
%vel=real(vel);
l=find(x2sig > 800);
x2sig(l)= NaN*ones(size(l));

m=find(x1sig > 800);
x1sig(m)= NaN*ones(size(m));

%deltat=200*(SAFB1-PAFF1+6);
orient tall
     start=1;
     inc=3600;
     k=1;
     page=1;
while (start+inc <= stop);

%g=find(deltat > 1000); deltat(g)=NaN.*ones(1:length(g)); clear g;

subplot(4,1,k);
plot(Time(start:(start+inc)),x2sig(start:(start+inc)),Time(start:(start+inc)),x1sig(start:(start+inc)),'--')
%,timepres(start:(start+(inc/4))),100*(SD__P(start:(start+(inc/4)))-sd__p0),':'
%axis([Time(start) Time(start+inc) 0 1000])

ylabel('x1sig;x2sig;P(torr)');
xlabel('GMT (sec)');
if k==1
 title([int2str(fltday)]);
end
% text(.1,.9,'._._. = 10*velocity (m/s)','sc')
% text(.6,.9,' . . . . = 200*(SAFB1-PAFF1+6)','sc')

%The following line can be used to compare oclsig corrected by uvmon instead of corrected by ocluv
%subplot(4,1,(k+1)),plot(timeohcl(start:(start+inc)),oclsig(start:(start+inc)).*(ocluv(start:(start+inc))./uv(start:(start+inc))))

subplot(4,1,(k+1)),plot(timeohcl(start:(start+inc)),oclsig(start:(start+inc)))
ylabel('OHCell/uv')
xlabel('GMT (sec)')


if k==3 & page==1
 print wave -dpsc2;
 page=page+1;
 k=1;
 elseif k==3
 page=page+1;
 print wave -dpsc2 -append;
 k=1;
else k==1
% title([int2str(fltday)]);
 k=k+2;
end

   start=start+inc;
   pause(5);
end

subplot(4,1,k);
plot(Time(start:stop),x2sig(start:stop),Time(start:stop),x1sig(start:stop))
ylabel('x1sig;x2sig;P(torr)');
xlabel('GMT (sec)');

subplot(4,1,(k+1)),plot(timeohcl(start:stop),oclsig(start:stop))
ylabel('OHCell/uv')
xlabel('GMT (sec)')
print wave -dpsc2 -append;
%!copy /b wave.ps lpt1:
%!copy wave.ps c:\spool\fldprn2
%!nprint wave.ps