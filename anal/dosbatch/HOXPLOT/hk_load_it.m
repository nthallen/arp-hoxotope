% LOAD_IT.m, adapted from Rick Stimpfle's housekeeping selecting routine select_d1.m
% Created 10/1/1999
% Selects and loads data. >> Careful of mixing data of different rates. <<
% Some room for data manipulation.
% Centigrade temperatures should be converted to Kelvin to avoid negative features.
%      >> only a problem if you use ylimscale=1 <<

selectx=0;
% if you want to plot a specific time range,set flag and limits, un-comment line
% selectx=1; tstart=70000; tstop=71000;

% default values for optional switches
ylimscale=1;
nogrid=1;
y1flag=1;y2flag=1;y3flag=1;y4flag=1;y5flag=1;y6flag=1;y7flag=1;y8flag=1;
force_ys=0;

 
%1     Secondary Duct Absolute & Differential Pressures
if plot1==0;
load jumbo SD__P NoseP SD_DP STVPs SVPos SDP_T Time;
t=t_to_t(Time); clear Time;
x=t;
y1=SD__P;		label1='SD  P'; 	ymin(1)=0; ymax(1)=760;
y2=NoseP;		label2='NoseP'; 	ymin(2)=0; ymax(2)=10;
y3=SD_DP; 		label3='SD DP'; 	ymin(3)=0; ymax(3)=10;
y4=[]; 			label4=' '; 		ymin(4)=-1; ymax(4)=1; 
y5=STVPs./1e4; label5='STVPs x10^4'; ymin(5)=0; ymax(5)=6.5;
y6=SVPos; 		label6='SVPos';	ymin(6)=0; ymax(6)=6.5;
y7=SDP_T; 		label7='SDP T';	ymin(7)=24; ymax(7)=26;
y8=[];			label8=' ';			ymin(8)=-1; ymax(8)=1;
end;

%2     Nav. Data: Altitude, Latitude, Longitude, 'True-air Speed', Time Drift
if plot2==0;
load jumbo Alttd NoseP Lattd Lngtd TASpd TDrft Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=Alttd./1e4;	label1='Alttd x10^4'; ymin(1)=0; ymax(1)=7;
y2=[]; 			label2=' ';			ymin(2)=-1; ymax(2)=1;
y3=Lattd; 		label3='Lattd';	ymin(3)=min(y3); ymax(3)=max(y3);
y4=Lngtd; 		label4='Lngtd';	ymin(4)=min(y4); ymax(4)=max(y4);
y5=TDrft; 		label5='TDrft';	ymin(5)=-1; ymax(5)=1;
y6=TASpd; 		label6='AirSpd';	ymin(6)=0; ymax(6)=max(y6);
y7=NoseP; 		label7='NoseP';	ymin(7)=0; ymax(7)=10;
y8=[];			label8=' ';			ymin(8)=-1; ymax(8)=1;
end;

%3     Secondary Duct Thermister Ring Data (front)
if plot3==0;
load jumbo SAFF1 SAFF2 SAFF3 SAFF4 Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=SAFF1;	 	label1='SAFF1'; 	ymin(1)=200; ymax(1)=300;
y2=[]; 	 		label2=' ';			ymin(2)=-1; ymax(2)=1;
y3=SAFF2; 		label3='SAFF2';	ymin(3)=200; ymax(3)=300;
y4=[]; 			label4=' ';			ymin(4)=-1; ymax(4)=1;
y5=SAFF3; 		label5='SAFF3';	ymin(5)=200; ymax(5)=300;
y6=[]; 			label6=' ';			ymin(6)=-1; ymax(6)=1;
y7=SAFF4; 		label7='SAFF4';	ymin(7)=200; ymax(7)=300;
y8=[];			label8=' ';			ymin(8)=-1; ymax(8)=1; 
end;

