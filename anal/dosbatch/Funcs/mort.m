% MORT brings up the Mortage GUI. The user inputs the amount
% of mortgage, the interest rate and the amount of time 
% for the loan to be payed back. The monthly payment value and
% the total amount to be paid back, at that interest level and
% amortization period, will be printed in the MATLAB window.
% The GUI then plots the interest and principal curves that shows
% how much of each month's payments goes to the interest and how
% much of it goes to paying back the actual loan.  
%
% Try a couple of different scenarios and see how much of a different
% a little percentage rate change and loan amount can have an affect
% on the over all loan payments.
%
%
% 	Yama Habibzai
%	The Mathworks Inc.
%	yama@mathworks.com
%	http://www.mathworks.com
%     
% note: This GUI and its functions are not supported by the 
% 	Mathworks Inc. Use it at your own risk.
%
%

fig = figure('Name', 'Mortgage Calculator',... 
      'NumberTitle', 'off');
set(gcf, 'DefaultAxesPosition', [.1 .1 .55 .8]);
figcolor = get(gcf, 'color');
uicontrol(gcf,'Style', 'text','units','normal',...
'position', [.675 .85 .27 .05],'string', 'Loan amount($): ',...
'foregroundcolor', 'black','backgroundcolor', figcolor);

uicontrol(gcf,'style', 'text','units','normal',...
'position', [.675 .74 .27 .05],'string', 'Interest Rate(%): ',...
'foregroundcolor', 'black','backgroundcolor', figcolor);

uicontrol(gcf,'style', 'text','units','normal',...
'position', [.699 .635 .27 .05],'string', 'Amortization(years): ',...
'foregroundcolor', 'black','backgroundcolor', figcolor);

principle = uicontrol(gcf,'style', 'edit',...
'units', 'normal','position', [.7 .8 .23 .05]);

call = ['loan = str2num(get(gco, ''string''));'];
set(principle, 'callBack', call);

percent = uicontrol(gcf,'style', 'edit',...
'units', 'normal','position', [.7 .691 .23 .05]);

call2 = ['interest = str2num(get(gco, ''string''));'];
set(percent, 'callBack', call2);

years = uicontrol(gcf,'style', 'edit',...
'units', 'normal','position', [.7 .59 .23 .05]);

call3 = ['time = str2num(get(gco, ''string''));'];
set(years, 'callBack', call3);

calcstart = uicontrol(gcf,'style', 'push',...
'units', 'normal','position', [.7 .4 .23 .1],...
'string', 'Calculate','callback', 'calc_mort'); 
 
uicontrol(gcf,'style', 'push',...
'units', 'normal','position', [.7 .25 .23 .05],...
'string', 'ZOOM','callback', 'zoom');

uicontrol(gcf,'style', 'push',...
'units', 'normal','position', [.7 .15 .23 .05],...
'string', 'REFRESH','callback', 'init');

uicontrol(gcf,'style', 'push',...
'units', 'normal','position', [.7 .05 .23 .05],...
'string', 'QUIT','callback', 'close all');
grid
clc;

