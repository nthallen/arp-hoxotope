% prntwv.m
% take start time of the flight correct for TDrft 
% and write a batch file
% to run waveform at 15:00 minute intervals
    
%     !del wavef.bat
     load nav;
     timenv=time2d(timenv);
     stop=15.*(timenv(length(timenv))-timenv(1))/900; 
     hour=fix(timenv(1)./(60*60));
     min=fix((timenv(1)-hour*60*60)./60);
     sec=timenv(1)-hour*60*60-min*60;
     houre=fix(timenv(1)./(60*60));
     mine=fix((timenv(1)-hour*60*60)./60);
     sece=timenv(1)-hour*60*60-min*60;
     start=5;
     while (start+30 <= stop)
        lbl=['call \\strat\\batch\\wave\\waveform ',int2str(hour),':', ...
        int2str(min+start),':',int2str(sec),...
        ' ',int2str(hour),':',int2str(min+start+15),':',int2str(sec)...
            ' ',int2str(hour),':',int2str(min+start+30),':',int2str(sec)];
     fprintf('wavef.bat',lbl)
     fprintf('wavef.bat','\n')
     start=start+30;
     end
     lbl=['call \\strat\\batch\\wave\\waveform ', int2str(hour),':', ...
     int2str(min+start),':',int2str(sec),' ',int2str(hour),':',...
     int2str(min+start+(stop-start)./2),':',int2str(sec)...
     ' ',int2str(hour),':',int2str(min+stop),':',int2str(sec)];
     fprintf('wavef.bat',lbl)
     fprintf('wavef.bat','\n')
%     fprintf('wavef.bat','call remat 00:00:00 48:00:00 \n')
     quit                                                              
 
   