%4     Secondary Duct Thermister Ring Data (back)
if plot4==0;
load jumbo SAFB1 SAFB2 SAFB3 SAFB4 SAFB5 SAFB6 SAFB7 Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=SAFB1;	 	label1='SAFB1'; 	ymin(1)=200; ymax(1)=300;
y2=SAFB2; 		label2='SAFB2 ';	ymin(2)=200; ymax(2)=300;
y3=SAFB3; 		label3='SAFB3';	ymin(3)=200; ymax(3)=300;
y4=SAFB4; 		label4='SAFB4 ';	ymin(4)=200; ymax(4)=300;
y5=SAFB5; 		label5='SAFB5';	ymin(5)=200; ymax(5)=300;
y6=SAFB6; 		label6='SAFB6 ';	ymin(6)=200; ymax(6)=300;
y7=SAFB7; 		label7='SAFB7';	ymin(7)=200; ymax(7)=300;
y8=[];			label8=' ';			ymin(8)=-1; ymax(8)=1; 
end;

%5     Detection Axes: X1, X2, UVMon, Absolute Counts & Ratios
if plot5==0;
load jumbo XL_TP X2Las UVMon Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=XL_TP; 		label1='XL TP';	ymin(1)=0; ymax(1)=8;
y2=X2Las; 		label2='X2Las';	ymin(2)=0; ymax(2)=1.3;
y3=UVMon; 		label3='UVMon';	ymin(3)=0; ymax(3)=4.5;
y4=[];			label4=' ';			ymin(4)=-1; ymax(4)=1; 
y5=UVMon./XL_TP; label5='UVMon/XL TP 0.5 good'; ymin(5)=0; ymax(5)=3;
y6=UVMon./X2Las; label6='UVMon/X2Las 3.0 good'; ymin(6)=0; ymax(6)=4;
y7=XL_TP./X2Las; label7='XL TP./X2Las 6.0 good'; ymin(7)=0; ymax(7)=8;
y8=[];			label8=' ';			ymin(8)=-1; ymax(8)=1;  
end;

%6     Detection Axes Diagnostics Temperatures and Voltages
if plot6==0;
load jumbo X1DAT X2DAT X1FAT X2FAT X1_HV X2_HV Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=X1DAT;	label1='X1DAT';		ymin(1)=5; ymax(1)=20; 
y2=X2DAT; 	label2='X2DAT';		ymin(2)=5;	ymax(2)=20;
y3=X1FAT; 	label3='X1FAT';		ymin(3)=15;	ymax(3)=25;
y4=X2FAT; 	label4='X2FAT';		ymin(4)=15;	ymax(4)=25;
y5=X1_HV; 	label5='X1 HV';		ymin(5)=1.8; ymax(5)=1.82;
y6=X2_HV; 	label6='X2 HV';		ymin(6)=1.8; ymax(6)=1.82;
y7=[]; 		label7=' ';				ymin(7)=-1; ymax(7)=1;
y8=[];		label8=' ';				ymin(8)=-1; ymax(8)=1;
end;

%7     Gas Addition System Pressures & Temperatures
if plot7==0;
load jumbo AirHP AirLP NO_HP NO_LP A_RgT NORgT NOFlT SolDT Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=AirHP; 	label1='AirHP';		ymin(1)=0; ymax(1)=2.5;
y2=AirLP; 	label2='AirLP';		ymin(2)=0; ymax(2)=5;
y3=NO_HP; 	label3='NO HP';		ymin(3)=0; ymax(3)=8;
y4=NO_LP; 	label4='NO LP';		ymin(4)=0; ymax(4)=2;
y5=A_RgT; 	label5='AirRgT';		ymin(5)=0; ymax(5)=15;
y6=NORgT;	label6='NORgT';		ymin(6)=10; ymax(6)=20;
y7=NOFlT;	label7='NOFlT';		ymin(7)=5; ymax(7)=20;
y8=SolDT;	label8='SolDT';		ymin(8)=20; ymax(8)=60;
end;

%8     Indexers: Attenuator, Etalon, Bellows & Dye Laser Pressure
if plot8==0;
load jumbo AtPos AtnPs EtPos EtnPs BAPos BlwPs DLH_P Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=AtPos; 	label1='AtPos';		ymin(1)=5.5; ymax(1)=6.5;
y2=AtnPs; 	label2='AtnPs';		ymin(2)=0; ymax(2)=6000;
y3=EtPos; 	label3='EtPos';		ymin(3)=2; ymax(3)=4;
y4=EtnPs./10000; label4='EtnPs x10^4';	ymin(4)=2; ymax(4)=4;
y5=BAPos; 	label5='BAPos';		ymin(5)=2; ymax(5)=8;
y6=BlwPs./10000; 	label6='BlwPs x10^4'; ymin(6)=0; ymax(6)=6;
y7=DLH_P; 	label7='DLH P';		ymin(7)=4.9; ymax(7)=5.4;
y8=[];		label8=' ';				ymin(8)=-1; ymax(8)=1;
end;

