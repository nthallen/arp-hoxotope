l=['Flight   ' fltday];
mintime=min(time_hox)/1000;
maxtime=max(time_hox)/1000;
axis([mintime maxtime min(temp_hox)-5 250])
plot(time_hox/1000,temp_hox)
xlabel('Time (K sec)')
ylabel('Temp (K)')
title(l)
pause
axis([mintime maxtime 0 100])
plot(time_hox/1000,vel_hox/100)
xlabel('Time (K sec)')
ylabel('Velocity (m/s)')
title(l)
pause
axis([mintime maxtime 0 300])
plot(time_hox/1000,sx1sig_hox,'.',time_hox/1000,sx2sig_hox+100,'.',time_hox/1000,sx1sig_hoxf)
xlabel('Time (K sec)')
ylabel('Laser Bkgnd Axis 1; Bkgnd+100 Axis 2')
title(l)
pause
axis([mintime maxtime min([min(n2sig1) min(n2sig2)]) max([max(n2sig1) max(n2sig2)])])
plot(time_n2/1000,n2sig1,'*',time_hox/1000,n2_x1,time_n2/1000,n2sig2,'+',time_hox/1000,n2_x2)
xlabel('Time (K sec)')
ylabel('N2 Raman signal: * = Axis 1; + = Axis 2')
title(l)
pause
axis([mintime maxtime min(etnps_hox) max(etnps_hox)])
plot(time_hox/1000,etnps_hox,'.',time_hox/1000,trueon)
xlabel('Time (K sec)')
ylabel('Etalon Position; est. line position')
title(l)
pause
axis([mintime maxtime .4 1.0])
plot(time_hox/1000,corr_hox);
xlabel('Time (K sec)')
ylabel('Excit Rate (Flt) / Excit Rate (Lab)')
title(l)
pause
axis([mintime maxtime 0.7 1.3])
plot(time_oh/1000, OH_x1./OH_x2,'*',time_ho2/1000, titrate_x1./titrate_x2)
xlabel('Time (K sec)')
ylabel('OH_x1./OH_x2 *; HOx_x1./HOx_x2')
title(l)
pause
axis([mintime maxtime 0.7 1.6])
plot(time_hox/1000,kcorr)
xlabel('Time (Ksec)')
ylabel('HOx Back Inj / HOx Front Inj')
title(l)
pause
axis([mintime maxtime 0 6])
stairs(time_ho2/1000,topflow1)
pause
stairs(time_ho2/1000,topflow2)
