% HOUSEKEEP.m, adapted from Rick Stimpfle's housekeeping routine step_thru1.m
% Created 10/1/1999

cls
fltdate=input('Inupt the Flight date without the subscript  -  ');
save fltdate;
%cd d:\970506.2

for I=[1:15];  % customize loop definition to get what you want 
%for I=[4 5];
load fltdate
fltdate_str=int2str(fltdate);

plot1=1;  
plot2=1;  
plot3=1;  
plot4=1;  
plot5=1;  
plot6=1;  
plot7=1;  
plot8=1;  
plot9=1;  
plot10=1; 
plot11=1; 
plot12=1; 
plot13=1; 
plot14=1; 
plot15=1; 

eval(['plot',int2str(I),'=0;'])

HK_LOAD_IT
HK_PLOT_IT

%print    %place a print option here
%print -dwin 
print pltHSKP -dps2 -append;
pause(5)
%pause
clear    % un-comment this clear if you are actually stepping everything and
         % don't need to look at background diagnostics
end;
        