%9     Power Diagnostics
if plot9==0;
load jumbo V28_V V28I1 V28I2 V300I HD__T ICC_T PC__T PS__T Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=V28_V-28; label1='V28 V-28';	ymin(1)=-0.4; ymax(1)=1.4;
y2=V300I; 	label2='V300I';		ymin(2)=-0.4; ymax(2)=1.4;
y3=V28I1; 	label3='V28I1';		ymin(3)=0; ymax(3)=25;
y4=V28I2; 	label4='V28I2';		ymin(4)=0; ymax(4)=25;
y5=HD__T; 	label5='HD T';			ymin(5)=0; ymax(5)=30;
y6=ICC_T; 	label6='ICC T';		ymin(6)=0; ymax(6)=30;
y7=PC__T; 	label7='PC T';			ymin(7)=0; ymax(7)=30;
y8=PS__T;	label8='PS T';			ymin(8)=-5; ymax(8)=5;
end;

%10     Dye Laser Diagnostics
if plot10==0;
load jumbo UVMon DHx1T DHx2T DLH1T DLH2T DLooT DRs_T Time;
t=t_to_t(Time); clear Time;
x=t;
y1=UVMon;	label1='UVMon';		ymin(1)=0; ymax(1)=4.5;
y2=[]; 		label2=' ';				ymin(2)=-1; ymax(2)=1;
y3=DHx1T; 	label3='DHx1T';		ymin(3)=-7; ymax(3)=10;
y4=DHx2T; 	label4='DHx2T';		ymin(4)=10; ymax(4)=35;
y5=DLH1T; 	label5='DLH1T';		ymin(5)=20; ymax(5)=28;
y6=DLH2T; 	label6='DLH2T';		ymin(6)=20; ymax(6)=28;
y7=DLooT; 	label7='DLooT';		ymin(7)=18; ymax(7)=26;
y8=DRs_T;	label8='DRs T';		ymin(8)=18; ymax(8)=26;
end;

%11     Topaz Diagnostics 1 
if plot11==0;
load jumbo DL_TP LSD1T LSD2T lHx1T LHx2T KDP_H RKDPTSP Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=DL_TP;	label1='DL TP/(4*4095)'; ymin(1)=0; ymax(1)=4.5;
y2=[];		label2=' ';				ymin(2)=-1; ymax(2)=1;
y3=LSD1T;	label3='LSD1T';		ymin(3)=0; ymax(3)=45;
y4=LSD2T;	label4='LSD2T';		ymin(4)=0; ymax(4)=45;
y5=lHx1T;	label5='LHx1T';		ymin(5)=-50; ymax(5)=0;
y6=LHx2T; 	label6='LHx2T';		ymin(6)=10; ymax(6)=50;
y7=KDP_H; 	label7='KDP H';		ymin(7)=0; ymax(7)=10;
y8=RKDPTSP; label8='RKDPTSP'; 	ymin(8)=0; ymax(8)=2500;
end;

%12     Topaz Diagnostics 2
if plot12==0;
load jumbo RLSD1T LSD1T RLSD2T LSD2T RLSD1TSP RLSD2TSP TopazSecs RepRtSP Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=RLSD1T; 	label1='RLSD1T';		ymin(1)=0; ymax(1)=45;
y2=LSD1T; 	label2='LSD1T';		ymin(2)=0; ymax(2)=45;
y3=RLSD2T; 	label3='RLSD2T';		ymin(3)=0; ymax(3)=45;
y4=LSD2T; 	label4='LSD2T';		ymin(4)=0; ymax(4)=45;
y5=RLSD1TSP; label5='RLSD1TSP';	 ymin(5)=20; ymax(5)=30;
y6=RLSD2TSP; label6='RLSD2TSP'; 	ymin(6)=20; ymax(6)=30;
y7=TopazSecs; label7='TopazSecs'; ymin(7)=0; ymax(7)=10;
y8=RepRtSP;	label8='RepRtSP';		ymin(8)=9500; ymax(8)=10500;
end;

%13     Topaz Diagnostics 3
if plot13==0;
load jumbo DTE_I DTETV LTE_I LTETV COutT CIn_T Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=DTE_I; 	label1='DTE I';		ymin(1)=0; ymax(1)=5;
y2=DTETV;	label2='DTETV';		ymin(2)=0; ymax(2)=5;
y3=LTE_I;	label3='LTE I';		ymin(3)=0; ymax(3)=20;
y4=LTETV;	label4='LTETV';		ymin(4)=0; ymax(4)=2;
y5=COutT;	label5='COutT';		ymin(5)=15; ymax(5)=35;
y6=CIn_T;	label6='CIn T';		ymin(6)=15; ymax(6)=25;
y7=[];		label7=' ';				ymin(7)=-1; ymax(7)=1;
y8=[];		label8=' ';				ymin(8)=-1; ymax(8)=1;
end;

%14     OH Cell Diagnostics
if plot14==0;
load jumbo OHCHT OHC2T OClHV OHCLI Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=OHCHT; 	label1='OHCHT';		ymin(1)=10; ymax(1)=25;
y2=[];		label2=' ';				ymin(2)=-1; ymax(2)=1;
y3=OHC2T;	label3='OHC2T';		ymin(3)=0; ymax(3)=50;
y4=[];		label4=' ';				ymin(4)=-1; ymax(4)=1;
y5=OClHV;	label5='OClHV';		ymin(5)=1.5; ymax(5)=2;
y6=[];		label6=' ';				ymin(6)=-1; ymax(6)=1;
y7=OHCLI;	label7='OHCLI';		ymin(7)=2; ymax(7)=4;
y8=[];		label8=' ';				ymin(8)=-1; ymax(8)=1;
end;

%15     Laser Performance Diagnostics
if plot15==0;
load jumbo UVMon DL_TP BlwPs DLH_P AtnPs EtnPs LMP_T Time;
t=t_to_t(Time); clear Time;
x=t; 
y1=UVMon; 	label1='UVMon';		ymin(1)=0; ymax(1)=4.5;
y2=DL_TP; 	label2='DL TP';		ymin(2)=0; ymax(2)=4.5;
y3=BlwPs./10000; 	label3='BlwPs x10^4'; ymin(3)=0; ymax(3)=6;
y4=DLH_P; 	label4='DLH P';		ymin(4)=4.9; ymax(4)=5.4;
y5=AtnPs; 	label5='AtnPs';		ymin(5)=0; ymax(5)=6000;
y6=EtnPs./10000; label6='EtnPs x10^4';	ymin(6)=2; ymax(6)=4;
y7=LMP_T; 	label7='LMP T';		ymin(7)=20; ymax(7)=22;
y8=[];		label8=[];				ymin(8)=-1; ymax(8)=1;
end;

%////////////////////////////////////////////////// DONE DONE DONE DONE DONE !!!!
%cd c:\rick\solve\matlab\flt_extract

if isempty(y8); y8=x*nan; y8flag=0; end;
if isempty(y7); y7=x*nan; y7flag=0; end;
if isempty(y6); y6=x*nan; y6flag=0; end;
if isempty(y5); y5=x*nan; y5flag=0; end;
if isempty(y4); y4=x*nan; y4flag=0; end;
if isempty(y3); y3=x*nan; y3flag=0; end;
if isempty(y2); y2=x*nan; y2flag=0; end;
if isempty(y1); y1=x*nan; y1flag=0; end;


if exist('label8')==0; label8='no data'; end;
if exist('label7')==0; label7='no data'; end;
if exist('label6')==0; label6='no data'; end;
if exist('label5')==0; label5='no data'; end;
if exist('label4')==0; label4='no data'; end;
if exist('label3')==0; label3='no data'; end;
if exist('label2')==0; label2='no data'; end;
if exist('label1')==0; label1='no data'; end;


%option to change x range

if selectx==1;
it = find (x>=tstart & x<=tstop);

x=x(it);
y1=y1(it);
y2=y2(it);
y3=y3(it);
y4=y4(it);
y5=y5(it);
y6=y6(it);
y7=y7(it);
y8=y8(it);

end




